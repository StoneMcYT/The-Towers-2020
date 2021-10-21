# HOE OF RUSH

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_hoe",tag:{Tags:"weapon1"}}}] run effect give @s minecraft:glowing 10 0 true

# SHOVEL OF HELL

execute if score fireball_cd_blue TickCount matches 1..1 at @a[team=blue_team,nbt={SelectedItem:{id:"minecraft:golden_shovel",tag:{Tags:"weapon2"}}}] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5
execute if score fireball_cd_blue TickCount matches 0..0 at @a[team=blue_team,nbt={SelectedItem:{id:"minecraft:golden_shovel",tag:{Tags:"weapon2"}}}] run particle minecraft:flame ~ ~ ~ 1 1 1 0.01 1
execute if score fireball_cd_red TickCount matches 1..1 at @a[team=red_team,nbt={SelectedItem:{id:"minecraft:golden_shovel",tag:{Tags:"weapon2"}}}] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5
execute if score fireball_cd_red TickCount matches 0..0 at @a[team=red_team,nbt={SelectedItem:{id:"minecraft:golden_shovel",tag:{Tags:"weapon2"}}}] run particle minecraft:flame ~ ~ ~ 1 1 1 0.01 1
execute if score fireball_cd_blue TickCount matches 1.. run scoreboard players remove fireball_cd_blue TickCount 1
execute if score fireball_cd_red TickCount matches 1.. run scoreboard players remove fireball_cd_red TickCount 1
execute as @a[scores={sneak=0,sneak_counter=80..}] if score @s sneak_counter matches 80.. run scoreboard players set @s throw_fb 1
execute as @a[team=blue_team,scores={throw_fb=1}] run scoreboard players set fireball_cd_blue TickCount 900
execute as @a[team=red_team,scores={throw_fb=1}] run scoreboard players set fireball_cd_red TickCount 900
execute at @a[scores={throw_fb=1}] run playsound minecraft:entity.ghast.shoot master @a ~ ~ ~ 1
execute as @a[scores={throw_fb=1}] run function tt:throw_fireball
# Sneak
execute as @a if score @s sneak matches 0..0 run scoreboard players reset @s sneak_counter
execute as @a if score @s sneak matches 1.. run scoreboard players add @s sneak_counter 1
execute as @a unless entity @s[nbt={SelectedItem:{id:"minecraft:golden_shovel",tag:{Tags:"weapon2"}}}] run scoreboard players reset @s sneak_counter
scoreboard players set @a sneak 0
execute as @a unless score @s sneak_counter matches 1.. run stopsound @s * minecraft:block.portal.trigger
execute if score fireball_cd_blue TickCount matches 1.. run scoreboard players reset @a[team=blue_team] sneak_counter
execute if score fireball_cd_red TickCount matches 1.. run scoreboard players reset @a[team=red_team] sneak_counter
execute at @e[type=fireball] run particle minecraft:flame ~ ~ ~ 0 0 0 0.05 20 force
# Sounds
execute at @a[scores={sneak_counter=20}] run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 0.7 1.25
execute at @a[scores={sneak_counter=80}] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.3
execute at @a[scores={sneak_counter=81}] run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.5
# Particles
execute at @a[scores={sneak_counter=10..}] run particle minecraft:lava ~ ~ ~ 1 1 1 0.2 1
# Bossbar
execute store result bossbar tt:shovel_blue value run scoreboard players get fireball_cd_blue TickCount
execute store result bossbar tt:shovel_red value run scoreboard players get fireball_cd_red TickCount
execute if score fireball_cd_blue TickCount matches 1.. run bossbar set tt:shovel_blue players @a[team=blue_team,nbt={SelectedItem:{id:"minecraft:golden_shovel",tag:{Tags:"weapon2"}}}]
execute if score fireball_cd_red TickCount matches 1.. run bossbar set tt:shovel_red players @a[team=red_team,nbt={SelectedItem:{id:"minecraft:golden_shovel",tag:{Tags:"weapon2"}}}]
execute if score fireball_cd_blue TickCount matches 1..1 run bossbar set tt:shovel_blue players
execute if score fireball_cd_red TickCount matches 1..1 run bossbar set tt:shovel_red players

#
