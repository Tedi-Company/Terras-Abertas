minetest.register_node("ta_base:Oak_Planks", {
    description = "Tabua de madeira de carvalho",
    tiles = {"Oak_Planks.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:Oak_Planks"
})

minetest.register_craft({
    type = "shapeless",
    output = "ta_base:Oak_Planks 8",
    recipe = {"ta_base:wood"}
})

