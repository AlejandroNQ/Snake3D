execute unless entity @e[tag=temp] run summon minecraft:area_effect_cloud 0 0 0 {Duration:1,Tags:[temp]}

tag @s add temp 

effect give @s minecraft:invisibility 1 255 true

tp @e[tag=temp] 0 16.35 0

execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~8 ~ ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~4 ~ ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~2 ~ ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~1 ~ ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~8 ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~4 ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~2 ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~1 ~
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~ ~8
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~ ~4
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~ ~2
execute as @e[tag=temp,limit=1,sort=random] at @s run tp @s ~ ~ ~1

tag @s remove temp

execute if entity @e[tag=body,distance=..0.1] run function snake:tpfood
execute if entity @a[distance=..1] run function snake:tpfood

playsound minecraft:entity.enderman.teleport player @a