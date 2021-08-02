#get ID
scoreboard players operation #temp id = @s id

execute as @e if score @s id = #temp id run scoreboard players add @s score 1

playsound minecraft:entity.player.burp player @a
execute as @a if score @s id = #temp id run title @s actionbar {"text":"+1!","color":"dark_green"}

execute as @e[tag=food,distance=..0.4] at @s run function snake:tpfood