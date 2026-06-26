-- Ativa o sistema de tradução para a pedra
local S = minetest.get_translator("ta_base")

minetest.register_node("ta_base:stone", {
    description = S("Stone"), -- Agora o jogo sabe que pode traduzir essa palavra!
    tiles = {"stone.png"},
    is_ground_content = true,
    groups = {crumbly = 3, soil = 1},
    drop = "ta_base:stone"
})
