#reinicia partida
scoreboard players set @a alive 1
kill @e[type=minecraft:area_effect_cloud,tag=!fixed]
kill @e[type=minecraft:armor_stand]
scoreboard players set @a id 0
scoreboard players set @a score 0

#resetea la comida
kill @e[tag=food]
summon minecraft:silverfish 0 0 0 {Duration:2000000,Tags:[food],NoAI:1}
summon minecraft:silverfish 0 0 0 {Duration:2000000,Tags:[food],NoAI:1}
execute as @e[tag=food] run function snake:tpfood
#effect give @e[tag=food] minecraft:glowing 3600 1 true


#asigna numeros a los jugadores
execute if entity @a[scores={id=0}] run scoreboard players set @a[scores={id=0},limit=1] id 1
execute if entity @a[scores={id=0}] run scoreboard players set @a[scores={id=0},limit=1] id 2
execute if entity @a[scores={id=0}] run scoreboard players set @a[scores={id=0},limit=1] id 3
execute if entity @a[scores={id=0}] run scoreboard players set @a[scores={id=0},limit=1] id 4
execute if entity @a[scores={id=0}] run scoreboard players set @a[scores={id=0},limit=1] id 5
execute if entity @a[scores={id=0}] run scoreboard players set @a[scores={id=0},limit=1] id 6


#genera las cabezas (y las empareja con el jugador)
execute if entity @a[scores={id=1}] run summon minecraft:area_effect_cloud 3 24 8 {Duration:2000000,Tags:[head]}
execute if entity @a[scores={id=1}] as @e[tag=head] unless score @s id matches 0 run scoreboard players set @s id 1
execute if entity @a[scores={id=2}] run summon minecraft:area_effect_cloud 11 24 8 {Duration:2000000,Tags:[head]}
execute if entity @a[scores={id=2}] as @e[tag=head] unless score @s id matches 0 run scoreboard players set @s id 2
execute if entity @a[scores={id=3}] run summon minecraft:area_effect_cloud 8 21 8 {Duration:2000000,Tags:[head]}
execute if entity @a[scores={id=3}] as @e[tag=head] unless score @s id matches 0 run scoreboard players set @s id 3
execute if entity @a[scores={id=4}] run summon minecraft:area_effect_cloud 8 27 8 {Duration:2000000,Tags:[head]}
execute if entity @a[scores={id=4}] as @e[tag=head] unless score @s id matches 0 run scoreboard players set @s id 4
execute if entity @a[scores={id=5}] run summon minecraft:area_effect_cloud 8 24 3 {Duration:2000000,Tags:[head]}
execute if entity @a[scores={id=5}] as @e[tag=head] unless score @s id matches 0 run scoreboard players set @s id 5
execute if entity @a[scores={id=6}] run summon minecraft:area_effect_cloud 8 24 11 {Duration:2000000,Tags:[head]}
execute if entity @a[scores={id=6}] as @e[tag=head] unless score @s id matches 0 run scoreboard players set @s id 6

scoreboard players set @e[tag=head] dir 0
scoreboard players set @e[tag=head] score 4


bossbar add snake:timer "Start"
bossbar set snake:timer max 100
bossbar set snake:timer players @a
bossbar set snake:timer visible true

scoreboard players set #time id 100
scoreboard players set #timer id 0
function snake:timer


schedule function snake:movimiento 100