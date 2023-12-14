# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

# ⚠ WIP ⚠ mod-brawlers-guild ⚠ WIP ⚠

## Description

Adds [Mist of Pandaria's Brawler's Guild](https://wowpedia.fandom.com/wiki/Brawler%27s_Guild) to [AzerothCore](http://azerothcore.org/).

<p>
<img src="https://i.imgur.com/aPhT0Oo.jpg" alt="The Obsidian Sanctum" width=35%/>
</p>

## How to use ingame (Horde only)

- .go c id 60000 Everything else is self explanatory.

## Installation

```
1) Simply place the module under the `modules` directory of your AzerothCore source. 
2) Import the SQL(s) manually to the right Database (auth, world or characters) or with the `db_assembler.sh`.
3) Re-run cmake and launch a clean build of AzerothCore.
```

### Season tuning information

- Season 1 - Tier 7 &nbsp; (213~)
- Season 2 - Tier 8 &nbsp; (232~)
- Season 3 - Tier 9 &nbsp; (245~)
- Season 4 - Tier 10 (264~)

(Item level is based on the highest obtainable gear from 10m)
## Edit module configuration (optional)

If you need to change the module configuration, go to your server configuration folder (where your `worldserver` or `worldserver.exe` is), copy `modarenatop.conf.dist` to `modarenatop.conf` and edit that new file.

## Edit shop configuration

In `npc_brawlers_guild.cpp` look for "Shop", there you can edit prices, items and required rank for every item.

## Credits
Avarishd: [GitHub](https://github.com/avarishd) [Discord](https://discordapp.com/users/125563894310633472)

AzerothCore: [GitHub Repository](https://github.com/azerothcore) [Website](http://azerothcore.org/) [Discord](https://discord.gg/PaqQRkd)
