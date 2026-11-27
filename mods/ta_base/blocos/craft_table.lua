local S = minetest.get_translator("ta_base")
minetest.register_node("ta_base:craft_table", {
    description = S("craft_table"),
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

