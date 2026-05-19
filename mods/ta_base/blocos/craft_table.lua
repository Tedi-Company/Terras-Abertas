minetest.register_node("ta_base:craft_table", {
    description = "bloco de contrução",
    tiles = {
        "grass_top.png",   -- topo
        "grass_side.png"   -- lados
    },
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})

minetest.register_craft({
    output = "base:craft_table",
    recipe = {
        {"base:wood", "base:Oak_Planks"},
        {"base:wood", "base:Oak_Planks"},
        {"base:wood", "base:Oak_Planks"},
    }
})

