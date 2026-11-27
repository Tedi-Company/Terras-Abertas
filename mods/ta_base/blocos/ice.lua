local S = minetest.get_translator("ta_base")

minetest.register_node("ta_base:ice", {
    description = S("Ice"),
    tiles = {"ice.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
})

minetest.register_node("ta_base:snowblock", {
    description = S("Snow Block"),
    tiles = {"snowblock.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:stone"
})

minetest.register_node("ta_base:snow", {
    description = "Neve",   
    drawtype = "raillike", 
    tiles = {"snow.png"},
    inventory_image = "snow.png",
    wield_image = "snow.png",
    paramtype = "light",
    buildable_to = true,
    walkable = false,
    pointable = true,
    diggable = true,
    groups = {crumbly = 3, attached_node = 1, snow = 1},
    drop = "ta_base:snow",
    sounds = {},
})


