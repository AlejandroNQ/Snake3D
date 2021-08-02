#dircheck
execute as @e[tag=fixed] at @s as @a[distance=..3.99] unless score @s prevdir = @e[tag=fixed,limit=1,sort=nearest] id run scoreboard players operation @s dir = @e[tag=fixed,limit=1,sort=nearest] dir
execute as @e[tag=fixed] at @s as @a[scores={alive=1},distance=..3.99] run tp @s 8.0 24.0 8.0
execute as @e[tag=head] at @s as @a if score @s id = @e[tag=head,limit=1,sort=nearest] id run scoreboard players operation @e[tag=head,limit=1,sort=nearest] dir = @s dir
