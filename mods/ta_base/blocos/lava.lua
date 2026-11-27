-- 1. ADICIONE O TRADUTOR NO TOPO DO ARQUIVO
local S = minetest.get_translator("ta_base")

-- 2. REGISTRO DA LAVA FONTE (BLOCO PARADO)
minetest.register_node("ta_base:lava_source", {
    description = S("Lava Source"),

    tiles = {"lava.png"},                         -- Textura correta da lava
    drawtype = "liquid",
    paramtype = "light",
    light_source = 13,                            -- Faz a lava brilhar no escuro (essencial)
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "source",
    
    -- CORREÇÃO: Aponta para os IDs certos da LAVA, não da água!
    liquid_alternative_flowing = "ta_base:lava_flowing",
    liquid_alternative_source = "ta_base:lava_source",
    
    liquid_viscosity = 7,                         -- Lava é mais viscosa/lenta que a água
    damage_per_second = 4,                        -- Faz a lava queimar e dar dano ao jogador
    groups = {lava = 3, liquid = 3, igniter = 1}, -- Grupos corretos de calor/fogo
})

-- 3. REGISTRO DA LAVA FLUINDO (O QUE ESCORRE)
minetest.register_node("ta_base:lava_flowing", {
    description = S("Flowing Lava"),

    tiles = {"lava.png"},                         -- Textura correta da lava
    drawtype = "flowingliquid",
    paramtype = "light",
    paramtype2 = "flowingliquid",
    light_source = 13,                            -- A lava escorrendo também brilha
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "flowing",
    
    -- CORREÇÃO: Conecta com as alternativas de LAVA
    liquid_alternative_flowing = "ta_base:lava_flowing",
    liquid_alternative_source = "ta_base:lava_source",
    
    liquid_viscosity = 7,
    damage_per_second = 4,                        -- Também queima quem encostar
    groups = {lava = 3, liquid = 3, igniter = 1, not_in_creative_inventory = 1},
})
