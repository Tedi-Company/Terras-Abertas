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

--
-- Register biomes
--

local y_max = Everness.settings.biomes.everness_crystal_forest.y_max
local y_min = Everness.settings.biomes.everness_crystal_forest.y_min

-- Crystal Forest

Everness:register_biome({
    name = 'everness:crystal_forest',
    node_top = 'everness:dirt_with_crystal_grass',
    depth_top = 1,
    node_filler = 'everness:crystal_dirt',
    depth_filler = 1,
    node_riverbed = 'everness:crystal_dirt',
    depth_riverbed = 2,
    node_stone = 'everness:crystal_stone',
    node_dungeon = 'everness:crystal_cobble',
    node_dungeon_alt = 'everness:crystal_mossy_cobble',
    node_dungeon_stair = 'stairs:stair_crystal_cobble',
    y_max = y_max,
    y_min = y_min,
    heat_point = 35,
    humidity_point = 50,
})

--
-- Register ores
--

-- Blob ore.
-- These before scatter ores to avoid other ores in blobs.

-- Crystal sand

Everness:register_ore({
    ore_type = 'blob',
    ore = 'everness:crystal_sand',
    wherein = { 'everness:crystal_stone' },
    clust_scarcity = 16 * 16 * 16,
    clust_size = 5,
    y_max = y_max,
    y_min = y_min,
    noise_threshold = 0.0,
    noise_params = {
        offset = 0.5,
        scale = 0.2,
        spread = { x = 5, y = 5, z = 5 },
        seed = 2316,
        octaves = 1,
        persist = 0.0
    },
    biomes = { 'everness:crystal_forest' }
})

-- Dirt

Everness:register_ore({
    ore_type = 'blob',
    ore = 'everness:crystal_dirt',
    wherein = { 'everness:crystal_stone' },
    clust_scarcity = 16 * 16 * 16,
    clust_size = 5,
    y_max = y_max,
    y_min = y_min,
    noise_threshold = 0.0,
    noise_params = {
        offset = 0.5,
        scale = 0.2,
        spread = { x = 5, y = 5, z = 5 },
        seed = 17676,
        octaves = 1,
        persist = 0.0
    },
    biomes = { 'everness:crystal_forest' }
})

-- Scatter ores

-- Coal

Everness:register_ore({
    ore_type = 'scatter',
    ore = 'everness:crystal_stone_with_coal',
    wherein = 'everness:crystal_stone',
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 9,
    clust_size = 3,
    y_max = y_max,
    y_min = y_min,
    biomes = { 'everness:crystal_forest' }
})

--
-- Register decorations
--

Everness:register_decoration({
    name = 'everness:crystal_forest_crystal_mushrooms',
    deco_type = 'simple',
    place_on = { 'everness:dirt_with_crystal_grass' },
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.006,
        spread = { x = 250, y = 250, z = 250 },
        seed = 2,
        octaves = 3,
        persist = 0.66
    },
    biomes = { 'everness:crystal_forest' },
    y_max = y_max,
    y_min = y_min,
    decoration = 'everness:crystal_mushrooms',
    param2 = 40
})

Everness:register_decoration({
    name = 'everness:crystal_forest_crystal_tree',
    deco_type = 'schematic',
    place_on = { 'everness:dirt_with_crystal_grass' },
    place_offset_y = 0,
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.002,
        spread = { x = 250, y = 250, z = 250 },
        seed = 2,
        octaves = 3,
        persist = 0.66
    },
    biomes = { 'everness:crystal_forest' },
    y_max = y_max,
    y_min = y_min,
    schematic = core.get_modpath('everness') .. '/schematics/everness_crystal_tree.mts',
    flags = 'place_center_x, place_center_z',
    rotation = 'random',
})

Everness:register_decoration({
    name = 'everness:crystal_forest_crystal_tree_large',
    deco_type = 'schematic',
    place_on = { 'everness:dirt_with_crystal_grass' },
    place_offset_y = 0,
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.001,
        spread = { x = 250, y = 250, z = 250 },
        seed = 2,
        octaves = 3,
        persist = 0.66
    },
    biomes = { 'everness:crystal_forest' },
    y_max = y_max,
    y_min = y_min,
    schematic = core.get_modpath('everness') .. '/schematics/everness_crystal_tree_large.mts',
    flags = 'place_center_x, place_center_z',
    rotation = 'random',
})

Everness:register_decoration({
    name = 'everness:crystal_forest_crystal_bush',
    deco_type = 'schematic',
    place_on = { 'everness:dirt_with_crystal_grass' },
    sidelen = 16,
    place_offset_y = 1,
    noise_params = {
        offset = -0.004,
        scale = 0.01,
        spread = { x = 100, y = 100, z = 100 },
        seed = 137,
        octaves = 3,
        persist = 0.7,
    },
    biomes = { 'everness:crystal_forest' },
    y_max = y_max,
    y_min = y_min,
    schematic = core.get_modpath('everness') .. '/schematics/everness_crystal_bush.mts',
    flags = 'place_center_x, place_center_z',
})

local function register_crystal_grass_decoration(offset, scale, length)
    Everness:register_decoration({
        name = 'everness:crystal_forest_crystal_grass_' .. length,
        deco_type = 'simple',
        place_on = { 'everness:dirt_with_crystal_grass' },
        sidelen = 16,
        noise_params = {
            offset = offset,
            scale = scale,
            spread = { x = 200, y = 200, z = 200 },
            seed = 329,
            octaves = 3,
            persist = 0.6
        },
        biomes = { 'everness:crystal_forest' },
        y_max = y_max,
        y_min = y_min,
        decoration = 'everness:crystal_grass_' .. length,
        param2 = 0,
        param2_max = 239,
    })
end

-- Crystal Grasses

register_crystal_grass_decoration(-0.03, 0.09, 3)
register_crystal_grass_decoration(-0.015, 0.075, 2)
register_crystal_grass_decoration(0, 0.06, 1)

--
-- On Generated
--

local chance = 20
local disp = 16
local schem = core.get_modpath('everness') .. '/schematics/everness_quartz_temple.mts'
local size = { x = 16, y = 13, z = 16 }
local math_sin = math.sin
local math_floor = math.floor
local math_sqrt = math.sqrt
local math_min = math.min
local math_max = math.max

local size_x = math_floor(size.x / 2)
local size_z = math_floor(size.z / 2)
local y_dis = 1

local c_dirt_with_crystal_grass = core.get_content_id('everness:dirt_with_crystal_grass')

local c_megalith_1 = core.get_content_id('everness:crystal_megalith_1')
local c_megalith_2 = core.get_content_id('everness:crystal_megalith_2')
local c_megalith_3 = core.get_content_id('everness:crystal_megalith_3')
local c_megalith_4 = core.get_content_id('everness:crystal_megalith_4')
local c_megalith_5 = core.get_content_id('everness:crystal_megalith_5')

local c_cluster = core.get_content_id('everness:crystal_cluster')

local is_replaceable = {
    [core.CONTENT_AIR] = true,
    [core.get_content_id('everness:crystal_grass_1')] = true,
    [core.get_content_id('everness:crystal_grass_2')] = true,
    [core.get_content_id('everness:crystal_grass_3')] = true,
}

local np_crystal_grass = {
    offset = 0,
    scale = 1,
    spread = { x = 200, y = 200, z = 200 },
    seed = 329,
    octaves = 3,
    persist = 0.6,
}

local nobj_crystal_grass = nil
local grass_noise_buf = {}
local points_x = {}
local points_z = {}

local function place_megalith(data, p2data, vi, ystride, height, pal_idx, rot)
    local p2 = pal_idx * 32 + rot
    if height == 9 then
        -- 9-tall Megalith: 1 -> 2 -> 2 -> 3 -> 3 -> 4 -> 4 -> 4 -> 5
        data[vi + ystride * 1] = c_megalith_1
        data[vi + ystride * 2] = c_megalith_2
        data[vi + ystride * 3] = c_megalith_2
        data[vi + ystride * 4] = c_megalith_3
        data[vi + ystride * 5] = c_megalith_3
        data[vi + ystride * 6] = c_megalith_4
        data[vi + ystride * 7] = c_megalith_4
        data[vi + ystride * 8] = c_megalith_4
        data[vi + ystride * 9] = c_megalith_5
        for i = 1, 9 do p2data[vi + ystride * i] = p2 end
    elseif height == 7 then
        -- 7-tall Megalith: 1 -> 2 -> 3 -> 3 -> 4 -> 4 -> 5
        data[vi + ystride * 1] = c_megalith_1
        data[vi + ystride * 2] = c_megalith_2
        data[vi + ystride * 3] = c_megalith_3
        data[vi + ystride * 4] = c_megalith_3
        data[vi + ystride * 5] = c_megalith_4
        data[vi + ystride * 6] = c_megalith_4
        data[vi + ystride * 7] = c_megalith_5
        for i = 1, 7 do p2data[vi + ystride * i] = p2 end
    elseif height == 5 then
        -- 5-tall Megalith: 1 -> 2 -> 3 -> 4 -> 5
        data[vi + ystride * 1] = c_megalith_1
        data[vi + ystride * 2] = c_megalith_2
        data[vi + ystride * 3] = c_megalith_3
        data[vi + ystride * 4] = c_megalith_4
        data[vi + ystride * 5] = c_megalith_5
        for i = 1, 5 do p2data[vi + ystride * i] = p2 end
    elseif height == 3 then
        -- 3-tall Spire: 1 -> 4 -> 5
        data[vi + ystride * 1] = c_megalith_1
        data[vi + ystride * 2] = c_megalith_4
        data[vi + ystride * 3] = c_megalith_5
        for i = 1, 3 do p2data[vi + ystride * i] = p2 end
    end
end

local np_heat = {
    offset = 50,
    scale = 50,
    spread = { x = 1000, y = 1000, z = 1000 },
    seed = 5349,
    octaves = 3,
    persist = 0.5,
}

local nobj_heat = nil

local function get_heat_at(x, z, col_idx, heatmap)
    if heatmap and heatmap[col_idx] then
        return heatmap[col_idx]
    end
    if not nobj_heat then
        if core.get_perlin then
            nobj_heat = core.get_perlin(np_heat)
        elseif PerlinNoise then
            nobj_heat = PerlinNoise(np_heat)
        end
    end
    if nobj_heat then
        return nobj_heat:get_2d({ x = x, y = z })
    end
    return 35
end

local function get_crystal_palette_index(heat, x, z)
    -- Map Crystal Forest biome heat window (~18 to ~52, centered at heat_point 35) to full palette (0 to 7)
    local min_biome_heat = 18.0
    local max_biome_heat = 52.0
    local norm_heat = math_min(math_max((heat - min_biome_heat) / (max_biome_heat - min_biome_heat), 0.0), 1.0)
    local base_idx = math_floor(norm_heat * 8)
    if base_idx >= 8 then
        base_idx = 7
    end
    -- Subtle micro-variation (+/- 1 palette step) based on local position
    local jitter = ((x * 13 + z * 17) % 3) - 1
    local pal_idx = base_idx + jitter
    if pal_idx < 0 then
        pal_idx = 0
    elseif pal_idx > 7 then
        pal_idx = 7
    end
    return pal_idx
end

local biome_id_everness_crystal_forest = core.get_biome_id('everness:crystal_forest')

Everness:add_to_queue_on_generated({
    name = 'everness:crystal_forest',
    can_run = function(biomemap, chunk_biomes)
        return (chunk_biomes and chunk_biomes[biome_id_everness_crystal_forest]) or table.indexof(biomemap, biome_id_everness_crystal_forest) ~= -1
    end,
    on_data = function(minp, maxp, area, data, p2data, gennotify, rand, shared_args)
        local cell_size = 192
        local max_edge_dist = 68.0
        local ystride = area.ystride
        local chunk_size_x = maxp.x - minp.x + 1
        local chunk_size_z = maxp.z - minp.z + 1

        -- 1. Precompute 2D grass noise flat buffer in C++ (eliminates thousands of Lua-C calls & table allocations)
        if not nobj_crystal_grass then
            if core.get_perlin_map then
                nobj_crystal_grass = core.get_perlin_map(np_crystal_grass, { x = chunk_size_x, y = chunk_size_z, z = 1 })
            elseif PerlinNoiseMap then
                nobj_crystal_grass = PerlinNoiseMap(np_crystal_grass, { x = chunk_size_x, y = chunk_size_z, z = 1 })
            end
        end
        if nobj_crystal_grass then
            nobj_crystal_grass:get_2d_map_flat({ x = minp.x, y = minp.z }, grass_noise_buf)
        end

        -- 2. Precompute the small set of Worley feature points covering this chunk once (reduces trig calls by 99.99%)
        local min_gx = math_floor(minp.x / cell_size) - 1
        local max_gx = math_floor(maxp.x / cell_size) + 1
        local min_gz = math_floor(minp.z / cell_size) - 1
        local max_gz = math_floor(maxp.z / cell_size) + 1

        local num_pts = 0
        for cx = min_gx, max_gx do
            for cz = min_gz, max_gz do
                local n = math_sin(cx * 127.1 + cz * 311.7 + 8741.3) * 43758.5453
                local rx = (n - math_floor(n)) * 0.6 + 0.2
                local n2 = math_sin(cx * 269.5 + cz * 183.3 + 4521.7) * 43758.5453
                local rz = (n2 - math_floor(n2)) * 0.6 + 0.2
                num_pts = num_pts + 1
                points_x[num_pts] = (cx + rx) * cell_size
                points_z[num_pts] = (cz + rz) * cell_size
            end
        end

        local heatmap = core.get_mapgen_object('heatmap')

        for z = minp.z, maxp.z do
            local col_z_offset = (z - minp.z) * chunk_size_x
            for x = minp.x, maxp.x do
                local col_idx = col_z_offset + (x - minp.x) + 1

                -- Veins only generate in the opposite noise spectrum where crystal grass does not grow
                if not grass_noise_buf[col_idx] or grass_noise_buf[col_idx] <= 0 then
                    -- Fast Worley F1/F2 distance from precomputed feature points
                    local min1_sq = 1e9
                    local min2_sq = 1e9
                    for i = 1, num_pts do
                        local dx = x - points_x[i]
                        local dz = z - points_z[i]
                        local dist_sq = dx * dx + dz * dz
                        if dist_sq < min1_sq then
                            min2_sq = min1_sq
                            min1_sq = dist_sq
                        elseif dist_sq < min2_sq then
                            min2_sq = dist_sq
                        end
                    end
                    local edge_dist = math_sqrt(min2_sq) - math_sqrt(min1_sq)

                    -- Crystals generate along the white Worley cell boundary veins
                    if edge_dist <= max_edge_dist then
                        -- Density gradient: concentration at vein center (~25%), smoothly thinning outward (~4%)
                        local t = edge_dist / max_edge_dist
                        local spawn_chance = 0.25 * ((1.0 - t) ^ 1.1)
                        local pos_rnd = (math_sin(x * 374.1 + z * 513.7 + 8741.3) * 43758.5453) % 1.0

                        if pos_rnd < spawn_chance then
                            local vi = area:index(x, maxp.y - 9, z)
                            for y = maxp.y - 9, minp.y, -1 do
                                if data[vi] == c_dirt_with_crystal_grass then
                                    local vi_up1 = vi + ystride
                                    if is_replaceable[data[vi_up1]] then
                                        local rot = (x * 7 + z * 13) % 4
                                        local heat = get_heat_at(x, z, col_idx, heatmap)
                                        local pal_idx = get_crystal_palette_index(heat, x, z)

                                        if edge_dist <= 8.0 then
                                            -- Tier 1 (Center Spine): 9-tall Megaliths
                                            place_megalith(data, p2data, vi, ystride, 9, pal_idx, rot)
                                        elseif edge_dist <= 18.0 then
                                            -- Tier 2: 7-tall Megaliths
                                            place_megalith(data, p2data, vi, ystride, 7, pal_idx, rot)
                                        elseif edge_dist <= 30.0 then
                                            -- Tier 3: 5-tall Megaliths
                                            place_megalith(data, p2data, vi, ystride, 5, pal_idx, rot)
                                        elseif edge_dist <= 46.0 then
                                            -- Tier 4: 3-tall Spires
                                            place_megalith(data, p2data, vi, ystride, 3, pal_idx, rot)
                                        else
                                            -- Tier 5 (Outer Spread): 1-tall Glass Crystal Clusters
                                            data[vi + ystride * 1] = c_cluster
                                            p2data[vi + ystride * 1] = pal_idx * 32 + rot
                                        end
                                    end
                                    break
                                end
                                vi = vi - ystride
                            end
                        end
                    end
                end
            end
        end
    end,
    after_set_data = function(minp, maxp, vm, area, data, p2data, gennotify, rand, shared_args)
        local sidelength = maxp.x - minp.x + 1
        local center_x = minp.x + math_floor(sidelength / 2) + rand:next(0, disp)
        local center_z = minp.z + math_floor(sidelength / 2) + rand:next(0, disp)
        local vi = area:index(center_x, minp.y, center_z)
        local ystride = area.ystride
        shared_args.schem_positions = {}

        for y = minp.y, maxp.y do
            if data[vi + ystride] == core.CONTENT_AIR
                and data[vi] == c_dirt_with_crystal_grass
                and rand:next(0, 100) < chance
            then
                local s_pos = area:position(vi)

                --
                -- Quartz Temple
                --

                -- add Y displacement
                local schem_pos = vector.new(s_pos.x, s_pos.y - y_dis, s_pos.z)

                -- find floor big enough
                local positions = core.find_nodes_in_area_under_air(
                    vector.new(s_pos.x - size_x, s_pos.y - 1, s_pos.z - size_z),
                    vector.new(s_pos.x + size_x, s_pos.y + 1, s_pos.z + size_z),
                    {
                        'everness:dirt_with_crystal_grass'
                    }
                )

                if #positions >= math_floor((size.x * size.z) * 0.7) then
                    -- enough air to place structure ?
                    local air_positions = core.find_nodes_in_area(
                        vector.new(s_pos.x - size_x, s_pos.y, s_pos.z - size_z),
                        vector.new(s_pos.x + size_x, s_pos.y + size.y, s_pos.z + size_z),
                        {
                            'air'
                        }
                    )

                    if #air_positions > (size.x * size.y * size.z) / 2 then
                        core.place_schematic_on_vmanip(
                            vm,
                            schem_pos,
                            schem,
                            'random',
                            nil,
                            true,
                            'place_center_x, place_center_z'
                        )

                        shared_args.schem_positions.everness_quartz_temple = shared_args.schem_positions.everness_quartz_temple or {}

                        table.insert(shared_args.schem_positions.everness_quartz_temple, {
                            pos = schem_pos,
                            minp = vector.new(s_pos.x - size_x, s_pos.y - y_dis, s_pos.z - size_z),
                            maxp = vector.new(s_pos.x + size_x, s_pos.y - y_dis + size.y, s_pos.z + size_z)
                        })

                        core.log('action', '[Everness] Quartz Temple was placed at ' .. schem_pos:to_string())
                        break
                    end
                end
            end
            vi = vi + ystride
        end
    end,
    after_write_to_map = function(shared_args)
        local schem_positions = shared_args.schem_positions or {}

        for name, tbl in pairs(schem_positions) do
            if next(tbl) then
                for i, v in ipairs(tbl) do
                    local chest_positions = core.find_nodes_in_area(
                        v.minp,
                        v.maxp,
                        { 'everness:chest' }
                    )

                    if #chest_positions > 0 then
                        Everness:populate_loot_chests(chest_positions)
                    end
                end
            end
        end
    end
})
