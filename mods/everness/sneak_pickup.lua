--[[
    Everness. Never ending discovery in Everness mapgen.
    Copyright (C) 2026 SaKeL

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.
--]]

local TIMER = 0
local PLAYER_SNEAKING = {}
local PLAYER_DELAY = {}

-- Hook core.item_drop so throwing items (Q or Shift+Q) applies a cooldown
local old_item_drop = core.item_drop
core.item_drop = function(itemstack, dropper, pos)
    if dropper and type(dropper) == "userdata" and dropper.is_player and dropper:is_player() then
        local name = dropper:get_player_name()
        if name and name ~= "" then
            PLAYER_DELAY[name] = 1.5
        end
    end
    return old_item_drop(itemstack, dropper, pos)
end

local function pick_dropped_items(player)
    local inv = player:get_inventory()
    if not inv then
        return
    end

    local pos = player:get_pos()
    if not pos then
        return
    end

    local objects = core.get_objects_inside_radius(pos, 4)
    if not objects or #objects == 0 then
        return
    end

    local objects_to_collect = {}

    -- filter - leave only uncollected builtin items (ignore items in flight for 0.8s)
    for i = 1, #objects do
        local object = objects[i]
        if not object:is_player() then
            local luaentity = object:get_luaentity()
            if luaentity
                and luaentity.name == '__builtin:item'
                and luaentity.itemstring ~= ''
                and not luaentity._being_collected
                and (luaentity.age or 0) >= 0.8
            then
                objects_to_collect[#objects_to_collect + 1] = object
            end
        end
    end

    if #objects_to_collect == 0 then
        return
    end

    -- sort with the oldest objects first
    if #objects_to_collect > 1 then
        table.sort(objects_to_collect, function(a, b)
            local ea = a:get_luaentity()
            local eb = b:get_luaentity()
            return (eb and eb.age or 0) < (ea and ea.age or 0)
        end)
    end

    for i = 1, #objects_to_collect do
        local object = objects_to_collect[i]
        local luaentity = object:get_luaentity()

        if luaentity and not luaentity._being_collected and luaentity.itemstring ~= '' then
            local itemstack = ItemStack(luaentity.itemstring)
            local leftover_stack = inv:add_item('main', itemstack)
            local stack_count_prev = itemstack:get_count()
            local stack_count_leftover = leftover_stack:get_count()

            if leftover_stack and stack_count_prev ~= stack_count_leftover then
                -- Collect item / Item fits in the inventory
                local pos_obj = object:get_pos()

                if stack_count_leftover ~= 0 then
                    core.spawn_item(pos_obj, leftover_stack:to_string())
                end

                luaentity.itemstring = ''
                luaentity._being_collected = true
                object:set_acceleration({ x = 0, y = 0, z = 0 })
                object:set_velocity({ x = 0, y = 0, z = 0 })
                luaentity.physical_state = false
                luaentity.object:set_properties({
                    physical = false,
                    selectionbox = { 0, 0, 0, 0, 0, 0 },
                    collisionbox = { 0, 0, 0, 0, 0, 0 }
                })

                object:move_to(vector.new(pos.x, pos.y + 1.25, pos.z))

                core.sound_play('everness_item_drop_pickup', {
                    pos = pos,
                    max_hear_distance = 16,
                    gain = 0.4,
                })

                core.after(0, function(v_object)
                    if v_object and v_object:get_luaentity() then
                        v_object:remove()
                    end
                end, object)
            end
        end
    end
end

core.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    PLAYER_SNEAKING[name] = false
    PLAYER_DELAY[name] = 0
end)

core.register_on_leaveplayer(function(player)
    local name = player:get_player_name()
    PLAYER_SNEAKING[name] = nil
    PLAYER_DELAY[name] = nil
end)

core.register_globalstep(function(dtime)
    TIMER = TIMER + dtime
    if TIMER < 0.25 then
        return
    end

    local dt = TIMER
    TIMER = 0

    local players = core.get_connected_players()
    if #players == 0 then
        return
    end

    local damage_enabled = core.settings:get_bool('enable_damage', true)

    for i = 1, #players do
        local player = players[i]
        local player_name = player:get_player_name()
        local control = player:get_player_control()
        local player_hp = player:get_hp()
        local is_sneaking = PLAYER_SNEAKING[player_name] or false
        local p_delay = PLAYER_DELAY[player_name] or 0

        if p_delay > 0 then
            p_delay = math.max(0, p_delay - dt)
            PLAYER_DELAY[player_name] = p_delay
        end

        if control.sneak and (player_hp > 0 or not damage_enabled) then
            if p_delay == 0 then
                pick_dropped_items(player)
            end
        end

        -- Hide nametag when sneaking
        if control.sneak ~= is_sneaking then
            if control.sneak and player_hp > 0 then
                local nametag_tbl = player:get_nametag_attributes()
                if nametag_tbl and nametag_tbl.color then
                    nametag_tbl.color.a = 0
                    player:set_nametag_attributes(nametag_tbl)
                end
                player:set_properties{ makes_footstep_sound = false }
            else
                local nametag_tbl = player:get_nametag_attributes()
                if nametag_tbl and nametag_tbl.color then
                    nametag_tbl.color.a = 255
                    player:set_nametag_attributes(nametag_tbl)
                end
                player:set_properties{ makes_footstep_sound = true }
            end

            PLAYER_SNEAKING[player_name] = control.sneak
        end
    end
end)
