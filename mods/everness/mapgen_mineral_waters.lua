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

local y_max = Everness.settings.biomes.everness_mineral_waters.y_max
local y_min = Everness.settings.biomes.everness_mineral_waters.y_min

-- Mineral Waters

Everness:register_biome({
    name = 'everness:mineral_waters',
    node_top = 'everness:mineral_sand',
    depth_top = 1,
    node_filler = 'everness:mineral_stone',
    depth_filler = 1,
    node_stone = 'everness:mineral_stone',
    node_riverbed = 'everness:mineral_sand',
    depth_riverbed = 2,
    node_dungeon = 'everness:mineral_stone_brick',
    node_dungeon_alt = 'everness:mineral_stone_brick_with_growth',
    node_dungeon_stair = 'stairs:stair_mineral_stone_brick',
    y_max = y_max,
    y_min = y_min,
    vertical_blend = 16,
    heat_point = 78,
    humidity_point = 58,
})

--
-- Register ores
--

-- Scatter ores

-- Coal

Everness:register_ore({
    ore_type = 'scatter',
    ore = 'everness:mineral_stone_with_coal',
    wherein = 'everness:mineral_stone',
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 9,
    clust_size = 3,
    y_max = y_max,
    y_min = y_min,
    biomes = { 'everness:mineral_waters' }
})

Everness:register_ore({
    ore_type = 'scatter',
    ore = 'everness:mineral_stone_with_ceramic_sherds',
    wherein = 'everness:mineral_stone',
    clust_scarcity = 14 * 14 * 14,
    clust_num_ores = 5,
    clust_size = 3,
    y_max = y_max,
    y_min = y_min,
    biomes = { 'everness:mineral_waters' }
})

--
-- On Generated
--

local function find_irecursive(tbl, c_id)
    for _, v in ipairs(tbl) do
        if type(v) == 'table' then
            if find_irecursive(v, c_id) then
                return true
            end
        elseif c_id == v then
            return true
        end
    end
    return false
end

-- Get the content IDs for the nodes used
local c_everness_mineral_water_source = core.get_content_id('everness:mineral_water_source')
local c_everness_mineral_stone = core.get_content_id('everness:mineral_stone')
local c_everness_mineral_stone_brick = core.get_content_id('everness:mineral_stone_brick')
local c_everness_mineral_stone_brick_with_growth = core.get_content_id('everness:mineral_stone_brick_with_growth')
local c_everness_mineral_stone_brick_with_flower_growth = core.get_content_id('everness:mineral_stone_brick_with_flower_growth')
local c_everness_mineral_sand = core.get_content_id('everness:mineral_sand')
local c_everness_mineral_sandstone = core.get_content_id('everness:mineral_sandstone')
local c_everness_mineral_sandstone_block = core.get_content_id('everness:mineral_sandstone_block')
local c_everness_chest = core.get_content_id('everness:chest')
local c_everness_mineral_stone_with_coal = core.get_content_id('everness:mineral_stone_with_coal')
local c_everness_mineral_stone_with_ceramic_sherds = core.get_content_id('everness:mineral_stone_with_ceramic_sherds')
local c_everness_lotus_flower_white = core.get_content_id('everness:lotus_flower_white')
local c_everness_lotus_flower_purple = core.get_content_id('everness:lotus_flower_purple')
local c_everness_lotus_flower_pink = core.get_content_id('everness:lotus_flower_pink')
local c_everness_lotus_lotus_leaf = core.get_content_id('everness:lotus_leaf')
local c_everness_lotus_lotus_leaf_2 = core.get_content_id('everness:lotus_leaf_2')
local c_everness_lotus_lotus_leaf_3 = core.get_content_id('everness:lotus_leaf_3')
local c_everness_ceramic_pot_blank = core.get_content_id('everness:ceramic_pot_blank')
local c_everness_ceramic_pot_flowers = core.get_content_id('everness:ceramic_pot_flowers')
local c_everness_ceramic_pot_lines = core.get_content_id('everness:ceramic_pot_lines')
local c_everness_ceramic_pot_tribal = core.get_content_id('everness:ceramic_pot_tribal')
local c_everness_mineral_water_weed_1 = core.get_content_id('everness:mineral_water_weed_1')
local c_everness_mineral_water_weed_2 = core.get_content_id('everness:mineral_water_weed_2')
local c_everness_mineral_water_weed_3 = core.get_content_id('everness:mineral_water_weed_3')
local c_everness_water_geyser = core.get_content_id('everness:water_geyser')
local c_everness_rose_bush = core.get_content_id('everness:rose_bush')
-- Biome IDs
local biome_id_everness_mineral_waters = core.get_biome_id('everness:mineral_waters')

-- Pool building blocks variations
local pool_build_nodes = {
    {
        c_everness_mineral_stone,
        c_everness_mineral_stone_brick,
        c_everness_mineral_stone_brick_with_growth,
        c_everness_mineral_stone_brick_with_flower_growth
    },
    {
        c_everness_mineral_sandstone,
        c_everness_mineral_sandstone_block
    }
}
local c_lotus_flowers = {
    c_everness_lotus_flower_white,
    c_everness_lotus_flower_purple,
    c_everness_lotus_flower_pink
}
local c_lotus_leaves = {
    c_everness_lotus_lotus_leaf,
    c_everness_lotus_lotus_leaf_2,
    c_everness_lotus_lotus_leaf_3
}
local c_pots = {
    c_everness_ceramic_pot_blank,
    c_everness_ceramic_pot_flowers,
    c_everness_ceramic_pot_lines,
    c_everness_ceramic_pot_tribal
}
local c_water_weeds = {
    c_everness_mineral_water_weed_1,
    c_everness_mineral_water_weed_2
}

local chance = 20
local disp = 16
local schem = core.get_modpath('everness') .. '/schematics/everness_mineral_waters_tower.mts'
local size = { x = 7, y = 16, z = 9 }
local size_x = math.round(size.x / 2)
local size_z = math.round(size.z / 2)

Everness:add_to_queue_on_generated({
    name = 'everness:mineral_waters',
    can_run = function(biomemap, chunk_biomes)
        return (chunk_biomes and chunk_biomes[biome_id_everness_mineral_waters]) or table.indexof(biomemap, biome_id_everness_mineral_waters) ~= -1
    end,
    on_data = function(minp, maxp, area, data, p2data, gennotify, rand, shared_args, biomemap)
        biomemap = biomemap or core.get_mapgen_object('biomemap') or {}
        local csize_x = maxp.x - minp.x + 1
        local rand_version = rand:next(1, 2)
        local chest_positions = {}
        local pot_pos = {}

        if rand_version == 1 then
            --
            -- Pools
            --
            for y = minp.y, maxp.y do
                for z = minp.z, maxp.z do
                    for x = minp.x, maxp.x do
                        local b_idx_start = (z - minp.z) * csize_x + (x - minp.x) + 1
                        if biomemap[b_idx_start] == biome_id_everness_mineral_waters then
                            local ai = area:index(x, y, z)
                            local node_cid = data[ai]
                            local node_name = core.get_name_from_content_id(node_cid)
                            local node_def = core.registered_nodes[node_name]

                            local is_start_tree_or_leaf = node_def and node_def.groups and (
                                (node_def.groups.tree and node_def.groups.tree > 0)
                                or (node_def.groups.leaves and node_def.groups.leaves > 0)
                                or (node_def.groups.wood and node_def.groups.wood > 0)
                            )

                            local is_start_ground = node_def and node_def.walkable
                                and not is_start_tree_or_leaf
                                and (
                                    node_cid == c_everness_mineral_sand
                                    or node_cid == c_everness_mineral_stone
                                    or (node_def.groups and (node_def.groups.sand or node_def.groups.stone or node_def.groups.soil))
                                )

                            if
                                data[ai + area.ystride] == core.CONTENT_AIR
                                and is_start_ground
                            then
                                local length = 5 + rand:next(0, 10)
                                local width = 5 + rand:next(0, 10)
                                local height = 3 + rand:next(0, 4)
                                local walkable_nodes = 0
                                local invalid_placement = false

                                -- find space for lake (walkable rectangle)
                                for li = 1, length do
                                    local x_rec = x + li

                                    for wi = 1, width do
                                        local z_rec = z + wi
                                        local ai_rec = (ai + li) + (area.zstride * wi)
                                        local n_cid = data[ai_rec]

                                        local is_target_biome
                                        -- 1. Fast path: check biomemap flat array (within chunk bounds)
                                        if x_rec >= minp.x and x_rec <= maxp.x and z_rec >= minp.z and z_rec <= maxp.z then
                                            local b_idx = (z_rec - minp.z) * csize_x + (x_rec - minp.x) + 1
                                            is_target_biome = (biomemap[b_idx] == biome_id_everness_mineral_waters)
                                        else
                                            -- 2. Fallback: for coordinates extending outside chunk boundaries
                                            local b_data = core.get_biome_data({ x = x_rec, y = y, z = z_rec })
                                            is_target_biome = (b_data and b_data.biome == biome_id_everness_mineral_waters)
                                        end

                                        if n_cid == core.CONTENT_IGNORE then
                                            if is_target_biome then
                                                walkable_nodes = walkable_nodes + 1
                                            else
                                                invalid_placement = true
                                                break
                                            end
                                        else
                                            local n_name = core.get_name_from_content_id(n_cid)
                                            local n_def = core.registered_nodes[n_name]

                                            local is_tree_or_leaf = n_def and n_def.groups and (
                                                (n_def.groups.tree and n_def.groups.tree > 0)
                                                or (n_def.groups.leaves and n_def.groups.leaves > 0)
                                                or (n_def.groups.wood and n_def.groups.wood > 0)
                                            )

                                            if not is_target_biome or is_tree_or_leaf then
                                                invalid_placement = true
                                                break
                                            end

                                            if n_def
                                                and n_def.walkable
                                                and data[ai_rec + area.ystride] == core.CONTENT_AIR
                                            then
                                                walkable_nodes = walkable_nodes + 1
                                            end
                                        end
                                    end

                                    if invalid_placement then
                                        break
                                    end
                                end

                                -- build pool (cuboid)
                                if not invalid_placement and walkable_nodes >= (width * length * 0.75) then
                                    local pool_build_nodes_group = pool_build_nodes[rand:next(1, #pool_build_nodes)]
                                    -- offset y so the pools are sticking out / sinking in from the ground vertically
                                    local ai_offset_y = ai - (area.ystride * height) + (area.ystride * rand:next(0, math.ceil(height / 2)))

                                    for hi = 1, height do
                                        for li = 1, length do
                                            for wi = 1, width do
                                                local mineral_stone = pool_build_nodes_group[rand:next(1, #pool_build_nodes_group)]
                                                local ai_cub = (ai_offset_y + li) + (area.ystride * hi) + (area.zstride * wi)
                                                local current_c_id = data[ai_cub]

                                                local is_outer_boundary = (hi == 1 or li == 1 or li == length or wi == 1 or wi == width)

                                                if is_outer_boundary then
                                                    -- Guarantee 100% solid floor (hi == 1) and all 4 solid perimeter walls to prevent leaks
                                                    if not find_irecursive(pool_build_nodes, current_c_id) then
                                                        data[ai_cub] = mineral_stone
                                                    end
                                                else
                                                    -- Interior of the pool: fill with water
                                                    data[ai_cub] = c_everness_mineral_water_source
                                                end

                                                -- place loot chest in the middle of the pool floor
                                                if hi == 2
                                                    and height > 4
                                                    and math.ceil(length / 2) == li
                                                    and math.ceil(width / 2) == wi
                                                    and data[ai_cub - area.ystride] ~= c_everness_mineral_water_source
                                                    and rand:next(0, 100) < 3
                                                then
                                                    data[ai_cub] = c_everness_chest
                                                    table.insert(chest_positions, vector.new(area:position(ai_cub)))
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            -- Plug any holes along chunk boundaries where adjacent lake chunks placed water
            for y = minp.y, maxp.y do
                for z = minp.z, maxp.z do
                    for x = minp.x, maxp.x do
                        if x == minp.x or x == maxp.x or z == minp.z or z == maxp.z or z == minp.z + 1 or z == maxp.z - 1 then
                            local ai = area:index(x, y, z)
                            if data[ai] == core.CONTENT_AIR then
                                local is_leaking = false

                                if x == minp.x and data[ai - 1] == c_everness_mineral_water_source then
                                    is_leaking = true
                                elseif x == maxp.x and data[ai + 1] == c_everness_mineral_water_source then
                                    is_leaking = true
                                elseif (z == minp.z and (data[ai - area.zstride] == c_everness_mineral_water_source or data[ai - area.zstride * 2] == c_everness_mineral_water_source))
                                    or (z == minp.z + 1 and data[ai - area.zstride * 2] == c_everness_mineral_water_source) then
                                    is_leaking = true
                                elseif (z == maxp.z and (data[ai + area.zstride] == c_everness_mineral_water_source or data[ai + area.zstride * 2] == c_everness_mineral_water_source))
                                    or (z == maxp.z - 1 and data[ai + area.zstride * 2] == c_everness_mineral_water_source) then
                                    is_leaking = true
                                end

                                if is_leaking then
                                    data[ai] = c_everness_mineral_sand
                                    -- Support down if there is air below so the sand wall is solid
                                    local down_count = 1
                                    while down_count <= 8 do
                                        local down_ai = ai - area.ystride * down_count
                                        if data[down_ai] == core.CONTENT_AIR then
                                            data[down_ai] = c_everness_mineral_sand
                                        else
                                            break
                                        end
                                        down_count = down_count + 1
                                    end
                                end
                            end
                        end
                    end
                end
            end
        elseif rand_version == 2 then
            --
            -- Lakes
            --
            local function is_valid_lake_node(c_id, nx, ny, nz)
                if c_id == c_everness_mineral_sand
                    or c_id == c_everness_mineral_water_source
                    or c_id == c_everness_mineral_stone
                    or c_id == c_everness_mineral_stone_with_coal
                    or c_id == c_everness_mineral_stone_with_ceramic_sherds
                then
                    return true
                end
                -- At chunk boundaries, ungenerated adjacent chunk nodes in data are CONTENT_IGNORE
                if c_id == core.CONTENT_IGNORE then
                    local is_target_biome
                    if nx >= minp.x and nx <= maxp.x and nz >= minp.z and nz <= maxp.z then
                        local b_idx = (nz - minp.z) * csize_x + (nx - minp.x) + 1
                        is_target_biome = (biomemap[b_idx] == biome_id_everness_mineral_waters)
                    else
                        local b_data = core.get_biome_data({ x = nx, y = ny, z = nz })
                        is_target_biome = (b_data and b_data.biome == biome_id_everness_mineral_waters)
                    end
                    return is_target_biome == true
                end
                return false
            end

            for z = minp.z, maxp.z do
                for y = minp.y, maxp.y do
                    for x = minp.x, maxp.x do
                        local ai = area:index(x, y, z)
                        local c_current = data[ai]

                        -- Check 4 horizontal cardinal neighbors (+X, -X, +Z, -Z)
                        local c_right = data[ai + 1]
                        local c_left = data[ai - 1]
                        local c_front = data[ai + (area.zstride * 2)]
                        local c_back = data[ai - (area.zstride * 2)]

                        local keep_going = true
                        local while_count = 1
                        local max_dig_depth = 11

                        if
                            c_current == c_everness_mineral_sand
                            and is_valid_lake_node(c_right, x + 1, y, z)
                            and is_valid_lake_node(c_left, x - 1, y, z)
                            and is_valid_lake_node(c_front, x, y, z + 2)
                            and is_valid_lake_node(c_back, x, y, z - 2)
                        then
                            -- dig below
                            while keep_going and while_count <= max_dig_depth do
                                local while_index = ai - area.ystride * while_count
                                local cur_y = y - while_count

                                if
                                    (
                                        data[while_index] == c_everness_mineral_stone
                                        or data[while_index] == c_everness_mineral_stone_with_coal
                                        or data[while_index] == c_everness_mineral_stone_with_ceramic_sherds
                                    )
                                    and is_valid_lake_node(data[while_index + 1 + area.ystride], x + 1, cur_y + 1, z)
                                    and is_valid_lake_node(data[while_index - 1 + area.ystride], x - 1, cur_y + 1, z)
                                    and is_valid_lake_node(data[while_index + area.zstride + area.ystride], x, cur_y + 1, z + 1)
                                    and is_valid_lake_node(data[while_index - area.zstride + area.ystride], x, cur_y + 1, z - 1)
                                then
                                    data[while_index + area.ystride] = c_everness_mineral_water_source
                                else
                                    keep_going = false
                                end

                                while_count = while_count + 1
                            end
                        end
                    end
                end
            end
        end

        -- Place decorations after generating (2nd pass)
        -- luacheck: ignore 512
        for y = minp.y, maxp.y do
            for z = minp.z, maxp.z do
                for x = minp.x, maxp.x do
                    local ai = area:index(x, y, z)
                    --
                    -- Place Lotus Flowers and Leaves
                    --
                    if
                        data[ai] == c_everness_mineral_water_source
                        -- spawn around water
                        and data[ai + 1 + area.zstride] == c_everness_mineral_water_source
                        and data[ai + 1 - area.zstride] == c_everness_mineral_water_source
                        and data[ai + 1] == c_everness_mineral_water_source
                        and data[ai - 1] == c_everness_mineral_water_source
                        and data[ai - 1 + area.zstride] == c_everness_mineral_water_source
                        and data[ai - 1 - area.zstride] == c_everness_mineral_water_source
                        and data[ai + area.zstride] == c_everness_mineral_water_source
                        and data[ai - area.zstride] == c_everness_mineral_water_source
                        -- make sure there is space above
                        and data[ai + area.ystride] == core.CONTENT_AIR
                        -- spawn around air above
                        and data[ai + area.ystride + 1] == core.CONTENT_AIR
                        and data[ai + area.ystride + 1 + area.zstride] == core.CONTENT_AIR
                        and data[ai + area.ystride + 1 - area.zstride] == core.CONTENT_AIR
                        and data[ai + area.ystride - 1] == core.CONTENT_AIR
                        and data[ai + area.ystride - 1 + area.zstride] == core.CONTENT_AIR
                        and data[ai + area.ystride - 1 - area.zstride] == core.CONTENT_AIR
                        and data[ai + area.ystride + area.zstride] == core.CONTENT_AIR
                        and data[ai + area.ystride - area.zstride] == core.CONTENT_AIR
                    then
                        if rand:next(0, 100) < 2 then
                            data[ai + area.ystride] = c_lotus_flowers[rand:next(1, #c_lotus_flowers)]

                            -- Place Lotus Leaves around Flowers
                            local radius = 3
                            local chance_max = 80

                            for i = -radius, radius do
                                for j = -radius, radius do
                                    local idx = ai + i + (area.zstride * j) + area.ystride
                                    local distance = math.round(vector.distance(area:position(ai), area:position(idx)))
                                    local chance_lotus_leaf = math.round(chance_max / distance)

                                    if chance_lotus_leaf > chance_max then
                                        chance_lotus_leaf = chance_max
                                    end

                                    if
                                        rand:next(0, 100) < chance_lotus_leaf
                                        and data[idx] == core.CONTENT_AIR
                                        and data[idx - area.ystride] == c_everness_mineral_water_source
                                    then
                                        data[idx] = c_lotus_leaves[rand:next(1, #c_lotus_leaves)]
                                        p2data[idx] = rand:next(0, 3)
                                    end
                                end
                            end
                        elseif rand:next(0, 100) < 4 then
                            data[ai + area.ystride] = c_lotus_leaves[rand:next(1, #c_lotus_leaves)]
                            p2data[ai + area.ystride] = rand:next(0, 3)

                            -- add some more leaves around the leaf
                            for i = -1, 1 do
                                for j = -1, 1 do
                                    local idx = ai + i + (area.zstride * j) + area.ystride

                                    if
                                        rand:next(0, 100) < 25
                                        and data[idx] == core.CONTENT_AIR
                                        and data[idx - area.ystride] == c_everness_mineral_water_source
                                    then
                                        data[idx] = c_lotus_leaves[rand:next(1, #c_lotus_leaves)]
                                        p2data[idx] = rand:next(0, 3)
                                    end
                                end
                            end
                        end
                    end

                    --
                    -- Place Seaweed
                    --
                    if
                        data[ai] == c_everness_mineral_water_source
                        and data[ai + area.ystride] == c_everness_mineral_water_source
                        and rand:next(0, 100) < 33
                    then
                        local c_weed = c_water_weeds[rand:next(1, #c_water_weeds)]

                        if rand:next(0, 100) < 5 then
                            -- Weed with light source with a bit less probability
                            c_weed = c_everness_mineral_water_weed_3
                        end

                        if data[ai + 1] == c_everness_mineral_stone then
                            data[ai + 1] = c_weed
                            data[ai + 1] = c_weed
                            data[ai + 1] = c_weed
                            p2data[ai + 1] = 2
                        elseif data[ai - 1] == c_everness_mineral_stone then
                            data[ai - 1] = c_weed
                            data[ai - 1] = c_weed
                            data[ai - 1] = c_weed
                            p2data[ai - 1] = 3
                        elseif data[ai + area.zstride] == c_everness_mineral_stone then
                            data[ai + area.zstride] = c_weed
                            data[ai + area.zstride] = c_weed
                            data[ai + area.zstride] = c_weed
                            p2data[ai + area.zstride] = 4
                        elseif data[ai - area.zstride] == c_everness_mineral_stone then
                            data[ai - area.zstride] = c_weed
                            data[ai - area.zstride] = c_weed
                            data[ai - area.zstride] = c_weed
                            p2data[ai - area.zstride] = 5
                        elseif data[ai - area.ystride] == c_everness_mineral_stone then
                            data[ai - area.ystride] = c_weed
                            data[ai - area.ystride] = c_weed
                            data[ai - area.ystride] = c_weed
                            p2data[ai - area.ystride] = 1
                        end
                    end

                    --
                    -- Place pots under water
                    --
                    if
                        data[ai] == c_everness_mineral_water_source
                        -- spawn around water
                        and data[ai + 1 + area.zstride] == c_everness_mineral_water_source
                        and data[ai + 1 - area.zstride] == c_everness_mineral_water_source
                        and data[ai + 1] == c_everness_mineral_water_source
                        and data[ai - 1] == c_everness_mineral_water_source
                        and data[ai - 1 + area.zstride] == c_everness_mineral_water_source
                        and data[ai - 1 - area.zstride] == c_everness_mineral_water_source
                        and data[ai + area.zstride] == c_everness_mineral_water_source
                        and data[ai - area.zstride] == c_everness_mineral_water_source
                        -- spawn around water above
                        and data[ai + area.ystride] == c_everness_mineral_water_source
                        and data[ai + area.ystride + 1] == c_everness_mineral_water_source
                        and data[ai + area.ystride + 1 + area.zstride] == c_everness_mineral_water_source
                        and data[ai + area.ystride + 1 - area.zstride] == c_everness_mineral_water_source
                        and data[ai + area.ystride - 1] == c_everness_mineral_water_source
                        and data[ai + area.ystride - 1 + area.zstride] == c_everness_mineral_water_source
                        and data[ai + area.ystride - 1 - area.zstride] == c_everness_mineral_water_source
                        and data[ai + area.ystride + area.zstride] == c_everness_mineral_water_source
                        and data[ai + area.ystride - area.zstride] == c_everness_mineral_water_source
                        -- spawn on solid node below
                        and data[ai - area.ystride] ~= c_everness_mineral_water_source
                    then
                        if rand:next(0, 100) < 1 then
                            table.insert(pot_pos, vector.new(area:position(ai)))
                        end
                    end

                    --
                    -- Surface Decorations on dry mineral sand (Rose Bush, Water Geyser, Pots)
                    --
                    if
                        data[ai] == c_everness_mineral_sand
                        and data[ai + area.ystride] == core.CONTENT_AIR
                    then
                        local r_val = rand:next(1, 1000)
                        if r_val <= 6 then
                            -- Rose Bush (needs air around)
                            if data[ai + area.ystride * 2] == core.CONTENT_AIR
                                and data[ai + 1 + area.ystride] == core.CONTENT_AIR
                                and data[ai - 1 + area.ystride] == core.CONTENT_AIR
                                and data[ai + area.zstride + area.ystride] == core.CONTENT_AIR
                                and data[ai - area.zstride + area.ystride] == core.CONTENT_AIR
                            then
                                data[ai + area.ystride] = c_everness_rose_bush
                            end
                        elseif r_val <= 9 then
                            -- Water Geyser (needs air around)
                            if data[ai + area.ystride * 2] == core.CONTENT_AIR
                                and data[ai + 1 + area.ystride] == core.CONTENT_AIR
                                and data[ai - 1 + area.ystride] == core.CONTENT_AIR
                                and data[ai + area.zstride + area.ystride] == core.CONTENT_AIR
                                and data[ai - area.zstride + area.ystride] == core.CONTENT_AIR
                            then
                                data[ai + area.ystride] = c_everness_water_geyser
                            end
                        elseif r_val <= 12 then
                            -- Ceramic Pots (above water on dry sand)
                            if data[ai + area.ystride * 2] == core.CONTENT_AIR then
                                data[ai + area.ystride] = c_pots[rand:next(1, #c_pots)]
                            end
                        end
                    end
                end
            end
        end

        -- Set `shared_args`
        shared_args.chest_positions = chest_positions
        shared_args.pot_pos = pot_pos
    end,
    after_set_data = function(minp, maxp, vm, area, data, p2data, gennotify, rand, shared_args)
        local sidelength = maxp.x - minp.x + 1
        local x_disp = rand:next(0, disp)
        local z_disp = rand:next(0, disp)
        shared_args.schem_positions = {}

        for y = minp.y, maxp.y do
            local vi = area:index(minp.x + sidelength / 2 + x_disp, y, minp.z + sidelength / 2 + z_disp)

            if data[vi + area.ystride] == core.CONTENT_AIR
                and (
                    data[vi] == c_everness_mineral_water_source
                    or data[vi] == c_everness_mineral_sand
                )
                and rand:next(0, 100) < chance
            then
                local s_pos = area:position(vi)

                --
                -- Mineral Waters Tower
                --

                -- find floor big enough
                local positions = core.find_nodes_in_area_under_air(
                    vector.new(s_pos.x - size_x, s_pos.y - 1, s_pos.z - size_z),
                    vector.new(s_pos.x + size_x, s_pos.y + 1, s_pos.z + size_z),
                    {
                        'everness:mineral_sand',
                        'everness:mineral_water_source'
                    }
                )

                if #positions < size.x * size.z then
                    -- not enough space
                    return
                end

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
                        s_pos,
                        schem,
                        'random',
                        nil,
                        true,
                        'place_center_x, place_center_z'
                    )

                    shared_args.schem_positions.everness_mineral_waters_tower = shared_args.schem_positions.everness_mineral_waters_tower or {}

                    table.insert(shared_args.schem_positions.everness_mineral_waters_tower, {
                        pos = s_pos,
                        minp = vector.new(s_pos.x - size_x, s_pos.y, s_pos.z - size_z),
                        maxp = vector.new(s_pos.x + size_x, s_pos.y + size.y, s_pos.z + size_z)
                    })

                    core.log('action', '[Everness] Mineral Waters Tower was placed at ' .. s_pos:to_string())
                end
            end
        end

        --
        -- Palm Trees (placed on dry mineral sand after pools & lakes)
        --
        local num_palms = rand:next(1, 33)
        for _ = 1, num_palms do
            local px = rand:next(minp.x + 3, maxp.x - 3)
            local pz = rand:next(minp.z + 3, maxp.z - 3)
            for py = maxp.y, minp.y, -1 do
                local vi = area:index(px, py, pz)
                local c_ground = data[vi]
                if c_ground == c_everness_mineral_sand and data[vi + area.ystride] == core.CONTENT_AIR then
                    local p = vector.new(px, py + 1, pz)
                    local air_positions = core.find_nodes_in_area(
                        vector.new(p.x - 2, p.y, p.z - 2),
                        vector.new(p.x + 2, p.y + 6, p.z + 2),
                        { 'air' }
                    )
                    if #air_positions >= 25 then
                        core.place_schematic_on_vmanip(
                            vm,
                            p,
                            core.get_modpath('everness') .. '/schematics/everness_palm_tree.mts',
                            'random',
                            nil,
                            true,
                            'place_center_x, place_center_z'
                        )
                    end
                    break
                elseif c_ground ~= core.CONTENT_AIR and c_ground ~= core.CONTENT_IGNORE then
                    break
                end
            end
        end

        --
        -- Pots (under water)
        --
        local pot_pos = shared_args.pot_pos or {}
        for _, v in ipairs(pot_pos) do
            vm:set_node_at(v, { name = core.get_name_from_content_id(c_pots[rand:next(1, #c_pots)]) })
        end
    end,
    after_write_to_map = function(shared_args, gennotify, rand, minp, maxp)
        -- Populate loot chest inventory
        local chest_positions = shared_args.chest_positions or {}

        if next(chest_positions) then
            Everness:populate_loot_chests(chest_positions)
        end

        -- Populate loot chest inventory for schematics
        local schem_positions = shared_args.schem_positions or {}

        for name, tbl in pairs(schem_positions) do
            if next(tbl) then
                for i, v in ipairs(tbl) do
                    local chest_positions2 = core.find_nodes_in_area(
                        v.minp,
                        v.maxp,
                        { 'everness:chest' }
                    )

                    if #chest_positions2 > 0 then
                        Everness:populate_loot_chests(chest_positions2)
                    end
                end
            end
        end

        -- Populate ceramic pot inventory
        local pot_nodes = {
            'everness:ceramic_pot_blank',
            'everness:ceramic_pot_flowers',
            'everness:ceramic_pot_lines',
            'everness:ceramic_pot_tribal'
        }
        local pot_positions = (minp and maxp and core.find_nodes_in_area(minp, maxp, pot_nodes)) or {}
        for _, p in ipairs(pot_positions) do
            local meta = core.get_meta(p)
            local inv = meta:get_inventory()
            if not inv or inv:get_size('main') == 0 then
                local n = core.get_node(p)
                local ndef = core.registered_nodes[n.name]
                if ndef and ndef.on_construct then
                    ndef.on_construct(p)
                end
                inv = meta:get_inventory()
            end
            if inv and inv:get_size('main') > 0 and inv:is_empty('main') then
                local rand_idx = rand:next(1, #Everness.loot_chest.default)
                local item_def = Everness.loot_chest.default[rand_idx]

                if item_def and core.registered_items[item_def.name] then
                    if rand:next(0, 100) <= item_def.chance then
                        local stack = ItemStack(item_def.name)

                        if core.registered_tools[item_def.name] then
                            stack:set_wear(rand:next(1, 65535))
                        else
                            stack:set_count(rand:next(1, math.min(item_def.max_count, stack:get_stack_max())))
                        end

                        inv:set_stack('main', 1, stack)
                    end
                end
            end
        end
    end
})
