kill @e[type=!player]
effect give @a minecraft:night_vision 36000 1 true
fill -1 15 -1 16 32 16 minecraft:white_concrete hollow
#fill -1 15 -1 16 32 16 minecraft:polished_diorite hollow
setblock 15 15 15 minecraft:barrel[facing=up]{CustomName:'{"text":"SNAKE COLOR"}',Items:[{Slot: 0, id:"minecraft:red_concrete",Count:1},{Slot: 1, id:"minecraft:lime_concrete",Count:1},{Slot: 2, id:"minecraft:blue_concrete",Count:1},{Slot: 3, id:"minecraft:orange_concrete",Count:1},{Slot: 4, id:"minecraft:magenta_concrete",Count:1},{Slot: 5, id:"minecraft:light_blue_concrete",Count:1}]} replace

summon minecraft:area_effect_cloud 12.0 24 8.0 {Duration:2000000,Tags:[fixed,posX]}
summon minecraft:area_effect_cloud 4.0 24 8.0 {Duration:2000000,Tags:[fixed,negX]}
summon minecraft:area_effect_cloud 8.0 28 8.0 {Duration:2000000,Tags:[fixed,posY]}
summon minecraft:area_effect_cloud 8.0 20 8.0 {Duration:2000000,Tags:[fixed,negY]}
summon minecraft:area_effect_cloud 8.0 24 12.0 {Duration:2000000,Tags:[fixed,posZ]}
summon minecraft:area_effect_cloud 8.0 24 4.0 {Duration:2000000,Tags:[fixed,negZ]}

#direction
scoreboard players set @e[tag=posX] dir 1
scoreboard players set @e[tag=negX] dir 2
scoreboard players set @e[tag=posY] dir 3
scoreboard players set @e[tag=negY] dir 4
scoreboard players set @e[tag=posZ] dir 5
scoreboard players set @e[tag=negZ] dir 6
#inverse direction (used in dircheck so snakes can't go backwards)
scoreboard players set @e[tag=posX] id 2
scoreboard players set @e[tag=negX] id 1
scoreboard players set @e[tag=posY] id 4
scoreboard players set @e[tag=negY] id 3
scoreboard players set @e[tag=posZ] id 6
scoreboard players set @e[tag=negZ] id 5


#puntuacion (y longitud de su serpiente)
scoreboard objectives add score dummy "SCORE"

#numero del jugador
scoreboard objectives add id dummy "PLAYER"
scoreboard objectives setdisplay list id

#direccion para las serpientes
scoreboard objectives add dir dummy "DIRECTION"

#direccion previa para las serpientes (para evitar ir de espaldas)
scoreboard objectives add prevdir dummy "PREVIOUS DIRECTION"

#
scoreboard objectives add alive dummy


title @a times 2 16 2


function snake:newgame