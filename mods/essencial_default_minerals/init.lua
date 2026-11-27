-- diamond

minetest.register_craftitem("essencial_default_minerals:diamond", {
	description = S("Diamond"),
	inventory_image = "default_diamond.png",
})

minetest.register_craft({
	output = "essencial_default_minerals:diamond 9",
	recipe = {
		{"essencial_default_blocks_of_minerals:diamondblock"},
	}
})

-- gold

minetest.register_craft({
	output = "essencial_default_minerals:gold_ingot 9",
	recipe = {
		{"essencial_default_blocks_of_minerals:goldblock"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "essencial_default_minerals:gold_ingot",
	recipe = "essencial_default_minerals:gold_lump",
})

minetest.register_craftitem("essencial_default_minerals:gold_lump", {
	description = S("Gold Lump"),
	inventory_image = "default_gold_lump.png"
})

minetest.register_craftitem("essencial_default_minerals:gold_ingot", {
	description = S("Gold Ingot"),
	inventory_image = "default_gold_ingot.png"
})

-- iron

minetest.register_craftitem("essencial_default_minerals:iron_lump", {
	description = S("Iron Lump"),
	inventory_image = "default_iron_lump.png"
})

minetest.register_craft({
	type = "cooking",
	output = "essencial_default_minerals:steel_ingot",
	recipe = "essencial_default_minerals:iron_lump",
})

-- copper

minetest.register_craft({
	type = "cooking",
	output = "essencial_default_minerals:copper_ingot",
	recipe = "essencial_default_minerals:copper_lump",
})

minetest.register_craft({
	output = "essencial_default_minerals:copper_ingot 9",
	recipe = {
		{"essencial_default_blocks_of_minerals:copperblock"},
	}
})

minetest.register_craftitem("essencial_default_minerals:copper_lump", {
	description = S("Copper Lump"),
	inventory_image = "default_copper_lump.png"
})

minetest.register_craftitem("essencial_default_minerals:copper_ingot", {
	description = S("Copper Ingot"),
	inventory_image = "default_copper_ingot.png"
})

-- bronze and copper

minetest.register_craft({
	output = "essencial_default_minerals:bronze_ingot 9",
	recipe = {
		{"essencial_default_minerals:copper_ingot", "essencial_default_minerals:copper_ingot", "essencial_default_minerals:copper_ingot"},
		{"essencial_default_minerals:copper_ingot", "essencial_default_minerals:tin_ingot", "essencial_default_minerals:copper_ingot"},
		{"essencial_default_minerals:copper_ingot", "essencial_default_minerals:copper_ingot", "essencial_default_minerals:copper_ingot"},
	}
})

-- bronze

minetest.register_craftitem("essencial_default_minerals:bronze_ingot", {
	description = S("Bronze Ingot"),
	inventory_image = "default_bronze_ingot.png"
})

-- tin

minetest.register_craftitem("essencial_default_minerals:tin_ingot", {
	description = S("Tin Ingot"),
	inventory_image = "default_tin_ingot.png"
})

minetest.register_craftitem("essencial_default_minerals:tin_lump", {
	description = S("Tin Lump"),
	inventory_image = "default_tin_lump.png"
})

minetest.register_craft({
	output = "essencial_default_minerals:tin_ingot 9",
	recipe = {
		{"essencial_default_blocks_of_minerals:tinblock"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "essencial_default_minerals:tin_ingot",
	recipe = "essencial_default_minerals:tin_lump",
})

-- Coal
minetest.register_craftitem("essencial_default_minerals:coal_lump", {
	description = S("Coal Lump"),
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craft({
	output = "essencial_default_minerals:coal_lump 9",
	recipe = {
		{"essencial_default_blocks_of_minerals:coalblock"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "essencial_default_minerals:coal_lump",
	burntime = 40,
})





