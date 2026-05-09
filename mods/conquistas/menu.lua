local function gerar_formspec(player)
    local meta = player:get_meta()

    local fs = ""
    fs = fs .. "formspec_version[4]"
    fs = fs .. "size[10,8]"
    fs = fs .. "label[0.3,0.3;Conquistas]"

    local y = 1.2
    for id, c in pairs(conquistas.lista) do
        local desbloqueada = meta:get_string("conquista_" .. id) == "1"

        local status = desbloqueada and "✔" or "✖"
        local texto = status .. " " .. c.titulo .. " - " .. c.descricao

        fs = fs .. "label[0.3," .. y .. ";" .. minetest.formspec_escape(texto) .. "]"
        y = y + 0.7
    end

    return fs
end

---------------------------------------------------
-- Comando para abrir o menu
---------------------------------------------------
minetest.register_chatcommand("conquistas", {
    description = "Abrir menu de conquistas",
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then return end

        minetest.show_formspec(
            name,
            "conquistas:menu",
            gerar_formspec(player)
        )
    end
})
