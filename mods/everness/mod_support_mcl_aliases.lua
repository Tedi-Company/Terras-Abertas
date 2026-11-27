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

local function register_alias(name, convert_to)
    if rawget(core.registered_items, name) ~= nil then
        return
    end
    local existing = core.registered_aliases[name]
    if not existing then
        core.register_alias(name, convert_to)
        core.registered_aliases[name] = convert_to
    elseif existing ~= convert_to and rawget(core.registered_items, existing) == nil then
        core.register_alias_force(name, convert_to)
        core.registered_aliases[name] = convert_to
    end
end

register_alias('mapgen_water_source', 'mcl_core:water_source')
register_alias('default:water_source', 'mcl_core:water_source')
register_alias('default:water_flowing', 'mcl_core:water_flowing')
register_alias('default:dirt', 'mcl_core:dirt')
register_alias('default:dirt_with_rainforest_litter', 'mcl_core:dirt_with_grass')
register_alias('default:dirt_with_snow', 'mcl_core:dirt_with_grass_snow')
register_alias('default:dirt_with_coniferous_litter', 'mcl_core:podzol')
register_alias('default:dirt_with_grass', 'mcl_core:dirt_with_grass')
register_alias('default:permafrost_with_moss', 'mcl_core:dirt_with_grass')
register_alias('default:permafrost_with_stones', 'mcl_core:coarse_dirt')
register_alias('default:stick', 'mcl_core:stick')
register_alias('default:paper', 'mcl_core:paper')
register_alias('default:book', 'mcl_books:book')
register_alias('default:skeleton_key', 'mcl_core:gold_nugget')
register_alias('default:flint', 'mcl_core:flint')
register_alias('default:obsidian_shard', 'mcl_core:prismarine_shard')
register_alias('default:clay_brick', 'mcl_core:brick')
register_alias('default:mese_crystal_fragment', 'mcl_amethyst:amethyst_shard')

-- Ingots
register_alias('default:gold_ingot', 'mcl_core:gold_ingot')
register_alias('default:bronze_ingot', 'mcl_copper:copper_ingot')
register_alias('default:tin_ingot', 'mcl_core:iron_ingot')
register_alias('default:copper_ingot', 'mcl_copper:copper_ingot')
register_alias('default:steel_ingot', 'mcl_core:iron_ingot')
register_alias('default:coal_lump', 'mcl_core:coal_lump')

-- Tools
register_alias('default:pick_stone', 'mcl_tools:pick_stone')
register_alias('default:pick_bronze', 'mcl_tools:pick_gold')
register_alias('default:pick_steel', 'mcl_tools:pick_iron')
register_alias('default:shovel_stone', 'mcl_tools:shovel_stone')
register_alias('default:shovel_bronze', 'mcl_tools:shovel_gold')
register_alias('default:shovel_steel', 'mcl_tools:shovel_iron')
register_alias('default:axe_stone', 'mcl_tools:axe_stone')
register_alias('default:axe_bronze', 'mcl_tools:axe_gold')
register_alias('default:axe_steel', 'mcl_tools:axe_iron')
register_alias('default:sword_stone', 'mcl_tools:sword_stone')
register_alias('default:sword_bronze', 'mcl_tools:sword_gold')
register_alias('default:sword_steel', 'mcl_tools:sword_iron')

-- Items / Nodes
register_alias('default:bookshelf', 'mcl_books:bookshelf')
register_alias('default:sign_wall_wood', 'mcl_signs:wall_sign')
register_alias('default:ladder_wood', 'mcl_core:ladder')
register_alias('default:ladder_steel', 'mcl_core:ladder')
register_alias('default:glass', 'mcl_core:glass')
register_alias('default:obsidian_glass', 'mcl_core:glass')

-- Trees
register_alias('default:tree', 'mcl_core:tree')
register_alias('default:jungletree', 'mcl_core:jungletree')
register_alias('default:pine_tree', 'mcl_core:sprucetree')
register_alias('default:cactus', 'mcl_core:cactus')
register_alias('default:large_cactus_seedling', 'mcl_core:cactus')
register_alias('default:papyrus', 'mcl_core:reeds')
register_alias('default:junglegrass', 'mcl_flowers:double_grass')
register_alias('default:blueberry_bush_sapling', 'mcl_flowers:rose_bush')
register_alias('default:sapling', 'mcl_core:sapling')
register_alias('default:junglesapling', 'mcl_core:junglesapling')
register_alias('default:pine_sapling', 'mcl_core:sprucesapling')
register_alias('default:acacia_sapling', 'mcl_core:acaciasapling')
register_alias('default:aspen_sapling', 'mcl_core:birchsapling')

register_alias('default:clay_lump', 'mcl_core:clay_lump')
register_alias('default:tin_lump', 'mcl_raw_ores:raw_gold')
register_alias('default:copper_lump', 'mcl_copper:raw_copper')
register_alias('default:iron_lump', 'mcl_raw_ores:raw_iron')
register_alias('default:coalblock', 'mcl_core:coalblock')
register_alias('default:steelblock', 'mcl_core:ironblock')
register_alias('default:copperblock', 'mcl_copper:block')
register_alias('default:tinblock', 'mcl_core:goldblock')
register_alias('default:bronzeblock', 'mcl_copper:block')
register_alias('default:mese', 'mesecons_torch:redstoneblock')
register_alias('default:meselamp', 'mesecons_lightstone:lightstone_off')
register_alias('default:obsidian', 'mcl_core:obsidian')
register_alias('default:mese_crystal', 'mcl_ocean:prismarine_crystals')
register_alias('default:diamond', 'mcl_core:diamond')
register_alias('default:pick_mese', 'mcl_tools:pick_diamond')
register_alias('default:shovel_mese', 'mcl_tools:shovel_diamond')
register_alias('default:axe_mese', 'mcl_tools:axe_diamond')
register_alias('default:sword_mese', 'mcl_tools:sword_diamond')

register_alias('default:tnt', 'mcl_tnt:tnt')
register_alias('default:snowblock', 'mcl_core:snowblock')
register_alias('default:ice', 'mcl_core:ice')
register_alias('default:torch', 'mcl_torches:torch')
register_alias('default:cobble', 'mcl_core:cobble')
register_alias('default:chest', 'mcl_chests:chest')
register_alias('default:snow', 'mcl_core:snow')
register_alias('default:stone', 'mcl_core:stone')
register_alias('default:sand', 'mcl_core:sand')
register_alias('default:desert_sand', 'mcl_core:sand')
register_alias('default:silver_sand', 'mcl_core:sand')
register_alias('default:gravel', 'mcl_core:gravel')
register_alias('default:stone_with_coal', 'mcl_core:stone_with_coal')
register_alias('default:stone_with_iron', 'mcl_core:stone_with_iron')
register_alias('default:stone_with_copper', 'mcl_copper:stone_with_copper')
register_alias('default:stone_with_tin', 'mcl_copper:stone_with_copper')
register_alias('default:stone_with_gold', 'mcl_core:stone_with_gold')
register_alias('default:stone_with_mese', 'mcl_core:stone_with_redstone')
register_alias('default:stone_with_diamond', 'mcl_core:stone_with_diamond')
register_alias('mapgen_lava_source', 'mcl_core:lava_source')
register_alias('default:lava_source', 'mcl_core:lava_source')
register_alias('default:mossycobble', 'mcl_core:mossycobble')
register_alias('default:clay', 'mcl_colorblocks:hardened_clay')
register_alias('default:dry_dirt_with_dry_grass', 'mcl_core:dirt_with_grass')
register_alias('default:dry_dirt', 'mcl_core:coarse_dirt')
register_alias('default:coral_skeleton', 'mcl_core:bone_block')
register_alias('default:lava_flowing', 'mcl_core:lava_flowing')
register_alias('default:fence_wood', 'mcl_fences:fence')
register_alias('default:torch_wall', 'mcl_torches:torch_wall')
register_alias('default:wood', 'mcl_core:wood')
register_alias('default:junglewood', 'mcl_core:junglewood')
register_alias('default:pine_wood', 'mcl_core:sprucewood')
register_alias('default:mese_post_light_pine_wood', 'mcl_torches:torch')
if not core.registered_items['default:acacia_tree'] then
    core.register_alias_force('default:acacia_tree', 'mcl_core:acaciatree')
end
register_alias('default:dry_grass_4', 'mcl_core:deadbush')
register_alias('default:dry_grass_2', 'mcl_core:deadbush')
register_alias('default:dry_shrub', 'mcl_core:deadbush')
register_alias('default:stonebrick', 'mcl_core:stonebrick')
register_alias('default:jungleleaves', 'mcl_core:jungleleaves')
register_alias('default:torch_ceiling', 'mcl_torches:torch_wall')
register_alias('default:goldblock', 'mcl_core:goldblock')

-- Common MTG Stairs and Slabs (registered if not already handled by game)
register_alias('stairs:stair_junglewood', 'mcl_stairs:stair_junglewood')
register_alias('stairs:slab_junglewood', 'mcl_stairs:slab_junglewood')
register_alias('stairs:stair_wood', 'mcl_stairs:stair_wood')
register_alias('stairs:slab_wood', 'mcl_stairs:slab_wood')
register_alias('stairs:stair_inner_wood', 'mcl_stairs:stair_wood_inner')
register_alias('stairs:stair_outer_wood', 'mcl_stairs:stair_wood_outer')
register_alias('stairs:stair_stonebrick', 'mcl_stairs:stair_stonebrick')
register_alias('stairs:slab_stonebrick', 'mcl_stairs:slab_stonebrick')
register_alias('stairs:stair_inner_stonebrick', 'mcl_stairs:stair_stonebrick_inner')
register_alias('stairs:stair_outer_stonebrick', 'mcl_stairs:stair_stonebrick_outer')
register_alias('stairs:stair_mossycobble', 'mcl_stairs:stair_mossycobble')
register_alias('stairs:slab_mossycobble', 'mcl_stairs:slab_mossycobble')

-- Walls backwards compatibility (old map data without underscores -> new registered wall names)
register_alias('everness:cursedbrickwall', 'everness:cursed_brick_wall')
register_alias('everness:cursedbrickwithgrowthwall', 'everness:cursed_brick_with_growth_wall')
register_alias('everness:coraldesertcobblewall', 'everness:coral_desert_cobble_wall')
register_alias('everness:coraldesertmossycobblewall', 'everness:coral_desert_mossy_cobble_wall')
register_alias('everness:forsakentundrabrickwall', 'everness:forsaken_tundra_brick_wall')
register_alias('everness:forsakentundracobblewall', 'everness:forsaken_tundra_cobble_wall')
register_alias('everness:forsakentundrastonewall', 'everness:forsaken_tundra_stone_wall')
register_alias('walls:cobble', 'mcl_walls:cobble')

-- Doors & Trapdoors
register_alias('xpanes:trapdoor_steel_bar', 'mcl_doors:iron_trapdoor')
register_alias('doors:trapdoor_open', 'mcl_doors:trapdoor_open')
register_alias('doors:trapdoor', 'mcl_doors:trapdoor')
register_alias('doors:door_wood', 'mcl_doors:wooden_door')
register_alias('doors:door_wood_a', 'mcl_doors:wooden_door_b_1')
register_alias('doors:door_wood_b', 'mcl_doors:wooden_door_t_1')
register_alias('doors:hidden', 'air')
register_alias('everness:cobweb', 'mcl_core:cobweb')

-- Fence Gates
register_alias('everness:gate_bamboo', 'everness:fence_bamboo_wood_gate')
register_alias('everness:gate_bamboo_open', 'everness:fence_bamboo_wood_gate_open')
register_alias('everness:gate_crystal_wood', 'everness:fence_crystal_wood_gate')
register_alias('everness:gate_crystal_wood_open', 'everness:fence_crystal_wood_gate_open')
register_alias('everness:gate_palm_wood', 'everness:fence_palm_wood_gate')
register_alias('everness:gate_palm_wood_open', 'everness:fence_palm_wood_gate_open')
register_alias('everness:gate_coral_wood', 'everness:fence_coral_wood_gate')
register_alias('everness:gate_coral_wood_open', 'everness:fence_coral_wood_gate_open')
register_alias('everness:gate_lava_tree_wood', 'everness:fence_lava_tree_wood_gate')
register_alias('everness:gate_lava_tree_wood_open', 'everness:fence_lava_tree_wood_gate_open')

-- Legacy flowers - replaced by everness:flowers_*
register_alias('flowers:rose', 'mcl_flowers:wither_rose')
register_alias('flowers:tulip', 'mcl_flowers:tulip_orange')
register_alias('flowers:dandelion_yellow', 'mcl_flowers:dandelion')
register_alias('flowers:geranium', 'mcl_flowers:allium')
register_alias('flowers:viola', 'mcl_flowers:azure_bluet')
register_alias('flowers:tulip_black', 'mcl_flowers:tulip_white')
register_alias('flowers:dandelion_white', 'mcl_flowers:tulip_pink')
register_alias('flowers:chrysanthemum_green', 'mcl_flowers:tulip_white')

-- Schematics compatibility
register_alias('butterflies:butterfly_violet', 'air')
