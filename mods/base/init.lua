local modpath = minetest.get_modpath("base")

-- carregar blocos
dofile(modpath .. "/blocos/dirt.lua")
dofile(modpath .. "/blocos/grass.lua")
dofile(modpath .. "/blocos/stone.lua")
dofile(modpath .. "/blocos/wood.lua")
dofile(modpath .. "/blocos/leaves.lua")

-- aliases obrigatórios do mapgen
minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:grass")
minetest.register_alias("base:tree", "base:wood")
-- Aliases de folhas
minetest.register_alias("mapgen_leaves", "base:leaves")
minetest.register_alias("default:leaves", "base:leaves")
minetest.register_alias("leaves", "base:leaves")



