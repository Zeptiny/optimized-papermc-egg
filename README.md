# This egg is still in development, DO NOT USE IN PRODUCTION!

# What this egg does

This egg ains to give 3 different tiers of optimization, all of them were based from https://github.com/YouHaveTrouble/minecraft-optimization and https://paper-chan.moe/paper-optimization/


## Startup
```java -Xms$(({{SERVER_MEMORY}} - ({{SERVER_MEMORY}}/5)))M -Xmx$(({{SERVER_MEMORY}} - ({{SERVER_MEMORY}}/5)))M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar {{SERVER_JARFILE}}```
Basically, this startup is from https://docs.papermc.io/paper/aikars-flags, starting with 80% os the max server memory (Due to memory overhead)


## Basic

This tier give some basic optimization, not changing much gameplay and not giving any breaking changes.
Ticks-per mob spawn were increased 10 times from vanilla levels, this big change isn't expected to give much difference in gameplay.
Merge-radius of both exp and items were increased, view distanced decreased to 8 and simulation to 7, entity activation range increased slightly.
Monster density is expected to be about 80% from vanilla level, other mobs were decreased, but without much affect to gameplay.

## Advanced

This tier gives a more abrupt optimization, changing the gameplay a little, but still not having any breaking element on gameplay.
Ticks-per mob sawn were increased, and merge radius, monster density is expected to be about 50% from vanilla levels, other mobs were decreased, may affect gameplay.

## Complete

This tier doesn't changes a lot from advanced, with the exception of game breaking mechanics, such as:
* Armor stands doesn't tick
* Max entity collision is decreased to 4
* Treasure maps were disabled
* Hopper move event were disabled, and they ignore ocluding blocks

Specific changes can be seen on the files of each tier, the only configuration on the file is what was changed, Paper will take care to update the configuration to newer versions and add the rest of it.