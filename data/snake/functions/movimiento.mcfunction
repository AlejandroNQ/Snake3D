effect give @a minecraft:invisibility 2 255 true


#avanza la cabeza

#east
execute as @e[tag=head,scores={dir=1}] at @s run tp ~1 ~ ~
#west         
execute as @e[tag=head,scores={dir=2}] at @s run tp ~-1 ~ ~
#up           
execute as @e[tag=head,scores={dir=3}] at @s run tp ~ ~1 ~
#down         
execute as @e[tag=head,scores={dir=4}] at @s run tp ~ ~-1 ~
#south        
execute as @e[tag=head,scores={dir=5}] at @s run tp ~ ~ ~1
#north        
execute as @e[tag=head,scores={dir=6}] at @s run tp ~ ~ ~-1


#updates prevdir
execute as @a run scoreboard players operation @s prevdir = @s dir


#wall clip    -1 15 -1  16 32 16 
execute positioned -1 15 -1 as @e[tag=head,dx=-8,dy=18,dz=18] at @s run tp @s ~16 ~ ~
execute positioned 15 15 -1 as @e[tag=head,dx= 8,dy=18,dz=18] at @s run tp @s ~-16 ~ ~
execute positioned -1 15 -1 as @e[tag=head,dx=18,dy=-8,dz=18] at @s run tp @s ~ ~16 ~
execute positioned -1 32 -1 as @e[tag=head,dx=18,dy= 8,dz=18] at @s run tp @s ~ ~-16 ~
execute positioned -1 15 -1 as @e[tag=head,dx=18,dy=18,dz=-8] at @s run tp @s ~ ~ ~16
execute positioned -1 15 15 as @e[tag=head,dx=18,dy=18,dz= 8] at @s run tp @s ~ ~ ~-16


#comer
execute as @e[tag=head] at @s if entity @e[tag=food,distance=..0.4] run function snake:eat


#death scenarios:
#si se choca consigo misma
execute as @e[tag=head] at @s positioned ~ ~-1 ~ as @e[tag=body,distance=..0.1] if score @s score < @e[tag=head,limit=1,sort=nearest] score as @a if score @s id = @e[tag=head,limit=1,sort=nearest] id run scoreboard players set @s alive 0
#si choca con otra
execute as @e[tag=head] at @s positioned ~ ~-1 ~ as @e[tag=body,distance=..0.1] unless score @s id = @e[tag=head,limit=1,sort=nearest] id as @a if score @s id = @e[tag=head,limit=1,sort=nearest] id run scoreboard players set @s alive 0


#reduce el contador de longevidad
scoreboard players remove @e[tag=body] score 1


#avanza el cuerpo
execute as @e[tag=head] at @s positioned ~ ~-1 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,ArmorItems:[{},{},{},{id:"minecraft:red_concrete",Count:1}],Tags:[body]}
execute as @e[tag=head] at @s positioned ~ ~-1 ~ run scoreboard players operation @e[type=minecraft:armor_stand,limit=1,distance=..0.1] id = @s id

#lo hace del color que toca
execute as @e[tag=head,scores={id=1}] at @s positioned ~ ~-1 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,distance=..0.1] ArmorItems[3].id set from block 15 16 15 Items[0].id
execute as @e[tag=head,scores={id=2}] at @s positioned ~ ~-1 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,distance=..0.1] ArmorItems[3].id set from block 15 16 15 Items[1].id
execute as @e[tag=head,scores={id=3}] at @s positioned ~ ~-1 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,distance=..0.1] ArmorItems[3].id set from block 15 16 15 Items[2].id
execute as @e[tag=head,scores={id=4}] at @s positioned ~ ~-1 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,distance=..0.1] ArmorItems[3].id set from block 15 16 15 Items[3].id
execute as @e[tag=head,scores={id=5}] at @s positioned ~ ~-1 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,distance=..0.1] ArmorItems[3].id set from block 15 16 15 Items[4].id
execute as @e[tag=head,scores={id=6}] at @s positioned ~ ~-1 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,distance=..0.1] ArmorItems[3].id set from block 15 16 15 Items[5].id

#y le da la vida (longevidad) adecuada
execute as @e[tag=head] at @s positioned ~ ~-1 ~ run scoreboard players operation @e[type=minecraft:armor_stand,limit=1,distance=..0.1] score = @s score


#recoge la cola
kill @e[tag=body,scores={score=..0}]


#death consecuences
#execute as @a[scores={alive=0}] run function snake:death



#se embucla
execute if entity @a[scores={alive=1}] run schedule function snake:movimiento 8
