local ENERGIA_MAX = 100
local CUSTO_POR_VIAGEM = 10

-- ==============================
-- FUNÇÕES
-- ==============================

local function mover_elevador(player, destino_y)
    local pos = player:get_pos()
    local passo = (destino_y > pos.y) and 0.2 or -0.2

    local function loop()
        if not player then return end
        pos = player:get_pos()

        if math.abs(pos.y - destino_y) < 0.3 then
            player:set_pos({x=pos.x, y=destino_y, z=pos.z})
            return
        end

        player:set_pos({x=pos.x, y=pos.y + passo, z=pos.z})
        minetest.after(0.05, loop)
    end

    loop()
end

local function gerar_formspec(meta)
    local andares = minetest.deserialize(meta:get_string("andares")) or {}
    local energia = meta:get_int("energia")

    local fs = "size[6,7]"
    fs = fs .. "label[0,0;Energia: "..energia.."%]"

    local y = 1
    for i, andar in ipairs(andares) do
        fs = fs .. "button[1,"..y..";4,0.8;ir"..i..";"..andar.nome.."]"
        y = y + 1
    end

    if #andares == 0 then
        fs = fs .. "label[1,2;Nenhum andar registrado]"
    end

    return fs
end

-- ==============================
-- PAINEL DO ELEVADOR
-- ==============================

minetest.register_node("ta_elevador:painel", {
    description = "Painel",
    tiles = {"default_steel_block.png"},
    groups = {cracky=1},

    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_int("energia", ENERGIA_MAX)
        meta:set_string("andares", minetest.serialize({}))
    end,

    on_rightclick = function(pos, node, player)
        local meta = minetest.get_meta(pos)
        minetest.show_formspec(
            player:get_player_name(),
            "elevador:menu_"..minetest.pos_to_string(pos),
            gerar_formspec(meta)
        )
    end,

    on_receive_fields = function(pos, formname, fields, player)
        local meta = minetest.get_meta(pos)
        local andares = minetest.deserialize(meta:get_string("andares")) or {}
        local energia = meta:get_int("energia")

        for i, andar in ipairs(andares) do
            if fields["ir"..i] then
                if energia < CUSTO_POR_VIAGEM then
                    minetest.chat_send_player(player:get_player_name(),
                        "⚠ Elevador sem energia!")
                    return
                end

                meta:set_int("energia", energia - CUSTO_POR_VIAGEM)
                mover_elevador(player, andar.y)
            end
        end
    end
})

-- ==============================
-- BLOCO PARA REGISTRAR ANDAR
-- ==============================

minetest.register_node("ta_elevador:registrar_andar", {
    description = "Registrar Andar do Elevador",
    tiles = {"default_copper_block.png"},
    groups = {cracky=1},

    on_rightclick = function(pos, node, player)
        minetest.show_formspec(
            player:get_player_name(),
            "elevador:registrar",
            "size[5,3]"..
            "field[0.5,1;4,1;nome;Nome do Andar;]"..
            "button_exit[1,2;3,1;salvar;Salvar]"
        )

        player:get_meta():set_string("andar_y", tostring(pos.y))
    end
})

-- ==============================
-- RECEBE O FORM
-- ==============================

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= "elevador:registrar" then return end
    if not fields.salvar or fields.nome == "" then return end

    local y = tonumber(player:get_meta():get_string("andar_y"))
    if not y then return end

    local pos = vector.round(player:get_pos())
    local painel_pos = minetest.find_node_near(pos, 10, {"elevador:painel"})
    if not painel_pos then
        minetest.chat_send_player(player:get_player_name(),
            "⚠ Nenhum painel de elevador próximo!")
        return
    end

    local meta = minetest.get_meta(painel_pos)
    local andares = minetest.deserialize(meta:get_string("andares")) or {}

    table.insert(andares, {
        nome = fields.nome,
        y = y
    })

    meta:set_string("andares", minetest.serialize(andares))

    minetest.chat_send_player(player:get_player_name(),
        "✔ Andar '"..fields.nome.."' registrado!")
end)
