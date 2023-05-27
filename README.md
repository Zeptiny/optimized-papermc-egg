# This egg is still in development, DO NOT USE IN PRODUCTION!

# What this egg does

It is a direct fork of the Paper egg from parkervcp.
This egg ains to give 3 different tiers of optimization, all of them were based from https://github.com/YouHaveTrouble/minecraft-optimization and https://paper-chan.moe/paper-optimization/

Readme in development

TO-DO:
* README

Basic:
* spigot.yml

Advanced:
* spigot.yml

Complete:
* spigot.yml

## Basic

This tier give some basic optimization, not changing much gameplay and not giving any breaking changed on gameplay.
Ticks-per mob spawn were increased 10 times from vanilla levels, this big change isn't expected to give much difference in gameplay.
Merge-radius of both exp and items were increased, view distanced decreased to 8 and simulation to 7, entity activation range increased slightly.
Monster density is expected to be about 80% from vanilla level, other mobs were decreased, but without much affect to gameplay.

## Advanced

This tier gives a more abrupt optimization, changing the gameplay a littly, but still not having any breaking element on gameplay.
Ticks-per mob sawn were increased, and merge radius, monster density is expected to be about 50% from vanilla levels, other mobs were decreased, may affect gameplay.

## Complete

This tier doesn't changes a lot from advanced, with the exception of game breaking mechanics, such as:
Armor stands doesn't tick
Max entity collision is decreased to 4
Treasure maps were disabled
Hopper move event were disabled, and they ignore ocluding blocks