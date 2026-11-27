minetest.register_on_joinplayer(function(player)
    minetest.after(2, function()
        -- Verifica se o jogador desativou os shaders nas configurações dele
        if not core.settings:get_bool("enable_shaders") then
            minetest.chat_send_player(player:get_player_name(), 
                "[Terras Abertas] Warning: This game is designed to be played with Shaders enabled! Please go to Settings > Graphics and turn Shaders ON for the best experience.")
        end
    end)
end)
