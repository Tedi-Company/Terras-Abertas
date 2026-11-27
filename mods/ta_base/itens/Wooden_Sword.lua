minetest.register_tool("ta_base:wooden_sword", {
    description = "Wooden Sword",
    inventory_image = "Wooden_Sword.png", 
    
    tool_capabilities = {
        full_punch_interval = 1.0, 
        max_drop_level = 0,
        
        groupcaps = {
            snappy = {
                times = {[1]=2.5, [2]=1.2, [3]=0.60},
                uses = 20, 
                maxlevel = 1,
            },
        },
        

        damage_groups = {fleshy = 2},
    },
})

minetest.register_craft({
    type = "shapeless",
    output = "ta_base:Oak_Planks 8",
    recipe = {"ta_base:wood"}
})

