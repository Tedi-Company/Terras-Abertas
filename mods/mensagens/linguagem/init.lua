--------------------------------------------------
-- TERRAS ABERTAS - SISTEMA DE LINGUAGEM INICIAL
--------------------------------------------------

-- Caminhos
local worldpath = minetest.get_worldpath()
local base_dir = worldpath .. "/variaveis"
local lang_dir = base_dir .. "/linguagem"
local lang_file = lang_dir .. "/linguagem.varterrasabertas"

--------------------------------------------------
-- CRIAR PASTAS (SE NÃO EXISTIREM)
--------------------------------------------------

minetest.mkdir(base_dir)
minetest.mkdir(lang_dir)

--------------------------------------------------
-- FUNÇÕES DE SALVAR E CARREGAR
--------------------------------------------------

local function salvar_linguagem(lang)
    local data = {
        language = lang
    }

    local file = io.open(lang_file, "w")
    if not file then return end

    file:write(minetest.serialize(data))
    file:close()
end

local function carregar_linguagem()
    local file = io.open(lang_file, "r")
    if not file then
        return nil
    end

    local content = file:read("*all")
    file:close()

    local data = minetest.deserialize(content)
    if data and data.language then
        return data.language
    end

    return nil
end

--------------------------------------------------
-- FORMSPEC DE SELEÇÃO DE IDIOMA
--------------------------------------------------

local function mostrar_janela_linguagem(player)
    local fs =
        "formspec_version[4]" ..
        "size[8,4]" ..
        "label[2.1,0.7;Choose the game language]" ..
        "button[1.5,2;2.5,1;pt;Português]" ..
        "button[4,2;2.5,1;en;English]"

    minetest.show_formspec(
        player:get_player_name(),
        "terrasabertas:linguagem",
        fs
    )
end

--------------------------------------------------
-- CAPTURAR ESCOLHA
--------------------------------------------------

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= "terrasabertas:linguagem" then
        return
    end

    if fields.pt then
        salvar_linguagem("pt")
    elseif fields.en then
        salvar_linguagem("en")
    end
end)

--------------------------------------------------
-- MOSTRAR APENAS NA CRIAÇÃO DO MUNDO
--------------------------------------------------

minetest.register_on_newplayer(function(player)
    if not carregar_linguagem() then
        minetest.after(0.5, function()
            mostrar_janela_linguagem(player)
        end)
    end
end)

--------------------------------------------------
-- EXEMPLO DE USO GLOBAL DA LINGUAGEM
--------------------------------------------------

local LANG = carregar_linguagem() or "pt"

local textos = {
    pt = {
        bemvindo = "Bem-vindo ao Terras Abertas"
    },
    en = {
        bemvindo = "Welcome to Open Lands"
    }
}

minetest.register_on_joinplayer(function(player)
    minetest.chat_send_player(
        player:get_player_name(),
        textos[LANG].bemvindo
    )
end)

--------------------------------------------------
-- LOG
--------------------------------------------------

minetest.log("action", "[Terras Abertas] Sistema de linguagem carregado")
