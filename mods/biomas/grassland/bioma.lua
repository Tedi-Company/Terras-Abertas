minetest.register_biome({
    name = "grassland",
    node_top = "base:grass",
    depth_top = 1,

    node_filler = "base:dirt",
    depth_filler = 3,

    node_stone = "base:stone",

    y_min = -31000,
    y_max = 31000,

    heat_point = 50,
    humidity_point = 50,
})
