local modpath = minetest.get_modpath("ta_base")

-- carregar blocos
dofile(modpath .. "/blocos/dirt.lua")
dofile(modpath .. "/blocos/water.lua")
dofile(modpath .. "/blocos/grass.lua")
dofile(modpath .. "/blocos/stone.lua")
dofile(modpath .. "/blocos/wood.lua")
dofile(modpath .. "/blocos/leaves.lua")
dofile(modpath .. "/blocos/Oak_Planks.lua")
dofile(modpath .. "/blocos/concrete/white_concrete.lua")
dofile(modpath .. "/blocos/mosses/moss_block.lua")
dofile(modpath .. "/blocos/craft_table.lua")

-- aliases obrigatórios do mapgen
minetest.register_alias("mapgen_stone", "ta_base:stone")
minetest.register_alias("mapgen_dirt", "ta_base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "ta_base:grass")
minetest.register_alias("ta_base:tree", "ta_base:wood")
minetest.register_alias("mapgen_water_source", "ta_base:water_source")

-- Correção de bugs:

minetest.register_alias("base:dirt", "ta_base:dirt")
minetest.register_alias("base:grass", "ta_base:grass")

-- Aliases de folhas
minetest.register_alias("mapgen_leaves", "ta_base:leaves")
minetest.register_alias("default:leaves", "ta_base:leaves")
minetest.register_alias("leaves", "ta_base:leaves")



