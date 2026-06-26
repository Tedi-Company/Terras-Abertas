local modpath = minetest.get_modpath("ta_conquistas")

dofile(modpath .. "/conquistas.lua")
dofile(modpath .. "/menu.lua")

---------------------------------------------------
-- Função para desbloquear conquista
---------------------------------------------------
local function desbloquear(player, id)
    local meta = player:get_meta()

    if meta:get_string("conquista_" .. id) == "1" then
        return
    end

    meta:set_string("conquista_" .. id, "1")

    local c = conquistas.lista[id]
    if c then
        minetest.chat_send_player(
            player:get_player_name(),
            "Conquista desbloqueada: " .. c.titulo
        )
    end
end

---------------------------------------------------
-- Eventos do jogo
---------------------------------------------------

-- Quebrar bloco
minetest.register_on_dignode(function(pos, oldnode, digger)
    if digger then
        desbloquear(digger, "quebrar_primeiro_bloco")
    end
end)

-- Colocar bloco
minetest.register_on_placenode(function(pos, newnode, placer)
    if placer then
        desbloquear(placer, "colocar_primeiro_bloco")
    end
end)

-- Atacar jogador
minetest.register_on_punchplayer(function(player, hitter)
    if hitter then
        desbloquear(hitter, "primeiro_dano")
    end
end)
