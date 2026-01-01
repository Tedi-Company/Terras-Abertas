minetest.register_node("base:grass", {
    description = "Terra com Grama",
    tiles = {
        "grass_top.png",   -- topo
        "dirt.png",        -- baixo
        "grass_side.png"   -- lados
    },
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "base:dirt"
})
