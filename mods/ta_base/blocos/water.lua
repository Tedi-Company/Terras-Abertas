-- 1. ADICIONE O TRADUTOR NO TOPO DO ARQUIVO
local S = minetest.get_translator("ta_base")

-- 1. REGISTRO DA FONTE DE ÁGUA (BLOCO PARADO)
minetest.register_node("ta_base:water_source", {
    description = S("Water"), -- 2. ADICIONE O S() AQUI

    tiles = {"water.png"},
    drawtype = "liquid",
    paramtype = "light",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "source",
    liquid_alternative_flowing = "ta_base:water_flowing",
    liquid_alternative_source = "ta_base:water_source",
    liquid_viscosity = 1,
    groups = {water = 3, liquid = 3},
})

-- 2. REGISTRO DA ÁGUA FLUINDO (O QUE ESCORRE)
minetest.register_node("ta_base:water_flowing", {
    description = S("Water"), -- 3. ADICIONE O S() AQUI TAMBÉM

    tiles = {"water.png"},
    drawtype = "flowingliquid",
    paramtype = "light",
    paramtype2 = "flowingliquid",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "flowing",
    liquid_alternative_flowing = "ta_base:water_flowing",
    liquid_alternative_source = "ta_base:water_source",
    liquid_viscosity = 1,
    groups = {water = 3, liquid = 3, not_in_creative_inventory = 1},
})
