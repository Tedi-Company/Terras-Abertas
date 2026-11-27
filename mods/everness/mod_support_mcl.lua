--[[
    Everness. Never ending discovery in Everness mapgen.
    Copyright (C) 2025 SaKeL

    mod_support_mcl total rewrite 2025 by Gunnar Zötl

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

local function register_alias(name, convert_to)
    if not core.registered_aliases[name] and rawget(core.registered_items, name) == nil then
        core.register_alias(name, convert_to)
        core.registered_aliases[name] = convert_to
    end
end

-- Test whether we are in VoxeLibre or Mineclonia
local isVL = core.get_modpath('vl_trusted') ~= nil
    or core.get_modpath('vl_core') ~= nil

local mod_emu = {}

---
-- Fences / Gates
---

mod_emu.default = {
    register_fence = function(name, def)
        local sname = string.match(name, ':(.+)$')
        local fence_id, gate_id, open_gate_id = mcl_fences.register_fence_and_fence_gate(
            sname,
            def.description,
            def.description .. ' Gate',
            def.texture,
            { handy = 1, axey = 1, flammable = 2, fence_wood = 1, fire_encouragement = 5, fire_flammability = 20 },
            2,
            15,
            { 'group:fence_wood' },
            def.sounds
        )
        if fence_id == name then
            register_alias('mcl_fences:' .. sname, name)
            register_alias('mcl_fences:' .. sname .. '_gate', name .. '_gate')
            register_alias('mcl_fences:' .. sname .. '_gate_open', name .. '_gate_open')
        else
            register_alias(name, fence_id)
            if gate_id then register_alias(name .. '_gate', gate_id) end
            if open_gate_id then register_alias(name .. '_gate_open', open_gate_id) end
        end
    end,

    register_fence_rail = function(name, def)
        local sname = string.match(name, ':(.+)$')
        local fence_id = mcl_fences.register_fence_and_fence_gate(
            sname,
            def.description,
            def.description .. ' Gate',
            def.texture,
            { handy = 1, axey = 1, flammable = 2, fence_wood = 1, fire_encouragement = 5, fire_flammability = 20 },
            2,
            15,
            { 'group:fence_wood' },
            def.sounds
        )
        if fence_id == name then
            register_alias('mcl_fences:' .. sname, name)
        else
            register_alias(name, fence_id)
        end
    end,

    register_mesepost = function(name, def)
        -- Not applicable in MCL
    end,
}

---
-- Walls
---

if core.global_exists('mcl_walls') and mcl_walls.update_wall then
    local orig_update_wall = mcl_walls.update_wall
    local directions = {
        { x = 1, y = 0, z = 0 },
        { x = 0, y = 0, z = 1 },
        { x = -1, y = 0, z = 0 },
        { x = 0, y = 0, z = -1 },
        { x = 0, y = -1, z = 0 },
    }
    local function connectable(itemstring)
        return (core.get_item_group(itemstring, "wall") == 1) or (core.get_item_group(itemstring, "solid") == 1)
    end

    rawset(mcl_walls, 'update_wall', function(pos)
        pos = vector.new(pos)
        local thisnode = core.get_node(pos)
        if core.get_item_group(thisnode.name, "wall") == 0 then
            return
        end

        local def = core.registered_nodes[thisnode.name]
        local base = (def and def._mcl_baseitem) or thisnode.name:match("^(.*)_%d+$") or thisnode.name
        base = base:gsub("^:", "")
        local colonpos = base:find(":")
        local itemname = colonpos and base:sub(colonpos + 1) or base

        -- When the wall itemname contains underscores, upstream mcl_walls incorrectly
        -- truncates at the first underscore (e.g. everness:crystal_cobble_wall -> everness:crystal_0).
        -- Safely compute the connection bitmask and set the exact registered state.
        if itemname:find("_") then
            local basename = base .. "_"
            local sum = 0

            for i = 1, 4 do
                local dir = directions[i]
                local node = core.get_node({ x = pos.x + dir.x, y = pos.y + dir.y, z = pos.z + dir.z })
                if connectable(node.name) then
                    sum = sum + 2 ^ (i - 1)
                end
            end

            local upnode = core.get_node({ x = pos.x, y = pos.y + 1, z = pos.z })
            if sum == 5 or sum == 10 then
                if connectable(upnode.name)
                    or (core.get_item_group(upnode.name, "fence") == 1)
                    or (core.get_item_group(upnode.name, "torch") == 1) then
                    sum = sum + 11
                end
            end

            local target_name = basename .. sum
            if core.registered_nodes[target_name] then
                core.set_node(pos, { name = target_name })
            else
                core.log("warning", "[everness] Wall target node not registered: " .. tostring(target_name))
            end
            return
        end

        return orig_update_wall(pos)
    end)
end

mod_emu.walls = {
    register = function(name, desc, tex, mat, snd)
        mcl_walls.register_wall(name, desc, mat, tex, nil, nil, snd)
        if core.registered_nodes[name] then
            core.override_item(name, {
                _mcl_baseitem = name,
                on_construct = mcl_walls.update_wall,
            })
        end
    end
}

---
-- Stairs and Slabs
---

mod_emu.stairs = {
    register_stair_and_slab = function(base, mat, stat, tex, stairdesc, slabdesc, snd, bool)
        local groups = {}
        if stat.cracky then
            -- In MTG: cracky 3 is softest, 1 is hardest.
            -- In MCL: pickaxey 1 is wood, 2 is stone/iron, 3 is diamond.
            groups.pickaxey = stat.cracky == 1 and 2 or 1
            groups.material_stone = 1
            groups.building_block = 1
        elseif stat.choppy then
            groups.axey = 1
            groups.handy = 1
            groups.wood = 1
            groups.material_wood = 1
            groups.building_block = 1
            groups.flammable = stat.flammable or 2
            groups.fire_encouragement = 5
            groups.fire_flammability = 20
        end

        mcl_stairs.register_stair_and_slab(
            base,
            mat,
            groups,
            tex,
            stairdesc,
            slabdesc,
            snd,
            6,
            2,
            'Double ' .. slabdesc,
            nil
        )
        register_alias('stairs:stair_' .. base, 'mcl_stairs:stair_' .. base)
        register_alias('stairs:stair_inner_' .. base, 'mcl_stairs:stair_' .. base .. '_inner')
        register_alias('stairs:stair_outer_' .. base, 'mcl_stairs:stair_' .. base .. '_outer')
        register_alias('stairs:slab_' .. base, 'mcl_stairs:slab_' .. base)
    end
}

---
-- Doors & Trapdoors
---

mod_emu.doors = {
    register = function(name, def)
        local sname = string.match(name, ':(.+)$')
        local modpath = core.get_modpath(core.get_current_modname())
        local utex = io.open(modpath .. '/textures/everness_mcl_doors_' .. sname .. '_lower.png', 'r')
        if not utex then
            core.log('warning', '[everness] mod_support_mcl not registering door type ' .. name .. ' because of missing textures')
            return
        end
        utex:close()

        local newdef = {
            description = def.description,
            inventory_image = def.inventory_image,
            groups = { handy = 1, axey = 1, material_wood = 1, flammable = -1 },
            sounds = def.sounds,
            sound_open = def.sound_open,
            sound_close = def.sound_close,
            _mcl_hardness = 3,
            _mcl_blast_resistance = 3,
        }
        if isVL then
            newdef.tiles_bottom = 'everness_mcl_doors_' .. sname .. '_lower.png'
            newdef.tiles_top = 'everness_mcl_doors_' .. sname .. '_upper.png'
        else
            newdef.tiles_bottom = {
                'everness_mcl_doors_' .. sname .. '_lower.png^[transformFX',
                'everness_mcl_doors_' .. sname .. '_lower_side.png'
            }
            newdef.tiles_top = {
                'everness_mcl_doors_' .. sname .. '_upper.png^[transformFX',
                'everness_mcl_doors_' .. sname .. '_upper_side.png'
            }
        end
        mcl_doors:register_door(name, newdef)

        -- Register aliases for MTG door nodes (_a bottom, _b top) used in schematics
        register_alias(name .. '_a', name .. '_b_1')
        register_alias(name .. '_b', name .. '_t_1')

        if def.recipe then
            core.register_craft({
                output = name .. ' 3',
                recipe = def.recipe
            })
        end
    end,

    register_trapdoor = function(name, def)
        mcl_doors:register_trapdoor(name, {
            description = def.description,
            inventory_image = def.inventory_image,
            tile_front = def.tile_front,
            tile_side = def.tile_side,
            wield_image = def.wield_image,
            groups = { handy = 1, axey = 1, material_wood = 1, flammable = -1 },
            sounds = def.sounds,
            sound_open = def.sound_open,
            sound_close = def.sound_close,
            _mcl_hardness = 3,
            _mcl_blast_resistance = 3,
        })
        if def.recipe then
            core.register_craft({
                output = name,
                recipe = def.recipe
            })
        end
    end,

    register_fencegate = function(name, def)
        local gate_name_map = {
            ['everness:gate_bamboo'] = 'everness:fence_bamboo_wood_gate',
            ['everness:gate_crystal_wood'] = 'everness:fence_crystal_wood_gate',
            ['everness:gate_palm_wood'] = 'everness:fence_palm_wood_gate',
            ['everness:gate_coral_wood'] = 'everness:fence_coral_wood_gate',
            ['everness:gate_lava_tree_wood'] = 'everness:fence_lava_tree_wood_gate',
        }
        if gate_name_map[name] then
            register_alias(name, gate_name_map[name])
            register_alias(name .. '_open', gate_name_map[name] .. '_open')
        end
    end
}

---
-- Buckets
---

if core.global_exists('mcl_buckets') and mcl_buckets.register_liquid then
    mcl_buckets.register_liquid({
        source_place = 'everness:mineral_water_source',
        source_take = { 'everness:mineral_water_source' },
        bucketname = 'everness:bucket_mineral_water',
        inventory_image = 'everness_mcl_bucket_mineral_water.png',
        name = S('Mineral') .. ' ' .. S('Water') .. ' ' .. S('Bucket'),
        longdesc = S('A bucket can be used to collect and release liquids. This one is filled with mineral water.'),
        usagehelp = S('Place it to empty the bucket and create a mineral water source.'),
        tt_help = S('Places a mineral water source'),
        groups = { water_bucket = 1 },
    })
end

---
-- Panes
---

if not (core.global_exists('xpanes') and xpanes.register_pane) then
    mod_emu.xpanes = {
        register_pane = function(name, def)
            if core.global_exists('mcl_panes') and mcl_panes.register_pane then
                local mcl_def = table.copy(def)
                if mcl_def.textures then
                    local t1 = mcl_def.textures[1] or ''
                    local t2 = (mcl_def.textures[2] and mcl_def.textures[2] ~= '') and mcl_def.textures[2] or t1
                    local t3 = mcl_def.textures[3] or t1
                    mcl_def.textures = { t1, t2, t3 }
                end
                mcl_panes.register_pane(name, mcl_def)
            end
            register_alias('xpanes:' .. name, 'mcl_panes:' .. name)
            register_alias('xpanes:' .. name .. '_flat', 'mcl_panes:' .. name .. '_flat')
        end
    }
else
    register_alias('mcl_panes:cursed_bar', 'xpanes:cursed_bar')
    register_alias('mcl_panes:cursed_bar_flat', 'xpanes:cursed_bar_flat')
    register_alias('mcl_panes:pyrite_pane', 'xpanes:pyrite_pane')
    register_alias('mcl_panes:pyrite_pane_flat', 'xpanes:pyrite_pane_flat')
end

---
-- Scoped Execution Runner
---

local function load_derivative_nodes()
    local prev_default = rawget(_G, 'default')
    local prev_walls   = rawget(_G, 'walls')
    local prev_stairs  = rawget(_G, 'stairs')
    local prev_doors   = rawget(_G, 'doors')
    local prev_xpanes  = rawget(_G, 'xpanes')

    rawset(_G, 'default', mod_emu.default)
    rawset(_G, 'walls',   mod_emu.walls)
    rawset(_G, 'stairs',  mod_emu.stairs)
    rawset(_G, 'doors',   mod_emu.doors)
    if mod_emu.xpanes then
        rawset(_G, 'xpanes', mod_emu.xpanes)
    end

    local path = core.get_modpath('everness')

    dofile(path .. '/panes.lua')
    dofile(path .. '/stairs.lua')
    dofile(path .. '/walls.lua')
    dofile(path .. '/fences.lua')
    dofile(path .. '/doors.lua')

    rawset(_G, 'default', prev_default)
    rawset(_G, 'walls',   prev_walls)
    rawset(_G, 'stairs',  prev_stairs)
    rawset(_G, 'doors',   prev_doors)
    if mod_emu.xpanes then
        rawset(_G, 'xpanes', prev_xpanes)
    end
end

load_derivative_nodes()

---
-- Trees & Leafdecay Compatibility with Mineclonia
---

-- In Mineclonia, mcl_trees overrides on_construct and after_destruct on all nodes
-- with group:tree ~= 0 in an on_mods_loaded callback.
-- This triggers heavy VoxelManip updates (reading/writing an 8-block radius) and
-- massive 15,625-node area searches whenever an Everness tree log is dug or placed.
-- Because Everness leaves do not use Mineclonia's distance param2 leafdecay,
-- mcl_trees's callbacks do no useful work on Everness trees while causing severe lag,
-- massive Lua memory allocations (~500 KB per log), and server OOM crashes on large trees.
--
-- Since everness is loaded after mcl_trees, this on_mods_loaded callback executes after
-- mcl_trees's on_mods_loaded, cleanly restoring Everness's own lightweight leafdecay.
core.register_on_mods_loaded(function()
    if not core.get_modpath('mcl_trees') then
        return
    end

    if Everness.leafdecay_trunk_defs then
        for trunk, def in pairs(Everness.leafdecay_trunk_defs) do
            if core.registered_nodes[trunk] then
                core.registered_nodes[trunk].on_construct = nil
                if core.registered_items[trunk] then
                    core.registered_items[trunk].on_construct = nil
                end
                core.override_item(trunk, {
                    after_destruct = function(pos, oldnode)
                        Everness.leafdecay_after_destruct(pos, oldnode, def)
                    end,
                })
            end
        end
    end

    -- Also handle other Everness trunks that do not have leafdecay (e.g. hollow_tree)
    if core.registered_nodes['everness:hollow_tree'] then
        core.registered_nodes['everness:hollow_tree'].on_construct = nil
        core.registered_nodes['everness:hollow_tree'].after_destruct = nil
        if core.registered_items['everness:hollow_tree'] then
            core.registered_items['everness:hollow_tree'].on_construct = nil
            core.registered_items['everness:hollow_tree'].after_destruct = nil
        end
    end
end)
