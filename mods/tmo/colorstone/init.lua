
--colorstone
minetest.register_node("colorstone:colorstoneblock", {
	description = ("Colorstone"),
	tiles = {"colorstone_colorstoneblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sounds = {},
})


minetest.register_craft({
	output = 'colorstone:colorstoneblock',
	recipe = {
		{'colorstone:purplestone', 'colorstone:greenstone', 'colorstone:yellowstone'},
		{'colorstone:bluestone', 'colorstone:redstone', 'colorstone:orangestone'},
		{'', '', ''},
	}
})
--orange
minetest.register_node("colorstone:stone_with_orangestone", {
	description = ("Orangestone Ore"),
	tiles = {"stone.png^orangestone_mineral_orangestone.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'colorstone:orangestone 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:orangestone'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:orangestone'},    --The 4th drops with a 1/3 chance
				rarity = 3,
			},
			{
				items = {'colorstone:orangestone'},    --The 5th drops with a 1/8 chance
				rarity = 8,
			},
		}
	},
	sounds = {},
})

-- Lapis Item
minetest.register_craftitem("colorstone:orangestone", {
	description = ("Orangestone"),
	inventory_image = "orangestone_orangestone.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_orangestone",
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
	ore            = "colorstone:stone_with_orangestone",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -3,
	height_max     = -300,
})
--red
minetest.register_node("colorstone:stone_with_redstone", {
	description = ("Redstone Ore"),
	tiles = {"stone.png^redstone_mineral_redstone.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'colorstone:redstone 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:redstone'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:redstone'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'colorstone:redstone'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})


minetest.register_craftitem("colorstone:redstone", {
	description = ("Redstone"),
	inventory_image = "redstone.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_redstone",
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
	ore            = "colorstone:stone_with_redstone",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31,
	height_max     = -500,
})	
--yellow
minetest.register_node("colorstone:stone_with_yellowstone", {
	description = ("Yellowstone Ore"),
	tiles = {"stone.png^yellowstone_mineral_yellowstone.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'colorstone:yellowstone 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:yellowstone'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:yellowstone'},    --The 4th drops with a 1/3 chance
				rarity = 3,
			},
			{
				items = {'colorstone:yellowstone'},    --The 5th drops with a 1/8 chance
				rarity = 8,
			},
		}
	},
	sounds = {},
})

-- Lapis Item
minetest.register_craftitem("colorstone:yellowstone", {
	description = ("Yellowstone"),
	inventory_image = "yellowstone_yellowstone.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_yellowstone",
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
	ore            = "colorstone:stone_with_yellowstone",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -400,
})
--blue
minetest.register_node("colorstone:stone_with_bluestone", {
	description = ("Bluestone Ore"),
	tiles = {"stone.png^bluestone_mineral_bluestone.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'colorstone:bluestone 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:bluestone'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:bluestone'},    --The 4th drops with a 1/3 chance
				rarity = 3,
			},
			{
				items = {'colorstone:bluestone'},    --The 5th drops with a 1/8 chance
				rarity = 8,
			},
		}
	},
	sounds = {},
})

-- Lapis Item
minetest.register_craftitem("colorstone:bluestone", {
	description = ("Bluestone"),
	inventory_image = "bluestone_bluestone.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_bluestone",
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
	ore            = "colorstone:stone_with_bluestone",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -500,
})
--purple
minetest.register_node("colorstone:stone_with_purplestone", {
	description = ("Purplestone Ore"),
	tiles = {"stone.png^purplestone_mineral_purplestone.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'colorstone:purplestone 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:purplestone'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:purplestone'},    --The 4th drops with a 1/3 chance
				rarity = 3,
			},
			{
				items = {'colorstone:purplestone'},    --The 5th drops with a 1/8 chance
				rarity = 8,
			},
		}
	},
	sounds = {},
})

-- Lapis Item
minetest.register_craftitem("colorstone:purplestone", {
	description = ("Purplestone"),
	inventory_image = "purplestone_purplestone.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_purplestone",
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
	ore            = "colorstone:stone_with_purplestone",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -200,
})
--green
minetest.register_node("colorstone:stone_with_greenstone", {
	description = ("Greenstone Ore"),
	tiles = {"stone.png^greenstone_mineral_greenstone.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 5,
		items = {
			{
				items = {'colorstone:greenstone 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:greenstone'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:greenstone'},    --The 4th drops with a 1/3 chance
				rarity = 3,
			},
			{
				items = {'colorstone:greenstone'},    --The 5th drops with a 1/8 chance
				rarity = 8,
			},
		}
	},
	sounds = {},
})

-- Lapis Item
minetest.register_craftitem("colorstone:greenstone", {
	description = ("Greenstone"),
	inventory_image = "greenstone_greenstone.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_greenstone",
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
	ore            = "colorstone:stone_with_greenstone",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1000,
})
--armor
minetest.register_tool('colorstone:helmet_colorstone', {
	description = 'Colorstone Helmet',
	inventory_image = 'colorstone_inv_helmet_colorstone.png',
	groups = {armor_head=15, armor_heal=2, armor_use=80, armor_fire=1},
	wear = 0,
})
minetest.register_tool('colorstone:chestplate_colorstone', {
	description = 'Colorstone Chestplate',
	inventory_image = 'colorstone_inv_chestplate_colorstone.png',
	groups = {armor_torso=25, armor_heal=2, armor_use=80, armor_fire=1},
	wear = 0,
})
minetest.register_tool('colorstone:leggings_colorstone', {
	description = 'Colorstone Leggings',
	inventory_image = 'colorstone_inv_leggings_colorstone.png',
	groups = {armor_legs=20, armor_heal=2, armor_use=80, armor_fire=1},
	wear = 0,
})
minetest.register_tool('colorstone:boots_colorstone', {
	description = 'Colorstone Boots',
	inventory_image = 'colorstone_inv_boots_colorstone.png',
	groups = {armor_feet=15, armor_heal=2, armor_use=80, physics_speed=1, physics_jump=0.2, armor_fire=1},
	wear = 0,
})
--armor troll

minetest.register_tool('colorstone:helmet_troll', {
	description = 'Troll Helmet',
	inventory_image = 'colorstone_inv_helmet_troll.png',
	groups = {armor_head=10, armor_heal=1, armor_use=100, armor_fire=1},
	wear = 0,
})
minetest.register_tool('colorstone:chestplate_troll', {
	description = 'Troll Chestplate',
	inventory_image = 'colorstone_inv_chestplate_troll.png',
	groups = {armor_torso=40, armor_heal=1, armor_use=100, armor_fire=1},
	wear = 0,
})
minetest.register_tool('colorstone:leggings_troll', {
	description = 'Troll Leggings',
	inventory_image = 'colorstone_inv_leggings_troll.png',
	groups = {armor_legs=15, armor_heal=1, armor_use=100, armor_fire=1},
	wear = 0,
})
minetest.register_tool('colorstone:boots_troll', {
	description = 'Troll Boots',
	inventory_image = 'colorstone_inv_boots_troll.png',
	groups = {armor_feet=20, armor_heal=1, armor_use=100, physics_speed=1, physics_jump=0.8, armor_fire=1},
	wear = 0,
})

--crafts

minetest.register_craft({
	output = 'colorstone:helmet_colorstone',
	recipe = {
		{'colorstone:colorstoneblock', 'colorstone:colorstoneblock', 'colorstone:colorstoneblock'},
		{'colorstone:colorstoneblock', '', 'colorstone:colorstoneblock'},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'colorstone:chestplate_colorstone',
	recipe = {
		{'colorstone:colorstoneblock', '', 'colorstone:colorstoneblock'},
		{'colorstone:colorstoneblock', 'colorstone:colorstoneblock', 'colorstone:colorstoneblock'},
		{'colorstone:colorstoneblock', 'colorstone:colorstoneblock', 'colorstone:colorstoneblock'},
	}
})
minetest.register_craft({
	output = 'colorstone:leggings_colorstone',
	recipe = {
		{'colorstone:colorstoneblock', 'colorstone:colorstoneblock', 'colorstone:colorstoneblock'},
		{'colorstone:colorstoneblock', '', 'colorstone:colorstoneblock'},
		{'colorstone:colorstoneblock', '', 'colorstone:colorstoneblock'},
	}
})
minetest.register_craft({
	output = 'colorstone:boots_colorstone',
	recipe = {
		{'', '', ''},
		{'colorstone:colorstoneblock', '', 'colorstone:colorstoneblock'},
		{'colorstone:colorstoneblock', '', 'colorstone:colorstoneblock'},
	}
})
minetest.register_craft({
	output = 'colorstone:helmet_troll',
	recipe = {
		{'colorstone:trollblock', 'colorstone:trollblock', 'colorstone:trollblock'},
		{'colorstone:trollblock', '', 'colorstone:trollblock'},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'colorstone:chestplate_troll',
	recipe = {
		{'colorstone:trollblock', '', 'colorstone:trollblock'},
		{'colorstone:trollblock', 'colorstone:trollblock', 'colorstone:trollblock'},
		{'colorstone:trollblock', 'colorstone:trollblock', 'colorstone:trollblock'},
	}
})
minetest.register_craft({
	output = 'colorstone:leggings_troll',
	recipe = {
		{'colorstone:trollblock', 'colorstone:trollblock', 'colorstone:trollblock'},
		{'colorstone:trollblock', '', 'colorstone:trollblock'},
		{'colorstone:trollblock', '', 'colorstone:trollblock'},
	}
})
minetest.register_craft({
	output = 'colorstone:boots_troll',
	recipe = {
		{'', '', ''},
		{'colorstone:trollblock', '', 'colorstone:trollblock'},
		{'colorstone:trollblock', '', 'colorstone:trollblock'},
	}
})
--troll
minetest.register_node("colorstone:stone_with_real_diamond", {
	description = ("Real Diamond Ore"),
	tiles = {"stone.png^real_diamond_mineral_real_diamond.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'colorstone:real_diamond 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:real_diamond'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:real_diamond'},    --The 4th drops with a 1/3 chance
				rarity = 2,
			},
			{
				items = {'colorstone:real_diamond'},    --The 5th drops with a 1/8 chance
				rarity = 2,
			},
		}
	},
	sounds = {},
})

minetest.register_craftitem("colorstone:real_diamond", {
	description = ("Real Diamond"),
	inventory_image = "real_diamond.png",
})


-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_real_diamond",
	wherein        = "ta_base:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -600,
})

-- -256 <-> -31000
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_real_diamond",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -3000,
})
minetest.register_node("colorstone:stone_with_trollface", {
	description = ("Trollface Ore"),
	tiles = {"stone.png^trollface_mineral_trollface.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'colorstone:trollface 1'},  --The first and second drops ever
			},
			{
				items = {'colorstone:trollface'},    --The 3rd drops with a 1/2 chance
				rarity = 2,
			},
			{
				items = {'colorstone:trollface'},    --The 4th drops with a 1/3 chance
				rarity = 3,
			},
			{
				items = {'colorstone:trollface'},    --The 5th drops with a 1/8 chance
				rarity = 8,
			},
		}
	},
	sounds = {},
})

-- Lapis Item
minetest.register_craftitem("colorstone:trollface", {
	description = ("Trollface"),
	inventory_image = "trollface_trollface.png",
})



-- Ore generation
-- -128 <-> -255
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "colorstone:stone_with_trollface",
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
	ore            = "colorstone:stone_with_trollface",
	wherein        = "ta_base:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -1000,
})
--node troll
minetest.register_node("colorstone:trollblock", {
	description = ("Noice Troll"),
	tiles = {"tmo_trollblock.png"},
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sounds = {},
})


minetest.register_craft({
	output = 'colorstone:trollblock',
	recipe = {
		{'colorstone:real_diamond', 'colorstone:real_diamond', 'colorstone:real_diamond'},
		{'colorstone:real_diamond', 'colorstone:trollface', 'colorstone:real_diamond'},
		{'colorstone:real_diamond', 'colorstone:real_diamond', 'colorstone:real_diamond'},
	}
})