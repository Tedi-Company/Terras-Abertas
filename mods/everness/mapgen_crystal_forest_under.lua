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

local y_max = Everness.settings.biomes.everness_crystal_forest_under.y_max
local y_min = Everness.settings.biomes.everness_crystal_forest_under.y_min

-- Crystal Forest Under

Everness:register_biome({
    name = 'everness:crystal_forest_under',
    node_cave_liquid = { 'mapgen_water_source', 'mapgen_lava_source' },
    node_dungeon = 'everness:crystal_cobble',
    node_dungeon_alt = 'everness:crystal_mossy_cobble',
    node_dungeon_stair = 'stairs:stair_crystal_cobble',
    y_max = y_max,
    y_min = y_min,
    heat_point = 35,
    humidity_point = 50,
})

--
-- Register decorations
--

Everness:register_decoration({
    name = 'everness:crystal_forest_under_floors',
    deco_type = 'simple',
    place_on = { 'default:stone' },
    sidelen = 16,
    place_offset_y = -1,
    fill_ratio = 10,
    biomes = { 'everness:crystal_forest_under' },
    y_max = y_max,
    y_min = y_min,
    decoration = {
        'everness:crystal_cave_dirt_with_moss',
        'everness:crystal_moss_block'
    },
    flags = 'all_floors, force_placement'
})

Everness:register_decoration({
    name = 'everness:crystal_forest_under_ceilings',
    deco_type = 'simple',
    place_on = { 'default:stone' },
    sidelen = 16,
    fill_ratio = 0.4,
    biomes = { 'everness:crystal_forest_under' },
    y_max = y_max,
    y_min = y_min,
    flags = 'all_ceilings',
    decoration = {
        'everness:crystal_moss_block'
    },
})

Everness:register_decoration({
    name = 'everness:crystal_forest_under_vines',
    deco_type = 'simple',
    place_on = { 'everness:crystal_moss_block' },
    sidelen = 16,
    fill_ratio = 0.09,
    biomes = { 'everness:crystal_forest_under' },
    param2 = 8,
    decoration = {
        'everness:twisted_vine_1',
        'everness:twisted_vine_2',
        'everness:golden_vine_1',
        'everness:golden_vine_2'
    },
    y_max = y_max,
    y_min = y_min,
    flags = 'all_ceilings',
    spawn_by = 'air',
    num_spawn_by = 8
})


Everness:register_decoration({
    name = 'everness:crystal_forest_under_crystal_sphere_cluster',
    deco_type = 'simple',
    place_on = {
        'everness:crystal_cave_dirt_with_moss',
        'everness:crystal_moss_block'
    },
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.0005,
        spread = { x = 250, y = 250, z = 250 },
        seed = 2,
        octaves = 3,
        persist = 0.66
    },
    biomes = { 'everness:crystal_forest_under' },
    y_max = y_max - 1500 > y_min and y_max - 1500 or y_max,
    y_min = y_min,
    flags = 'all_floors',
    decoration = {
        'everness:marker'
    },
})

Everness:register_decoration({
    name = 'everness:crystal_forest_under_crystal_cyan',
    deco_type = 'simple',
    place_on = {
        'everness:crystal_cave_dirt_with_moss',
        'everness:crystal_moss_block'
    },
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.02,
        spread = { x = 200, y = 200, z = 200 },
        seed = 329,
        octaves = 3,
        persist = 0.6
    },
    biomes = { 'everness:crystal_forest_under' },
    y_max = y_max,
    y_min = y_min,
    decoration = {
        'everness:crystal_cyan',
        'everness:crystal_purple',
        'everness:crystal_orange'
    },
    flags = 'all_floors',
    param2 = 1
})

Everness:register_decoration({
    name = 'everness:crystal_forest_under_twisted_crystal_grass',
    deco_type = 'simple',
    place_on = {
        'everness:crystal_cave_dirt_with_moss',
        'everness:crystal_moss_block'
    },
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.2,
        spread = { x = 100, y = 100, z = 100 },
        seed = 801,
        octaves = 3,
        persist = 0.7
    },
    biomes = { 'everness:crystal_forest_under' },
    y_max = y_max - 500 > y_min and y_max - 500 or y_max,
    y_min = y_min,
    decoration = 'everness:twisted_crystal_grass',
    flags = 'all_floors',
    param2 = 0,
    param2_max = 239,
})

Everness:register_decoration({
    name = 'everness:crystal_forest_under_twisted_crystal_spire',
    deco_type = 'simple',
    place_on = {
        'everness:crystal_cave_dirt_with_moss',
        'everness:crystal_moss_block'
    },
    sidelen = 16,
    noise_params = {
        offset = -0.05,
        scale = 0.1,
        spread = { x = 100, y = 100, z = 100 },
        seed = 801,
        octaves = 3,
        persist = 0.7
    },
    biomes = { 'everness:crystal_forest_under' },
    y_max = y_max - 500 > y_min and y_max - 500 or y_max,
    y_min = y_min,
    decoration = 'everness:twisted_crystal_spire',
    flags = 'all_floors',
    param2 = 0,
    param2_max = 239,
})

Everness:register_decoration({
    name = 'everness:crystal_forest_under_crystal_cyan_ceiling',
    deco_type = 'simple',
    place_on = { 'default:stone' },
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.02,
        spread = { x = 200, y = 200, z = 200 },
        seed = 329,
        octaves = 3,
        persist = 0.6
    },
    biomes = { 'everness:crystal_forest_under' },
    y_max = y_max,
    y_min = y_min,
    decoration = {
        'everness:crystal_cyan',
        'everness:crystal_purple',
        'everness:crystal_orange'
    },
    flags = 'all_ceilings',
})

--
-- On Generated
--

local math_floor = math.floor
local math_sin = math.sin

local floor_nodes = {}
local function register_floor_node(name)
    local id = core.get_content_id(name)
    if id and id ~= core.CONTENT_IGNORE and id ~= core.CONTENT_AIR then
        floor_nodes[id] = true
    end
end
register_floor_node('everness:crystal_cave_dirt_with_moss')
register_floor_node('everness:crystal_moss_block')

local c_air = core.get_content_id('air')

local replaceable_nodes = {
    [c_air] = true,
}
local function register_replaceable_node(name)
    local id = core.get_content_id(name)
    if id and id ~= core.CONTENT_IGNORE and id ~= core.CONTENT_AIR then
        replaceable_nodes[id] = true
    end
end
register_replaceable_node('everness:twisted_crystal_grass')
register_replaceable_node('everness:twisted_crystal_spire')
register_replaceable_node('everness:crystal_cyan')
register_replaceable_node('everness:crystal_purple')
register_replaceable_node('everness:crystal_orange')

local biome_id_everness_crystal_forest_under = core.get_biome_id('everness:crystal_forest_under')

local deco_id_crystal_forest_under_crystal_sphere_cluster = core.get_decoration_id('everness:crystal_forest_under_crystal_sphere_cluster')

-- `core.read_schematic` here so we don't cache the schem file, otherwise `replacements` will not work
local schem_crystal_sphere_cluster = core.read_schematic(core.get_modpath('everness') .. '/schematics/everness_crystal_purple_cluster.mts', {})
local crystal_sphere_cluster_size = { x = 20, y = 19, z = 19 }
local crystal_sphere_cluster_size_x = math.round(crystal_sphere_cluster_size.x / 2)
local crystal_sphere_cluster_size_z = math.round(crystal_sphere_cluster_size.z / 2)
local crystal_sphere_cluster_safe_volume = (crystal_sphere_cluster_size.x * crystal_sphere_cluster_size.y * crystal_sphere_cluster_size.z) / 2
local crystal_sphere_cluster_place_on = Everness.to_set(core.registered_decorations['everness:crystal_forest_under_crystal_sphere_cluster'].place_on)

Everness:register_gen_notify_decoration({
    deco_id_crystal_forest_under_crystal_sphere_cluster
})

Everness:add_to_queue_on_generated({
    name = 'everness:crystal_forest_under',
    can_run = function(biomemap, chunk_biomes)
        return (chunk_biomes and chunk_biomes[biome_id_everness_crystal_forest_under]) or table.indexof(biomemap, biome_id_everness_crystal_forest_under) ~= -1
    end,
    -- 1. on_data: Raw VoxelManip content/param2 manipulation (committed automatically via set_data)
    on_data = function(minp, maxp, area, data, p2data, gennotify, rand, shared_args, biomemap)
        --
        -- Crystal Clusters (Marker-free Worley Cellular Noise L-System)
        --
        local cell_size = 32
        local min_gx = math_floor(minp.x / cell_size) - 1
        local max_gx = math_floor(maxp.x / cell_size) + 1
        local min_gz = math_floor(minp.z / cell_size) - 1
        local max_gz = math_floor(maxp.z / cell_size) + 1
        local ystride = area.ystride
        local chunk_size_x = maxp.x - minp.x + 1

        for cx = min_gx, max_gx do
            for cz = min_gz, max_gz do
                local n = math_sin(cx * 127.1 + cz * 311.7 + 5432.1) * 43758.5453
                local rand_val = (n - math_floor(n))

                -- 80% chance cell has a crystal cluster, 20% empty spacing
                if rand_val < 0.80 then
                    local n2 = math_sin(cx * 269.5 + cz * 183.3 + 9876.5) * 43758.5453
                    local rx = (n2 - math_floor(n2)) * 0.7 + 0.15
                    local n3 = math_sin(cx * 419.2 + cz * 371.9 + 1357.9) * 43758.5453
                    local rz = (n3 - math_floor(n3)) * 0.7 + 0.15

                    local seed_x = math_floor((cx + rx) * cell_size)
                    local seed_z = math_floor((cz + rz) * cell_size)

                    if seed_x >= minp.x and seed_x <= maxp.x and seed_z >= minp.z and seed_z <= maxp.z then
                        -- Check column biome
                        local col_idx = (seed_z - minp.z) * chunk_size_x + (seed_x - minp.x) + 1
                        if not biomemap or not biomemap[col_idx] or biomemap[col_idx] == biome_id_everness_crystal_forest_under then
                            -- Color zoning (Orange 45%, Cyan 30%, Purple 25%)
                            local color_choice = math_floor((rand_val / 0.80) * 3) % 3
                            local rand_color = (color_choice == 0 and 'orange') or (color_choice == 1 and 'cyan') or 'purple'

                            -- Scan vertical column for cavern floor surface
                            for y = maxp.y - 1, minp.y, -1 do
                                local vi = area:index(seed_x, y, seed_z)
                                local node_id = data[vi]
                                local above_id = data[vi + ystride]

                                if floor_nodes[node_id] and replaceable_nodes[above_id] then
                                    -- Check vertical clearance (counting air and replaceable grass/decorations)
                                    local clearance = 0
                                    for h = 1, 12 do
                                        local check_y = y + h
                                        if check_y <= maxp.y and replaceable_nodes[data[vi + h * ystride]] then
                                            clearance = clearance + 1
                                        else
                                            break
                                        end
                                    end

                                    if clearance >= 2 then
                                        local stage = 1
                                        if clearance >= 9 and rand_val < 0.25 then
                                            stage = 3 -- Grand Cavern Spire
                                        elseif clearance >= 5 and rand_val < 0.55 then
                                            stage = 2 -- Medium Cluster
                                        end

                                        local cluster_pos = vector.new(seed_x, y + 1, seed_z)
                                        Everness.spawn_crystal_cluster_vmanip(
                                            nil,
                                            area,
                                            data,
                                            p2data,
                                            cluster_pos,
                                            rand_color,
                                            stage,
                                            rand
                                        )
                                    end
                                    break -- Placed at highest valid floor in this column
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
    -- 2. after_set_data: Schematics placement on VoxelManip
    after_set_data = function(minp, maxp, vm, area, data, p2data, gennotify, rand, shared_args)

        --
        -- Crystal Sphere Cluster
        --
        for _, pos in ipairs(gennotify['decoration#' .. (deco_id_crystal_forest_under_crystal_sphere_cluster or '')] or {}) do
            -- `pos` is position of the 'place_on' node
            local marker_pos = vector.new(pos.x, pos.y + 1, pos.z)
            local marker_node = core.get_node(marker_pos)
            local place_on_node = core.get_node(pos)
            local crystal_sphere_cluster_y_dis = rand:next(5, 9)

            if marker_node and marker_node.name == 'everness:marker' then
                -- remove marker
                core.remove_node(marker_pos)

                if place_on_node and crystal_sphere_cluster_place_on[place_on_node.name] then
                    -- enough air to place structure ?
                    local positions = core.find_nodes_in_area(
                        vector.new(
                            pos.x - crystal_sphere_cluster_size_x,
                            pos.y - crystal_sphere_cluster_y_dis,
                            pos.z - crystal_sphere_cluster_size_z
                        ),
                        vector.new(
                            pos.x + crystal_sphere_cluster_size_x,
                            pos.y - crystal_sphere_cluster_y_dis + crystal_sphere_cluster_size.y,
                            pos.z + crystal_sphere_cluster_size_z
                        ),
                        {
                            'air',
                            'everness:coral_tree',
                            'everness:crystal_block_orange',
                            'everness:crystal_block_purple',
                            'everness:crystal_block_cyan',
                        },
                        true
                    )

                    local air = positions.air or {}
                    local tree = positions['everness:coral_tree'] or {}
                    local block_orange = positions['everness:crystal_block_orange'] or {}
                    local block_purple = positions['everness:crystal_block_purple'] or {}
                    local block_cyan = positions['everness:crystal_block_cyan'] or {}

                    if
                        #air > crystal_sphere_cluster_safe_volume
                        -- do not overlap
                        and not (
                            #tree > 0
                            or #block_orange > 0
                            or #block_purple > 0
                            or #block_cyan > 0
                        )
                    then
                        local replacements
                        local rand_color

                        if rand:next(0, 100) < 25 then
                            local colors = { 'orange', 'cyan' }
                            rand_color = colors[rand:next(1, #colors)]

                            replacements = {
                                ['everness:crystal_block_purple'] = 'everness:crystal_block_' .. rand_color,
                                ['everness:crystal_purple'] = 'everness:crystal_' .. rand_color
                            }
                        end

                        core.place_schematic_on_vmanip(
                            vm,
                            vector.new(marker_pos.x, marker_pos.y - crystal_sphere_cluster_y_dis, marker_pos.z),
                            schem_crystal_sphere_cluster,
                            'random',
                            replacements,
                            true,
                            'place_center_x, place_center_z'
                        )

                        -- core.log('action', '[Everness] Crystal Sphere Cluster ' .. (rand_color or 'orange') .. ' was placed at ' .. pos:to_string())
                    end
                end
            end
        end
    end
})
