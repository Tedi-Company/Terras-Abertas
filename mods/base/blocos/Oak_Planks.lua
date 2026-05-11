minetest.register_node("base:Oak_Planks", {
    description = "Tabua de madeira de carvalho",
    tiles = {"Oak_Planks.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "base:Oak_Planks"
})

minetest.register_craft({
    type = "shapeless",
    output = "base:Oak_Planks 8",
    recipe = {"base:wood"}
})

