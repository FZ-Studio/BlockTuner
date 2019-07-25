#Get previous output state
execute store result score Global _bt_output_state run gamerule sendCommandFeedback

#Disable outbut
gamerule sendCommandFeedback false

#Pointer
tag @s add bt_tuner
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[bt_pointer]}
execute store result entity @e[tag=bt_pointer,limit=1] Pos[0] double 1 run scoreboard players get @p[tag=bt_tuner] _bt_x
execute store result entity @e[tag=bt_pointer,limit=1] Pos[1] double 1 run scoreboard players get @p[tag=bt_tuner] _bt_y
execute store result entity @e[tag=bt_pointer,limit=1] Pos[2] double 1 run scoreboard players get @p[tag=bt_tuner] _bt_z

#Detect block change in multyplayer. When no longer note block, stop the process
execute as @e[tag=bt_pointer] at @s unless block ~ ~ ~ minecraft:note_block run kill @s
