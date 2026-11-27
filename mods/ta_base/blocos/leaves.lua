-- Ativa o sistema de tradução
local S = minetest.get_translator("ta_base")

minetest.register_node("ta_base:leaves", {
    description = S("Leaves"), -- Corrigido com S() e letra maiúscula!

    drawtype = "allfaces_optional",
    waving = 1,
    paramtype = "light",

    tiles = {"leaves.png"},

    groups = {
        snappy = 3,
        leafdecay = 3,
        flammable = 2,
        crumbly = 3, soil = 1,
    },
})

minetest.register_node("ta_base:jungleleaves", {
    description = S("Leaves"), -- Corrigido com S() e letra maiúscula!

    drawtype = "allfaces_optional",
    waving = 1,
    paramtype = "light",

    tiles = {"leaves.png"},

    groups = {
        snappy = 3,
        leafdecay = 3,
        flammable = 2,
        crumbly = 3, soil = 1,
    },
})

minetest.register_node("ta_base:pine_needles", {
    description = S("Leaves"), -- Corrigido com S() e letra maiúscula!

    drawtype = "allfaces_optional",
    waving = 1,
    paramtype = "light",

    tiles = {"leaves.png"},

    groups = {
        snappy = 3,
        leafdecay = 3,
        flammable = 2,
        crumbly = 3, soil = 1,
    },
})

minetest.register_node("ta_base:pine_bush", {
    description = S("Pine Bush"),

    drawtype = "allfaces_optional",
    waving = 1,
    paramtype = "light",

    tiles = {"leaves.png"},

    groups = {
        snappy = 3,
        leafdecay = 3,
        flammable = 2,
        crumbly = 3, soil = 1,
    },
})

minetest.register_node("ta_base:blueberry_bush", {
    description = S("Blueberry Bush"),

    drawtype = "allfaces_optional",
    waving = 1,
    paramtype = "light",

    tiles = {"leaves.png"},

    groups = {
        snappy = 3,
        leafdecay = 3,
        flammable = 2,
        crumbly = 3, soil = 1,
    },
})
