-- =================================================================
-- SISTEMA DE VELAS COLORIDAS AUTOMÁTICO (TERRAS ABERTAS)
-- =================================================================

-- Tabela com os códigos de cores em Hexadecimal para o motor pintar o bloco sozinho
local colors_hex = {
	black      = "#202020",
	blue       = "#2b5cb8",
	brown      = "#704214",
	cyan       = "#00a3a3",
	dark_green = "#135213",
	dark_grey  = "#4a4a4a",
	green      = "#249e24",
	grey       = "#8c8c8c",
	magenta    = "#bd15bd",
	orange     = "#e67e22",
	pink       = "#ff9ebb",
	red        = "#c0392b",
	violet     = "#8e44ad",
	yellow     = "#f1c40f"
}

-- Função de ajuda nativa para registrar as velas no motor
local add_candle = function(color_id, color_name)
	
	-- 1. Define o nome técnico do nó (ex: ta_base:candle ou ta_base:candle_red)
	local node_name = "ta_base:candle"
	if color_id ~= "" then
		node_name = "ta_base:candle_" .. color_id
	end

	-- 2. Define a string de textura aplicando a colorização automática se for colorida
	local texture_string = "candle.png"
	if color_id ~= "" and colors_hex[color_id] then
		-- Aplica um overlay de cor com opacidade ajustada (170) para manter os sombreados originais da imagem
		texture_string = "candle.png^[colorize:" .. colors_hex[color_id] .. ":170"
	end

	-- 3. Registro nativo na API do Luanti
	core.register_node(node_name, {
		description = color_name .. "Candle",
		drawtype = "plantlike",
		tiles = {texture_string},
		inventory_image = texture_string,
		wield_image = texture_string,
		paramtype = "light",
		paramtype2 = "wallmounted", -- Permite colocar perfeitamente no chão, paredes ou teto
		walkable = false,
		light_source = 12, -- Emite luz nativa nas cavernas e noites do jogo
		selection_box = {
			type = "fixed",
			fixed = {-2/16, -0.5, -2/16, 2/16, 2/16, 2/16} -- Caixa de colisão fininha ajustada ao formato de vela
		},
		groups = {dig_immediate = 3, flammable = 1, attached_node = 1},
		
		-- Garante que se o jogador colocar a vela manualmente, ela fique salva corretamente no mapa
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			local node = core.get_node(pos)
			node.param1 = 1
			core.swap_node(pos, node)
		end,
	})
end

-- =================================================================
-- EXECUÇÃO DO REGISTRO DAS VELAS
-- =================================================================

add_candle("", "")
add_candle("black", "Black ")
add_candle("blue", "Blue ")
add_candle("brown", "Brown ")
add_candle("cyan", "Cyan ")
add_candle("dark_green", "Dark Green ")
add_candle("dark_grey", "Dark Grey ")
add_candle("green", "Green ")
add_candle("grey", "Grey ")
add_candle("magenta", "Magenta ")
add_candle("orange", "Orange ")
add_candle("pink", "Pink ")
add_candle("red", "Red ")
add_candle("violet", "Violet ")
add_candle("yellow", "Yellow ")
