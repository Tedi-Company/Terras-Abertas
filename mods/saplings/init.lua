minetest.register_node("saplings:sapling", {
	description = "Tree Sapling",
	drawtype = "plantlike",
	tiles = {"sapling.png"},
	inventory_image = "sapling.png",
	wield_image = "sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {
		snappy = 2, 
		dig_immediate = 3, 
		flammable = 2,
		attached_node = 1, 
		sapling = 1
	},

	on_construct = function(pos)
		-- Tempo em segundos para a árvore crescer (ex: entre 5 e 15 minutos)
		-- Para testes rápidos, você pode mudar para math.random(10, 30)
		minetest.get_node_timer(pos):start(math.random(300, 900))
	end,

	on_timer = function(pos, elapsed)
		-- 1. Remove a muda do chão antes de colocar o schematic
		minetest.remove_node(pos)

		-- 2. Escolhe aleatoriamente entre a árvore pequena ou a grande
		-- 70% de chance para árvore pequena, 30% para a grande
		local schematic_chosen = "mapgen_trees:small_tree"
		if math.random(1, 10) > 7 then
			schematic_chosen = "mapgen_trees:big_tree"
		end

		-- 3. Ajusta a posição Y para a árvore nascer alinhada com o chão
		-- (Geralmente schematics de árvores precisam começar 1 bloco abaixo ou no nível do tronco)
		local spawn_pos = {x = pos.x, y = pos.y, z = pos.z}

		-- 4. Invoca o motor do Luanti para gerar a estrutura .mts no mapa
		minetest.place_schematic(spawn_pos, schematic_chosen, "0", nil, true)
		
		return false -- Desliga o timer desta muda
	end,
})
