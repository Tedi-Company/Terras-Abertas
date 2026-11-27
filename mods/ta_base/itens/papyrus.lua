local S = minetest.get_translator("ta_base")

minetest.register_node("ta_base:papyrus", {
    description = S("Papyrus"), -- Usando o sistema de tradução
    drawtype = "plantlike",    -- Faz com que a imagem 2D se cruze em X no cenário 3D
    tiles = {"papyrus.png"},
    inventory_image = "papyrus.png",
    wield_image = "papyrus.png",
    paramtype = "light",
    sunlight_propagates = true,
    walkable = false,          -- Permite que o jogador passe por dentro da planta
    selection_box = {
        type = "fixed",
        fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}, -- Caixa de seleção ajustada ao caule
    },
    groups = {snappy = 3, flammable = 2, papyrus = 1}, -- Grupos para ferramentas e identificação
    sounds = {},
})
