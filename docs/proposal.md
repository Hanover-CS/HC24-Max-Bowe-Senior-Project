<link href="/retro.css" rel="stylesheet">

# Planet Crash: a top-down roguelike fighting game # 

## The Idea ##
**A top-down roguelite that has an emphasis on fighting, has separate regions you can travel to.** Online multiplayer would be ideal, probably P2P. There would be progression for the character outside of the main gameplay loop.
**That loop would consist of traveling to a specific area on the region map, then navigating each area until you reach a boss zone. Each region map would be a grid which would be nondescript at the beginning of a playthrough, then would provide
more information as you move from tile(area) to tile. The goal is to visit tiles that have items to earn before tackling a boss area, in order to make that fight easier.** There could be some sort of indicator that tells you 
how close you are to a boss zone(although this might be better as a semi-common item). Non-boss tiles could have item pickups, mystery events that could give you positive or negative effects, or treasure hordes that would add 
to your overall coin count which would carry over across runs. **The player character is an alien, visiting different planets(the regions), rocketing down to whichever tile you pick at the start of a run. You finish 
a planet by beating the boss. If you die, your run is over.** Each planet would have its own unique creatures and environments, and I would try to avoid making each tile seem identical by varying the fighting styles of different creatures in 
different areas. I would most likely utilize pixel art to make the sprites and game world. For the player character, I would like to add a light character creator, allowing you to change gender, hairstyle and hair color, and some other minor cosmetics. I'm undecided on whether the character will resemble a human or some alien being. Before each run, you would choose a certain class, each giving you access to a unique weapon and ability. 

## What My Goal is for Demo Day ##
**I would like to at least have the planet selector screen, tile selector screen, and basic fight scene accomplished by demo day. This would require that I get at least basic combat down, as well as some variety of enemies and levels.**

## Engine ##
Over the summer, I looked into several game engines, but **[Godot](#godot) seemed to stick out as a fairly intuitive option.** It's open-source, using C++, C#, and it's native GDScript. **You build 2D and 3D games using a hierarchy of nodes, organized inside of reusable scenes.** Halls of Torment was built on Godot, which is partially why I was drawn to it.

I considered other options as well. Firstly, I looked at **[Unity](#unity), which is effective at creating both 2D and 3D games. It has an intuitive interface that makes development much nicer. I have tried using before, however, and it seemed too bulky for the game that I wanted to make, so I looked elsewhere.** Another option was the **[Unreal Engine](#unreal), which has grown prominent in the industry due to its ability to create extremely good looking 3D graphics. This, again, seemed like it was too bulky for my 2D game, so I opted for Godot due to its lightweight nature and node-based development system.**

## Similar Games ##
### Vampire Survivors, Halls of Torment, Enter The Gungeon, Binding of Isaac ###

- [Vampire Survivors](#survivors) allows you to choose from a number of characters who each possess a different buff and weapon. **From there, you choose a level and play it until the timer runs out(a win) or you die. The main difference between 
        my game and this one is the area traversal. In Vampire Survivors, you just play a specific zone until you die or win, as opposed to my game's planet grid, which will have varied areas on each planet, each area's map 
        being significantly smaller than any in Vampire Survivors.** On top of that, Vampire Survivors has specific characters to choose from, no character creation. I will try to borrow it's player upgrade system, which uses money 
        earned in runs to permanently upgrade your stats. 
        
- [Halls of Torment](#halls) is very similar to Vampire Survivors, just with a Diablo 2-inspired style. It differs mainly in its gear collection system. The player character has armor slots for the chest, head, hands, legs, and feet. 
        Armor pieces can provide defensive bonuses, as well as other buffs. You can permanantly collect these pieces by finding them in a level, then delivering them to a wellkeeper who will allow you to purchase them for use in 
        other runs.**Again, the main difference of my game is the area traversal, Halls of Torment is very similar to Vampire Survivors in this respect.**
        
- [Enter The Gungeon](#gungeon) and [Binding of Isaac](#isaac)  are very similar in many ways. **They both have procedurally generated floors that you complete by beating a boss, and items to find or buy on each level. There are a variety of rooms on each level, some hidden.** Both have similar health indicators, with a variety of health items to pick up that affect the player in different ways. Isaac has more varied enemy types, while Enter The Gungeon is focused on acquiring different guns, it also gives the ability to dodge roll.

## References ##

- <a name="godot"></a>https://godotengine.org Manzur A., Linietsky J. (2014). Godot Engine. Open Source/Godot

- <a name="unity"></a>https://unity.com Unity Technologies. (2005). Unity. Unity Technologies 

- <a name="unreal"></a>https://unrealengine.com Sweeney T., Epic Games. (1998). Unreal Engine. Epic Games

- <a name="survivors"></a>https://vampire-survivors.fandom.com/wiki/Vampire_Survivors_Wiki Vampire Survivors(2022). PC. Luca Galante.

- <a name="halls"></a>https://www.chasing-carrots.com/halls-of-torment/ Halls of Torment(Early Access, 2022). PC. Chasing Carrots.

- <a name="gungeon"></a>https://enterthegungeon.com Enter The Gungeon(2016). PC. Devolver Digital.

- <a name="isaac"></a>https://www.nicalis.com/games/thebindingofisaacrepentance The Binding of Isaac: Repentance(2021). PC. Nicalis.
        
