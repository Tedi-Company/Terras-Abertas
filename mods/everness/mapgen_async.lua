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

local path = core.get_modpath('everness')

-- Shim missing main-thread engine registration/notification methods in the async mapgen environment
core.set_gen_notify = core.set_gen_notify or function() end
core.register_biome = core.register_biome or function() end
core.register_decoration = core.register_decoration or function() end
core.register_ore = core.register_ore or function() end
core.register_node = core.register_node or function() end
core.register_tool = core.register_tool or function() end
core.register_craftitem = core.register_craftitem or function() end
core.register_abm = core.register_abm or function() end
core.register_lbm = core.register_lbm or function() end
core.register_alias = core.register_alias or function() end
core.get_translator = core.get_translator or function() return function(s) return s end end
core.emerge_area = core.emerge_area or function() end
core.place_schematic = core.place_schematic or function() end
core.get_node = core.get_node or function() return { name = 'ignore' } end
core.set_node = core.set_node or function() end
core.remove_node = core.remove_node or function() end
core.get_biome_data = core.get_biome_data or function() return nil end
core.get_mapgen_setting = core.get_mapgen_setting or function() return nil end
core.dir_to_wallmounted = core.dir_to_wallmounted or function(dir)
    if dir.y > 0.5 then return 1
    elseif dir.y < -0.5 then return 0
    elseif dir.x > 0.5 then return 5
    elseif dir.x < -0.5 then return 4
    elseif dir.z > 0.5 then return 3
    elseif dir.z < -0.5 then return 2
    end
    return 0
end

core.registered_decorations = core.registered_decorations or {}
core.registered_nodes = core.registered_nodes or {}
core.registered_items = core.registered_items or {}
core.registered_biomes = core.registered_biomes or {}
core.registered_ores = core.registered_ores or {}

-- Load API definitions in the isolated mapgen Lua environment
dofile(path .. '/api.lua')

-- Load all enabled biome mapgen definitions to populate Everness.on_generated_queue
if Everness.settings.biomes.everness_bamboo_forest_under.enabled then
    dofile(path .. '/mapgen_bamboo_forest_under.lua')
end
if Everness.settings.biomes.everness_bamboo_forest.enabled then
    dofile(path .. '/mapgen_bamboo_forest.lua')
end
if Everness.settings.biomes.everness_baobab_savanna.enabled then
    dofile(path .. '/mapgen_baobab_savanna.lua')
end
if Everness.settings.biomes.everness_coral_forest_dunes.enabled then
    dofile(path .. '/mapgen_coral_forest_dunes.lua')
end
if Everness.settings.biomes.everness_coral_forest_ocean.enabled then
    dofile(path .. '/mapgen_coral_forest_ocean.lua')
end
if Everness.settings.biomes.everness_coral_forest_deep_ocean.enabled then
    dofile(path .. '/mapgen_coral_forest_deep_ocean.lua')
end
if Everness.settings.biomes.everness_coral_forest_under.enabled then
    dofile(path .. '/mapgen_coral_forest_under.lua')
end
if Everness.settings.biomes.everness_coral_forest.enabled then
    dofile(path .. '/mapgen_coral_forest.lua')
end
if Everness.settings.biomes.everness_crystal_forest_dunes.enabled then
    dofile(path .. '/mapgen_crystal_forest_dunes.lua')
end
if Everness.settings.biomes.everness_crystal_forest_ocean.enabled then
    dofile(path .. '/mapgen_crystal_forest_ocean.lua')
end
if Everness.settings.biomes.everness_crystal_forest_deep_ocean.enabled then
    dofile(path .. '/mapgen_crystal_forest_deep_ocean.lua')
end
if Everness.settings.biomes.everness_crystal_forest_shore.enabled then
    dofile(path .. '/mapgen_crystal_forest_shore.lua')
end
if Everness.settings.biomes.everness_crystal_forest_under.enabled then
    dofile(path .. '/mapgen_crystal_forest_under.lua')
end
if Everness.settings.biomes.everness_crystal_forest.enabled then
    dofile(path .. '/mapgen_crystal_forest.lua')
end
if Everness.settings.biomes.everness_cursed_lands_dunes.enabled then
    dofile(path .. '/mapgen_cursed_lands_dunes.lua')
end
if Everness.settings.biomes.everness_cursed_lands_ocean.enabled then
    dofile(path .. '/mapgen_cursed_lands_ocean.lua')
end
if Everness.settings.biomes.everness_cursed_lands_deep_ocean.enabled then
    dofile(path .. '/mapgen_cursed_lands_deep_ocean.lua')
end
if Everness.settings.biomes.everness_cursed_lands_swamp.enabled then
    dofile(path .. '/mapgen_cursed_lands_swamp.lua')
end
if Everness.settings.biomes.everness_cursed_lands_under.enabled then
    dofile(path .. '/mapgen_cursed_lands_under.lua')
end
if Everness.settings.biomes.everness_cursed_lands.enabled then
    dofile(path .. '/mapgen_cursed_lands.lua')
end
if Everness.settings.biomes.everness_forsaken_desert_ocean.enabled then
    dofile(path .. '/mapgen_forsaken_desert_ocean.lua')
end
if Everness.settings.biomes.everness_forsaken_desert_under.enabled then
    dofile(path .. '/mapgen_forsaken_desert_under.lua')
end
if Everness.settings.biomes.everness_forsaken_desert.enabled then
    dofile(path .. '/mapgen_forsaken_desert.lua')
end
if Everness.settings.biomes.everness_forsaken_tundra_beach.enabled then
    dofile(path .. '/mapgen_forsaken_tundra_beach.lua')
end
if Everness.settings.biomes.everness_forsaken_tundra_ocean.enabled then
    dofile(path .. '/mapgen_forsaken_tundra_ocean.lua')
end
if Everness.settings.biomes.everness_forsaken_tundra_under.enabled then
    dofile(path .. '/mapgen_forsaken_tundra_under.lua')
end
if Everness.settings.biomes.everness_forsaken_tundra.enabled then
    dofile(path .. '/mapgen_forsaken_tundra.lua')
end
if Everness.settings.biomes.everness_frosted_icesheet_ocean.enabled then
    dofile(path .. '/mapgen_frosted_icesheet_ocean.lua')
end
if Everness.settings.biomes.everness_frosted_icesheet_under.enabled then
    dofile(path .. '/mapgen_frosted_icesheet_under.lua')
end
if Everness.settings.biomes.everness_frosted_icesheet.enabled then
    dofile(path .. '/mapgen_frosted_icesheet.lua')
end
if Everness.settings.biomes.everness_mineral_waters.enabled then
    dofile(path .. '/mapgen_mineral_waters.lua')
end
if Everness.settings.biomes.everness_mineral_waters_under.enabled then
    dofile(path .. '/mapgen_mineral_waters_under.lua')
end

-- Reusable data buffers for VoxelManip in the async worker thread
local data = {}
local p2data = {}

-- Persistent content ID and group caches for async mapgen lookups
local cid_cache = {}
local group_cids_cache = {}

local function safe_get_content_id(name)
    local id = cid_cache[name]
    if id ~= nil then
        if id then
            return id
        end
        return nil
    end
    local ok, res = pcall(core.get_content_id, name)
    if ok and type(res) == 'number' then
        cid_cache[name] = res
        return res
    end
    cid_cache[name] = false
    return nil
end

local function get_group_cids(group_name)
    local list = group_cids_cache[group_name]
    if list then
        return list
    end
    list = {}
    for node_name in pairs(core.registered_nodes) do
        if core.get_item_group(node_name, group_name) > 0 then
            local id = safe_get_content_id(node_name)
            if id and (not core.CONTENT_IGNORE or id ~= core.CONTENT_IGNORE) then
                list[#list + 1] = id
            end
        end
    end
    group_cids_cache[group_name] = list
    return list
end

local function build_cids_map(nodenames)
    local cids_map = {}
    for _, name in ipairs(nodenames) do
        if name:sub(1, 6) == 'group:' then
            local g = name:sub(7)
            local cids = get_group_cids(g)
            for i = 1, #cids do
                cids_map[cids[i]] = name
            end
        else
            local id = safe_get_content_id(name)
            if id then
                cids_map[id] = name
            end
        end
    end
    return cids_map
end

-- Async on_generated callback in Minetest 5.9.0+ / Luanti
-- Receives `vmanip` as the first argument; engine commits vmanip automatically on return
core.register_on_generated(function(vmanip, minp, maxp, blockseed)
    local rand = PcgRandom(blockseed)
    local biomemap = core.get_mapgen_object('biomemap') or {}
    local gennotify = core.get_mapgen_object('gennotify') or {}
    local emin, emax = vmanip:get_emerged_area()
    local area = VoxelArea:new({ MinEdge = emin, MaxEdge = emax })

    -- Fetch raw voxel data upfront for direct, high-performance array indexing
    vmanip:get_data(data)
    vmanip:get_param2_data(p2data)

    local c_air = core.get_content_id('air')
    local ystride = area.ystride

    -- Expose VoxelManip-backed helper functions for structure / marker checks during mapgen
    core.get_node = function(pos)
        return vmanip:get_node_at(pos)
    end
    core.set_node = function(pos, node)
        return vmanip:set_node_at(pos, node)
    end
    core.remove_node = function(pos)
        return vmanip:set_node_at(pos, { name = 'air' })
    end
    core.swap_node = function(pos, node)
        return vmanip:set_node_at(pos, node)
    end

    core.find_nodes_in_area = function(search_minp, search_maxp, nodenames, grouped)
        if type(nodenames) == 'string' then
            nodenames = { nodenames }
        end
        local cids_map = build_cids_map(nodenames)

        if grouped then
            local res = {}
            local counts = {}
            for _, name in ipairs(nodenames) do
                res[name] = {}
                counts[name] = 0
            end
            for z = search_minp.z, search_maxp.z do
                for y = search_minp.y, search_maxp.y do
                    local vi = area:index(search_minp.x, y, z)
                    for x = search_minp.x, search_maxp.x do
                        local cid = data[vi]
                        local match_name = cids_map[cid]
                        if match_name then
                            local tbl = res[match_name]
                            tbl[#tbl + 1] = vector.new(x, y, z)
                            counts[match_name] = counts[match_name] + 1
                        end
                        vi = vi + 1
                    end
                end
            end
            return res, counts
        else
            local res = {}
            local counts = {}
            for z = search_minp.z, search_maxp.z do
                for y = search_minp.y, search_maxp.y do
                    local vi = area:index(search_minp.x, y, z)
                    for x = search_minp.x, search_maxp.x do
                        local cid = data[vi]
                        local match_name = cids_map[cid]
                        if match_name then
                            res[#res + 1] = vector.new(x, y, z)
                            counts[match_name] = (counts[match_name] or 0) + 1
                        end
                        vi = vi + 1
                    end
                end
            end
            return res, counts
        end
    end

    core.emerge_area = function(search_minp, search_maxp, callback, extra_data)
        if extra_data and extra_data.callback then
            extra_data.callback(extra_data.data)
        elseif callback then
            callback(nil, 0, 0, extra_data)
        end
    end

    core.place_schematic = function(pos, schem, rot, repl, force, flags)
        return core.place_schematic_on_vmanip(vmanip, pos, schem, rot, repl, force, flags)
    end

    core.find_nodes_in_area_under_air = function(search_minp, search_maxp, nodenames)
        if type(nodenames) == 'string' then
            nodenames = { nodenames }
        end
        local cids_map = build_cids_map(nodenames)
        local res = {}

        for z = search_minp.z, search_maxp.z do
            for y = search_minp.y, search_maxp.y do
                local vi = area:index(search_minp.x, y, z)
                for x = search_minp.x, search_maxp.x do
                    local cid = data[vi]
                    if cids_map[cid] then
                        local vi_above = vi + ystride
                        if data[vi_above] == c_air then
                            res[#res + 1] = vector.new(x, y, z)
                        end
                    end
                    vi = vi + 1
                end
            end
        end
        return res
    end

    local chunk_biomes = {}
    for i = 1, #biomemap do
        chunk_biomes[biomemap[i]] = true
    end

    local active_defs = {}
    for _, def in ipairs(Everness.on_generated_queue) do
        if def.can_run(biomemap, chunk_biomes) then
            table.insert(active_defs, def)
        end
    end

    if #active_defs == 0 then
        return
    end

    local shared_args = {}

    -- 1. on_data: Raw VoxelManip content/param2 manipulation
    for _, def in ipairs(active_defs) do
        if def.on_data then
            shared_args[def.name] = shared_args[def.name] or {}
            def.on_data(minp, maxp, area, data, p2data, gennotify, rand, shared_args[def.name], biomemap)
        end
    end

    vmanip:set_data(data)
    vmanip:set_param2_data(p2data)

    -- 2. after_set_data: Schematics placement on VoxelManip
    for _, def in ipairs(active_defs) do
        if def.after_set_data then
            shared_args[def.name] = shared_args[def.name] or {}
            def.after_set_data(minp, maxp, vmanip, area, data, p2data, gennotify, rand, shared_args[def.name])
        end
    end

    -- 3. Lighting & Liquid calculation
    vmanip:set_lighting({ day = 0, night = 0 })
    vmanip:calc_lighting()
    vmanip:update_liquids()
    -- Note: vmanip:write_to_map() is NOT called here because the engine automatically
    -- writes and commits the async vmanip upon callback completion.
end)
