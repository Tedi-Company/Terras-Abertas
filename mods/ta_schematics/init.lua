local modpath = minetest.get_modpath("ta_schematics")

-- Papyrus on grass
minetest.register_decoration({
    name = "ta_schematics:papyrus_two_x_one_on_grass",
    deco_type = "schematic",
    schematic = modpath .. "/schematics/papyrus_two_x_one_on_grass_4.0.0.mts",

    place_on = {"ta_base:dirt_with_grass", "ta_base:dirt"}, 
    
    sidelen = 16,
    noise_params = {
        offset = -0.3,
        scale = 0.7,
        spread = {x = 100, y = 100, z = 100},
        seed = 354,
        octaves = 3,
        persist = 0.7
    },

    y_max = 2,
    y_min = 0,

    flags = "place_center_x, place_center_z",
    rotation = "random",
})

-- Papyrus on dry dirt
minetest.register_decoration({
    name = "ta_schematics:papyrus_two_x_one_on_dry_dirt.mts",
    deco_type = "schematic",
    schematic = modpath .. "/schematics/papyrus_two_x_one_on_dry_dirt_4.0.01.mts",

    place_on = {"ta_base:dirt_with_grass", "ta_base:dirt"}, 
    
    sidelen = 16,
    noise_params = {
        offset = -0.3,
        scale = 0.7,
        spread = {x = 100, y = 100, z = 100},
        seed = 354,
        octaves = 3,
        persist = 0.7
    },

    y_max = 2,
    y_min = 0,

    flags = "place_center_x, place_center_z",
    rotation = "random",
})

