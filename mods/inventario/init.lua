local creative_items = {}

-- 1. Varre o jogo ao ligar e guarda todos os blocos e itens existentes
minetest.register_on_mods_loaded(function()
    for name, def in pairs(minetest.registered_items) do
        if name ~= "" and name ~= "ignore" and def.description and def.groups and not def.groups.not_in_creative_inventory then
            table.insert(creative_items, name)
        end
    end
    table.sort(creative_items)
end)

-- Guarda o estado de navegação de cada jogador na memória
local player_states = {}

-- 2. Função principal que gera o código visual da nossa tela (Formspec)
local function get_custom_inventory_formspec(player, tab, page)
    local name = player:get_player_name()
    tab = tab or "mochila"
    page = page or 1
    
    player_states[name] = {tab = tab, page = page}

    -- Define o tamanho total da janela da nossa interface
    local formspec = "size[8,8.6]" ..
        "bgcolor-[#1c1c1cee;true]"

    -- Desenha os botões das abas no topo da janela
    if tab == "mochila" then
        formspec = formspec .. 
            "style[tab_mochila;bgcolor=#555555]" ..
            "style[tab_creative;bgcolor=#222222]"
    else
        formspec = formspec .. 
            "style[tab_mochila;bgcolor=#222222]" ..
            "style[tab_creative;bgcolor=#555555]"
    end
    
    formspec = formspec .. 
        "button[0,0;2.5,0.6;tab_mochila;🎒 Sua Mochila]" ..
        "button[2.6,0;2.5,0.6;tab_creative;🎨 Criativo]"

    -- CONTEÚDO DA ABA 1: MOCHILA
    if tab == "mochila" then
        formspec = formspec ..
            "label[0,1.0;Sua Mochila Principal]" ..
            "list[current_player;main;0,1.5;8,4;]"
            
    -- CONTEÚDO DA ABA 2: CRIATIVO INDEPENDENTE
    elseif tab == "creative" then
        local items_per_page = 32 -- 8 colunas x 4 linhas de blocos
        local max_pages = math.ceil(#creative_items / items_per_page)
        if page > max_pages then page = max_pages end
        if page < 1 then page = 1 end
        player_states[name].page = page

        formspec = formspec .. 
            "label[0,1.0;Itens do Jogo (Pág. " .. page .. "/" .. max_pages .. ")]"

        local start_idx = ((page - 1) * items_per_page) + 1
        local end_idx = math.min(start_idx + items_per_page - 1, #creative_items)
        
        local x, y = 0, 1.5
        for i = start_idx, end_idx do
            local item_name = creative_items[i]
            formspec = formspec .. "item_image_button[" .. x .. "," .. y .. ";1,1;" .. item_name .. ";give_" .. item_name .. ";]"
            x = x + 1
            if x >= 8 then
                x = 0
                y = y + 1
            end
        end

        -- Botões para passar a página
        formspec = formspec .. 
            "button[0,5.8;2,0.6;btn_prev;◀ Voltar]" ..
            "button[6,5.8;2,0.6;btn_next;Avançar ▶]"
    end

    -- BARRA DE ATALHOS FIXA NO RODAPÉ (Sempre visível)
    formspec = formspec .. 
        "label[0,6.8;Barra de Atalhos Rápidos]" ..
        "list[current_player;main;0,7.3;8,1;8]" ..
        "listring[current_player;main]"

    return formspec
end

-- 3. Injeta a nossa tela customizada DIRETAMENTE no botão de inventário (Tecla I) do jogador
minetest.register_on_joinplayer(function(player)
    -- Define a nossa tela como a tela oficial do inventário do jogador
    player:set_inventory_formspec(get_custom_inventory_formspec(player, "mochila", 1))
end)

-- 4. Processa os cliques dentro da nossa tela customizada
minetest.register_on_player_receive_fields(function(player, formname, fields)
    -- Na versão 5.15, quando a tela é o inventário padrão atualizado por set_inventory_formspec, 
    -- o formname retornado é uma string vazia ""
    if formname ~= "" then return end
    
    local name = player:get_player_name()
    local state = player_states[name] or {tab = "mochila", page = 1}

    -- Cliques nas abas do topo
    if fields.tab_mochila then
        player:set_inventory_formspec(get_custom_inventory_formspec(player, "mochila", 1))
        return true
    end
    if fields.tab_creative then
        player:set_inventory_formspec(get_custom_inventory_formspec(player, "creative", 1))
        return true
    end

    -- Navegação de páginas da lista do criativo
    if fields.btn_next then
        player:set_inventory_formspec(get_custom_inventory_formspec(player, "creative", state.page + 1))
        return true
    end
    if fields.btn_prev then
        player:set_inventory_formspec(get_custom_inventory_formspec(player, "creative", state.page - 1))
        return true
    end

    -- Clique nos ícones dos blocos para ganhar o item
    for field, _ in pairs(fields) do
        if field:sub(1, 5) == "give_" then
            local item_name = field:sub(6)
            local inv = player:get_inventory()
            local stack = ItemStack(item_name .. " 99")
            if inv:room_for_item("main", stack) then
                inv:add_item("main", stack)
            end
            return true
        end
    end
end)
