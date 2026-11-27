local S = minetest.get_translator("ta_base")
minetest.register_node("ta_base:moss_block", {
    description = S("moss block"),
    tiles = {"moss_block.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})
