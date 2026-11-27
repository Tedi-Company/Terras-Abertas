if minetest.get_modpath("multidimensions") and minetest.get_modpath("draconis") then

    -- 1. REGISTRO DA DIMENSÃO (BLOQUEANDO BIOMAS DA TERRA)
    multidimensions.register_dimension("era_dos_dragoes_1", {
        name = "Era Dos Dragões 1",
        
        stone = "draconis:stone_scorched",               
        grass = "draconis:soil_scorched",                
        dirt = "draconis:bone_pile_scorched",            
        water = "ta_base:lava_source",                   
        
        bed = "draconis:stone_scorched",                 
        bedrock = "draconis:stone_scorched",             
        sand = "draconis:soil_scorched",                 
        desert_stone = "draconis:stone_scorched",        
        
        no_decorations = true,          
        ignore_global_biomes = true,    
        biome_type = "single",          
        
        sky_color = {r = 255, g = 69, b = 0},             
        horizon_color = {r = 0, g = 0, b = 0},            
        
        miny = 5000,
        maxy = 6000,
    })

    -- 2. SISTEMA DE SPAWN EM MASSA CORRIGIDO (SPAWN AÉREO PARA DRACONIS)
    minetest.register_abm({
        label = "Spawn Controlado de Dragões de Fogo",
        nodenames = {"draconis:soil_scorched"}, 
        neighbors = {"air"},                   
        interval = 5,                          -- Tenta spawnar a cada 5 segundos
        chance = 12,                           -- Chance bem alta por bloco ativo
        
        action = function(pos, node, active_object_count, active_object_count_wider)
            -- Trava de altura da dimensão
            if pos.y < 5005 or pos.y > 5995 then
                return
            end

            -- Permite até 10 dragões na área visível do jogador
            if active_object_count_wider > 10 then
                return
            end

            -- Faz o dragão nascer 4 blocos ACIMA do chão (direto no ar para voar)
            local spawn_pos = {x = pos.x, y = pos.y + 4, z = pos.z}

            -- Pequeno delay (0.1s) para o motor do jogo processar o ar ao redor antes do monstro aparecer
            minetest.after(0.1, function()
                if draconis and draconis.spawn_dragon then
                    -- Tenta a função direta de dragão do mod
                    draconis.spawn_dragon(spawn_pos, "draconis:fire_dragon")
                elseif creatura and creatura.spawn_mob then
                    -- Tenta forçar o spawn pela API principal (Creatura)
                    creatura.spawn_mob(spawn_pos, "draconis:fire_dragon")
                else
                    -- Força bruta: injeta a criatura e liga o "cérebro" (IA) dela manualmente
                    local ent = minetest.add_entity(spawn_pos, "draconis:fire_dragon")
                    if ent then
                        local lua_ent = ent:get_luaentity()
                        if lua_ent and lua_ent.on_activate then
                            lua_ent:on_activate(lua_ent, "", 0)
                        end
                    end
                end
            end)
        end,
    })
end
