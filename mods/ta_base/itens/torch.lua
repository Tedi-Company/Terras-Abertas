minetest.register_node("ta_base:torch", {
    description = "Tocha",
    drawtype = "torchlike",
    tiles = {"torch.png"},
    inventory_image = "torch.png",
    wield_image = "torch.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    light_source = 12,
    groups = {dig_immediate = 3, flammable = 1, attached_node = 1},
})
