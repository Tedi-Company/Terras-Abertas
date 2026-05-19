minetest.register_node("ta_base:moss_block", {
    description = "Bloco de musgo",
    tiles = {"moss_block.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})
