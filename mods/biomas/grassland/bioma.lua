minetest.register_biome({
    name = "grassland",
    node_top = "ta_base:grass",
    depth_top = 1,

    node_filler = "ta_base:dirt",
    depth_filler = 3,

    node_stone = "ta_base:stone",

    y_min = -31000,
    y_max = 31000,

    heat_point = 50,
    humidity_point = 50,
})
