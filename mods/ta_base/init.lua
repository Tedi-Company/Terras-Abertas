-- ## By Tedi Games Studios

S = minetest.get_translator("ta_base")

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
dofile(modpath .. "/blocos/sand.lua")
dofile(modpath .. "/blocos/lava.lua")
dofile(modpath .. "/blocos/cactus.lua")
dofile(modpath .. "/blocos/ice.lua")

--Carregar Itens:

dofile(modpath .. "/itens/Wooden_Sword.lua")
dofile(modpath .. "/itens/papyrus.lua")
dofile(modpath .. "/itens/iron_bar.lua")
dofile(modpath .. "/itens/torch.lua")
dofile(modpath .. "/itens/stick.lua")
--Candle Desativado

-- aliases obrigatórios do mapgen
minetest.register_alias("mapgen_stone", "ta_base:stone")
minetest.register_alias("mapgen_dirt", "ta_base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "ta_base:grass")
minetest.register_alias("ta_base:tree", "ta_base:wood")
minetest.register_alias("mapgen_water_source", "ta_base:water_source")

-- Correção de bugs:

minetest.register_alias("base:dirt", "ta_base:dirt")
minetest.register_alias("base:water_source", "ta_base:water_source")
minetest.register_alias("base:grass", "ta_base:grass")
minetest.register_alias("base:stone", "ta_base:stone")
minetest.register_alias("base:wood", "ta_base:wood")
minetest.register_alias("base:leaves", "ta_base:leaves")
minetest.register_alias("base:Oak_Planks", "ta_base:Oak_Planks")
minetest.register_alias("base:white_concrete", "ta_base:white_concrete")
minetest.register_alias("base:moss_block", "ta_base:moss_block")
minetest.register_alias("base:craft_table", "ta_base:craft_table")

-- Aliases de folhas
minetest.register_alias("mapgen_leaves", "ta_base:leaves")
minetest.register_alias("default:leaves", "ta_base:leaves")
minetest.register_alias("leaves", "ta_base:leaves")
