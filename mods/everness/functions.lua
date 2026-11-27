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
-- Player proximity helper for ambient particle spawners & client effects
--

local function is_player_nearby(pos, max_dist)
    local players = core.get_connected_players()
    for i = 1, #players do
        local player = players[i]
        local ppos = player:get_pos()
        if ppos then
            local dx = pos.x - ppos.x
            local dy = pos.y - ppos.y
            local dz = pos.z - ppos.z
            local dist_sq = dx * dx + dy * dy + dz * dz

            -- 1. Immediate vicinity in any direction (18m)
            if dist_sq <= 324 then -- 18^2
                return true
            end

            -- 2. Extended forward cone in player's look direction (up to max_dist * 1.5 ahead)
            local extended_dist = max_dist * 1.5
            if dist_sq <= (extended_dist * extended_dist) then
                local ldir = player:get_look_dir()
                if ldir then
                    -- Dot product > 0 means the node is in front of the player's view
                    local dot = dx * ldir.x + dy * ldir.y + dz * ldir.z
                    if dot > 0 then
                        return true
                    end
                end
            end
        end
    end
    return false
end

--
-- Convert dirt to something that fits the environment
--

local grass_covered_mapping = {
    ['everness:coral_dirt'] = { 'everness:dirt_with_coral_grass' },
    ['everness:cursed_dirt'] = { 'everness:dirt_with_cursed_grass' },
    ['everness:crystal_dirt'] = { 'everness:dirt_with_crystal_grass' },
    ['everness:dirt_1'] = {
        'everness:dirt_with_grass_1',
        'everness:dirt_with_grass_extras_1',
        'everness:dirt_with_grass_extras_2',
    },
    ['everness:dry_dirt'] = { 'everness:dry_dirt_with_dry_grass' }
}

local grass_covered_mapping_under = {
    ['everness:coral_desert_stone'] = { 'everness:coral_desert_stone_with_moss' },
    ['everness:soul_sandstone'] = { 'everness:soul_sandstone_veined' },
    ['everness:crystal_cave_dirt'] = { 'everness:crystal_cave_dirt_with_moss' },
    ['everness:mold_cobble'] = { 'everness:mold_stone_with_moss' },
    ['everness:mineral_lava_stone_dry'] = { 'everness:mineral_lava_stone_with_moss' },
}

-- Spread grass on dirt

Everness:register_abm({
    label = 'everness:grass_spread',
    description = 'Spreads grass on neighboring blocks.',
    nodenames = {
        'everness:coral_dirt',
        'everness:cursed_dirt',
        'everness:crystal_dirt',
        'everness:dirt_1',
        'everness:dry_dirt',
    },
    neighbors = {
        'air',
        'group:coral_grass',
        'group:cursed_grass',
        'group:crystal_grass',
        'group:bamboo_grass',
        'group:everness_dry_grass'
    },
    interval = 12,
    chance = 50,
    catch_up = false,
    action = function(pos, node)
        -- Check for darkness: night, shadow or under a light-blocking node
        -- Returns if ignore above
        local above = { x = pos.x, y = pos.y + 1, z = pos.z }
        if (core.get_node_light(above) or 0) < 13 then
            return
        end

        -- Look for spreading dirt-type neighbours
        local p2 = core.find_node_near(pos, 1, 'group:everness_spreading_dirt_type')

        if p2 then
            local n3_def = grass_covered_mapping[node.name]

            if not n3_def then
                return
            end

            local n3_name = n3_def[1]

            if #n3_def > 1 then
                n3_name = n3_def[math.random(1, #n3_def)]
            end

            core.set_node(pos, { name = n3_name })
            return
        end

        -- Else, any seeding nodes on top?
        local name = core.get_node(above).name

        if core.get_item_group(name, 'coral_grass') ~= 0 and node.name == 'everness:coral_dirt' then
            core.set_node(pos, { name = 'everness:dirt_with_coral_grass' })
        elseif core.get_item_group(name, 'cursed_grass') ~= 0 and node.name == 'everness:cursed_dirt' then
            core.set_node(pos, { name = 'everness:dirt_with_cursed_grass' })
        elseif core.get_item_group(name, 'crystal_grass') ~= 0 and node.name == 'everness:crystal_dirt' then
            core.set_node(pos, { name = 'everness:dirt_with_crystal_grass' })
        elseif core.get_item_group(name, 'bamboo_grass') ~= 0 and node.name == 'everness:dirt_1' then
            local bamboo_grass_covered_types = {
                'everness:dirt_with_grass_1',
                'everness:dirt_with_grass_extras_1',
                'everness:dirt_with_grass_extras_2'
            }

            core.set_node(pos, { name = bamboo_grass_covered_types[math.random(1, #bamboo_grass_covered_types)] })
        elseif core.get_item_group(name, 'everness_dry_grass') ~= 0 and node.name == 'everness:dry_dirt' then
            core.set_node(pos, { name = 'everness:dry_dirt_with_dry_grass' })
        end
    end
})

-- Spread mold/moss on stone/dirt - under

Everness:register_abm({
    label = 'everness:grass_spread_under',
    description = 'Spreads grass on neighboring blocks in caves (under).',
    nodenames = {
        'everness:coral_desert_stone',
        'everness:soul_sandstone',
        'everness:crystal_cave_dirt',
        'everness:mold_cobble',
        'everness:mineral_lava_stone_dry',
    },
    neighbors = {
        'air',
        'group:coral_grass_under',
        'group:cursed_grass_under',
        'group:crystal_grass_under',
        'group:forsaken_tundra_grass_under',
        'group:mineral_waters_grass_under',
    },
    interval = 12,
    chance = 50,
    catch_up = false,
    action = function(pos, node)
        -- Check for darkness: night, shadow or under a light-blocking node
        -- Returns if ignore above
        local above = { x = pos.x, y = pos.y + 1, z = pos.z }
        if (core.get_node_light(above) or 0) < 13 then
            return
        end

        -- Look for spreading dirt-type neighbours
        local p2 = core.find_node_near(pos, 1, 'group:everness_spreading_dirt_type_under')

        if p2 then
            local n3_def = grass_covered_mapping_under[node.name]

            if not n3_def then
                return
            end

            local n3_name = n3_def[1]

            if #n3_def > 1 then
                n3_name = n3_def[math.random(1, #n3_def)]
            end

            core.set_node(pos, {name = n3_name})
            return
        end

        -- Else, any seeding nodes on top?
        local name = core.get_node(above).name

        if core.get_item_group(name, 'coral_grass_under') ~= 0 and node.name == 'everness:coral_desert_stone' then
            core.set_node(pos, { name = 'everness:coral_desert_stone_with_moss' })
        elseif core.get_item_group(name, 'cursed_grass_under') ~= 0 and node.name == 'everness:soul_sandstone' then
            core.set_node(pos, { name = 'everness:soul_sandstone_veined' })
        elseif core.get_item_group(name, 'crystal_grass_under') ~= 0 and node.name == 'everness:crystal_cave_dirt' then
            core.set_node(pos, { name = 'everness:crystal_cave_dirt_with_moss' })
        elseif core.get_item_group(name, 'forsaken_tundra_grass_under') ~= 0 and node.name == 'everness:mold_cobble' then
            core.set_node(pos, { name = 'everness:mold_stone_with_moss' })
        elseif core.get_item_group(name, 'mineral_waters_grass_under') ~= 0 and node.name == 'everness:mineral_lava_stone_dry' then
            core.set_node(pos, { name = 'everness:mineral_lava_stone_with_moss' })
        end
    end
})

--
-- Grass and dry grass removed in darkness
--

Everness:register_abm({
    label = 'everness:grass_covered',
    description = 'Grass and dry grass removed in darkness.',
    nodenames = {
        'group:everness_spreading_dirt_type',
        'group:everness_spreading_dirt_type_under',
    },
    interval = 8,
    chance = 50,
    catch_up = false,
    action = function(pos, node)
        local above = { x = pos.x, y = pos.y + 1, z = pos.z }
        local name = core.get_node(above).name
        local nodedef = core.registered_nodes[name]

        if name ~= 'ignore'
            and nodedef
            and not (
                (nodedef.sunlight_propagates or nodedef.paramtype == 'light')
                and nodedef.liquidtype == 'none'
            )
        then
            if node.name == 'everness:dirt_with_coral_grass' then
                core.set_node(pos, { name = 'everness:coral_dirt' })
            elseif node.name == 'everness:dirt_with_cursed_grass' then
                core.set_node(pos, { name = 'everness:cursed_dirt' })
            elseif node.name == 'everness:dirt_with_crystal_grass' then
                core.set_node(pos, { name = 'everness:crystal_dirt' })
            elseif node.name == 'everness:dirt_with_grass_1'
                or node.name == 'everness:dirt_with_grass_extras_1'
                or node.name == 'everness:dirt_with_grass_extras_2'
            then
                core.set_node(pos, { name = 'everness:dirt_1' })
            elseif node.name == 'everness:coral_desert_stone_with_moss' then
                core.set_node(pos, { name = 'everness:coral_desert_stone' })
            elseif node.name == 'everness:dry_dirt_with_dry_grass' then
                core.set_node(pos, { name = 'everness:dry_dirt' })
            elseif node.name == 'everness:soul_sandstone_veined' then
                core.set_node(pos, { name = 'everness:soul_sandstone' })
            elseif node.name == 'everness:crystal_cave_dirt_with_moss' then
                core.set_node(pos, { name = 'everness:crystal_cave_dirt' })
            elseif node.name == 'everness:mold_stone_with_moss' then
                core.set_node(pos, { name = 'everness:mold_cobble' })
            elseif node.name == 'everness:mineral_lava_stone_with_moss' then
                core.set_node(pos, { name = 'everness:mineral_lava_stone_dry' })
            end
        end
    end
})

--
-- Leafdecay
--

Everness:register_leafdecay({
    trunks = {
        'everness:coral_tree',
        'everness:coral_tree_bioluminescent',
        'everness:crystal_bush_stem',
        'everness:cursed_bush_stem',
        'everness:willow_tree',
        'everness:sequoia_tree',
        'everness:mese_tree',
        'everness:palm_tree',
        'everness:lava_tree',
        'everness:lava_tree_with_lava'
    },
    leaves = {
        'everness:coral_leaves',
        'everness:crystal_bush_leaves',
        'everness:willow_leaves',
        'everness:sequoia_leaves',
        'everness:mese_leaves',
        'everness:mese_tree_fruit',
        'everness:palm_leaves',
        'everness:coconut',
        'everness:lava_tree_leaves'
    },
    radius = 3
})

-- Baobab Tree
Everness:register_leafdecay({
    trunks = {
        'everness:baobab_tree',
        'everness:crystal_tree',
        'everness:dry_tree',
    },
    leaves = {
        'everness:baobab_leaves',
        'everness:baobab_fruit_renewable',
        'everness:crystal_leaves',
        'everness:dry_branches',
    },
    radius = 4,
})

--
-- Moss growth on cobble near water
--

local moss_correspondences = {
    ['everness:coral_desert_cobble'] = 'everness:coral_desert_mossy_cobble',
    ['everness:crystal_cobble'] = 'everness:crystal_mossy_cobble',
    ['stairs:slab_crystal_cobble'] = 'stairs:slab_crystal_mossy_cobble',
    ['stairs:stair_crystal_cobble'] = 'stairs:stair_crystal_mossy_cobble',
    ['stairs:stair_inner_crystal_cobble'] = 'stairs:stair_inner_crystal_mossy_cobble',
    ['stairs:stair_outer_crystal_cobble'] = 'stairs:stair_outer_crystal_mossy_cobble',
    ['everness:crystal_cobble_wall'] = 'everness:crystal_mossy_cobble_wall'
}

local moss_nodenames_correspondences = {
    'everness:coral_desert_cobble',
    'everness:crystal_cobble',
    'stairs:slab_crystal_cobble',
    'stairs:stair_crystal_cobble',
    'stairs:stair_inner_crystal_cobble',
    'stairs:stair_outer_crystal_cobble',
    'everness:crystal_cobble_wall'
}

if core.get_modpath('default') then
    moss_correspondences['stairs:slab_coral_desert_cobble'] = 'stairs:slab_coral_desert_mossy_cobble'
    moss_correspondences['stairs:stair_coral_desert_cobble'] = 'stairs:stair_coral_desert_mossy_cobble'
    moss_correspondences['stairs:stair_inner_coral_desert_cobble'] = 'stairs:stair_inner_coral_desert_mossy_cobble'
    moss_correspondences['stairs:stair_outer_coral_desert_cobble'] = 'stairs:stair_outer_coral_desert_mossy_cobble'
    moss_correspondences['everness:coral_desert_cobble_wall'] = 'everness:coral_desert_mossy_cobble_wall'

    table.insert(moss_nodenames_correspondences, 'stairs:slab_coral_desert_cobble')
    table.insert(moss_nodenames_correspondences, 'stairs:stair_coral_desert_cobble')
    table.insert(moss_nodenames_correspondences, 'stairs:stair_inner_coral_desert_cobble')
    table.insert(moss_nodenames_correspondences, 'stairs:stair_outer_coral_desert_cobble')
    table.insert(moss_nodenames_correspondences, 'everness:coral_desert_cobble_wall')
elseif core.get_modpath('mcl_core') then
    moss_correspondences['mcl_stairs:slab_coral_desert_cobble'] = 'mcl_stairs:slab_coral_desert_mossy_cobble'
    moss_correspondences['mcl_stairs:stair_coral_desert_cobble'] = 'mcl_stairs:stair_coral_desert_mossy_cobble'
    moss_correspondences['everness:coral_desert_cobble_wall'] = 'everness:coral_desert_mossy_cobble_wall'

    table.insert(moss_nodenames_correspondences, 'mcl_stairs:slab_coral_desert_cobble')
    table.insert(moss_nodenames_correspondences, 'mcl_stairs:stair_coral_desert_cobble')
    table.insert(moss_nodenames_correspondences, 'everness:coral_desert_cobble_wall')
end

Everness:register_abm({
    label = 'everness:moss_growth',
    description = 'Grows moss on blocks near water.',
    nodenames = moss_nodenames_correspondences,
    neighbors = { 'group:water' },
    interval = 16,
    chance = 200,
    catch_up = false,
    action = function(pos, node)
        node.name = moss_correspondences[node.name]

        if node.name then
            core.set_node(pos, node)
        end
    end
})

--
-- Magma growth on cobble near lava
--

local magma_correspondences = {
    ['everness:volcanic_rock'] = 'everness:volcanic_rock_with_magma',
}

local magma_nodenames_correspondences = {
    'everness:volcanic_rock'
}

if core.get_modpath('default') then
    magma_correspondences['default:cobble'] = 'everness:magmacobble'
    magma_correspondences['stairs:slab_cobble'] = 'stairs:slab_magmacobble'
    magma_correspondences['stairs:stair_cobble'] = 'stairs:stair_magmacobble'
    magma_correspondences['stairs:stair_inner_cobble'] = 'stairs:stair_inner_magmacobble'
    magma_correspondences['stairs:stair_outer_cobble'] = 'stairs:stair_outer_magmacobble'
    magma_correspondences['walls:cobble'] = 'everness:magmacobble_wall'
    magma_correspondences['stairs:slab_volcanic_rock'] = 'stairs:slab_volcanic_rock_with_magma'
    magma_correspondences['stairs:stair_volcanic_rock'] = 'stairs:stair_volcanic_rock_with_magma'
    magma_correspondences['stairs:stair_inner_volcanic_rock'] = 'stairs:stair_inner_volcanic_rock_with_magma'
    magma_correspondences['stairs:stair_outer_volcanic_rock'] = 'stairs:stair_outer_volcanic_rock_with_magma'
    magma_correspondences['everness:volcanic_rock_wall'] = 'everness:volcanic_rock_with_magma_wall'

    table.insert(magma_nodenames_correspondences, 'default:cobble')
    table.insert(magma_nodenames_correspondences, 'stairs:slab_cobble')
    table.insert(magma_nodenames_correspondences, 'stairs:stair_cobble')
    table.insert(magma_nodenames_correspondences, 'stairs:stair_inner_cobble')
    table.insert(magma_nodenames_correspondences, 'stairs:stair_outer_cobble')
    table.insert(magma_nodenames_correspondences, 'walls:cobble')
    table.insert(magma_nodenames_correspondences, 'stairs:slab_volcanic_rock')
    table.insert(magma_nodenames_correspondences, 'stairs:stair_volcanic_rock')
    table.insert(magma_nodenames_correspondences, 'stairs:stair_inner_volcanic_rock')
    table.insert(magma_nodenames_correspondences, 'stairs:stair_outer_volcanic_rock')
    table.insert(magma_nodenames_correspondences, 'everness:volcanic_rock_wall')
elseif core.get_modpath('mcl_core') then
    magma_correspondences['mcl_core:cobble'] = 'everness:magmacobble'
    magma_correspondences['mcl_stairs:slab_cobble'] = 'mcl_stairs:slab_magmacobble'
    magma_correspondences['mcl_stairs:stair_cobble'] = 'mcl_stairs:stair_magmacobble'
    magma_correspondences['mcl_walls:cobble'] = 'everness:magmacobble_wall'
    magma_correspondences['mcl_stairs:slab_volcanic_rock'] = 'mcl_stairs:slab_volcanic_rock_with_magma'
    magma_correspondences['mcl_stairs:stair_volcanic_rock'] = 'mcl_stairs:stair_volcanic_rock_with_magma'
    magma_correspondences['everness:volcanic_rock_wall'] = 'everness:volcanic_rock_with_magma_wall'

    table.insert(magma_nodenames_correspondences, 'mcl_core:cobble')
    table.insert(magma_nodenames_correspondences, 'mcl_stairs:slab_cobble')
    table.insert(magma_nodenames_correspondences, 'mcl_stairs:stair_cobble')
    table.insert(magma_nodenames_correspondences, 'mcl_walls:cobble')
    table.insert(magma_nodenames_correspondences, 'mcl_stairs:slab_volcanic_rock')
    table.insert(magma_nodenames_correspondences, 'mcl_stairs:stair_volcanic_rock')
    table.insert(magma_nodenames_correspondences, 'everness:volcanic_rock_wall')
end

Everness:register_abm({
    label = 'everness:magma_growth',
    description = 'Grows magma on blocks near lava.',
    nodenames = magma_nodenames_correspondences,
    neighbors = { 'group:lava' },
    interval = 16,
    chance = 200,
    catch_up = false,
    action = function(pos, node)
        node.name = magma_correspondences[node.name]

        if node.name then
            core.set_node(pos, node)
        end
    end
})

--
-- Falling leaves
--

Everness:register_abm({
    label = 'everness:falling_leaves',
    description = 'Makes leaves falling particles.',
    nodenames = { 'group:falling_leaves' },
    neighbors = { 'air' },
    interval = 24,
    chance = 24,
    catch_up = false,
    action = function(pos, node)
        if not core.settings:get_bool('enable_particles', true) or not is_player_nearby(pos, 32) then
            return
        end

        local air_below = core.find_nodes_in_area(pos, { x = pos.x, y = pos.y - 3, z = pos.z }, { 'air' })

        if #air_below < 3 then
            return
        end

        -- particles
        local tod = core.get_timeofday()
        local is_day = (tod > 0.2 and tod < 0.805)
        local particlespawner_def = {
            amount = 5,
            time = 1,
            minpos = { x = pos.x - 0.5, y = pos.y - 0.5, z = pos.z - 0.5 },
            maxpos = { x = pos.x + 0.5, y = pos.y - 0.5, z = pos.z + 0.5 },
            minvel = { x = -0.25, y = -0.25, z = -0.25 },
            maxvel = { x = 0.25, y = -0.5, z = 0.25 },
            minacc = { x = -0.25, y = -0.25, z = -0.25 },
            maxacc = { x = 0.25, y = -0.5, z = 0.25 },
            minexptime = 3,
            maxexptime = 6,
            minsize = 0.5,
            maxsize = 1.5,
            node = node
        }

        if core.has_feature({ dynamic_add_media_table = true, particlespawner_tweenable = true }) then
            -- new syntax, after v5.6.0
            particlespawner_def = {
                amount = 5,
                time = 1,
                size = {
                    min = 0.5,
                    max = 1.5,
                },
                exptime = {
                    min = 3,
                    max = 6
                },
                pos = {
                    min = vector.new({ x = pos.x - 1, y = pos.y - 0.5, z = pos.z - 1 }),
                    max = vector.new({ x = pos.x + 1, y = pos.y - 1, z = pos.z + 1 }),
                },
                vel = {
                    min = vector.new({ x = -0.25, y = -0.25, z = -0.25 }),
                    max = vector.new({ x = 0.25, y = -0.5, z = 0.25 })
                },
                acc = {
                    min = vector.new({ x = -0.25, y = -0.25, z = -0.25 }),
                    max = vector.new({ x = 0.25, y = -0.5, z = 0.25 })
                },
                node = {
                    name = node.name
                }
            }

            local anim_def

            if node.name == 'everness:coral_leaves' then
                anim_def = {
                    type = 'vertical_frames',
                    aspect_w = 16,
                    aspect_h = 16,
                    length = 1.6
                }

                particlespawner_def = Everness.mergeTables(particlespawner_def, {
                    size = {
                        min = 2.5,
                        max = 7.5,
                    },
                    exptime = {
                        min = 11,
                        max = 19
                    },
                    vel = {
                        min = vector.new(-0.3, -0.8, -0.3),
                        max = vector.new( 0.3, -0.4, 0.3)
                    },
                    acc = {
                        min = vector.new(-0.05, -0.05, -0.05),
                        max = vector.new( 0.05, -0.01, 0.05)
                    },
                    drag = {
                        min = vector.new(0.1, 0.05, 0.1),
                        max = vector.new(0.2, 0.10, 0.2)
                    },
                    jitter = {
                        min = vector.new(-0.1, -0.05, -0.1),
                        max = vector.new( 0.1, 0.05, 0.1)
                    },
                    collisiondetection = true,
                    collision_removal = false,
                    glow = is_day and 0 or math.random(4, 7),
                    texpool = {
                        -- 1. Lighter Rosy Mauve (+16 Lightness, +5 Saturation)
                        {
                            name = 'everness_coral_leaves_particle_anim.png^[hsl:0:5:16',
                            animation = anim_def
                        },
                        -- 2. Direct Mid-tone Match (Base texture, 0 shift)
                        {
                            name = 'everness_coral_leaves_particle_anim.png',
                            animation = anim_def
                        },
                        -- 3. Deeper Shadow Wine (-15 Lightness)
                        {
                            name = 'everness_coral_leaves_particle_anim.png^[hsl:0:0:-25',
                            animation = anim_def
                        }
                    }
                })

                particlespawner_def.node = nil
            elseif node.name == 'everness:crystal_leaves' then
                anim_def = {
                    type = 'vertical_frames',
                    aspect_w = 16,
                    aspect_h = 16,
                    length = 1.8
                }

                particlespawner_def = Everness.mergeTables(particlespawner_def, {
                    size = {
                        min = 4.5,
                        max = 6.5,
                    },
                    exptime = {
                        min = 20,
                        max = 44
                    },
                    -- Gentle, floating drift (slower than heavy leaves)
                    vel = {
                        min = vector.new(-0.25, -0.50, -0.25),
                        max = vector.new( 0.25, -0.20, 0.25),
                    },
                    -- Very light gravity
                    acc = {
                        min = vector.new(-0.03, -0.03, -0.03),
                        max = vector.new( 0.03, -0.01, 0.03),
                    },
                    -- Aerodynamic air resistance (floaty petal effect)
                    drag = {
                        min = vector.new(0.15, 0.08, 0.15),
                        max = vector.new(0.25, 0.12, 0.25),
                    },
                    -- Fluttering wind turbulence
                    jitter = {
                        min = vector.new(-0.15, -0.05, -0.15),
                        max = vector.new( 0.15, 0.05, 0.15),
                    },
                    collisiondetection = true,
                    collision_removal = false,
                    glow = is_day and 0 or math.random(6, 9),
                    texpool = {
                        -- 1. Base Wisteria / Lilac Blossom (Original #cebee0)
                        {
                            name = 'everness_crystal_leaves_particle_anim.png',
                            animation = anim_def
                        },
                        -- 2. Sakura / Cherry Blossom Pink (+80° Hue Shift)
                        {
                            name = 'everness_crystal_leaves_particle_anim.png^[hsl:80:15:0',
                            animation = anim_def
                        },
                        -- 3. Golden Primrose / Honey Blossom (+135° Hue Shift)
                        {
                            name = 'everness_crystal_leaves_particle_anim.png^[hsl:135:20:0',
                            animation = anim_def
                        }
                    }
                })

                particlespawner_def.node = nil
            elseif node.name == 'everness:dry_branches' then
                anim_def = {
                    type = 'vertical_frames',
                    aspect_w = 16,
                    aspect_h = 16,
                    length = 1.2
                }

                particlespawner_def = Everness.mergeTables(particlespawner_def, {
                    amount = 1,
                    vel = {
                        min = vector.new(-0.4, -1.6, -0.4),
                        max = vector.new( 0.4, -1.0, 0.4)
                    },
                    acc = {
                        min = vector.new(-0.1, -0.6, -0.1),
                        max = vector.new( 0.1, -0.3, 0.1)
                    },
                    drag = {
                        min = vector.new(0.02, 0.01, 0.02),
                        max = vector.new(0.06, 0.03, 0.06)
                    },
                    jitter = {
                        min = vector.new(-0.08, -0.02, -0.08),
                        max = vector.new( 0.08, 0.02, 0.08)
                    },
                    bounce = {
                        min = 0.1,
                        max = 0.25
                    },
                    exptime = {
                        min = 3.0,
                        max = 5.5
                    },
                    size = {
                        min = 4,
                        max = 7
                    },
                    collisiondetection = true,
                    collision_removal   = false,
                    texpool = {
                        -- 1. Base Oak / Pine Bark Brown (Original #5e4629)
                        {
                            name = 'everness_dry_branches_particle_anim.png',
                            animation = anim_def
                        },
                        -- 2. Sun-bleached / Dried Twig / Birch (Lightened & desaturated)
                        {
                            name = 'everness_dry_branches_particle_anim.png^[hsl:0:-20:20',
                            animation = anim_def
                        },
                        -- 3. Mossy / Damp Forest Branch (+60° Hue shift to olive/moss)
                        {
                            name = 'everness_dry_branches_particle_anim.png^[hsl:60:15:-8',
                            animation = anim_def
                        },
                        -- 4. (Optional) Dark Walnut / Peat (-20 Lightness)
                        {
                            name = 'everness_dry_branches_particle_anim.png^[hsl:0:-15:-20',
                            animation = anim_def
                        }
                    }
                })

                particlespawner_def.node = nil
            elseif node.name == 'everness:coral_tree_bioluminescent' then
                anim_def = {
                    type = 'vertical_frames',
                    aspect_w = 16,
                    aspect_h = 16,
                    length = 1.4
                }

                particlespawner_def = Everness.mergeTables(particlespawner_def, {
                    amount = 7,
                    size = {
                        min = 2.5,
                        max = 4.5,
                    },
                    exptime = {
                        min = 18,
                        max = 24
                    },
                    vel = {
                        min = vector.new(-0.15, -0.45, -0.15),
                        max = vector.new( 0.15, -0.15, 0.15)
                    },
                    acc = {
                        min = vector.new(-0.02, -0.04, -0.02),
                        max = vector.new( 0.02, -0.01, 0.02)
                    },
                    drag = {
                        min = vector.new(0.10, 0.08, 0.10),
                        max = vector.new(0.18, 0.12, 0.18)
                    },
                    jitter = {
                        min = vector.new(-0.05, -0.05, -0.05),
                        max = vector.new( 0.05, 0.05, 0.05)
                    },
                    glow = 13,
                    collisiondetection = true,
                    collision_removal = false,
                    texpool = {
                        -- 1. Base Electric Cyan / Mana Orb (Original #01e8f5, H ≈ 184°)
                        {
                            name = 'everness_coral_tree_bioluminescent_particle_anim.png',
                            alpha = 0.5,
                            animation = anim_def
                        },
                        -- 2. Arcane Amethyst / Violet Orb (+90° Hue Shift -> H ≈ 274°)
                        {
                            name = 'everness_coral_tree_bioluminescent_particle_anim.png^[hsl:90:10:0',
                            alpha = 0.5,
                            animation = anim_def
                        },
                        -- 3. Solar Gold / Sunfire Orb (-140° Hue Shift -> H ≈ 44°)
                        {
                            name = 'everness_coral_tree_bioluminescent_particle_anim.png^[hsl:-140:15:5',
                            alpha = 0.5,
                            animation = anim_def
                        }
                    }
                })

                particlespawner_def.node = nil
            elseif node.name == 'everness:cursed_dream_stone' then
                anim_def = {
                    type = 'vertical_frames',
                    aspect_w = 16,
                    aspect_h = 16,
                    length = 1.6,
                }

                particlespawner_def = Everness.mergeTables(particlespawner_def, {
                    amount = 7,
                    size = {
                        min = 7,
                        max = 11,
                    },
                    exptime = {
                        min = 18,
                        max = 24
                    },
                    vel = {
                        min = vector.new(-0.15, -0.45, -0.15),
                        max = vector.new( 0.15, -0.15, 0.15)
                    },
                    acc = {
                        min = vector.new(-0.02, -0.04, -0.02),
                        max = vector.new( 0.02, -0.01, 0.02)
                    },
                    drag = {
                        min = vector.new(0.10, 0.08, 0.10),
                        max = vector.new(0.18, 0.12, 0.18)
                    },
                    jitter = {
                        min = vector.new(-0.06, -0.03, -0.06),
                        max = vector.new( 0.06, 0.03, 0.06)
                    },
                    glow = 13,
                    collisiondetection = true,
                    collision_removal = false,
                    texpool = {
                            -- 1. Base Crimson / Pure Blood Red (Original)
                        {
                            name = 'everness_cursed_dream_stone_particle_anim.png',
                            alpha = 0.5,
                            animation = anim_def
                        },
                        -- 2. Reddish-Purple / Magenta Plum (-35° Hue shift)
                        {
                            name = 'everness_cursed_dream_stone_particle_anim.png^[hsl:-35:15:-8',
                            alpha = 0.5,
                            animation = anim_def
                        },
                        -- 3. Deep Burgundy / Wine Red (-8° Hue, -16 Lightness)
                        {
                            name = 'everness_cursed_dream_stone_particle_anim.png^[hsl:-8:10:-16',
                            alpha = 0.5,
                            animation = anim_def
                        },
                        -- 4. Blazing Scarlet / Fiery Ember (+18° Hue, +5 Lightness)
                        {
                            name = 'everness_cursed_dream_stone_particle_anim.png^[hsl:18:10:5',
                            alpha = 0.5,
                            animation = anim_def
                        }
                    }
                })

                particlespawner_def.node = nil
            end
        end

        -- Randomize falling leaves (with ABM they will fall all at the same time)
        core.after(math.random(6), function(pdef)
            core.add_particlespawner(pdef)
        end, particlespawner_def)
    end
})

--
-- Falling leaves - vines
--

Everness:register_abm({
    label = 'everness:falling_vines',
    description = 'Makes vines falling particles.',
    nodenames = { 'group:falling_vines' },
    neighbors = { 'air' },
    interval = 16,
    chance = 16,
    catch_up = false,
    action = function(pos, node)
        if not core.settings:get_bool('enable_particles', true) or not is_player_nearby(pos, 32) then
            return
        end

        local air_around = core.find_nodes_in_area(
            { x = pos.x - 1, y = pos.y, z = pos.z - 1 },
            { x = pos.x + 1, y = pos.y, z = pos.z + 1 },
            { 'air' }
        )

        if #air_around < 3 then
            return
        end

        -- particles
        local particlespawner_def = {
            amount = 5,
            time = 1,
            minpos = { x = pos.x - 0.5, y = pos.y - 0.5, z = pos.z - 0.5 },
            maxpos = { x = pos.x + 0.5, y = pos.y - 0.5, z = pos.z + 0.5 },
            minvel = { x = -0.25, y = -0.25, z = -0.25 },
            maxvel = { x = 0.25, y = -0.5, z = 0.25 },
            minacc = { x = -0.25, y = -0.25, z = -0.25 },
            maxacc = { x = 0.25, y = -0.5, z = 0.25 },
            minexptime = 15,
            maxexptime = 30,
            minsize = 0.5,
            maxsize = 1.5,
            node = node,
            glow = 7
        }

        if core.has_feature({ dynamic_add_media_table = true, particlespawner_tweenable = true }) then
            -- new syntax, after v5.6.0
            particlespawner_def = {
                amount = 5,
                time = 1,
                size = {
                    min = 0.5,
                    max = 1.5,
                },
                exptime = {
                    min = 15,
                    max = 30
                },
                pos = {
                    min = vector.new(pos.x - 0.5, pos.y - 0.5, pos.z - 0.5),
                    max = vector.new(pos.x + 0.5, pos.y - 0.5, pos.z + 0.5),
                },
                vel = {
                    min = vector.new(-0.25, -0.15, -0.25),
                    max = vector.new(0.25, -0.25, 0.25)
                },
                acc = {
                    min = vector.new(-0.25, -0.05, -0.25),
                    max = vector.new(0.25, -0.1, 0.25)
                },
                node = {
                    name = node.name
                },
                glow = 7
            }
        end

        core.add_particlespawner(particlespawner_def)
    end
})

Everness:register_abm({
    label = 'everness:grow_orange_cactus',
    description = 'Grows orange cactus.',
    nodenames = {
        'everness:cactus_orange',
        'everness:cactus_blue'
    },
    neighbors = { 'group:sand', 'group:everness_sand' },
    interval = 12,
    chance = 83,
    action = function(...)
        Everness:grow_cactus(...)
    end
})

--
-- Bio Bubbles
--

Everness:register_abm({
    label = 'everness:bio_bubbles',
    description = 'Bubble particles under water.',
    nodenames = { 'group:bio_bubbles' },
    neighbors = { 'group:water' },
    interval = 16,
    chance = 8,
    catch_up = false,
    action = function(pos, node)
        if not core.settings:get_bool('enable_particles', true) or not is_player_nearby(pos, 32) then
            return
        end

        local water_above = core.find_nodes_in_area(pos, { x = pos.x, y = pos.y + 10, z = pos.z }, { 'group:water' })

        if #water_above < 10 then
            return
        end

        -- particles
        local particlespawner_def = {
            amount = 50,
            time = 10,
            minpos = vector.new({ x = pos.x - 0.1, y = pos.y + 0.6, z = pos.z - 0.1 }),
            maxpos = vector.new({ x = pos.x + 0.1, y = pos.y + 0.6, z = pos.z + 0.1 }),
            minvel = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
            maxvel = vector.new({ x = 0.1, y = 0.5, z = 0.1 }),
            minacc = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
            maxacc = vector.new({ x = 0.1, y = 0.5, z = 0.1 }),
            minexptime = 5,
            maxexptime = 7,
            minsize = 2,
            maxsize = 3.5,
            texture = 'everness_bubble.png',
            glow = 7
        }

        if core.has_feature({ dynamic_add_media_table = true, particlespawner_tweenable = true }) then
            -- new syntax, after v5.6.0
            particlespawner_def = {
                amount = 50,
                time = 10,
                size = {
                    min = 2,
                    max = 3.5,
                },
                exptime = {
                    min = 5,
                    max = 7
                },
                pos = {
                    min = vector.new({ x = pos.x - 0.1, y = pos.y + 0.6, z = pos.z - 0.1 }),
                    max = vector.new({ x = pos.x + 0.1, y = pos.y + 0.6, z = pos.z + 0.1 }),
                },
                vel = {
                    min = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
                    max = vector.new({ x = 0.1, y = 0.5, z = 0.1 })
                },
                acc = {
                    min = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
                    max = vector.new({ x = 0.1, y = 0.5, z = 0.1 })
                },
                texture = {
                    name = 'everness_bubble.png',
                    alpha_tween = {
                        1, 0,
                        style = 'fwd',
                        reps = 1
                    },
                    scale_tween = {
                        0.5, 1,
                        style = 'fwd',
                        reps = 1
                    }
                },
                glow = 7
            }
        end

        core.add_particlespawner(particlespawner_def)
    end
})

--
-- Rising Souls
--

Everness:register_abm({
    label = 'everness:rising_souls',
    description = 'Rising souls particles under water.',
    nodenames = { 'group:rising_souls' },
    neighbors = { 'group:water' },
    interval = 16,
    chance = 8,
    catch_up = false,
    action = function(pos, node)
        if not core.settings:get_bool('enable_particles', true) or not is_player_nearby(pos, 32) then
            return
        end

        local water_above = core.find_nodes_in_area(pos, { x = pos.x, y = pos.y + 10, z = pos.z }, { 'group:water' })

        if #water_above < 10 then
            return
        end

        -- particles
        local particlespawner_def = {
            amount = 17,
            time = 10,
            minpos = vector.new({ x = pos.x - 0.3, y = pos.y + 0.6, z = pos.z - 0.3 }),
            maxpos = vector.new({ x = pos.x + 0.3, y = pos.y + 0.6, z = pos.z + 0.3 }),
            minvel = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
            maxvel = vector.new({ x = 0.1, y = 0.5, z = 0.1 }),
            minacc = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
            maxacc = vector.new({ x = 0.1, y = 0.5, z = 0.1 }),
            minexptime = 4,
            maxexptime = 6,
            minsize = 4,
            maxsize = 6,
            texture = 'everness_rising_soul_particle.png',
            glow = 7
        }

        if core.has_feature({ dynamic_add_media_table = true, particlespawner_tweenable = true }) then
            -- new syntax, after v5.6.0
            particlespawner_def = {
                amount = 17,
                time = 10,
                size = {
                    min = 4,
                    max = 6,
                },
                exptime = {
                    min = 4,
                    max = 6
                },
                pos = {
                    min = vector.new({ x = pos.x - 0.3, y = pos.y + 0.6, z = pos.z - 0.3 }),
                    max = vector.new({ x = pos.x + 0.3, y = pos.y + 0.6, z = pos.z + 0.3 }),
                },
                vel = {
                    min = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
                    max = vector.new({ x = 0.1, y = 0.5, z = 0.1 })
                },
                acc = {
                    min = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
                    max = vector.new({ x = 0.1, y = 0.5, z = 0.1 })
                },
                texture = {
                    name = 'everness_rising_soul_particle.png',
                    animation = {
                        type = 'vertical_frames',
                        aspect_w = 16,
                        aspect_h = 16,
                        length = 2,
                    },
                    alpha_tween = {
                        1, 0,
                        style = 'fwd',
                        reps = 1
                    },
                    scale_tween = {
                        0.5, 1,
                        style = 'fwd',
                        reps = 1
                    }
                },
                glow = 7
            }
        end

        core.add_particlespawner(particlespawner_def)
    end
})

--
-- Rising Crystals
--

Everness:register_abm({
    label = 'everness:rising_crystals',
    description = 'Crystal particles under water.',
    nodenames = { 'group:rising_crystals' },
    neighbors = { 'group:water' },
    interval = 16,
    chance = 8,
    catch_up = false,
    action = function(pos, node)
        if not core.settings:get_bool('enable_particles', true) or not is_player_nearby(pos, 32) then
            return
        end

        local water_above = core.find_nodes_in_area(pos, { x = pos.x, y = pos.y + 10, z = pos.z }, { 'group:water' })

        if #water_above < 10 then
            return
        end

        -- particles
        local particlespawner_def = {
            amount = 17,
            time = 10,
            minpos = vector.new({ x = pos.x - 0.3, y = pos.y + 0.6, z = pos.z - 0.3 }),
            maxpos = vector.new({ x = pos.x + 0.3, y = pos.y + 0.6, z = pos.z + 0.3 }),
            minvel = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
            maxvel = vector.new({ x = 0.1, y = 0.5, z = 0.1 }),
            minacc = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
            maxacc = vector.new({ x = 0.1, y = 0.5, z = 0.1 }),
            minexptime = 4,
            maxexptime = 6,
            minsize = 4,
            maxsize = 6,
            texture = 'everness_rising_soul_particle.png',
            glow = 7
        }

        if core.has_feature({ dynamic_add_media_table = true, particlespawner_tweenable = true }) then
            -- new syntax, after v5.6.0
            particlespawner_def = {
                amount = 25,
                time = 10,
                size = {
                    min = 6,
                    max = 8,
                },
                exptime = {
                    min = 4,
                    max = 6
                },
                pos = {
                    min = vector.new({ x = pos.x - 0.3, y = pos.y + 0.6, z = pos.z - 0.3 }),
                    max = vector.new({ x = pos.x + 0.3, y = pos.y + 0.6, z = pos.z + 0.3 }),
                },
                vel = {
                    min = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
                    max = vector.new({ x = 0.1, y = 0.5, z = 0.1 })
                },
                acc = {
                    min = vector.new({ x = -0.1, y = 0.25, z = -0.1 }),
                    max = vector.new({ x = 0.1, y = 0.5, z = 0.1 })
                },
                texture = {
                    name = 'everness_crystal_forest_deep_ocean_sand_bubbles.png',
                    animation = {
                        type = 'vertical_frames',
                        aspect_w = 16,
                        aspect_h = 16,
                        length = 1,
                    },
                    alpha_tween = {
                        1, 0.5,
                        style = 'fwd',
                        reps = 1
                    }
                },
                glow = 7
            }
        end

        core.add_particlespawner(particlespawner_def)
    end
})

-- Mineral Waters Water Geyser
Everness:register_abm({
    label = 'everness:water_geyser',
    description = 'Water geyser water splash.',
    nodenames = { 'everness:water_geyser' },
    interval = 16,
    chance = 16,
    catch_up = false,
    action = function(pos, node)
        if not is_player_nearby(pos, 48) then
            return
        end

        core.swap_node(pos, { name = 'everness:water_geyser_active' })

        local meta = core.get_meta(pos)
        local partcile_time = math.random(5, 15)

        -- player
        for _, object in ipairs(core.get_objects_in_area(vector.new(pos.x - 0.5, pos.y - 0.5, pos.z - 0.5), vector.new(pos.x + 0.5, pos.y + 1, pos.z + 0.5))) do
            if object:is_player()
                and object:get_hp() > 0
            then
                object:add_velocity(vector.new(0, math.random(27, 32), 0))
            end
        end

        -- particles
        local particlespawner_def = {
            amount = 80,
            time = partcile_time,
            minpos = vector.new(pos.x, pos.y + 1.5, pos.z),
            maxpos = vector.new(pos.x, pos.y + 2, pos.z),
            minvel = vector.new(0, 13, 0),
            maxvel = vector.new(0, 15, 0),
            minacc = vector.new(0, -1, 1),
            maxacc = vector.new(0, -3, 2),
            minexptime = 3,
            maxexptime = 5,
            minsize = 5,
            maxsize = 7,
            texture = 'everness_water_geyser_particle.png',
            vertical = true,
            collisiondetection = true,
            collision_removal = true
        }

        if core.has_feature({ dynamic_add_media_table = true, particlespawner_tweenable = true }) then
            -- new syntax, above v5.6.0
            particlespawner_def = {
                amount = 80,
                time = partcile_time,
                size = {
                    min = 5,
                    max = 7,
                },
                exptime = {
                    min = 3,
                    max = 5
                },
                pos = {
                    min = vector.new(pos.x, pos.y + 1.5, pos.z),
                    max = vector.new(pos.x, pos.y + 2, pos.z)
                },
                vel = {
                    min = vector.new(0, 13, 0),
                    max = vector.new(0, 15, 0)
                },
                acc = {
                    min = vector.new(0, -1, 1),
                    max = vector.new(0, -3, 2)
                },
                texture = {
                    name = 'everness_water_geyser_particle.png',
                    scale_tween = {
                        5, 10,
                        style = 'fwd',
                        reps = 1
                    },
                    alpha_tween = {
                        1, 0,
                        style = 'fwd',
                        reps = 1
                    },
                    blend = 'alpha',
                },
                vertical = true,
                collisiondetection = true,
                collision_removal = true
            }
        end

        local particle_id = core.add_particlespawner(particlespawner_def)
        meta:set_int('particle_id', particle_id)

        core.sound_play({
            name = 'everness_water_geyser',
            gain = 1.5,
            pitch = math.random(10, 30) / 10
        }, {
            pos = pos
        })

        core.get_node_timer(pos):start(partcile_time)
    end
})

-- Lava spitting
Everness:register_abm({
    label = 'everness:lava_spitting',
    description = 'Lava bursts in to air.',
    nodenames = { 'everness:lava_source' },
    neighbors = { 'air' },
    interval = 10,
    chance = 200,
    catch_up = false,
    action = function(pos, node)
        if not is_player_nearby(pos, 32) then
            return
        end

        local burst_colors = {
            '#FF5400',
            '#DD2005'
        }
        local partcile_time = math.random(3, 5)

        -- particles
        local particlespawner_def = {
            amount = 10,
            time = partcile_time,
            minpos = vector.new(pos.x - 0.1, pos.y + 0.5, pos.z - 0.1),
            maxpos = vector.new(pos.x + 0.1, pos.y + 1, pos.z + 0.1),
            minvel = vector.new(0, 1, 0),
            maxvel = vector.new(0, 3, 0),
            minacc = vector.new(0, -3, 0),
            maxacc = vector.new(0, -6, 0),
            minexptime = 3,
            maxexptime = 5,
            minsize = 3,
            maxsize = 10,
            texture = ('everness_water_geyser_particle.png^[multiply:%s'):format(burst_colors[math.random(1, #burst_colors)]),
            vertical = true,
            collisiondetection = true,
            collision_removal = true
        }
        local particlespawner_def2 = {
            amount = 40,
            time = partcile_time,
            minpos = vector.new(pos.x, pos.y + 0.5, pos.z),
            maxpos = vector.new(pos.x, pos.y + 1, pos.z),
            minvel = vector.new(0, 1, 0),
            maxvel = vector.new(0, 3, 0),
            minacc = vector.new(-1, -3, -1),
            maxacc = vector.new(1, -6, 1),
            minexptime = 3,
            maxexptime = 5,
            minsize = 3,
            maxsize = 10,
            node = node,
            vertical = true,
            collisiondetection = true,
            collision_removal = true
        }

        if core.has_feature({ dynamic_add_media_table = true, particlespawner_tweenable = true }) then
            -- new syntax, above v5.6.0
            particlespawner_def = {
                amount = 10,
                time = partcile_time,
                size = {
                    min = 1,
                    max = 2,
                },
                exptime = {
                    min = 3,
                    max = 5
                },
                pos = {
                    min = vector.new(pos.x - 0.1, pos.y + 0.5, pos.z - 0.1),
                    max = vector.new(pos.x + 0.1, pos.y + 1, pos.z + 0.1)
                },
                vel = {
                    min = vector.new(0, 1, 0),
                    max = vector.new(0, 3, 0)
                },
                acc = {
                    min = vector.new(0, -3, 0),
                    max = vector.new(0, -6, 0)
                },
                texture = {
                    name = ('everness_water_geyser_particle.png^[multiply:%s'):format(burst_colors[math.random(1, #burst_colors)]),
                    scale_tween = {
                        10, 3,
                        style = 'fwd',
                        reps = 1
                    }
                },
                vertical = true,
                collisiondetection = true,
                collision_removal = true
            }

            particlespawner_def2 = {
                amount = 40,
                time = partcile_time,
                size = {
                    min = 1,
                    max = 2,
                },
                exptime = {
                    min = 3,
                    max = 5
                },
                pos = {
                    min = vector.new(pos.x, pos.y + 0.5, pos.z),
                    max = vector.new(pos.x, pos.y + 1, pos.z)
                },
                vel = {
                    min = vector.new(0, 1, 0),
                    max = vector.new(0, 3, 0)
                },
                acc = {
                    min = vector.new(-1, -3, -1),
                    max = vector.new(1, -6, 1)
                },
                node = node,
                vertical = true,
                collisiondetection = true,
                collision_removal = true
            }
        end

        if math.random(0, 100) <=50 then
            core.add_particlespawner(particlespawner_def2)
        else
            core.add_particlespawner(particlespawner_def)
        end
    end
})

-- Generate bamboo tops after mineral waters biome generates decorations
Everness:register_lbm({
    -- Descriptive label for profiling purposes (optional).
    -- Definitions with identical labels will be listed as one.
    label = 'Generate bamboo tops after mineral waters biome generates decorations',

    -- Identifier of the LBM, should follow the modname:<whatever> convention
    name = 'everness:mineral_waters_bamboo_large',

    -- List of node names to trigger the LBM on.
    -- Names of non-registered nodes and groups (as group:groupname)
    -- will work as well.
    nodenames = { 'everness:bamboo_3' },

    -- Whether to run the LBM's action every time a block gets activated,
    -- and not only the first time the block gets activated after the LBM
    -- was introduced.
    run_at_every_load = true,

    -- Function triggered for each qualifying node.
    -- `dtime_s` is the in-game time (in seconds) elapsed since the block
    -- was last active
    action = function(pos, node, dtime_s)
        if core.get_node(vector.new(pos.x, pos.y + 1, pos.z)).name ~= 'air' then
            return
        end

        local node_below = core.get_node(vector.new(pos.x, pos.y - 1, pos.z))

        -- Get bamboo height
        local while_counter = 1
        local bamboo_height = 0
        local bamboo_below = node_below

        while bamboo_below.name == 'everness:bamboo_3' do
            bamboo_below = core.get_node(vector.new(pos.x, pos.y - while_counter, pos.z))
            bamboo_height = bamboo_height + 1
            while_counter = while_counter + 1
        end

        -- Add top bamboo nodes with leaves based on their generated height
        if bamboo_height > 4 then
            for i = 1, 3 do
                local pos_i = vector.new(pos.x, pos.y + i, pos.z)

                if core.get_node(pos_i).name == 'air' then
                    if i == 1 then
                        core.set_node(pos_i, {
                            name = 'everness:bamboo_4',
                            param2 = node_below.param2
                        })
                    else
                        core.set_node(pos_i, {
                            name = 'everness:bamboo_5',
                            param2 = node_below.param2
                        })
                    end
                end
            end
        else
            for i = 1, 2 do
                local pos_i = vector.new(pos.x, pos.y + i, pos.z)

                if core.get_node(pos_i).name == 'air' then
                    if i == 1 then
                        core.set_node(pos_i, {
                            name = 'everness:bamboo_4',
                            param2 = node_below.param2
                        })
                    else
                        core.set_node(pos_i, {
                            name = 'everness:bamboo_5',
                            param2 = node_below.param2
                        })
                    end
                end
            end
        end
    end
})

-- Activate timers on lotus flowers
Everness:register_lbm({
    -- Descriptive label for profiling purposes (optional).
    -- Definitions with identical labels will be listed as one.
    label = 'Activate timers on lotus flowers',

    -- Identifier of the LBM, should follow the modname:<whatever> convention
    name = 'everness:everness_lotus_flower_timers',

    -- List of node names to trigger the LBM on.
    -- Names of non-registered nodes and groups (as group:groupname)
    -- will work as well.
    nodenames = {
        'everness:lotus_flower_white',
        'everness:lotus_flower_purple',
        'everness:lotus_flower_pink'
    },

    -- Whether to run the LBM's action every time a block gets activated,
    -- and not only the first time the block gets activated after the LBM
    -- was introduced.
    run_at_every_load = true,

    -- Function triggered for each qualifying node.
    -- `dtime_s` is the in-game time (in seconds) elapsed since the block
    -- was last active
    action = function(pos, node, dtime_s)
        local timer = core.get_node_timer(pos)

        if not timer:is_started() then
            core.get_node_timer(pos):start(1)
        end
    end
})

-- Spread lotus flowers and leafs around them
Everness:register_abm({
    label = 'everness:lotus_flowers_and_leaves_spread',
    description = 'Spreads lotus flowers and leaves.',
    nodenames = {
        'everness:lotus_flower_white',
        'everness:lotus_flower_purple',
        'everness:lotus_flower_pink',
        'everness:lotus_leaf',
        'everness:lotus_leaf_2',
        'everness:lotus_leaf_3'
    },
    neighbors = {
        'everness:lotus_flower_white',
        'everness:lotus_flower_purple',
        'everness:lotus_flower_pink',
        'everness:lotus_leaf',
        'everness:lotus_leaf_2',
        'everness:lotus_leaf_3'
    },
    max_y = Everness.settings.biomes.everness_mineral_waters.y_max,
    min_y = Everness.settings.biomes.everness_mineral_waters.y_min,
    interval = 13,
    chance = 300,
    action = function(pos, node)
        if not is_player_nearby(pos, 48) then
            return
        end

        local under = core.get_node(vector.new(pos.x, pos.y - 1, pos.z))
        local def = core.registered_nodes[under.name] or {}

        if def.liquidtype ~= 'source' and core.get_item_group(under.name, 'water') == 0 then
            return
        end

        local light = core.get_node_light(pos)

        if not light or light < 13 then
            return
        end

        local pos0 = { x = pos.x - 3, y = pos.y - 1, z = pos.z - 3 }
        local pos1 = { x = pos.x + 3, y = pos.y + 1, z = pos.z + 3 }
        local flower_node_names = {
            'everness:lotus_flower_white',
            'everness:lotus_flower_purple',
            'everness:lotus_flower_pink'
        }
        local leaf_node_names = {
            'everness:lotus_leaf',
            'everness:lotus_leaf_2',
            'everness:lotus_leaf_3'
        }
        local node_name = flower_node_names[math.random(1, #flower_node_names)]
        local found_flower_positions = core.find_nodes_in_area(pos0, pos1, flower_node_names)

        -- Threshold of 1 results in an appropriate density
        if #found_flower_positions > 1 then
            -- Spread leaves around random nearby flower
            local rand_flower_pos = found_flower_positions[math.random(1, #found_flower_positions)]
            pos0 = { x = rand_flower_pos.x - 3, y = rand_flower_pos.y - 1, z = rand_flower_pos.z - 3 }
            pos1 = { x = rand_flower_pos.x + 3, y = rand_flower_pos.y + 1, z = rand_flower_pos.z + 3 }
            local found_leaf_positions = core.find_nodes_in_area(pos0, pos1, leaf_node_names)

            if #found_leaf_positions > 15 then
                return
            end

            node_name = leaf_node_names[math.random(1, #leaf_node_names)]
        end

        local water_positions = core.find_nodes_in_area_under_air(pos0, pos1, 'group:water')
        if #water_positions == 0 then
            return
        end

        -- Pick a random water position directly (avoids expensive table.sort)
        local candidates = {}
        for _, p in ipairs(water_positions) do
            local n = core.get_node(p)
            local d = core.registered_nodes[n.name]
            if d and d.liquidtype == 'source' then
                candidates[#candidates + 1] = p
            end
        end

        if #candidates == 0 then
            return
        end

        local water_pos = candidates[math.random(1, #candidates)]
        local water_above = vector.new(water_pos.x, water_pos.y + 1, water_pos.z)
        light = core.get_node_light(water_above)

        if light and light >= 13 then
            core.set_node(water_above, { name = node_name })
        end
    end
})

--
-- Lavacooling
--

-- Override lava cooling to include some variations of obsidian
core.register_on_mods_loaded(function()
    for _, abm in pairs(core.registered_abms) do
        if abm.label == 'Lava cooling' and abm.action ~= nil then
            local prev_cool_lava_action = abm.action

            table.insert_all(abm.nodenames, { 'everness:lava_source', 'everness:lava_flowing' })

            abm.action = function(pos, node, dtime_s)
                Everness.cool_lava(pos, node, dtime_s, prev_cool_lava_action)
            end
        end
    end
end)

-- Calculates `everness:hammer_sharp` wear when crafting
core.register_craft_predict(function(itemstack, player, old_craft_grid, craft_inv)
    if itemstack and itemstack:get_name() == 'everness:hammer_sharp' then
        local stack_meta = itemstack:get_meta()
        local hammers = 0
        local wear_total = 0

        for k, stack in pairs(old_craft_grid) do
            if stack:get_name() == 'everness:hammer' then
                local meta = stack:get_meta()
                wear_total = wear_total + meta:get_int('everness_wear')
                hammers = hammers + 1
            end
        end

        local average_wear = wear_total / hammers

        stack_meta:set_int('everness_wear', math.ceil(average_wear))

        -- Draw wear bar texture overlay
        if average_wear > 0 then
            Everness.draw_wear_bar(itemstack, average_wear)
        end

        return itemstack
    end
end)

-- Calculates `everness:hammer_sharp` wear when crafting
core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
    if itemstack and itemstack:get_name() == 'everness:hammer_sharp' then
        local stack_meta = itemstack:get_meta()
        local hammers = 0
        local wear_total = 0

        for k, stack in pairs(old_craft_grid) do
            if stack:get_name() == 'everness:hammer' then
                local meta = stack:get_meta()
                wear_total = wear_total + meta:get_int('everness_wear')
                hammers = hammers + 1
            end
        end

        local average_wear = wear_total / hammers

        stack_meta:set_int('everness_wear', math.ceil(average_wear))

        -- Draw wear bar texture overlay
        if average_wear > 0 then
            Everness.draw_wear_bar(itemstack, average_wear)
        end

        return itemstack
    end
end)
