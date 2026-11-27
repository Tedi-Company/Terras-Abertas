local S = minetest.get_translator("ta_base")
minetest.register_node("ta_base:dirt", {
    description = S("Dirt"),
    tiles = {"dirt.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})

minetest.register_node("ta_base:dirt_with_snow", {
    description = S("Dirt"),
    tiles = {"dirt.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})

minetest.register_node("ta_base:dirt_with_dry_grass", {
    description = S("Dirt"),
    tiles = {"dirt.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})

minetest.register_node("ta_base:dirt_with_rainforest_litter", {
    description = S("Dirt"),
    tiles = {"dirt.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})

minetest.register_node("ta_base:dry_dirt", {
    description = S("Dry Dirt"),
    tiles = {"dirt.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})

minetest.register_node("ta_base:dirt_with_coniferous_litter", {
    description = S("Dirt"),
    tiles = {"dirt.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})

minetest.register_node("ta_base:dry_dirt_with_dry_grass", {
    description = S("Dirt"),
    tiles = {"dirt.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})