# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

## Description

Adds [Mist of Pandaria's Brawler's Guild](https://wowpedia.fandom.com/wiki/Brawler%27s_Guild) to [AzerothCore](http://azerothcore.org/).

<p>
<img src="https://i.imgur.com/aPhT0Oo.jpg" alt="The Brawler's Guild" width=35%/>
</p>


> [!IMPORTANT]
> Requires at least AzerothCore commit [d6d49a9](https://github.com/azerothcore/azerothcore-wotlk/commit/d6d49a9e45e5eb59e06fe14d7e4107015fcc0e0e).
## How to use ingame (Horde only)

- .tele ringofvalor

## Description

The Brawler's Guild is an organization that arranges one on one battles between willing combatants, captured monsters, and other participants in gladiatorial combat. Being a neutral organization, only members of the Horde are allowed to enter, rising through the Brawler's Guild ranks with more wins. Prizes are awarded at higher ranks. The fights are all solo PvE matches in which the players must adapt and use different strategies depending on which opponent they are currently facing, making the Brawler's Guild one of the most challenging PvE activities a player can attempt on their own.

### Season tuning information

- Season 1 - Tier 7 &nbsp; (213~)
- Season 2 - Tier 8 &nbsp; (232~)
- Season 3 - Tier 9 &nbsp; (245~)
- Season 4 - Tier 10 (264~)

(Item level is based on the highest obtainable gear from 10m)

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

## Credits
Avarishd: [GitHub](https://github.com/avarishd) [Discord](https://discordapp.com/users/125563894310633472)

AzerothCore: [GitHub Repository](https://github.com/azerothcore) [Website](http://azerothcore.org/) [Discord](https://discord.gg/PaqQRkd)
