#get dead player's ID
scoreboard players operation #temp id = @s id


effect give @s minecraft:blindness 3 255 true
title @s subtitle [{"text":"score: ","color":"orange"},{"score":{"name":"@s","objective":"score"}}]
title @s title {"text":"GAME OVER","color":"red"}


#execute as @e[tag=body] if score @s id = #temp id run data modify entity @s ArmorItems[3].id set value "minecraft:black_concrete"
execute as @e[type=minecraft:armor_stand] if score @s id = #temp id at @s run particle minecraft:cloud ~ ~1.8 ~

execute as @e[type=!minecraft:player,tag=!fixed] if score @s id = #temp id run kill @s

execute as @e[type=armor_stand] if score @s id = #temp id unless score @s id matches 1..10 run kill @s


execute as @e[tag=head] if score @s id = #temp id run playsound minecraft:entity.player.death player @a


#si han muerto todos
execute unless entity @a[scores={alive=1}] run bossbar set snake:timer visible true
execute unless entity @a[scores={alive=1}] run schedule function snake:newgame 100
