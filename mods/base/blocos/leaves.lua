minetest.register_node("base:leaves", {
    description = "Folhas",

    drawtype = "allfaces_optional",
    waving = 1,
    paramtype = "light",

    tiles = {"leaves.png"},

    groups = {
        snappy = 3,
        leafdecay = 3,
        flammable = 2,
        crumbly = 3, soil = 1,
    },
})
