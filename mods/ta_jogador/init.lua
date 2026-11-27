minetest.register_item(":", {
    type = "none",
    wield_image = "hand.png",
    wield_scale = {x=1,y=1,z=2},
    tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {times = {[1]=1.5, [2]=2.5, [3]=3.5}, uses = 0},
            cracky  = {times = {[1]=3.0, [2]=4.0, [3]=5.0}, uses = 0},
            choppy  = {times = {[1]=2.0, [2]=3.0, [3]=4.0}, uses = 0},
        },
        damage_groups = {fleshy = 1},
    },
})

minetest.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    local privs = minetest.get_player_privs(name)

    privs.fast = true
    minetest.set_player_privs(name, privs)
end)

