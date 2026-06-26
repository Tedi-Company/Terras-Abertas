-- Ativa o sistema de tradução
local S = minetest.get_translator("ta_base")

minetest.register_node("ta_base:grass", {
    description = S("Dirt with grass"), -- Agora o jogo sabe que pode traduzir isso!
    tiles = {
        "grass_top.png",   -- topo
        "grass_side.png"   -- lados
    },
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:dirt"
})
