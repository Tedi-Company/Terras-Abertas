-- 1. Registro do Bioma
minetest.register_biome({
    name = "floresta_luminescente",
    node_top = "ta_base:dirt",
    depth_top = 1,

    node_filler = "ta_base:dirt",
    depth_filler = 3,

    node_stone = "ta_base:stone",

    y_min = -31000,
    y_max = 31000,

    heat_point = 50,
    humidity_point = 50,
})

-- Guardar o estado do céu de cada jogador para fazer a transição suave
local player_sky_state = {}

-- 2. Definição da Função Visual (Movida para cima para evitar erro de 'nil')
local function atualizar_efeito_visual(player, progresso)
    if progresso <= 0 then
        -- Restaura o céu padrão do jogo (Dia normal)
        player:set_sky({ mode = "regular" })
        player:set_lighting({ shadows = { intensity = 0.33 } }) -- Sombras normais
        return
    end

    -- Interpolação de cores (Céu vai do azul do dia para o roxo/preto espacial)
    -- Formato hexadecimal ARGB sem o caractere '#' (padrão aceito pelas APIs do Luanti)
    local r = math.floor(10 + (0x7F - 10) * (1 - progresso))
    local g = math.floor(5 + (0x99 - 5) * (1 - progresso))
    local b = math.floor(25 + (0xFF - 25) * (1 - progresso))
    local cor_ceu = string.format("%02X%02X%02X", r, g, b)

    -- Aplicar modificação no céu utilizando a sintaxe atualizada do Luanti
    player:set_sky({
        mode = "plain",
        base_color = cor_ceu,
        clouds = false, -- Desativa as nuvens comuns de dia
        sky_color = {
            day_sky = cor_ceu,
            night_sky = cor_ceu,
            dawn_sky = cor_ceu,
            dusk_sky = cor_ceu,
            day_horizon = cor_ceu,
            night_horizon = cor_ceu
        },
        -- Controla os corpos celestes
        sun = { visible = false }, 
        moon = { visible = true }, 
        stars = { visible = true, count = math.floor(progresso * 1000) } 
    })

    -- Escurece a luz ambiente dos blocos ao redor do jogador
    player:set_lighting({
        shadows = { intensity = 0.33 + (progresso * 0.5) }, 
        exposure = { lum_mid = 1.0 - (progresso * 0.7) }   
    })
end

-- 3. Loop Global que monitora a posição dos jogadores
minetest.register_globalstep(function(dtime)
    for _, player in ipairs(minetest.get_connected_players()) do
        local name = player:get_player_name()
        local pos = player:get_pos()
        
        -- Detectar o bioma atual do jogador
        local biome_data = minetest.get_biome_data(pos)
        local no_bioma = biome_data and minetest.get_biome_name(biome_data.biome) == "floresta_luminescente"
        
        -- Inicializar tabela do jogador se não existir
        if not player_sky_state[name] then
            player_sky_state[name] = { progresso = 0 }
        end
        
        local state = player_sky_state[name]
        
        -- Transição suave (avança ou recua o progresso entre 0.0 e 1.0)
        if no_bioma and state.progresso < 1 then
            state.progresso = math.min(1, state.progresso + dtime * 0.5) -- Leva ~2 segundos para escurecer
            atualizar_efeito_visual(player, state.progresso)
        elseif not no_bioma and state.progresso > 0 then
            state.progresso = math.max(0, state.progresso - dtime * 0.5) -- Leva ~2 segundos para clarear de volta
            atualizar_efeito_visual(player, state.progresso)
        end
    end
end)

-- 4. Limpeza de memória ao desconectar
minetest.register_on_leaveplayer(function(player)
    player_sky_state[player:get_player_name()] = nil
end)
