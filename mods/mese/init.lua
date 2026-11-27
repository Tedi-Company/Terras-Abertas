local S = core.get_translator("ta_mods_minetest")

-- 0. Registro dooooooo (kkkkkk) cristal e seu fragmento
minetest.register_craftitem("mese:mese_crystal", {
	description = S("Mese Crystal"),
	inventory_image = "default_mese_crystal.png",
})

minetest.register_craftitem("mese:mese_crystal_fragment", {
	description = S("Mese Crystal Fragment"),
	inventory_image = "default_mese_crystal_fragment.png",
})

-- 1. Registro do Minério de Mese (Mese Ore)
minetest.register_node("mese:stone_with_mese", {
	description = S("Mese Ore"),
	tiles = {"default_stone.png^default_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "mese:mese_crystal",
	sound = {},
})

-- 2. Registro do Bloco de Mese
minetest.register_node("mese:mese", {
	description = S("Mese Block"),
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = {},
	light_source = 3,
})

-- 3. Registro da Lâmpada de Mese (Mese Lamp)
minetest.register_node("mese:meselamp", {
	description = S("Mese Lamp"),
	drawtype = "glasslike",
	tiles = {"default_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = {},
	light_source = 14, -- Substituído default.LIGHT_MAX pelo valor fixo 14
})

-- 4. Função interna para criar os Postes de Mese sem depender do default
local function register_mese_post_light(node_name, description, texture)
	minetest.register_node(node_name, {
		description = description,
		drawtype = "nodebox",
		tiles = {texture},
		paramtype = "light",
		sunlight_propagates = true,
		light_source = 14,
		walkable = true,
		node_box = {
			type = "fixed",
			fixed = {
				{-2/16, -8/16, -2/16, 2/16, 8/16, 2/16}, -- Formato fino de pilar
			}
		},
		groups = {choppy = 2, oddly_breakable_by_hand = 2},
		sounds = {},
	})
end

-- 5. Registro dos Postes usando o prefixo CORRETO (mese:)
register_mese_post_light("mese:mese_post_light", S("Apple Wood Mese Post Light"), "default_fence_wood.png")
register_mese_post_light("mese:mese_post_light_acacia_wood", S("Acacia Wood Mese Post Light"), "default_fence_acacia_wood.png")
register_mese_post_light("mese:mese_post_light_junglewood", S("Jungle Wood Mese Post Light"), "default_fence_junglewood.png")
register_mese_post_light("mese:mese_post_light_pine_wood", S("Pine Wood Mese Post Light"), "default_fence_pine_wood.png")
register_mese_post_light("mese:mese_post_light_aspen_wood", S("Aspen Wood Mese Post Light"), "default_fence_aspen_wood.png")

-- 6. Algumas receitas:

minetest.register_craft({
	output = "mese:mese_crystal",
	recipe = {
		{"mese:mese_crystal_fragment", "mese:mese_crystal_fragment", "mese:mese_crystal_fragment"},
		{"mese:mese_crystal_fragment", "mese:mese_crystal_fragment", "mese:mese_crystal_fragment"},
		{"mese:mese_crystal_fragment", "mese:mese_crystal_fragment", "mese:mese_crystal_fragment"},
	}
})

minetest.register_craft({
	output = "mese:mese_crystal 9",
	recipe = {
		{"mese:mese"},
	}
})

minetest.register_craft({
	output = "mese:mese_crystal_fragment 9",
	recipe = {
		{"mese:mese_crystal"},
	}
})
