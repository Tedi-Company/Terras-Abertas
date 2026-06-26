-- Fly automático quando criativo estiver ativo
-- e remoção automática quando criativo estiver desligado

local function sync_fly_priv(player)
    local name = player:get_player_name()
    local privs = minetest.get_player_privs(name)

    -- detecta criativo de qualquer forma possível
    local is_creative =
        (creative and creative.is_enabled_for and creative.is_enabled_for(name)) or
        minetest.settings:get_bool("creative_mode")

    -- aplica regras
    if is_creative then
        if not privs.fly then
            privs.fly = true
            minetest.set_player_privs(name, privs)
        end
    else
        if privs.fly then
            privs.fly = nil
            minetest.set_player_privs(name, privs)
        end
    end
end

-- ao entrar no mundo
minetest.register_on_joinplayer(function(player)
    sync_fly_priv(player)
end)

-- monitora troca de modo durante o jogo
minetest.register_globalstep(function(dtime)
    for _, player in ipairs(minetest.get_connected_players()) do
        sync_fly_priv(player)
    end
end)
