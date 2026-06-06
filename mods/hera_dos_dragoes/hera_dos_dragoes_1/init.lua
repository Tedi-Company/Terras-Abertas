-- 1. Comando para ir até a dimensão isolada
minetest.register_chatcommand("ir_dimensao", {
    privs = {teleport = true},
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if player then
            -- Teleporta o jogador para o local ultra isolado (Longe em X e muito alto em Y)
            player:set_pos({x = 25000, y = 25000, z = 0})
            minetest.chat_send_player(name, "Você viajou para os confins do mundo!")
        end
    end,
})

-- 2. Gerador nativo que cola a sua Schematic nas coordenadas isoladas
minetest.register_on_generated(function(minp, maxp, blockseed)
    -- Verifica se o pedaço do mapa que está gerando engloba as coordenadas X=25000 e Y=25000
    if minp.x <= 25000 and maxp.x >= 25000 and minp.y <= 25000 and maxp.y >= 25000 then
        
        -- Posição exata do bloco central da sua schematic
        local posicao_schematic = {x = 25000, y = 25000, z = 0}
        
        -- Caminho do arquivo dentro do seu mod
        local caminho_schematic = minetest.get_modpath("heras_dos_dragoes") .. "/hera_dos_dragoes_1/schematics/HeraDosDragoes1.mts"
        
        -- Cola a estrutura no mapa nativamente
        minetest.place_schematic(posicao_schematic, caminho_schematic, "0", {}, true)
    end
end)
