local S = minetest.get_translator("ta_base")

minetest.register_node("ta_base:wood", {
    description = S("Tronco de Madeira de carvalho"),

    drawtype = "nodebox",
    paramtype = "light",

    tiles = {
        "wood_top.png",
        "wood_top.png",
        "wood_side.png",
    },

    node_box = {
        type = "fixed",
        fixed = {
            {-0.35, -0.5, -0.5,  0.35, 0.5, 0.5},
            {-0.5,  -0.5, -0.35, 0.5,  0.5, 0.35},
        }
    },

    selection_box = {
        type = "fixed",
        fixed = {-0.5,-0.5,-0.5,0.5,0.5,0.5}
    },

    collision_box = {
        type = "fixed",
        fixed = {-0.5,-0.5,-0.5,0.5,0.5,0.5}
    },

    groups = {
        tree = 1,
        choppy = 2,
        oddly_breakable_by_hand = 1
    },
})
