
local modpath = minetest.get_modpath(minetest.get_current_modname())

minetest.register_node("tmm:stone_with_alu", {
	description = ("Aluminium Ore"),
	tiles = {"stone.png^alu_mineral_alu.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:alu 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:alu'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:alu'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:alu'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:alu", {
	description = ("Aluminium"),
	inventory_image = "alu.png",
})


minetest.register_node("tmm:alublock", {
	description = ("Aluminium Block"),
	tiles = {"alu_alublock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:alu',
	recipe = {
		{'tmm:alu', 'tmm:alu', 'tmm:alu'},
		{'tmm:alu', 'tmm:alu', 'tmm:alu'},
		{'tmm:alu', 'tmm:alu', 'tmm:alu'},
	}
})

-- Lapis Items from Lapis Block Crafting
minetest.register_craft({
	output = 'alum:alu 9',
	recipe = {
		{'tmm:alu'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_alu",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -200,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_alu",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -2000,
})

minetest.register_node("tmm:stone_with_beryllium", {
	description = ("tmm: Ore"),
	tiles = {"stone.png^beryllium_mineral_beryllium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:beryllium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:beryllium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:beryllium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:beryllium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:beryllium", {
	description = ("Beryllium"),
	inventory_image = "beryllium.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_beryllium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -100,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_beryllium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -10000,
})
minetest.register_node("tmm:stone_with_bismuth", {
	description = ("Bismuth Ore"),
	tiles = {"stone.png^bismuth_mineral_bismuth.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:bismuth 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:bismuth'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:bismuth'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:bismuth'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:bismuth", {
	description = ("Bismuth"),
	inventory_image = "bismuth.png",
})


minetest.register_node("tmm:bismuthblock", {
	description = ("Bismuth Block"),
	tiles = {"bismuth_bismuthblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:bismuthblock',
	recipe = {
		{'tmm:bismuth', 'tmm:bismuth', 'tmm:bismuth'},
		{'tmm:bismuth', 'tmm:bismuth', 'tmm:bismuth'},
		{'tmm:bismuth', 'tmm:bismuth', 'tmm:bismuth'},
	}
})

minetest.register_craft({
	output = 'tmm:bismuth 9',
	recipe = {
		{'tmm:bismuth'},
	}
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_bismuth",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -2000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_bismuth",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -10000,
})
minetest.register_node("tmm:stone_with_boron", {
	description = ("Boron Ore"),
	tiles = {"stone.png^boron_mineral_boron.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:boron 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:boron'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:boron'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:boron'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:boron", {
	description = ("Boron"),
	inventory_image = "boron.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_boron",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -400,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_boron",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -900,
})
minetest.register_node("tmm:stone_with_cadium", {
	description = ("Cadium Ore"),
	tiles = {"stone.png^cadium_mineral_cadium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:cadium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:cadium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:cadium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:cadium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:cadium", {
	description = ("Cadium"),
	inventory_image = "cadium.png",
})

-- Lapis Block
minetest.register_node("tmm:cadiumblock", {
	description = ("Cadium Block"),
	tiles = {"cadium_cadiumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:cadium',
	recipe = {
		{'tmm:cadium', 'tmm:cadium', 'tmm:cadium'},
		{'tmm:cadium', 'tmm:cadium', 'tmm:cadium'},
		{'tmm:cadium', 'tmm:cadium', 'tmm:cadium'},
	}
})

minetest.register_craft({
	output = 'tmm:cadium 9',
	recipe = {
		{'tmm:cadium'},
	}
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_cadium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -50,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_cadium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -20000,
})
minetest.register_node("tmm:stone_with_zirconium", {
	description = ("Zirconium Ore"),
	tiles = {"stone.png^zirconium_mineral_zirconium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:zirconium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:zirconium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:zirconium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:zirconium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:zirconium", {
	description = ("Zirconium"),
	inventory_image = "zirconium.png",
})


minetest.register_node("tmm:zirconiumblock", {
	description = ("Zirconium Block"),
	tiles = {"zirconium_zirconiumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:zirconium',
	recipe = {
		{'tmm:zirconium', 'tmm:zirconium', 'tmm:zirconium'},
		{'tmm:zirconium', 'tmm:zirconium', 'tmm:zirconium'},
		{'tmm:zirconium', 'tmm:zirconium', 'tmm:zirconium'},
	}
})

-- Lapis Items from Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:zirconium 9',
	recipe = {
		{'tmm:zirconium'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_zirconium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -900,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_zirconium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -9000,
})
minetest.register_node("tmm:stone_with_antimony", {
	description = ("Antimony Ore"),
	tiles = {"stone.png^antimony_mineral_antimony.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:antimony 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:antimony'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:antimony'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:antimony'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:antimony", {
	description = ("Antimony"),
	inventory_image = "antimony.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_antimony",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -1000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_antimony",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -20000,
})
minetest.register_node("tmm:stone_with_arsenic", {
	description = ("Arsenic Ore"),
	tiles = {"stone.png^arsenic_mineral_arsenic.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:arsenic 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:arsenic'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:arsenic'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:arsenic'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:arsenic", {
	description = ("Arsenic"),
	inventory_image = "arsenic.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_arsenic",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -1000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_arsenic",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -3000,
})
minetest.register_node("tmm:stone_with_tellurium", {
	description = ("Tellurium Ore"),
	tiles = {"stone.png^tellurium_mineral_tellurium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:tellurium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:tellurium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:tellurium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:tellurium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:tellurium", {
	description = ("Tellurium"),
	inventory_image = "tellurium.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_tellurium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -900,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_tellurium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1800,
})
minetest.register_node("tmm:stone_with_thallium", {
	description = ("Thallium Ore"),
	tiles = {"stone.png^thallium_mineral_thallium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:thallium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:thallium'},    --The 3rd drops with a 1/2 chance
				rarity = 1,
			},
			{
				items = {'tmm:thallium'},    --The 4th drops with a 1/3 chance
				rarity = 1,
			},
			{
				items = {'tmm:thallium'},    --The 5th drops with a 1/8 chance
				rarity = 1,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:thallium", {
	description = ("Thallium"),
	inventory_image = "thallium.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_thallium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -1000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_thallium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -15000,
})
minetest.register_node("tmm:stone_with_sodium", {
	description = ("Sodium Ore"),
	tiles = {"stone.png^sodium_mineral_sodium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:sodium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:sodium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:sodium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:sodium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:sodium", {
	description = ("Sodium"),
	inventory_image = "sodium.png",
})


minetest.register_node("tmm:sodiumblock", {
	description = ("Sodium Block"),
	tiles = {"sodium_sodiumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

minetest.register_craft({
	output = 'tmm:sodium',
	recipe = {
		{'tmm:sodium', 'tmm:sodium', 'tmm:sodium'},
		{'tmm:sodium', 'tmm:sodium', 'tmm:sodium'},
		{'tmm:sodium', 'tmm:sodium', 'tmm:sodium'},
	}
})


minetest.register_craft({
	output = 'tmm:sodium 9',
	recipe = {
		{'tmm:sodium'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_sodium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -100,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_sodium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1000,
})
minetest.register_node("tmm:stone_with_strontium", {
	description = ("Strontium Ore"),
	tiles = {"stone.png^strontium_mineral_strontium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:strontium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:strontium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:strontium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:strontium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:strontium", {
	description = ("Strontium"),
	inventory_image = "strontium.png",
})

-- Lapis Block
minetest.register_node("tmm:strontiumblock", {
	description = ("Strontium Block"),
	tiles = {"strontium_strontiumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

-- Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:strontium',
	recipe = {
		{'tmm:strontium', 'tmm:strontium', 'tmm:strontium'},
		{'tmm:strontium', 'tmm:strontium', 'tmm:strontium'},
		{'tmm:strontium', 'tmm:strontium', 'tmm:strontium'},
	}
})

-- Lapis Items from Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:strontium 9',
	recipe = {
		{'tmm:strontium'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_strontium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -1200,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_strontium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1600,
})
minetest.register_node("tmm:stone_with_sulfur", {
	description = ("Sulfur Ore"),
	tiles = {"stone.png^sulfur_mineral_sulfur.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:sulfur 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:sulfur'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:sulfur'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:sulfur'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:sulfur", {
	description = ("Sulfur"),
	inventory_image = "sulfur.png",
})

minetest.register_node("tmm:sulfurblock", {
	description = ("Sulfur Block"),
	tiles = {"sulfur_sulfurblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:sulfur',
	recipe = {
		{'tmm:sulfur', 'tmm:sulfur', 'tmm:sulfur'},
		{'tmm:sulfur', 'tmm:sulfur', 'tmm:sulfur'},
		{'tmm:sulfur', 'tmm:sulfur', 'tmm:sulfur'},
	}
})


minetest.register_craft({
	output = 'tmm:sulfur 9',
	recipe = {
		{'tmm:sulfur'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_sulfur",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -500,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_sulfur",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -5000,
})
minetest.register_node("tmm:stone_with_tantalum", {
	description = ("Tantalum Ore"),
	tiles = {"stone.png^tantalum_mineral_tantalum.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:tantalum 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:tantalum'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:tantalum'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:tantalum'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:tantalum", {
	description = ("Tantalum"),
	inventory_image = "tantalum.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_tantalum",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -400,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_tantalum",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -22000,
})
minetest.register_node("tmm:stone_with_tungsten", {
	description = ("Tungsten Ore"),
	tiles = {"stone.png^tungsten_mineral_tungsten.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:tungsten 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:tungsten'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:tungsten'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:tungsten'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:tungsten", {
	description = ("Tungsten"),
	inventory_image = "tungsten.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_tungsten",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -800,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_tungsten",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -30000,
})
minetest.register_node("tmm:stone_with_uran", {
	description = ("'Uran Ore"),
	tiles = {"stone.png^uran_mineral_uran.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:uran 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:uran'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:uran'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:uran'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})
minetest.register_craftitem("tmm:uran", {
	description = ("Uran"),
	inventory_image = "uran.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_uran",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -3000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_uran",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1800,
})

minetest.register_node("tmm:uranblock", {
	description = ("Uran Block"),
	tiles = {"uran_uranblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
	light_source = 90,
	damage_per_second = 5,
	
})


minetest.register_craft({
	output = 'tmm:uranblock',
	recipe = {
		{'tmm:berrylium', 'tmm:berrylium', 'tmm:berrylium'},
		{'tmm:berrylium', 'tmm:uran', 'tmm:berrylium'},
		{'tmm:berrylium', 'tmm:berrylium', 'tmm:berrylium'},
	}
})

minetest.register_node("tmm:stone_with_vanadium", {
	description = ("Vanadium Ore"),
	tiles = {"stone.png^vanadium_mineral_vanadium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:vanadium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:vanadium'},    --The 3rd drops with a 1/2 chance
				rarity = 1,
			},
			{
				items = {'tmm:vanadium'},    --The 4th drops with a 1/3 chance
				rarity = 1,
			},
			{
				items = {'tmm:vanadium'},    --The 5th drops with a 1/8 chance
				rarity = 1,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:vanadium", {
	description = ("Vanadium"),
	inventory_image = "vanadium.png",
})




-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_vanadium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -980,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_vanadium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -9888,
})
minetest.register_node("tmm:stone_with_yttrium", {
	description = ("Yttrium Ore"),
	tiles = {"stone.png^yttrium_mineral_yttrium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:yttrium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:yttrium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:yttrium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:yttrium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:yttrium", {
	description = ("Yttrium"),
	inventory_image = "yttrium.png",
})


minetest.register_node("tmm:yttriumblock", {
	description = ("Yttrium Block"),
	tiles = {"yttrium_yttriumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:yttrium',
	recipe = {
		{'tmm:yttrium', 'tmm:yttrium', 'tmm:yttrium'},
		{'tmm:yttrium', 'tmm:yttrium', 'tmm:yttrium'},
		{'tmm:yttrium', 'tmm:yttrium', 'tmm:yttrium'},
	}
})

-- Lapis Items from Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:yttrium 9',
	recipe = {
		{'tmm:yttrium'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_yttrium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -4000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_yttrium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -20001,
})
minetest.register_node("tmm:stone_with_platinum", {
	description = ("Platinum Ore"),
	tiles = {"stone.png^platinum_mineral_platinum.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:platinum 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:platinum'},    --The 3rd drops with a 1/2 chance
				rarity = 1,
			},
			{
				items = {'tmm:platinum'},    --The 4th drops with a 1/3 chance
				rarity = 1,
			},
			{
				items = {'tmm:platinum'},    --The 5th drops with a 1/8 chance
				rarity = 1,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:platinum", {
	description = ("Platinum"),
	inventory_image = "platinum.png",
})


minetest.register_node("tmm:platinumblock", {
	description = ("Platinum Block"),
	tiles = {"platinum_platinumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:platinum',
	recipe = {
		{'tmm:platinum', 'tmm:platinum', 'tmm:platinum'},
		{'tmm:platinum', 'tmm:platinum', 'tmm:platinum'},
		{'tmm:platinum', 'tmm:platinum', 'tmm:platinum'},
	}
})

-- Lapis Items from Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:platinum 9',
	recipe = {
		{'tmm:platinum'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_platinum",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -9876,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_platinum",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -12345,
})
minetest.register_node("tmm:stone_with_potassium", {
	description = ("Potassium Ore"),
	tiles = {"stone.png^potassium_mineral_potassium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:potassium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:potassium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:potassium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:potassium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:potassium", {
	description = ("Potassium"),
	inventory_image = "potassium.png",
})

-- Lapis Block
minetest.register_node("tmm:potassiumblock", {
	description = ("Potassium Block"),
	tiles = {"potassium_potassiumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

-- Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:potassium',
	recipe = {
		{'tmm:potassium', 'tmm:potassium', 'tmm:potassium'},
		{'tmm:germanium', 'tmm:potassium', 'tmm:potassium'},
		{'tmm:germanium', 'tmm:potassium', 'tmm:potassium'},
	}
})

-- Lapis Items from Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:potassium 9',
	recipe = {
		{'tmm:potassium'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_potassium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -89,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_potassium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -689,
})
minetest.register_node("tmm:stone_with_rhodium", {
	description = ("Rhodium Ore"),
	tiles = {"stone.png^rhodium_mineral_rhodium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:rhodium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:rhodium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:rhodium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:rhodium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})
minetest.register_craftitem("tmm:rhodium", {
	description = ("Rhodium"),
	inventory_image = "rhodium.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_rhodium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -2000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_rhodium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -30000,
})
minetest.register_node("tmm:stone_with_ruthenium", {
	description = ("Ruthenium Ore"),
	tiles = {"stone.png^ruthenium_mineral_ruthenium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:ruthenium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:ruthenium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:ruthenium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:ruthenium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})
minetest.register_craftitem("tmm:ruthenium", {
	description = ("Ruthenium"),
	inventory_image = "ruthenium.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_ruthenium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -700,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_ruthenium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -7111,
})
minetest.register_node("tmm:stone_with_palladium", {
	description = ("Palladium Ore"),
	tiles = {"stone.png^palladium_mineral_palladium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:palladium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:palladium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:palladium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:palladium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:palladium", {
	description = ("Palladium"),
	inventory_image = "palladium.png",
})


minetest.register_node("tmm:palladiumblock", {
	description = ("Palladium Block"),
	tiles = {"palladium_palladiumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:palladium',
	recipe = {
		{'tmm:palladium', 'tmm:palladium', 'tmm:palladium'},
		{'tmm:palladium', 'tmm:palladium', 'tmm:palladium'},
		{'tmm:palladium', 'tmm:palladium', 'tmm:palladium'},
	}
})

minetest.register_craft({
	output = 'tmm:palladium 9',
	recipe = {
		{'tmm:palladium'},
	}
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_palladium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -302,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_palladium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -3222,
})
minetest.register_node("tmm:stone_with_mercury", {
	description = ("Mercury Ore"),
	tiles = {"stone.png^mercury_mineral_mercury.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:mercury 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:mercury'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:mercury'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:mercury'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})
minetest.register_craftitem("tmm:mercury", {
	description = ("Mercury"),
	inventory_image = "mercury.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_mercury",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -3400,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_mercury",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -25000,
})

minetest.register_node("tmm:stone_with_notsilver", {
	description = ("Silver Ore"),
	tiles = {"stone.png^notsilver_mineral_notsilver.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:notsilver 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:notsilver'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:notsilver'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:notsilver'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:notsilver", {
	description = ("Silver"),
	inventory_image = "notsilver.png",
})


minetest.register_node("tmm:notsilverblock", {
	description = ("Silver Block"),
	tiles = {"notsilver_notsilverblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:notsilver',
	recipe = {
		{'tmm:notsilver', 'tmm:notsilver', 'tmm:notsilver'},
		{'tmm:notsilver', 'tmm:notsilver', 'tmm:notsilver'},
		{'tmm:notsilver', 'tmm:notsilver', 'norsilver:notsilver'},
	}
})


minetest.register_craft({
	output = 'tmm:notsilver 9',
	recipe = {
		{'tmm:notsilver'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_notsilver",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -700,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_notsilver",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1000,
})
minetest.register_node("tmm:stone_with_gallium", {
	description = ("Gallium Ore"),
	tiles = {"stone.png^gallium_mineral_gallium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:gallium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:gallium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:gallium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:gallium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:gallium", {
	description = ("Gallium"),
	inventory_image = "gallium.png",
})


minetest.register_node("tmm:galliumblock", {
	description = ("Gallium Block"),
	tiles = {"gallium_galliumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:gallium',
	recipe = {
		{'tmm:gallium', 'tmm:gallium', 'tmm:gallium'},
		{'tmm:gallium', 'tmm:gallium', 'tmm:gallium'},
		{'tmm:gallium', 'tmm:gallium', 'tmm:gallium'},
	}
})

-- Lapis Items from Lapis Block Crafting
minetest.register_craft({
	output = 'tmm:gallium 9',
	recipe = {
		{'tmm:gallium'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_gallium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -230,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_gallium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -3400,
})
minetest.register_node("tmm:stone_with_molybdenum", {
	description = ("Molybdenum Ore"),
	tiles = {"stone.png^molybdenum_mineral_molybdenum.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:molybdenum 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:molybdenum'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:molybdenum'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:molybdenum'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:molybdenum", {
	description = ("Molybdenum"),
	inventory_image = "molybdenum.png",
})

-- Lapis Block
minetest.register_node("tmm:molybdenumblock", {
	description = ("Molybdenum Block"),
	tiles = {"molybdenum_molybdenumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:molybdenum',
	recipe = {
		{'tmm:molybdenum', 'tmm:molybdenum', 'tmm:molybdenum'},
		{'tmm:molybdenum', 'tmm:molybdenum', 'tmm:molybdenum'},
		{'tmm:molybdenum', 'tmm:molybdenum', 'tmm:molybdenum'},
	}
})

minetest.register_craft({
	output = 'tmm:molybdenum 9',
	recipe = {
		{'tmm:molybdenum'},
	}
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_molybdenum",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -560,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_molybdenum",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -3400,
})
minetest.register_node("tmm:stone_with_indium", {
	description = ("Indium Ore"),
	tiles = {"stone.png^indium_mineral_indium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:indium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:indium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:indium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:indium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:indium", {
	description = ("Indium"),
	inventory_image = "indium.png",
})




minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_indium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -340,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_indium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -4500,
})
minetest.register_node("tmm:stone_with_iridium", {
	description = ("Iridium Ore"),
	tiles = {"stone.png^iridium_mineral_iridium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:iridium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:iridium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:iridium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:iridium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})
minetest.register_craftitem("tmm:iridium", {
	description = ("Iridium"),
	inventory_image = "iridium.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_iridium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -460,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_iridium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -5670,
})
minetest.register_node("tmm:stone_with_lead", {
	description = ("Lead Ore"),
	tiles = {"ta_base_stone.png^lead_mineral_lead.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:lead 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:lead'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:lead'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:lead'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:lead", {
	description = ("Lead"),
	inventory_image = "lead.png",
})


minetest.register_node("tmm:leadblock", {
	description = ("Lead Block"),
	tiles = {"lead_leadblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:lead',
	recipe = {
		{'tmm:lead', 'tmm:lead', 'tmm:lead'},
		{'tmm:lead', 'tmm:lead', 'tmm:lead'},
		{'tmm:lead', 'tmm:lead', 'tmm:lead'},
	}
})

minetest.register_craft({
	output = 'tmm:lead 9',
	recipe = {
		{'tmm:lead'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_lead",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -234,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_lead",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1234,
})
minetest.register_node("tmm:stone_with_lithium", {
	description = ("Lithium Ore"),
	tiles = {"stone.png^lithium_mineral_lithium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:lithium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:lithium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:lithium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:lithium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:lithium", {
	description = ("Lithium"),
	inventory_image = "lithium.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_lithium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -1200,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_lithium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -2290,
})
minetest.register_node("tmm:stone_with_magnesium", {
	description = ("Magnesium Ore"),
	tiles = {"stone.png^magnesium_mineral_magnesium.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:magnesium 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:magnesium'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:magnesium'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:magnesium'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

-- Lapis Item
minetest.register_craftitem("tmm:magnesium", {
	description = ("Magnesium"),
	inventory_image = "magnesium.png",
})

-- Lapis Block
minetest.register_node("tmm:magnesiumblock", {
	description = ("Magnesium Block"),
	tiles = {"magnesium_magnesiumblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

minetest.register_craft({
	output = 'tmm:magnesium',
	recipe = {
		{'tmm:magnesium', 'tmm:magnesium', 'tmm:magnesium'},
		{'tmm:magnesium', 'tmm:magnesium', 'tmm:magnesium'},
		{'tmm:magnesium', 'tmm:magnesium', 'tmm:magnesium'},
	}
})


minetest.register_craft({
	output = 'tmm:magnesium 9',
	recipe = {
		{'tmm:magnesium'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_magnesium",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -790,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_magnesium",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -3400,
})
minetest.register_node("tmm:stone_with_manganese", {
	description = ("Manganese Ore"),
	tiles = {"stone.png^manganese_mineral_manganese.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:manganese 2'},  --The first and second drops ever
			},
			{
				items = {'tmm:manganese'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'tmm:manganese'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'tmm:manganese'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sound = {},
})

minetest.register_craftitem("tmm:manganese", {
	description = ("Manganese"),
	inventory_image = "manganese.png",
})




minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_manganese",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -450,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_manganese",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -4300,
})
-- tools
minetest.override_item("", {
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

--
-- Picks
--


minetest.register_tool("tmm:pick_germanium", {
	description = ("Germanium Pickaxe"),
	inventory_image = "default_tool_steelpick.png^[brighten",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {},
	groups = {pickaxe = 1}
})

minetest.register_tool("tmm:pick_zinc", {
	description = ("Zinc Pickaxe"),
	inventory_image = "default_tool_steelpick.png^[colorize:blue:50",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.50, [2]=1.50, [3]=0.70}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {},
	groups = {pickaxe = 1}
})


minetest.register_tool("tmm:pick_nickel", {
	description = ("Nickel Pickaxe"),
	inventory_image = "default_tool_steelpick.png^[colorize:red:50",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.50, [2]=1.20, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {},
	groups = {pickaxe = 1}
})

minetest.register_tool("tmm:pick_coblat", {
	description = ("Cobalt Pickaxe"),
	inventory_image = "default_tool_steelpick.png^[colorize:green:50",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {},
	groups = {pickaxe = 1}
})

--
-- Shovels
--


minetest.register_tool("tmm:shovel_germanium", {
	description = ("Germanium Shovel"),
	inventory_image = "default_tool_steelshovel.png^[brighten",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {},
	groups = {shovel = 1}
})

minetest.register_tool("tmm:shovel_zinc", {
	description = ("Zinc Shovel"),
	inventory_image = "default_tool_steelshovel.png^[colorize:blue:50",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.30, [2]=0.80, [3]=0.30}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {},
	groups = {shovel = 1}
})

minetest.register_tool("tmm:shovel_nickel", {
	description = ("Nickel Shovel"),
	inventory_image = "default_tool_steelshovel.png^[colorize:red:50",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.20}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {},
	groups = {shovel = 1}
})

minetest.register_tool("tmm:shovel_cobalt", {
	description = ("Cobalt Shovel"),
	inventory_image = "default_tool_steelshovel.png^[colorize:green:50",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.20}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {},
	groups = {shovel = 1}
})

--
-- Axes
--


minetest.register_tool("tmm:axe_germanium", {
	description = ("Germanium Axe"),
	inventory_image = "default_tool_steelaxe.png^[brighten",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.30, [2]=1.30, [3]=0.90}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {},
	groups = {axe = 1}
})

minetest.register_tool("tmm:axe_zinc", {
	description = ("Zinc Axe"),
	inventory_image = "default_tool_steelaxe.png^[colorize:blue:50",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=1.20, [3]=0.80}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {},
	groups = {axe = 1}
})


minetest.register_tool("tmm:axe_nickel", {
	description = ("Nickel Axe"),
	inventory_image = "default_tool_steelaxe.png^[colorize:red:50",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.00, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {},
	groups = {axe = 1}
})

minetest.register_tool("tmm:axe_cobalt", {
	description = ("Cobalt Axe"),
	inventory_image = "default_tool_steelaxe.png^[colorize:green:50",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.90, [2]=0.90, [3]=0.50}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {},
	groups = {axe = 1}
})

--
-- Swords
--


minetest.register_tool("tmm:sword_germanium", {
	description = ("Germanium Sword"),
	inventory_image = "default_tool_steelsword.png^[brighten",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {},
	groups = {sword = 1}
})

minetest.register_tool("tmm:sword_zinc", {
	description = ("Zinc Sword"),
	inventory_image = "default_tool_steelsword.png^[colorize:blue:50",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {},
	groups = {sword = 1}
})


minetest.register_tool("tmm:sword_nickel", {
	description = ("Nickel Sword"),
	inventory_image = "default_tool_steelsword.png^[colorize:red:50",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {},
	groups = {sword = 1}
})

minetest.register_tool("tmm:sword_cobalt", {
	description = ("Cobalt Sword"),
	inventory_image = "default_tool_steelsword.png^[colorize:green:50",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {},
	groups = {sword = 1}
})

--
-- Register Craft Recipies
--

local craft_ingreds = {
	germanium = "tmm:germanium",
	nickel = "tmm:nickel",
	cobalt = "tmm:cobalt",
	zinc = "tmm:zinc"
}

for name, mat in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "tmm:pick_".. name,
		recipe = {
			{mat, mat, mat},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})

	minetest.register_craft({
		output = "tmm:shovel_".. name,
		recipe = {
			{mat},
			{"group:stick"},
			{"group:stick"}
		}
	})

	minetest.register_craft({
		output = "tmm:axe_".. name,
		recipe = {
			{mat, mat},
			{mat, "group:stick"},
			{"", "group:stick"}
		}
	})

	minetest.register_craft({
		output = "tmm:sword_".. name,
		recipe = {
			{mat},
			{mat},
			{"group:stick"}
		}
	})
end
-- germanium
minetest.register_node("tmm:stone_with_germanium", {
	description = ("Germanium Ore"),
	tiles = {"stone.png^(default_mineral_tin.png^[brighten)"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:germanium 2'},  
			},
			{
				items = {'tmm:germanium'},    
				rarity = 2,
			},
			{
				items = {'tmm:germanium'},   
				rarity = 2,
			},
			{
				items = {'tmm:germanium'},    
				rarity = 1,
			},
		}
	},
	sound = {},
})

-- germanium Item
minetest.register_craftitem("tmm:germanium", {
	description = ("Germanium"),
	inventory_image = "default_steel_ingot.png^[brighten",
})

-- germanium Block
minetest.register_node("tmm:germaniumblock", {
	description = ("Germanium Block"),
	tiles = {"default_steel_block.png^[brighten"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

-- germanium Block Crafting
minetest.register_craft({
	output = 'tmm:germaniumblock',
	recipe = {
		{'tmm:germanium', 'tmm:germanium', 'tmm:germanium'},
		{'tmm:germanium', 'tmm:germanium', 'tmm:germanium'},
		{'tmm:germanium', 'tmm:germanium', 'tmm:germanium'},
	}
})

-- germanium Items from germanium Block Crafting
minetest.register_craft({
	output = 'tmm:germanium 9',
	recipe = {
		{'tmm:germaniumblock'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_germanium",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = 31000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_germanium",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = 31000,
})

-- nickel
minetest.register_node("tmm:stone_with_nickel", {
	description = ("Nickel Ore"),
	tiles = {"default_stone.png^(default_mineral_tin.png^[colorize:red:50)"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:nickel 2'},  
			},
			{
				items = {'tmm:nickel'},    
				rarity = 2,
			},
			{
				items = {'tmm:nickel'},   
				rarity = 2,
			},
			{
				items = {'tmm:nickel'},    
				rarity = 1,
			},
		}
	},
	sound = {},
})

-- germanium Item
minetest.register_craftitem("tmm:nickel", {
	description = ("Nickel"),
	inventory_image = "default_steel_ingot.png^[colorize:red:50",
})

-- germanium Block
minetest.register_node("tmm:nickelblock", {
	description = ("Nickel Block"),
	tiles = {"default_stone.png^(default_mineral_tin.png^[colorize:blue:50)"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

-- germanium Block Crafting
minetest.register_craft({
	output = 'tmm:nickelblock',
	recipe = {
		{'tmm:nickel', 'tmm:nickel', 'tmm:nickel'},
		{'tmm:nickel', 'tmm:nickel', 'tmm:nickel'},
		{'tmm:nickel', 'tmm:nickel', 'tmm:nickel'},
	}
})

-- germanium Items from germanium Block Crafting
minetest.register_craft({
	output = 'tmm:nickel 9',
	recipe = {
		{'tmm:nickelblock'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_nickel",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -100,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_nickel",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -200,
})

-- cobalt
minetest.register_node("tmm:stone_with_cobalt", {
	description = ("Cobalt Ore"),
	tiles = {"stone.png^(default_mineral_tin.png^[colorize:green:50)"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:cobalt 2'},  
			},
			{
				items = {'tmm:cobalt'},    
				rarity = 2,
			},
			{
				items = {'tmm:cobalt'},   
				rarity = 2,
			},
			{
				items = {'tmm:cobalt'},    
				rarity = 1,
			},
		}
	},
	sound = {},
})

-- germanium Item
minetest.register_craftitem("tmm:cobalt", {
	description = ("Cobalt"),
	inventory_image = "default_steel_ingot.png^[colorize:green:50",
})

-- germanium Block
minetest.register_node("tmm:cobaltblock", {
	description = ("Cobalt Block"),
	tiles = {"default_steel_block.png^[colorize:green:50"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

-- germanium Block Crafting
minetest.register_craft({
	output = 'tmm:cobaltblock',
	recipe = {
		{'tmm:cobalt', 'tmm:cobalt', 'tmm:cobalt'},
		{'tmm:cobalt', 'tmm:cobalt', 'tmm:cobalt'},
		{'tmm:cobalt', 'tmm:cobalt', 'tmm:cobalt'},
	}
})

-- germanium Items from germanium Block Crafting
minetest.register_craft({
	output = 'tmm:cobalt 9',
	recipe = {
		{'tmm:cobaltblock'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_cobalt",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -300,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_cobalt",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -500,
})

--zinc
minetest.register_node("tmm:stone_with_zinc", {
	description = ("Zinc Ore"),
	tiles = {"stone.png^(default_mineral_tin.png^[colorize:blue:50)"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'tmm:zinc 2'},  
			},
			{
				items = {'tmm:zinc'},    
				rarity = 2,
			},
			{
				items = {'tmm:zinc'},   
				rarity = 2,
			},
			{
				items = {'tmm:zinc'},    
				rarity = 1,
			},
		}
	},
	sound = {},
})


minetest.register_craftitem("tmm:zinc", {
	description = ("Zinc"),
	inventory_image = "default_steel_ingot.png^[colorize:blue:50",
})

minetest.register_node("tmm:zincblock", {
	description = ("Zinc Block"),
	tiles = {"default_steel_block.png^[colorize:blue:50"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})

minetest.register_craft({
	output = 'tmm:zincblock',
	recipe = {
		{'tmm:zinc', 'tmm:zinc', 'tmm:zinc'},
		{'tmm:zinc', 'tmm:zinc', 'tmm:zinc'},
		{'tmm:zinc', 'tmm:zinc', 'tmm:zinc'},
	}
})


minetest.register_craft({
	output = 'tmm:zinc 9',
	recipe = {
		{'tmm:zincblock'},
	}
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_zinc",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -200,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "tmm:stone_with_zinc",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -100,
})


minetest.register_node("tmm:sandproducerblock", {
	description = ("Sand Producer Block"),
	tiles = {"sand.png^tmm_producer.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:sandproducerblock',
	recipe = {
		{'tmm:alu', 'nickel:alu', 'tmm:alu'},
		{'tmm:alu', 'default:sand', 'tmm:alu'},
		{'tmm:alu', 'nickel:alu', 'tmm:alu'},
	}
})
minetest.register_abm({
	label = 'sandproducer',
	nodenames = {'tmm:sandproducerblock'},
	interval = 1,
	chance = 1,
	action = function(pos)
	pos.y = pos.y + 1
	minetest.add_node(pos, {name = 'ta_base:sand'})
	end,
})

minetest.register_node("tmm:dirtproducerblock", {
	description = ("Dirt Producer Block"),
	tiles = {"dirt.png^tmm_producer.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})


minetest.register_craft({
	output = 'tmm:dirtproducerblock',
	recipe = {
		{'tmm:alu', 'nickel:alu', 'tmm:alu'},
		{'tmm:alu', 'ta_base:dirt', 'tmm:alu'},
		{'tmm:alu', 'nickel:alu', 'tmm:alu'},
	}
})
minetest.register_abm({
	label = 'dirtproducer',
	nodenames = {'tmm:dirtproducerblock'},
	interval = 1,
	chance = 1,
	action = function(pos)
	pos.y = pos.y + 1
	minetest.add_node(pos, {name = 'ta_base:dirt'})
	end,
})
--ultimate metal
minetest.register_craftitem("tmm:ultimate_metal_shard_1", {
	description = ("Ultimate Metal Shard 1"),
	inventory_image = "tmm_ultimate_metal_shard.png",
})
minetest.register_craft({
	output = 'tmm:ultimate_metal_shard_1',
	recipe = {
		{'tmm:alu', 'nickel:berrylium', 'tmm:bismuth'},
		{'tmm:boron', 'tmm:cadium', 'tmm:zirconium'},
		{'tmm:antimony', 'nickel:arsenic', 'tmm:tellurium'},
	}
})
minetest.register_craftitem("tmm:ultimate_metal_shard_2", {
	description = ("Ultimate Metal Shard 2"),
	inventory_image = "tmm_ultimate_metal_shard.png",
})
minetest.register_craft({
	output = 'tmm:ultimate_metal_shard_2',
	recipe = {
		{'tmm:thallium', 'nickel:sodium', 'tmm:strontium'},
		{'tmm:tantalum', 'tmm:tungsten', 'tmm:uran'},
		{'tmm:vanadium', 'nickel:yttrium', 'tmm:platinum'},
	}
})
minetest.register_craftitem("tmm:ultimate_metal_shard_3", {
	description = ("Ultimate Metal Shard 3"),
	inventory_image = "tmm_ultimate_metal_shard.png",
})
minetest.register_craft({
	output = 'tmm:ultimate_metal_shard_3',
	recipe = {
		{'tmm:potassium', 'nickel:rhodium', 'tmm:ruthenium'},
		{'tmm:palladium', 'tmm:mercury', 'tmm:notsilver'},
		{'tmm:gallium', 'nickel:molybdenum', 'tmm:indium'},
	}
})
minetest.register_craftitem("tmm:ultimate_metal_shard_4", {
	description = ("Ultimate Metal Shard 4"),
	inventory_image = "tmm_ultimate_metal_shard.png",
})
minetest.register_craft({
	output = 'tmm:ultimate_metal_shard_4',
	recipe = {
		{'tmm:iridium', 'nickel:lead', 'tmm:zinc'},
		{'tmm:lithium', 'tmm:magnesium', 'tmm:manganese'},
		{'tmm:germanium', 'nickel:cobalt', 'tmm:nickel'},
	}
})
minetest.register_node("tmm:ultimate_metal_block", {
	description = ("Ultimate Metal Block"),
	tiles = {"ultimate_metal_block.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sound = {},
})
minetest.register_craft({
	output = 'tmm:ultimate_metal_block',
	recipe = {
		{'tmm:ultimate_metal_shard_1', 'nickel:ultimate_metal_shard_2', ''},
		{'tmm:ultimate_metal_shard_3', 'tmm:ultimate_metal_shard_4', ''},
		{'', '', ''},
	}
})


