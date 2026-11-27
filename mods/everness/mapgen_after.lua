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

if Everness.async_mapgen_active then
    --
    -- Hybrid Async Mapgen Mode (Minetest 5.9.0+ / Luanti)
    --
    -- The heavy VoxelManip manipulation, biome logic, and schematics are executed
    -- on the dedicated background mapgen worker thread in `mapgen_async.lua`.
    -- The main server thread on_generated below only executes post-generation tasks
    -- that require the active ServerMap environment (node metadata, chest loot, fix_light).
    --
    core.register_on_generated(function(minp, maxp, blockseed)
        local rand = PcgRandom(blockseed)
        local biomemap = core.get_mapgen_object('biomemap') or {}
        local gennotify = core.get_mapgen_object('gennotify') or {}
        local shared_args = {}

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

        -- Populate loot chests placed by structures in this chunk
        local chest_positions = core.find_nodes_in_area(minp, maxp, { 'everness:chest' })
        if #chest_positions > 0 then
            Everness:populate_loot_chests(chest_positions)
        end

        -- Run any main-thread after_write_to_map handlers (e.g. core.fix_light, node placement)
        for _, def in ipairs(active_defs) do
            if def.after_write_to_map then
                shared_args[def.name] = shared_args[def.name] or {}
                def.after_write_to_map(shared_args[def.name], gennotify, rand, minp, maxp)
            end
        end
    end)
    return
end

--
-- Synchronous Mapgen Mode (Fallback for Minetest <= 5.8)
--
-- Localize data buffer table outside the loop, to be re-used for all
-- mapchunks, therefore minimising memory use.
local data = {}
local p2data = {}

core.register_on_generated(function(minp, maxp, blockseed)
    local rand = PcgRandom(blockseed)
    local biomemap = core.get_mapgen_object('biomemap') or {}
    local gennotify = core.get_mapgen_object('gennotify') or {}
    local vm, emin, emax = core.get_mapgen_object('voxelmanip')
    local area = VoxelArea:new({ MinEdge = emin, MaxEdge = emax })
    vm:get_data(data)
    vm:get_param2_data(p2data)
    local shared_args = {}

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

    -- on_data
    for _, def in ipairs(active_defs) do
        if def.on_data then
            shared_args[def.name] = shared_args[def.name] or {}
            def.on_data(minp, maxp, area, data, p2data, gennotify, rand, shared_args[def.name], biomemap)
        end
    end

    vm:set_data(data)
    vm:set_param2_data(p2data)

    -- after_set_data
    for _, def in ipairs(active_defs) do
        if def.after_set_data then
            shared_args[def.name] = shared_args[def.name] or {}
            def.after_set_data(minp, maxp, vm, area, data, p2data, gennotify, rand, shared_args[def.name])
        end
    end

    vm:set_lighting({ day = 0, night = 0 })
    vm:calc_lighting()
    vm:update_liquids()
    vm:write_to_map()

    -- after_write_to_map
    for _, def in ipairs(active_defs) do
        if def.after_write_to_map then
            shared_args[def.name] = shared_args[def.name] or {}
            def.after_write_to_map(shared_args[def.name], gennotify, rand, minp, maxp)
        end
    end
end)
