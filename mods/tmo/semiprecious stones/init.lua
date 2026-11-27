
minetest.register_node("semistone:stone_with_achat", {
	description = ("Achat Ore"),
	tiles = {"stone.png^achat_mineral_achat.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'semistone:achat 2'},  --The first and second drops ever
			},
			{
				items = {'semistone:achat'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'semistone:achat'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'semistone:achat'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})

minetest.register_craftitem("semistone:achat", {
	description = ("Achat"),
	inventory_image = "achat.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_achat",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = 31000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_achat",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -300,
})

minetest.register_node("semistone:stone_with_angelite", {
	description = ("angelite Ore"),
	tiles = {"stone.png^angelite_mineral_angelite.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'semistone:angelite 2'},  --The first and second drops ever
			},
			{
				items = {'semistone:angelite'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'semistone:angelite'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'semistone:angelite'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})

minetest.register_craftitem("semistone:angelite", {
	description = ("angelite"),
	inventory_image = "angelite.png",
})

-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_angelite",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = 10,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_angelite",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -300,
})
minetest.register_node("semistone:stone_with_apatite", {
	description = ("Apatite Ore"),
	tiles = {"stone.png^apatite_mineral_apatite.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'semistone:apatite 2'},  --The first and second drops ever
			},
			{
				items = {'semistone:apatite'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'semistone:apatite'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'semistone:apatite'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})

minetest.register_craftitem("semistone:apatite", {
	description = ("Apatite"),
	inventory_image = "apatite.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_apatite",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = 31000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_apatite",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1000,
})
minetest.register_node("semistone:stone_with_azurite", {
	description = ("Azurite Ore"),
	tiles = {"stone.png^azurite_mineral_azurite.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'semistone:azurite 2'},  --The first and second drops ever
			},
			{
				items = {'semistone:azurite'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'semistone:azurite'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'semistone:azurite'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})


minetest.register_craftitem("semistone:azurite", {
	description = ("Azurite"),
	inventory_image = "azurite.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_azurite",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = 31000,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_azurite",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -5000,
})
minetest.register_node("semistone:stone_with_calcite", {
	description = ("Calcite Ore"),
	tiles = {"stone.png^calcite_mineral_calcite.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'semistone:calcite 2'},  --The first and second drops ever
			},
			{
				items = {'semistone:calcite'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'semistone:calcite'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'semistone:calcite'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})


minetest.register_craftitem("semistone:calcite", {
	description = ("Calcite"),
	inventory_image = "calcite.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_calcite",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = 3100,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_calcite",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -200,
})
minetest.register_node("semistone:stone_with_rosequarz", {
	description = ("Rosequarz Ore"),
	tiles = {"stone.png^rosequarz_mineral_rosequarz.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'semistone:rosequarz 2'},  --The first and second drops ever
			},
			{
				items = {'semistone:rosequarz'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'semistone:rosequarz'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'semistone:rosequarz'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})

minetest.register_craftitem("semistone:rosequarz", {
	description = ("Rosequarz"),
	inventory_image = "rosequarz.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "semistone:stone_with_rosequarz",
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
	ore            = "semistone:stone_with_rosequarz",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -4000,
})
minetest.register_node("semistone:rosequarzblock", {
	description = ("Rosequarz Block"),
	tiles = {"rosequarzblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sounds = {},
})


minetest.register_craft({
	output = 'semistone:rosequarzblock',
	recipe = {
		{'semistone:rosequarz', 'semistone:rosequarz', 'semistone:rosequarz'},
		{'semistone:rosequarz', 'semistone:rosequarz', 'semistone:rosequarz'},
		{'semistone:rosequarz', 'semistone:rosequarz', 'semistone:rosequarz'},
	}
})
--armor
minetest.register_tool('semistone:helmet_rosequarz', {
	description = 'Rosequarz Helmet',
	inventory_image = 'rosequarz_inv_helmet_rosequarz.png',
	groups = {armor_head=25, armor_heal=10, armor_use=120, armor_fire=1},
	wear = 0,
})
minetest.register_tool('semistone:chestplate_rosequarz', {
	description = 'Rosequarz Chestplate',
	inventory_image = 'rosequarz_inv_chestplate_rosequarz.png',
	groups = {armor_torso=35, armor_heal=20, armor_use=120, armor_fire=1},
	wear = 0,
})
minetest.register_tool('semistone:leggings_rosequarz', {
	description = 'rosequarz Leggings',
	inventory_image = 'rosequarz_inv_leggings_rosequarz.png',
	groups = {armor_legs=25, armor_heal=10, armor_use=120, armor_fire=1},
	wear = 0,
})
minetest.register_tool('semistone:boots_rosequarz', {
	description = 'Rosequarz Boots',
	inventory_image = 'rosequarz_inv_boots_rosequarz.png',
	groups = {armor_feet=25, armor_heal=8, armor_use=230, physics_speed=1, physics_jump=0.4, armor_fire=1},
	wear = 0,
})
--crafts
minetest.register_craft({
	output = 'semistone:helmet_rosequarz',
	recipe = {
		{'semistone:rosequarzblock', 'semistone:rosequarzblock', 'semistone:rosequarzblock'},
		{'semistone:rosequarzblock', '', 'semistone:rosequarzblock'},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'semistone:chestplate_rosequarz',
	recipe = {
		{'semistone:rosequarzblock', '', 'semistone:rosequarzblock'},
		{'semistone:rosequarzblock', 'semistone:rosequarzblock', 'semistone:rosequarzblock'},
		{'semistone:rosequarzblock', 'semistone:rosequarzblock', 'semistone:rosequarzblock'},
	}
})
minetest.register_craft({
	output = 'semistone:leggings_rosequarz',
	recipe = {
		{'semistone:rosequarzblock', 'semistone:rosequarzblock', 'semistone:rosequarzblock'},
		{'semistone:rosequarzblock', '', 'semistone:rosequarzblock'},
		{'semistone:rosequarzblock', '', 'semistone:rosequarzblock'},
	}
})
minetest.register_craft({
	output = 'semistone:boots_rosequarz',
	recipe = {
		{'', '', ''},
		{'semistone:rosequarzblock', '', 'semistone:rosequarzblock'},
		{'semistone:rosequarzblock', '', 'semistone:rosequarzblock'},
	}
})
--other armor
minetest.register_craftitem("semistone:combined_cristals", {
	description = ("Combined Cristals"),
	inventory_image = "combined_cristals.png",
})
minetest.register_craft({
	output = 'semistone:combined_cristals',
	recipe = {
		{'semistone:angelite', 'semistone:apatite', 'semistone:calcite'},
		{'semistone:azurite', '', ''},
		{'', '', ''},
	}
})
minetest.register_tool('semistone:helmet_combined_cristals', {
	description = 'Combined Cristals Helmet',
	inventory_image = 'combined_cristals_inv_helmet_combined_cristals.png',
	groups = {armor_head=20, armor_heal=2, armor_use=110, armor_fire=1},
	wear = 0,
})
minetest.register_tool('semistone:chestplate_combined_cristals', {
	description = 'Combined Cristals Chestplate',
	inventory_image = 'combined_cristals_inv_chestplate_combined_cristals.png',
	groups = {armor_torso=45, armor_heal=2, armor_use=120, armor_fire=1},
	wear = 0,
})
minetest.register_tool('semistone:leggings_combined_cristals', {
	description = 'Combined Cristals Leggings',
	inventory_image = 'combined_cristals_inv_leggings_combined_cristals.png',
	groups = {armor_legs=20, armor_heal=1, armor_use=100, armor_fire=1},
	wear = 0,
})
minetest.register_tool('semistone:boots_combined_cristals', {
	description = 'Combined Cristals Boots',
	inventory_image = 'combined_cristals_inv_boots_combined_cristals.png',
	groups = {armor_feet=20, armor_heal=2, armor_use=130, physics_speed=1, armor_fire=1},
	wear = 0,
})
--crafts
minetest.register_craft({
	output = 'semistone:helmet_combined_cristals',
	recipe = {
		{'semistone:combined_cristals', 'semistone:combined_cristals', 'semistone:combined_cristals'},
		{'semistone:combined_cristals', '', 'semistone:combined_cristals'},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'semistone:chestplate_combined_cristals',
	recipe = {
		{'semistone:combined_cristals', '', 'semistone:combined_cristals'},
		{'semistone:combined_cristals', 'semistone:combined_cristals', 'semistone:combined_cristals'},
		{'semistone:combined_cristals', 'semistone:combined_cristals', 'semistone:combined_cristals'},
	}
})
minetest.register_craft({
	output = 'semistone:leggings_combined_cristals',
	recipe = {
		{'semistone:combined_cristals', 'semistone:combined_cristals', 'semistone:combined_cristals'},
		{'semistone:combined_cristals', '', 'semistone:combined_cristals'},
		{'semistone:combined_cristals', '', 'semistone:combined_cristals'},
	}
})
minetest.register_craft({
	output = 'semistone:boots_combined_cristals',
	recipe = {
		{'', '', ''},
		{'semistone:combined_cristals', '', 'semistone:combined_cristals'},
		{'semistone:combined_cristals', '', 'semistone:combined_cristals'},
	}
})