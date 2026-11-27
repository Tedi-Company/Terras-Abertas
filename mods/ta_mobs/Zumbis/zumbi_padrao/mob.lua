-- Registro do Monstro
mobs:register_mob("ta_mobs:zombie", {
    type = "monster",
    hp_min = 20,
    hp_max = 29,
    armor = 100,
    damage = 7,
    visual = "mesh",
    mesh = "zombie_model.obj",
    textures = {
        {"zombi_texture.png"}
    },
    walk_velocity = 1,
    run_velocity = 2,
    view_range = 15,
})

-- Comando de Invocação
minetest.register_chatcommand("spawn", {
    params = "zombie",
    description = "Invoca o zumbi do mod",
    privs = {give = true},
    func = function(name, param)
        if param ~= "zombie" then
            return false, "Use: /spawn zombie"
        end
        local player = minetest.get_player_by_name(name)
        if not player then return false end
        
        local pos = player:get_pos()
        pos.y = pos.y + 0.5
        
        minetest.add_entity(pos, "ta_mobs:zombie")
        return true, "Zombie summoned!"
    end,
})
