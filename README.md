# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

# ⚠⚠⚠ WIP ⚠⚠⚠ mod-brawlers-guild ⚠⚠⚠ WIP ⚠⚠⚠

## Description

Adds [Mist of Pandaria's Brawler's Guild](https://wowpedia.fandom.com/wiki/Brawler%27s_Guild) to AzerothCore.


## How to use ingame (Horde only for now)

- .go c id 60000

## Installation

```
1) Simply place the module under the `modules` directory of your AzerothCore source. 
2) Import the SQL(s) manually to the right Database (auth, world or characters) or with the `db_assembler.sh`.
3) Re-run cmake and launch a clean build of AzerothCore.
```

## Edit module configuration (optional)

If you need to change the module configuration, go to your server configuration folder (where your `worldserver` or `worldserver.exe` is), copy `modarenatop.conf.dist` to `modarenatop.conf` and edit that new file.

## Edit shop configuration

In `npc_brawlers_guild.cpp` look for "Shop", there you can edit prices, items and required rank for every item.

## Seasons Information (more soon ™)

### Season 1

- Pre Tier 7 - average iLvL 200

## Credits

* [Avarishd](https://github.com/avarishd) - Discord

AzerothCore: [repository](https://github.com/azerothcore) - [website](http://azerothcore.org/) - [discord chat community](https://discord.gg/PaqQRkd)
