--[[
    Everness. Never ending discovery in Everness mapgen.
    Copyright (C) 2025 SaKeL

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

--]]

local S = core.get_translator(core.get_current_modname())

---
-- Helper: Adapt world-aligned textures for mesh nodes (slopes)
--
-- In Luanti, solid nodes and nodeboxes support `align_style = "world"` and
-- `scale = N` natively. However, More Blocks slopes use `drawtype = "mesh"`
-- (.obj meshes), where the engine does not support world alignment and instead
-- stretches the entire multi-block texture into the 0..1 UV coordinates of the
-- mesh face. For mesh nodes, we detect world-aligned textures and crop a single
-- 1-node tile so the slope displays a properly proportioned texture.
---

local function adapt_tiles_for_slopes(tiles, recipeitem)
    if not tiles and recipeitem and core.registered_nodes[recipeitem] then
        tiles = core.registered_nodes[recipeitem].tiles
    end
    if not tiles then return nil end

    local new_tiles = {}
    local has_world_aligned = false

    for i, t in ipairs(tiles) do
        local tile_def = t
        if type(tile_def) == 'string' and recipeitem and core.registered_nodes[recipeitem] then
            local src_tiles = core.registered_nodes[recipeitem].tiles
            if src_tiles and src_tiles[i] and type(src_tiles[i]) == 'table' then
                tile_def = src_tiles[i]
            end
        end

        if type(tile_def) == 'table' and tile_def.align_style == 'world' and tile_def.scale and tile_def.scale > 1 then
            has_world_aligned = true
            local tile_name = tile_def.name
            local cropped_name

            if tile_def.animation then
                -- For animated multi-block textures (e.g. scale = 8 with vertical_frames),
                -- crop a 16x16 tile using [combine to extract a clean 16x16 frame.
                cropped_name = '[combine:16x16:0,0=' .. tile_name
            else
                -- For static textures (scale = 2, 4, etc.), ^[sheet:SxS:0,0 cleanly crops
                -- a 1-node tile (0,0) and respects any texture pack resolution.
                cropped_name = tile_name .. '^[sheet:' .. tile_def.scale .. 'x' .. tile_def.scale .. ':0,0'
            end

            new_tiles[i] = {
                name = cropped_name,
                backface_culling = tile_def.backface_culling,
            }
        else
            new_tiles[i] = t
        end
    end

    if has_world_aligned then
        return new_tiles
    end
    return tiles
end

---
-- Helper: Register all Stairs+ shapes with slope-adapted textures
---

local function register_stairsplus(modname, subname, recipeitem, fields)
    local slope_tiles = adapt_tiles_for_slopes(fields.tiles, recipeitem)

    if slope_tiles ~= fields.tiles then
        -- Nodeboxes (stairs, slabs, panels, microblocks) support world-aligned textures natively
        stairsplus:register_stair(modname, subname, recipeitem, fields)
        stairsplus:register_slab(modname, subname, recipeitem, fields)
        stairsplus:register_panel(modname, subname, recipeitem, fields)
        stairsplus:register_micro(modname, subname, recipeitem, fields)

        -- Slopes are .obj meshes which do not support world-aligned textures in the engine;
        -- use the cropped 16x16 tiles so textures are not squished onto the mesh
        local slope_fields = table.copy(fields)
        slope_fields.tiles = slope_tiles
        stairsplus:register_slope(modname, subname, recipeitem, slope_fields)
    else
        stairsplus:register_all(modname, subname, recipeitem, fields)
    end
end

---
-- Stairs+ / More Blocks Circular Saw Scoped Adapter
---

local moreblocks_emu_stairs = {
    register_stair_and_slab = function(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds, worldaligntex)
        -- Strip translation escape sequences (\027%b() and \027.) to avoid malformed double-translation
        local clean_desc = desc_stair:gsub('\027%b()', ''):gsub('\027.', '')
        local base_desc = clean_desc:gsub('%s+[Ss]tair$', '')

        register_stairsplus('everness', subname, recipeitem, {
            description = S(base_desc),
            tiles = images,
            groups = groups,
            sounds = sounds,
        })

        -- Backwards compatibility aliases for schematics, previous worlds, and crafts
        core.register_alias_force('stairs:stair_' .. subname, 'everness:stair_' .. subname)
        core.register_alias_force('stairs:stair_inner_' .. subname, 'everness:stair_' .. subname .. '_inner')
        core.register_alias_force('stairs:stair_outer_' .. subname, 'everness:stair_' .. subname .. '_outer')
        core.register_alias_force('stairs:slab_' .. subname, 'everness:slab_' .. subname)
    end
}

-- Execute stairs.lua under the Scoped Adapter
local prev_stairs = rawget(_G, 'stairs')
rawset(_G, 'stairs', moreblocks_emu_stairs)

local path = core.get_modpath('everness')
dofile(path .. '/stairs.lua')

rawset(_G, 'stairs', prev_stairs)

---
-- Additional Everness building blocks for Circular Saw
---

local extra_nodes = {
    -- Tree Trunks
    { subname = 'coral_tree', recipeitem = 'everness:coral_tree', desc = 'Coral Tree Trunk' },
    { subname = 'coral_tree_bioluminescent', recipeitem = 'everness:coral_tree_bioluminescent', desc = 'Coral Tree Bioluminescent Trunk' },
    { subname = 'baobab_tree', recipeitem = 'everness:baobab_tree', desc = 'Baobab Tree Trunk' },
    { subname = 'sequoia_tree', recipeitem = 'everness:sequoia_tree', desc = 'Sequoia Tree Trunk' },
    { subname = 'willow_tree', recipeitem = 'everness:willow_tree', desc = 'Willow Tree Trunk' },
    { subname = 'hollow_tree', recipeitem = 'everness:hollow_tree', desc = 'Hollow Tree Trunk' },
    { subname = 'crystal_tree', recipeitem = 'everness:crystal_tree', desc = 'Crystal Tree Trunk' },
    { subname = 'mese_tree', recipeitem = 'everness:mese_tree', desc = 'Mese Tree Trunk' },
    { subname = 'palm_tree', recipeitem = 'everness:palm_tree', desc = 'Palm Tree Trunk' },
    { subname = 'lava_tree', recipeitem = 'everness:lava_tree', desc = 'Lava Tree Trunk' },
    { subname = 'lava_tree_with_lava', recipeitem = 'everness:lava_tree_with_lava', desc = 'Lava Tree Trunk with Lava Veins' },

    -- Bamboo blocks
    { subname = 'bamboo_block', recipeitem = 'everness:bamboo_block', desc = 'Bamboo Block' },
    { subname = 'bamboo_dry_block', recipeitem = 'everness:bamboo_dry_block', desc = 'Dry Bamboo Block' },

    -- Cursed blocks
    { subname = 'cursed_stone', recipeitem = 'everness:cursed_stone', desc = 'Cursed Stone' },
    { subname = 'cursed_brick_mixed', recipeitem = 'everness:cursed_brick_mixed', desc = 'Cursed Brick Mixed' },
    { subname = 'cursed_brick_carved', recipeitem = 'everness:cursed_brick_carved', desc = 'Cursed Brick Carved' },
    { subname = 'cursed_dream_stone', recipeitem = 'everness:cursed_dream_stone', desc = 'Cursed Dream Stone' },

    -- Crystal blocks
    { subname = 'crystal_stone', recipeitem = 'everness:crystal_stone', desc = 'Crystal Stone' },
    { subname = 'crystal_sandstone', recipeitem = 'everness:crystal_sandstone', desc = 'Crystal Sandstone' },
    { subname = 'crystal_sandstone_brick', recipeitem = 'everness:crystal_sandstone_brick', desc = 'Crystal Sandstone Brick' },
    { subname = 'crystal_sandstone_chiseled', recipeitem = 'everness:crystal_sandstone_chiseled', desc = 'Crystal Sandstone Chiseled' },
    { subname = 'crystal_block_cyan', recipeitem = 'everness:crystal_block_cyan', desc = 'Cyan Crystal Block' },
    { subname = 'crystal_block_orange', recipeitem = 'everness:crystal_block_orange', desc = 'Orange Crystal Block' },
    { subname = 'crystal_block_purple', recipeitem = 'everness:crystal_block_purple', desc = 'Purple Crystal Block' },

    -- Forsaken blocks
    { subname = 'forsaken_desert_stone', recipeitem = 'everness:forsaken_desert_stone', desc = 'Forsaken Desert Stone' },
    { subname = 'forsaken_tundra_rocks', recipeitem = 'everness:forsaken_tundra_rocks', desc = 'Forsaken Tundra Rocks' },

    -- Pyrite blocks
    { subname = 'pyriteblock', recipeitem = 'everness:pyriteblock', desc = 'Pyrite Block' },
    { subname = 'pyriteblock_brick', recipeitem = 'everness:pyriteblock_brick', desc = 'Pyrite Brick' },
    { subname = 'pyriteblock_forged', recipeitem = 'everness:pyriteblock_forged', desc = 'Forged Pyrite Block' },
    { subname = 'pyriteblock_polished', recipeitem = 'everness:pyriteblock_polished', desc = 'Polished Pyrite Block' },
    { subname = 'pyriteblock_spiral', recipeitem = 'everness:pyriteblock_spiral', desc = 'Pyrite Spiral' },
    { subname = 'pyriteblock_slab_brick', recipeitem = 'everness:pyriteblock_slab_brick', desc = 'Pyrite Slab Brick' },

    -- Ice & Snow blocks
    { subname = 'ancient_emerald_ice', recipeitem = 'everness:ancient_emerald_ice', desc = 'Ancient Emerald Ice' },
    { subname = 'dense_emerald_ice', recipeitem = 'everness:dense_emerald_ice', desc = 'Dense Emerald Ice' },
    { subname = 'emerald_ice', recipeitem = 'everness:emerald_ice', desc = 'Emerald Ice' },
    { subname = 'frosted_ice', recipeitem = 'everness:frosted_ice', desc = 'Frosted Ice' },
    { subname = 'frosted_ice_translucent', recipeitem = 'everness:frosted_ice_translucent', desc = 'Frosted Ice Translucent' },
    { subname = 'frosted_snowblock', recipeitem = 'everness:frosted_snowblock', desc = 'Frosted Snow Block' },
    { subname = 'icecobble', recipeitem = 'everness:icecobble', desc = 'Ice Cobble' },
    { subname = 'snowcobble', recipeitem = 'everness:snowcobble', desc = 'Snow Cobble' },
    { subname = 'mold_cobble', recipeitem = 'everness:mold_cobble', desc = 'Mold Cobble' },

    -- Obsidian & Volcanic blocks
    { subname = 'weeping_obsidian', recipeitem = 'everness:weeping_obsidian', desc = 'Weeping Obsidian' },
    { subname = 'blue_crying_obsidian', recipeitem = 'everness:blue_crying_obsidian', desc = 'Blue Crying Obsidian' },
    { subname = 'blue_weeping_obsidian', recipeitem = 'everness:blue_weeping_obsidian', desc = 'Blue Weeping Obsidian' },
    { subname = 'sulfur_stone', recipeitem = 'everness:sulfur_stone', desc = 'Sulfur Stone' },
    { subname = 'volcanic_sulfur', recipeitem = 'everness:volcanic_sulfur', desc = 'Volcanic Sulfur Stone' },

    -- Bone & Coral
    { subname = 'bone', recipeitem = 'everness:bone', desc = 'Bone Block' },
    { subname = 'crystal_coral_dark', recipeitem = 'everness:crystal_coral_dark', desc = 'Crystal Coral Dark' },

    -- Glass
    { subname = 'pyrite_glass', recipeitem = 'everness:pyrite_glass', desc = 'Pyrite Glass' },
    { subname = 'tinted_glass_red', recipeitem = 'everness:tinted_glass_red', desc = 'Tinted Glass Red' },
}

for _, item in ipairs(extra_nodes) do
    local def = core.registered_nodes[item.recipeitem]
    if def then
        local tiles = table.copy(def.tiles or {})
        if #tiles > 1 and def.drawtype and def.drawtype:find('glass') then
            tiles = { tiles[1] }
        end
        register_stairsplus('everness', item.subname, item.recipeitem, {
            description = S(item.desc),
            tiles = tiles,
            groups = table.copy(def.groups or {}),
            sounds = def.sounds,
        })
    end
end

core.log('action', '[Everness] More Blocks / Circular Saw integration loaded successfully.')
