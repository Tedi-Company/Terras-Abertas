minetest.register_node("base:moss_block", {
    description = "Bloco de musgo",
    tiles = {"moss_block.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "base:dirt"
})
