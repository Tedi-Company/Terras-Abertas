local S = minetest.get_translator("ta_base")
minetest.register_node("ta_base:white_concrete", {
    description = S("White concrete"),
    tiles = {"white_concrete.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:white_concrete"
})
