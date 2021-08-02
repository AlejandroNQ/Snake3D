scoreboard players set #one id 1
execute store result bossbar snake:timer value if score #timer id < #time id run scoreboard players operation #timer id += #one id

execute if score #timer id < #time id run schedule function snake:timer 1

execute unless score #timer id < #time id run bossbar set snake:timer visible false
