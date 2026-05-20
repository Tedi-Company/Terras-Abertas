local modpath = minetest.get_modpath("arvores")

-- Árvore pequena
minetest.register_decoration({
    name = "mapgen_trees:small_tree",
    deco_type = "schematic",

    place_on = {"ta_base:grass"},
    sidelen = 16,

    fill_ratio = 0.0025,
    biomes = {"grassland"},

    y_min = 1,
    y_max = 80,

    schematic = modpath .. "/schematics/small_tree_0.3.3.mts",

    flags = "place_center_x, place_center_z",
    rotation = "random",
})

-- Árvore grande
minetest.register_decoration({
    name = "mapgen_trees:big_tree",
    deco_type = "schematic",

    place_on = {"ta_base:grass"},
    sidelen = 16,

    fill_ratio = 0.0008,
    biomes = {"grassland"},

    y_min = 1,
    y_max = 80,

    schematic = modpath .. "/schematics/big_tree_0.3.3.mts",

    flags = "place_center_x, place_center_z",
    rotation = "random",
})
