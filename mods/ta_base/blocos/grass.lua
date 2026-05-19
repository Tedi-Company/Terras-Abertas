minetest.register_node("ta_base:grass", {
    description = "Terra com Grama",
    tiles = {
        "grass_top.png",   -- topo
        "grass_side.png"   -- lados
    },
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})
