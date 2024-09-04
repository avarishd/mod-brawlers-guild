#include <sstream>
#include <string.h>
#include "Configuration/Config.h"
#include "ObjectMgr.h"
#include "CreatureScript.h"
#include "Chat.h"
#include "GameObjectAI.h"
#include "GameObjectScript.h"
#include "PassiveAI.h"
#include "ScriptMgr.h"
#include "ScriptedGossip.h"
#include "ScriptedCreature.h"
#include "World.h"
#include "Player.h"
#include "Chat.h"

/* TODO
Teleport player's pet too
Correct tuning (requires testing with proper ilvl) (After all creatures for s1 are done (+ rares))
More scripted fights (outside of SAI)
Custom area fights (e.g void zones closing in the arena)
Seasons
*/

bool BrawlersGuild_Enabled;
bool BrawlersGuild_AnnounceModule;
bool BrawlersGuild_Gambler;
uint8 BrawlersGuild_CurrentSeason;

class BrawlersGuild_conf : public WorldScript
{
public:
    BrawlersGuild_conf() : WorldScript("BrawlersGuild_conf") { }

    void OnBeforeConfigLoad(bool /*reload*/) override
    {
        BrawlersGuild_Enabled        = sConfigMgr->GetOption<bool>("BrawlersGuild.Enabled", true);
        BrawlersGuild_AnnounceModule = sConfigMgr->GetOption<bool>("BrawlersGuild.Announce", true);
        BrawlersGuild_Gambler        = sConfigMgr->GetOption<bool>("BrawlersGuild.Gambler", true);
        BrawlersGuild_CurrentSeason  = 1; //sConfigMgr->GetOption<uint8>("BrawlersGuild.CurrentSeason", 1);

        /*
        if (BrawlersGuild_CurrentSeason < 1 || BrawlersGuild_CurrentSeason > 4)
        {
            LOG_ERROR("error", "Config BrawlersGuild.CurrentSeason has invalid value [{}].", BrawlersGuild_CurrentSeason);
            BrawlersGuild_Enabled = false;
        }
        */
    }
};

enum Crowd
{
    NPC_CROWD_ARENA_SPECTATOR   = 200004,
    NPC_CROWD_ARENA_SPECTATOR_2 = 200005,
};

enum BrawlersGuild 
{
    GOSSIP_HELLO            = 11201,
    QUEST_BRAWLERS_GUILD    = 90000,
    ITEM_BRAWLERS_GOLD      = 43003,

    NPC_RAT                 = 200002,
    NPC_BRAWLERS_GUILD      = 200000,
    NPC_TARGET_SELECTOR     = 200022,

    // Current Player
    ACTION_FIND_PLAYER = 1,
    EVENT_FIND_PLAYER = 2, // Move queue
    EVENT_START       = 3,
    EVENT_NOT_FOUND   = 4,
    ACTION_DEFEAT     = 7,

    // Other players
    ACTION_FIND_OTHER_PLAYERS   = 5,
    EVENT_FIND_OTHER_PLAYERS    = 6,

    // Arena Events
    EVENT_ARENA_UNKNOWN         = 20,

    // Crowd Events
    EVENT_LOAD_ARENA_OBJECTS    = 21,
    EVENT_CROWD_VICTORY         = 22,
    EVENT_CROWD_DEFEAT          = 23,

    // Gambler
    EVENT_GAMBLER_CLOSE_BETTING = 24,


    // Helix
    MY_RANK         = 10,
    ADD_TO_QUEUE    = 11,
    TOP_15          = 12,
    GOODBYE         = 13,
    DEL_FROM_QUEUE  = 14,

    // Gambler
    BET_FOR         = 30,
    BET_AGAINST     = 31,

    SPELL_QUEUE_COOLDOWN = 200001,
    SPELL_CHEAP_SHOT     = 30986,
    SOUND_STEALTH        = 3325,
    SPELL_MARKER         = 42171, // Red Arrow marker
    SPELL_GREEN_MARKER   = 75779  // Green Arrow Marker
};

enum ArenaObjects
{
    //GO_ARENA_PILLAR     = 900002,
    //GO_FROST_TRAP       = 202106,

    NPC_FIREWORK_TONK   = 200006, // Firework on Victory. // Fire(cosmetic) 46679, 51195
    NPC_ARENA_ANNOUNCER = 200007,
    NPC_ARENA_GAMBLER   = 200008
};

enum Announcer
{
    ACTION_ANNOUNCE_VICTORY      = 1,
    ACTION_ANNOUNCE_DEFEAT_TIME  = 2,
    ACTION_ANNOUNCE_DEFEAT_DEATH = 3
};

const Position goArenaPillar[6] =
{
    {2192.73f, -4764.74f, 55.13f},
    {2174.02f, -4754.84f, 55.13f},
    {2175.51f, -4771.19f, 55.13f},
    {2183.32f, -4752.23f, 55.13f},
    {2186.81f, -4778.53f, 55.13f},
    {2166.56f, -4763.95f, 55.13f}
};

std::vector<Position> goFrostTrap =
{
    {2191.561f, -4758.389f, 55.13f},
    {2192.785f, -4772.621f, 55.13f},
    {2187.672f, -4778.614f, 55.13f},
    {2180.190f, -4782.718f, 55.13f},
    {2170.234f, -4775.148f, 55.13f},
    {2163.880f, -4767.833f, 55.13f},
    {2166.656f, -4756.252f, 55.13f},
    {2176.379f, -4750.622f, 55.13f},
    {2175.636f, -4758.154f, 55.13f}
};

// Player queue list
std::list<Player*> queueList;

// Crowd list
std::list<Creature*> spectatorList;

// Firework tonks list
std::list<Creature*> fireworkList;

// Gambler - Bet FOR
std::list<Player*> betFor;

// Gambler - Bet AGAINST
std::list<Player*> betAgainst;

// Crowd emotes
const uint32 crowdEmotes[5] = {75, 11, 4, 18, 5};
// Crowd Cheer sounds
const uint32 crowdCheer[4] = {8571, 8572, 8573, 8574};

// The current player that is about to/already fighting in the arena.
Player* CurrentPlayer = nullptr;

// Teleport position when starting
const Position playerSpawnPos = {2194.21f, -4751.58f, 55.13f, 3.83f};

// Reset position
const Position playerResetPos = {2208.17f, -4778.42f, 65.41f, 3.1f};

// Arena mobs spawn position.
const Position spawnPos = {2172, -4786, 55.13f, 1.15f};

// [Season][Rank][Creature]
const uint32 Rank[1][8][4] =
{
    // Season 1
    {
        // Rank 1 - Bob, Smiley, Dungeon Master Billey, Zerg
        {200100, 200101, 200102, 200103},
        // Rank 2 - Electrified Golem, Bomb Bot, Projection Unit (+pets), King Dash
        {200104, 200105, 200106 /*200107*/, 200108},
        // Rank 3 - Mazhareen, Gorenog, Darkfeather, Ming Li
        {200109, 200110, 200111, 200112},
        // Rank 4 - Crash, Illaria the Illusionist (+pets), Circuitron, Terror
        {200113, 200114 /*200115*/, 200116, 200117},
        // Rank 5 - Shadowthorn, Leper Gnome Quin, Darkfang (+pets), Klunk
        {200118, 200119, 200120 /*200121*/, 200122},
        // Rank 6 - Shortneck, Shadowfeather (+pets), Scaleslash, Carl
        {200123, 200124 /*200125*/, 200126, 200127},
        // Rank 7 - Springcoil (+ Gadgetclank + pets), Boltstrike (+pets), Tyson Sanders (+pets), T800 Multi-Mode Robot
        {200128 /*200129, 200130*/, 200131 /*200132*/, 200133 /*200134*/, 200135},
        // Rank 8 - Lord Nelly (+pets), Karsh, Rom'ogg Bonecrusher (+pets), Deathstealer (+pets)
        {200136 /*200137*/, 200138, 200139 /*200140*/, 200141 /*200142*/},
    },

    /*
    // Season 2 NYI
    {
        {60011, 60012, 60013, 60014},
        {60011, 60012, 60013, 60014},
        {60011, 60012, 60013, 60014},
        {60011, 60012, 60013, 60014},
        {60011, 60012, 60013, 60014},
        {60011, 60012, 60013, 60014},
        {60011, 60012, 60013, 60014},
        {60011, 60012, 60013, 60014},
    }
    */
};

/*
// [Season][Creature] - Class fights, buffed each 5 ranks
const uint32 RankRare[2][10]
{
    // Season 1
    {},
    
    // Season 2
    {},
};
*/

// https://github.com/azerothcore/azerothcore-wotlk/blob/master/src/server/game/Scripting/ScriptMgr.h
class BrawlersGuild_Announce : public PlayerScript
{
public:

    BrawlersGuild_Announce() : PlayerScript("BrawlersGuild_Announce") {}

    // Announce Module
    void OnLogin(Player* player) override
    {
        if (BrawlersGuild_AnnounceModule)
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cffe67b09Brawlers Guild|r module.");
        }
    }

    // Remove players that join group activities or logout
    void OnQueueRandomDungeon(Player* player, uint32 & rDungeonId) override
    {
        if (BrawlersGuild_Enabled && CurrentPlayer)
        {
            for (Player* p : queueList)
            {
                if (p == player)
                {
                    queueList.remove(player);
                    ChatHandler(player->GetSession()).SendNotification("You have been removed from the queue.");
                    player->CastSpell(player, SPELL_QUEUE_COOLDOWN, true); // 60 second cooldown to prevent queue abuse.
                    break;
                }
            }
        }
    }

    void OnAddToBattleground(Player* player, Battleground* bg) override
    {
        if (BrawlersGuild_Enabled && CurrentPlayer)
        {
            for (Player* p : queueList)
            {
                if (p == player)
                {
                    queueList.remove(player);
                    ChatHandler(player->GetSession()).SendNotification("You have been removed from the queue.");
                    player->CastSpell(player, SPELL_QUEUE_COOLDOWN, true); // 60 second cooldown to prevent queue abuse.
                    break;
                }
            }
        }
    }
    
    void OnLogout(Player* player) override
    {
        if (BrawlersGuild_Enabled && CurrentPlayer)
        {
            for (Player* p : queueList)
            {
                if (p == player)
                {
                    queueList.remove(player);
                    break;
                }
            }
        }
    }

    void OnPlayerJoinBG(Player* player) override
    {
        if (BrawlersGuild_Enabled && CurrentPlayer)
        {
            for (Player* p : queueList)
            {
                if (p == player)
                {
                    queueList.remove(player);
                    ChatHandler(player->GetSession()).SendNotification("You have been removed from the queue.");
                    player->CastSpell(player, SPELL_QUEUE_COOLDOWN, true); // 60 second cooldown to prevent queue abuse.
                    break;
                }
            }
        }
    }

    // On Player Death, checks only for the CurrentPlayer.
    void OnPlayerJustDied(Player* player) override
    {
        if (BrawlersGuild_Enabled && CurrentPlayer && player == CurrentPlayer)
        {
            uint32 mapId  = player->GetMapId();
            uint32 areaId = player->GetAreaId();

            // Check only for Kalimdor, Orgrimmar /// @TOOD: Find a way to get subzone name (e.g "Ring of Valor")
            if (mapId == 1 && areaId == 1637)
            {
                float z = player->GetPositionZ();

                // Center of the arena and ground elevation + jump Z.
                if (player->IsInRange2d(2178.2f, -4764.79f, 0, 30.0f) && (z >= 55.0f && z <= 57.0f))
                {
                    if (Creature* t = player->FindNearestCreature(NPC_TARGET_SELECTOR, 30))
                    {
                        t->AI()->DoAction(ACTION_DEFEAT);
                    }
                }
            }
        }
    }
};

class npc_brawlers_guild : public CreatureScript
{
public:
    npc_brawlers_guild() : CreatureScript("npc_brawlers_guild") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_BRAWLERS_GUILD) == QUEST_STATUS_REWARDED)
        {
            if (BrawlersGuild_Enabled)
            {
                if (!player->HasAura(SPELL_QUEUE_COOLDOWN))
                {
                    // Check if player is not in the queue.
                    if ((std::find(queueList.begin(), queueList.end(), player) == queueList.end()))
                    {
                        // Do not allow to queue if at rank 0. (Require to buy X from shop to restore rank to 1.)
                        QueryResult result = CharacterDatabase.Query("SELECT `Rank` FROM `brawlersguild` WHERE `CharacterGUID` = '{}';", player->GetGUID().GetCounter());
                        if (result)
                        {
                            Field *fields = result->Fetch();
                            uint32 rank = fields[0].Get<uint32>();
                            if (rank != 0)
                            {
                                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Sign me up for a fight!", GOSSIP_SENDER_MAIN, ADD_TO_QUEUE);
                            }
                            else
                            {
                                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "You cannot queue at rank 0, visit the shop to learn more!", GOSSIP_SENDER_MAIN, 0);
                            }
                        }
                    }
                    // Already in queue,
                    else
                    {
                        AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Remove me from the queue!", GOSSIP_SENDER_MAIN, DEL_FROM_QUEUE);
                    }
                }
                else
                {
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "You will be allowed to queue in 1 minute.", GOSSIP_SENDER_MAIN, 0);
                }
            }
            else
            {
                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Queue is currently disabled.", GOSSIP_SENDER_MAIN, 0);
            }

            // Queue size
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "-----------------", GOSSIP_SENDER_MAIN, 0);
            std::stringstream size;
            size << "Current queue size: " << queueList.size();
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, size.str(), GOSSIP_SENDER_MAIN, 0);
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "-----------------", GOSSIP_SENDER_MAIN, 0);

            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "What is my current rank progress?", GOSSIP_SENDER_MAIN, MY_RANK);
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Show me top 15!", GOSSIP_SENDER_MAIN, TOP_15);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "I am at the wrong place.", GOSSIP_SENDER_MAIN, GOODBYE);
        }
        SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* player, Creature*  creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);

        if (action == ADD_TO_QUEUE)
        {
            if (player->ToPlayer())
            {
                queueList.push_back(player);
                ChatHandler(player->GetSession()).SendNotification("You have been added to the queue.");

                if (Creature* t = creature->FindNearestCreature(NPC_TARGET_SELECTOR, 40))
                {
                    t->AI()->DoAction(ACTION_FIND_PLAYER);
                }
            }

        CloseGossipMenuFor(player);
        }

        if (action == DEL_FROM_QUEUE)
        {
            if (player->ToPlayer())
            {
                queueList.remove(player);
                ChatHandler(player->GetSession()).SendNotification("You have been removed from the queue.");
                player->CastSpell(player, SPELL_QUEUE_COOLDOWN, true); // 60 second cooldown to prevent queue abuse.
            }

        CloseGossipMenuFor(player);
        }

        if (action == MY_RANK)
        {
            QueryResult result = CharacterDatabase.Query("SELECT `Rank`, `Progress` FROM `brawlersguild` WHERE `CharacterGUID` = '{}'", player->GetGUID().GetCounter());
            if (!result)
            {
                AddGossipItemFor(player, GOSSIP_ICON_CHAT, "You are currently unranked.", GOSSIP_SENDER_MAIN, GOODBYE);
                SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
            }
            else
            {
                Field *fields = result->Fetch();
                std::string rank = fields[0].Get<std::string>();
                std::string progress = fields[1].Get<std::string>();
                uint32 reqprogress = sConfigMgr->GetOption<uint32>("BrawlersGuild.RankRequired", 10);

                std::stringstream buf;
                buf << "Current rank: " << rank;

                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, buf.str(), GOSSIP_SENDER_MAIN, GOODBYE);
                buf.str("");
                buf << "Progress towards next rank: " << progress << " / " << reqprogress;
                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, buf.str(), GOSSIP_SENDER_MAIN, GOODBYE);
                SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
            }
        }

        if (action == TOP_15)
        {
            QueryResult result = CharacterDatabase.Query("SELECT `CharacterGUID`, `Rank` FROM `brawlersguild` ORDER BY `Rank` DESC LIMIT 15");
            if (!result)
            {
                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Position - Name - Rank", GOSSIP_SENDER_MAIN, GOODBYE);
                AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Leaderboard is empty.", GOSSIP_SENDER_MAIN, GOODBYE);
                SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
            }
            else
            {
                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Position - Name - Rank", GOSSIP_SENDER_MAIN, GOODBYE);
                uint32 top = 1;
                do {
                    Field *fields = result->Fetch();
                    ObjectGuid pguid = ObjectGuid::Create<HighGuid::Player>((*result)[0].Get<uint32>());
                    std::string rank = fields[1].Get<std::string>();

                    std::string playername;
                    sCharacterCache->GetCharacterNameByGuid(pguid, playername);

                    std::stringstream buffer;
                    buffer << top << ". [" << playername << "]  - " << rank;

                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, buffer.str(), GOSSIP_SENDER_MAIN, GOODBYE);

                    top++;
                } while(result->NextRow());
            }
            SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
        }

        if (action == GOODBYE)
        {
            CloseGossipMenuFor(player);
        }

    return true;
    }

    bool OnQuestReward(Player* player, Creature* /*creature*/, const Quest* Quest, uint32 /*slot*/) override
    {
        if (Quest->GetQuestId() == QUEST_BRAWLERS_GUILD)
        {
            player->AddItem(ITEM_BRAWLERS_GOLD, sConfigMgr->GetOption<uint32>("BrawlersGuild.CoinsStartingQuestReward", 10));

            // Register player upon quest completion
            QueryResult result = CharacterDatabase.Query("SELECT `CharacterGUID` FROM `brawlersguild` WHERE `CharacterGUID` = '{}'", player->GetGUID().GetCounter());
            if (!result)
            {
                // Award 2 progress, in order to prevent instant downranking on first loss.
                // GUID, Progress, Rank
                CharacterDatabase.DirectExecute("REPLACE INTO `brawlersguild` (`CharacterGUID`, `Progress`, `Rank`) VALUES ('{}', '2', '1');", player->GetGUID().GetCounter());
            }
        }
        return false;
    }


    private:
        //bool ArenaActive = false;
};

class npc_player_detector : public CreatureScript
{
public:
    npc_player_detector() : CreatureScript("npc_player_detector") { }

    struct npc_player_detectorAI : public ScriptedAI
    {
        npc_player_detectorAI(Creature* creature) : ScriptedAI(creature), summons(me)
        {
            events.ScheduleEvent(EVENT_LOAD_ARENA_OBJECTS, 2s);
        }


    // Maybe add custom announcement per summon, maybe.
    void JustSummoned(Creature* cr) override
    {
        summons.Summon(cr);

        /* === [Core] Disabled due to creatures not pathing around objects. (Still blocks LoS though) ===

        // Arena Objects, automatically cleaned with creature despawn.
        if (cr->GetEntry() != 60015) // Exceptions for: Crash
        {
            uint8 rng = urand(0,5);
            float rngO = frand(0.0f, 2 * M_PI);
            cr->SummonGameObject(GO_ARENA_PILLAR, goArenaPillar[rng].GetPositionX(), goArenaPillar[rng].GetPositionY(), goArenaPillar[rng].GetPositionZ(), rngO, 0, 0, 0, 0, 0, false, GO_SUMMON_TIMED_OR_CORPSE_DESPAWN);
        }
        */

        /*
        // Summon Traps
        Acore::Containers::RandomShuffle(goFrostTrap); // Randomize every arena
        for (uint8 i = 0; i < urand(1,2); ++i)
        {
            cr->SummonGameObject(GO_FROST_TRAP, goFrostTrap[i].GetPositionX(), goFrostTrap[i].GetPositionY(), goFrostTrap[i].GetPositionZ(), 0, 0, 0, 0, 0, 0, false, GO_SUMMON_TIMED_OR_CORPSE_DESPAWN);
        }
        */
    }

    // Defeat by timing out.
    void SummonedCreatureDespawn(Creature* /*summon*/) override
    {
        if (CurrentPlayer && CurrentPlayer->IsAlive()) // Prevent double callback
        {
            Defeat(true);
        }
    }

    // We still lose if we evade the creature.
    void SummonedCreatureEvade(Creature* summon) override
    {
        summon->DespawnOrUnsummon();
    }

    // Victory by kill
    void SummonedCreatureDies(Creature* summon, Unit* /*killer*/)
    {
        if (CurrentPlayer)
        {
            Victory(CurrentPlayer);
            queueList.remove(CurrentPlayer);
            CurrentPlayer = nullptr;
            events.ScheduleEvent(EVENT_FIND_PLAYER, 2s);
        }

        if (summon)
        {
            summon->DespawnOrUnsummon();
        }
    }

    // Gambler - betFor & betAgainst
    void CalculateBets(bool outcome)
    {
        if (outcome) // Win
        {
            for (Player* player : betFor)
            {
                if (player)
                {
                    if (player->GetFreeInventorySpace())
                    {
                        ChatHandler(player->GetSession()).SendNotification("You've won your bet. (+5 Brawler's Gold)");
                        player->AddItem(ITEM_BRAWLERS_GOLD, 10);
                    }
                }
            }
            for (Player* player : betAgainst)
            {
                if (player)
                {
                    ChatHandler(player->GetSession()).SendNotification("You've lost your bet. (-5 Brawler's Gold)");
                }
            }
        }
        else // Lose
        {
            for (Player* player : betAgainst)
            {
                if (player)
                {
                    if (player->GetFreeInventorySpace())
                    {
                        ChatHandler(player->GetSession()).SendNotification("You've won your bet. (+5 Brawler's Gold)");
                        player->AddItem(ITEM_BRAWLERS_GOLD, 10);
                    }
                }
            }
            for (Player* player : betFor)
            {
                if (player)
                {
                    ChatHandler(player->GetSession()).SendNotification("You've lost your bet. (-5 Brawler's Gold)");
                }
            }
        }

        betFor.clear();
        betAgainst.clear();
    }

    // Rank Increase handler
    void Victory(Player* player)
    {
        if (player)
        {
            me->Whisper("Victory!", LANG_UNIVERSAL, player, true);
            player->AddItem(ITEM_BRAWLERS_GOLD, sConfigMgr->GetOption<uint32>("BrawlersGuild.CoinsVictoryReward", 2));
            player->NearTeleportTo(playerResetPos.GetPositionX(), playerResetPos.GetPositionY(), playerResetPos.GetPositionZ(), playerResetPos.GetOrientation());

            QueryResult result = CharacterDatabase.Query("SELECT `Rank`, `Progress` FROM `brawlersguild` WHERE `CharacterGUID` = '{}';", player->GetGUID().GetCounter());
            if (result)
            {
                Field *fields = result->Fetch();
                uint32 rank = fields[0].Get<uint32>();
                uint32 progress = fields[1].Get<uint32>();

                // Update Rank (and Progress) if we reach the threshold, progress always goes to 0.
                if (progress + sConfigMgr->GetOption<uint32>("BrawlersGuild.RankWin", 1) >= (sConfigMgr->GetOption<uint32>("BrawlersGuild.RankRequired", 10)))
                {
                    rank += 1;
                    std::stringstream rankup;
                    rankup << "You've reached Rank " << rank << "!";

                    me->Whisper(rankup.str(), LANG_UNIVERSAL, player, true);
                    CharacterDatabase.DirectExecute("UPDATE `brawlersguild` SET `Progress` = '0', `Rank` = '{}' WHERE `CharacterGUID` = '{}';", rank, player->GetGUID().GetCounter());
                }
                // Update Progress
                else
                {
                    progress += sConfigMgr->GetOption<uint32>("BrawlersGuild.RankWin", 1);
                    CharacterDatabase.DirectExecute("UPDATE `brawlersguild` SET `Progress` = '{}' WHERE `CharacterGUID` = '{}';", progress, player->GetGUID().GetCounter());
                }
            }

            if (Creature* ann = ObjectAccessor::GetCreature(*me, announcer))
            {
                ann->AI()->DoAction(ACTION_ANNOUNCE_VICTORY);
            }

            if (roll_chance_i(10))
                me->PlayRadiusSound(crowdCheer[urand(0,3)], 50);

            Firework();
            CrowdReaction();
            CalculateBets(true);
        }
    }

    // Rank deduction handler     // true = timed out, false = player died
    void Defeat(bool type)
    {
        if (CurrentPlayer)
        {
            CurrentPlayer->NearTeleportTo(playerResetPos.GetPositionX(), playerResetPos.GetPositionY(), playerResetPos.GetPositionZ(), playerResetPos.GetOrientation());
            std::string msg = type ? "You ran out of time!" : "You have failed.";
            me->Whisper(msg, LANG_UNIVERSAL, CurrentPlayer, true);

            if (sConfigMgr->GetOption<uint32>("BrawlersGuild.RankLose", 2) != 0)
            {
                QueryResult result = CharacterDatabase.Query("SELECT `Rank`, `Progress` FROM `brawlersguild` WHERE `CharacterGUID` = '{}';", CurrentPlayer->GetGUID().GetCounter());
                if (result)
                {
                    Field *fields = result->Fetch();
                    uint32 rank = fields[0].Get<uint32>();
                    int32 progress = fields[1].Get<uint32>(); // Required to go negative, in order to downrank.

                    // Update Rank (and Progress) if we reach the threshold, progress always goes to 0.
                    if (progress - sConfigMgr->GetOption<uint32>("BrawlersGuild.RankLose", 2) < 0)
                    {
                        rank -= 1;
                        std::stringstream rankup;
                        rankup << "You've downranked to Rank " << rank << "!";

                        me->Whisper(rankup.str(), LANG_UNIVERSAL, CurrentPlayer, true);
                        CharacterDatabase.DirectExecute("UPDATE `brawlersguild` SET `Progress` = '0', `Rank` = '{}' WHERE `CharacterGUID` = '{}';", rank, CurrentPlayer->GetGUID().GetCounter());
                    }
                    // Update Progress
                    else
                    {
                        progress -= sConfigMgr->GetOption<uint32>("BrawlersGuild.RankLose", 2);
                        CharacterDatabase.DirectExecute("UPDATE `brawlersguild` SET `Progress` = '{}' WHERE `CharacterGUID` = '{}';", progress, CurrentPlayer->GetGUID().GetCounter());
                    }
                }
            }

            if (Creature* ann = ObjectAccessor::GetCreature(*me, announcer))
            {
                ann->AI()->DoAction(type ? ACTION_ANNOUNCE_DEFEAT_TIME : ACTION_ANNOUNCE_DEFEAT_DEATH);
            }

            // Gambler - Open Betting (Just in case)
            if (Creature* gam = ObjectAccessor::GetCreature(*me, gambler))
            {
                gam->RemoveAura(SPELL_MARKER);
            }

            CrowdReaction();
            queueList.remove(CurrentPlayer);
            summons.DespawnAll();
            CurrentPlayer = nullptr;
            events.ScheduleEvent(EVENT_FIND_PLAYER, 2s);
            CalculateBets(false);
        }
    }

    void Firework()
    {
        if (!fireworkList.empty())
        {
            for (Creature* tonks : fireworkList)
            {
                tonks->AI()->SetData(1, 1);
            }
        }
    }

    void CrowdReaction()
    {
        if (!spectatorList.empty())
        {
            for (Creature* spectators : spectatorList)
            {
                if (roll_chance_i(50))
                {
                    if (spectators)
                    {
                        uint8 rng = urand(0,4);
                        spectators->HandleEmoteCommand(crowdEmotes[rng]);

                        if (roll_chance_i(50))
                        {
                            spectators->HandleEmoteCommand(26); //EMOTE_STATE_STAND
                        }
                    }
                }
            }
        }
    }

    void DoAction(int32 action)
    {
        if (action == ACTION_FIND_PLAYER)
        {
            events.ScheduleEvent(EVENT_FIND_PLAYER, 2s);
        }

        if (action == ACTION_DEFEAT)
        {
            Defeat(false);
        }
    }

    void AddRatGossip(bool s)
    {
        if (Creature* rat = me->FindNearestCreature(NPC_RAT, 20))
            if (s)
            {
                if (!rat->HasNpcFlag(UNIT_NPC_FLAG_GOSSIP))
                    rat->SetNpcFlag(UNIT_NPC_FLAG_GOSSIP);
            }
            else
            {
                if (rat->HasNpcFlag(UNIT_NPC_FLAG_GOSSIP))
                    rat->RemoveNpcFlag(UNIT_NPC_FLAG_GOSSIP);
            }
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);
        {
            {
                switch (events.ExecuteEvent())
                {
                    case EVENT_FIND_PLAYER:
                    {
                        if (!CurrentPlayer)
                        {
                            for (Player* player : queueList)
                            {
                                if (player)
                                {
                                    CurrentPlayer = player;
                                    break;
                                }
                                else
                                {
                                    // Remove player from queue list
                                    queueList.remove(CurrentPlayer);
                                    CurrentPlayer = nullptr;
                                    events.ScheduleEvent(EVENT_FIND_PLAYER, 2s);
                                }
                            }

                            if (CurrentPlayer)
                            {
                                CurrentPlayer->NearTeleportTo(playerSpawnPos.GetPositionX(), playerSpawnPos.GetPositionY(), playerSpawnPos.GetPositionZ(), playerSpawnPos.GetOrientation());
                                events.ScheduleEvent(EVENT_START, 2s);
                                events.ScheduleEvent(EVENT_NOT_FOUND, 5s);
                            }
                        }
                        break;
                    }

                    // Something went wrong
                    case EVENT_NOT_FOUND:
                    {
                        if (CurrentPlayer)
                        {
                            CurrentPlayer->NearTeleportTo(playerResetPos.GetPositionX(), playerResetPos.GetPositionY(), playerResetPos.GetPositionZ(), playerResetPos.GetOrientation());
                            queueList.remove(CurrentPlayer);
                            CurrentPlayer = nullptr;
                        }

                        events.ScheduleEvent(EVENT_FIND_PLAYER, 2s);
                        AddRatGossip(true);
                        summons.DespawnAll();
                        break;
                    }
                    case EVENT_START:
                    {
                        if (CurrentPlayer)
                        {
                            QueryResult result = CharacterDatabase.Query("SELECT `Rank` FROM `brawlersguild` WHERE `CharacterGUID` = '{}';", CurrentPlayer->GetGUID().GetCounter());

                            if (result)
                            {
                                Field *fields = result->Fetch();
                                uint32 rank = fields[0].Get<uint32>();

                                // Max rank is 8, anything above that start spawning rares, with increased chance per higher rank (NYI)
                                me->SummonCreature(Rank[BrawlersGuild_CurrentSeason - 1][rank - 1][urand(0,3)], spawnPos.GetPositionX(), spawnPos.GetPositionY(), spawnPos.GetPositionZ(), 1.1, TEMPSUMMON_TIMED_DESPAWN, 1000 * sConfigMgr->GetOption<uint32>("BrawlersGuild.FightDuration", 120));

                                AddRatGossip(false);
                                me->Whisper("Begin!", LANG_UNIVERSAL, CurrentPlayer, true);

                                // Gambler - Open Betting
                                if (Creature* gam = ObjectAccessor::GetCreature(*me, gambler))
                                {
                                    betFor.clear();
                                    betAgainst.clear();
                                    me->AddAura(SPELL_MARKER, gam);
                                }
                                events.ScheduleEvent(EVENT_GAMBLER_CLOSE_BETTING, 10s);
                            }
                            else
                            {
                                // Something went wrong
                                events.ScheduleEvent(EVENT_FIND_PLAYER, 2s);
                                AddRatGossip(true);
                            }

                            events.CancelEvent(EVENT_NOT_FOUND);
                        }
                        break;
                    }
                    case EVENT_ARENA_UNKNOWN:
                    {
                        //uint8 rng = urand(0,5);
                        //me->SummonGameObject(GO_ARENA_PILLAR, goArenaPillar[rng].GetPositionX(), goArenaPillar[rng].GetPositionY(), goArenaPillar[rng].GetPositionZ(), 0, 0, 0, 0, 0, 0);
                        break;
                    }
                    // Ran only once
                    case EVENT_LOAD_ARENA_OBJECTS:
                    {
                        me->GetCreatureListWithEntryInGrid(spectatorList, NPC_CROWD_ARENA_SPECTATOR, 50);
                        me->GetCreatureListWithEntryInGrid(spectatorList, NPC_CROWD_ARENA_SPECTATOR_2, 50);
                        me->GetCreatureListWithEntryInGrid(fireworkList, NPC_FIREWORK_TONK, 40);
                        if (Creature* c = me->FindNearestCreature(NPC_ARENA_ANNOUNCER, 40))
                        {
                            announcer = c->GetGUID();
                        }
                        if (Creature* c = me->FindNearestCreature(NPC_ARENA_GAMBLER, 40))
                        {
                            gambler = c->GetGUID();
                        }
                        break;
                    }
                    case EVENT_GAMBLER_CLOSE_BETTING:
                    {
                        if (Creature* gam = ObjectAccessor::GetCreature(*me, gambler))
                        {
                            gam->RemoveAura(SPELL_MARKER);
                        }
                        break;
                    }
                    case EVENT_CROWD_DEFEAT: // do it as a function or in victory/defeat
                    {
                        break;
                    }
                }
            }
        }
    }

    private:
        EventMap events;
        SummonList summons;
        ObjectGuid announcer;
        ObjectGuid gambler;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_player_detectorAI (creature);
    }
};

// Checks for players (and pets) that are not supposed to be in the arena.
class npc_other_players_detector : public CreatureScript
{
public:
    npc_other_players_detector() : CreatureScript("npc_other_players_detector") { }

    struct npc_other_players_detectorAI : public ScriptedAI
    {
        npc_other_players_detectorAI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* who) override
        {
            if (who)
            {
                if (me->GetExactDist2d(who) <= 29.0f)
                {
                    if (who->IsPlayer())
                    {
                        if (!who->ToPlayer()->IsGameMaster())
                        {
                            if (me->GetMap()->isInLineOfSight(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), who->GetPositionX(), who->GetPositionY(), who->GetPositionZ(), 2, LINEOFSIGHT_CHECK_VMAP , VMAP::ModelIgnoreFlags::Nothing))
                            {
                                if (who->ToPlayer() != CurrentPlayer)
                                {
                                    me->PlayDirectSound(SOUND_STEALTH, who->ToPlayer());
                                    me->AddAura(SPELL_CHEAP_SHOT, who);
                                    who->NearTeleportTo(playerResetPos.GetPositionX(), playerResetPos.GetPositionY(), playerResetPos.GetPositionZ(), playerResetPos.GetOrientation());
                                }
                            }
                        }
                    }
                    if (who->IsPet())
                    {
                        if (me->GetMap()->isInLineOfSight(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), who->GetPositionX(), who->GetPositionY(), who->GetPositionZ(), 2, LINEOFSIGHT_CHECK_VMAP , VMAP::ModelIgnoreFlags::Nothing))
                        {
                            if (who->ToCreature()->GetOwner() != CurrentPlayer)
                            {
                                who->ToCreature()->DespawnOrUnsummon();
                            }
                        }
                    }
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_other_players_detectorAI (creature);
    }
};

const std::string annVictory[30] =
{
    {"Ladies and gentlemen, let's give it up for our incredible champion!"},
    {"And there we have it, folks! Another victorious win for the fighter of the century!"},
    {"A stunning display of skill and power! Our fighter takes home the well-deserved victory!"},
    {"What an extraordinary performance! Our fighter has triumphed once again, proving their unparalleled dominance!"},
    {"The crowd goes wild as our warrior emerges triumphant! What a mesmerizing show!"},
    {"Incredible! Our fighter outshines the competition, solidifying their place in the hall of champions"},
    {"The roar of the crowd echoes the triumph of our champion! A well-deserved triumph!"},
    {"Unbelievable! Our fighter emerged as the ultimate victor, leaving a trail of awe and admiration!"},
    {"A resounding victory! Our fighter has electrified this arena with their indomitable spirit!"},
    {"It's official, folks! Our fighter has risen to the top, leaving their opponents in awe and us in pure amazement!"},
    {"And the champion rises, a true warrior in the arena!"},
    {"With heart and grit, he has secured his victory tonight!"},
    {"A phenomenal performance! He truly showcased his skill and determination!"},
    {"What an incredible display of strength and finesse!"},
    {"He fought like a lion, and the crown is now his!"},
    {"Against all odds, he has emerged victorious!"},
    {"A masterclass in strategy and power – well done, champion!"},
    {"He has claimed his place at the top with unwavering resolve!"},
    {"Tonight, he proved that hard work pays off!"},
    {"With every punch, he carved his path to victory!"},
    {"A relentless spirit has brought him triumph this evening!"},
    {"What an electrifying performance! The crowd is on their feet!"},
    {"A true testament to his dedication and skill!"},
    {"He’s not just a fighter; he’s a phenomenon!"},
    {"With courage, he has written a new chapter in his legacy!"},
    {"He’s claimed his destiny with style and valor!"},
    {"A brilliant showcase of tenacity and talent!"},
    {"Against the odds, he has written his own victory story!"},
    {"He is the embodiment of strength and determination!"},
    {"Tonight, he has shown the world what it means to be a champion!"}
};

const std::string annTime[10] =
{
    {"Time's up! Don't worry, I'm sure the excitement will continue... somewhere else."},
    {"Well, folks, that's all she wrote. Time ran out, and so did our hopes for a thrilling finish."},
    {"And the clock hits zero! It's like watching paint dry, but with more disappointment."},
    {"Time flies when you're... bored out of your mind. Thanks for making the minutes feel like hours!"},
    {"Time has expired, and so has our patience. Let's hope the action picks up next time!"},
    {"Tick tock, tick tock, and just like that, the excitement went down the drain."},
    {"Time ran out, just like my enthusiasm. Let's keep the pity party going, shall we?"},
    {"No more time left! Reality check: this could've been better spent doing something else."},
    {"Time's up, folks! File this game under 'forgettable' and move on with your lives."},
    {"And just like that, the clock steals away the opportunity for anything exciting to happen."},
    {"Looks like the clock struck zero on your chance to shine!"},
    {"Time’s up, champ! Back to the drawing board!"},
    {"You’re late to the party—hope you won’t mind the empty seats!"},
    {"The countdown is over, and so is your chance!"},
    {"Tick-tock! Looks like you let the opportunity slip away!"},
    {"Well, well—time waits for no fighter!"},
    {"And here you are, fashionably late to your own demise!"},
    {"Sorry, the hourglass has run out; no extra rounds for you!"},
    {"Time’s a cruel foe, and it just knocked you out!"},
    {"The final bell’s rung, and you didn’t even step in the ring!"},
    {"Your time just expired—don’t let the door hit you on the way out!"},
    {"And there goes your shot—time to clock out!"},
    {"Too slow, my friend—the sands of time have spoken!"},
    {"Looks like you overslept your chance at glory!"},
    {"The clock has struck, and your moment has vanished!"},
    {"You’re all dressed up with nowhere to go—time’s up!"},
    {"Sad news, buddy—the fight schedule just closed!"},
    {"Time can be a ruthless opponent—you just got KO'd by it!"},
    {"The arena’s ready, but sadly, your clock just ran out!"},
    {"Looks like the universe conspired against your big moment!"}
};

const std::string annDeath[30] =
{
    {"And that's one less hero in the arena! They'll be missed. By someone. Probably."},
    {"Well, well, well, looks like someone just got schooled! Maybe they should've studied harder."},
    {"Ouch! That was a face plant for the books! Better luck next time, pal."},
    {"And the player has been knocked out! Time to start reevaluating life choices, my friend."},
    {"Down goes another one! That's gotta sting, both physically and emotionally."},
    {"Game over for that poor soul. May they find solace in respawns and redemption."},
    {"RIP, player. We hardly knew ya. And honestly, we probably won't remember ya either."},
    {"That was a swift defeat! They couldn't even blink before they were knocked out."},
    {"And... crash! This player's dreams just shattered faster than a screen protector."},
    {"Another one bites the dust! Can someone get these players a map? They seem lost."},
    {"Looks like that last round really took his breath away—permanently!"},
    {"Guess he won't be needing a rematch now!"},
    {"Talk about a knockout; he took it to the extreme!"},
    {"And that's one way to make a dramatic exit!"},
    {"He went down like a tree—never to rise again!"},
    {"Well, folks, he certainly left it all in the ring—forever!"},
    {"I guess you could say he really 'took one for the team'… the afterlife team!"},
    {"He wasn't just knocked out; he was sent packing six feet under!"},
    {"Looks like he found the ultimate way to avoid a post-fight interview!"},
    {"And that’s a wrap! Someone call the coroner; he just took the ultimate dive!"},
    {"Well, he definitely took the 'knockout' part too literally!"},
    {"Looks like he found a way to take his fight to the next level—permanently!"},
    {"Talk about going to sleep on the job—he really committed!"},
    {"He came, he fought, he... checked out!"},
    {"Guess he didn’t know when to throw in the towel—or stay out of the ring!"},
    {"That’s one way to ensure you never have to face an opponent again!"},
    {"He took 'going down for the count' to a whole new extreme!"},
    {"Looks like he crossed the ultimate finish line a little too soon!"},
    {"He always wanted to make a grand exit, but this was a bit much!"},
    {"Guess he found the ultimate way to avoid the rematch!"},
    {"He really took 'tap out' to heart—literally!"},
    {"He didn't just lose; he went on his final vacation!"},
    {"His career ended with a bang—or was that just the final bell?"},
    {"He sure knew how to make an exit; just not the right one!"},
    {"Well, that’s one way to dodge the next fight!"},
    {"He truly left it all in the ring—too much, perhaps!"},
    {"Looks like he won't be needing a post-fight interview!"},
    {"He went for glory and ended up with a long nap instead!"},
    {"Talk about taking a 'hard fall' to a whole new level!"},
    {"Well, he certainly put the 'final' in 'final round!'"}
};

class npc_arena_announcer : public CreatureScript
{
public:
    npc_arena_announcer() : CreatureScript("npc_arena_announcer") { }

    struct npc_arena_announcerAI : public ScriptedAI
    {
        npc_arena_announcerAI(Creature* creature) : ScriptedAI(creature) {}

    void Announce(std::string type)
    {
        // Find a way to consolidate that
        uint8 rng = urand(0,9);
        if (type == "Victory")
        {
            me->Yell(annVictory[rng], LANG_UNIVERSAL);
        }
        else if (type == "DefeatTime")
        {
            me->Yell(annTime[rng], LANG_UNIVERSAL);
        }
        else
        {
            me->Yell(annDeath[rng], LANG_UNIVERSAL);
        }

    }

    void DoAction(int32 action) override
    {
        if (action == ACTION_ANNOUNCE_VICTORY)
        {
            Announce("Victory");
        }

        if (action == ACTION_ANNOUNCE_DEFEAT_TIME)
        {
            Announce("DefeatTime");
        }

        if (action == ACTION_ANNOUNCE_DEFEAT_DEATH)
        {
            Announce("DefeatDeath");
        }
    }

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_arena_announcerAI (creature);
    }

};

class npc_anti_stuck : public CreatureScript
{
public:
    npc_anti_stuck() : CreatureScript("npc_anti_stuck") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        AddGossipItemFor(player, GOSSIP_ICON_CHAT, "I'm stuck, little help please.", GOSSIP_SENDER_MAIN, 1);
        SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* player, Creature*  creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        
        if (action == 1)
        {
            if (player->ToPlayer())
            {
                player->NearTeleportTo(playerResetPos.GetPositionX(), playerResetPos.GetPositionY(), playerResetPos.GetPositionZ(), playerResetPos.GetOrientation());
            }
        }

    return true;
    }
};

enum Shop
{
    OPEN_SHOP                = 19,

    // Rank 0
    BUY_RANK_0               = 20, // Required to be bought after downranking to Rank 0.

    // Rank 1
    SHOP_ITEM_ARCTIC_FUR     = 44128,
    SHOP_ITEM_SARONITE_BAR   = 36913,
    BUY_RANK_1_FUR           = 21,
    BUY_RANK_1_BAR           = 22,

    // Rank 2
    SHOP_ITEM_GIGANTIQUE_BAG = 38082,
    SHOP_ITEM_FORTUNE_COIN   = 32465,
    BUY_RANK_2_BAG           = 23,
    BUY_RANK_2_COIN          = 24,

    // Rank 3
    SHOP_ITEM_NAXX_HORSE     = 23193,
    SHOP_ITEM_EPIC_SHIRT     = 45037,
    BUY_RANK_3_NAXX           = 25,
    BUY_RANK_3_SHIRT          = 26,

    // Rank 4
    SHOP_ITEM_DREAD_RING     = 50255,
    SHOP_ITEM_EOH            = 40752,
    BUY_RANK_4_RING          = 27,
    BUY_RANK_4_EOH           = 28,
/*
    // Rank 5
    SHOP_ITEM_GIGANTIQUE_BAG = 38082,
    SHOP_ITEM_FORTUNE_COIN   = 32465,
    BUY_RANK_5_BAG           = 29,
    BUY_RANK_5_COIN          = 30,

    // Rank 6
    SHOP_ITEM_GIGANTIQUE_BAG = 38082,
    SHOP_ITEM_FORTUNE_COIN   = 32465,
    BUY_RANK_6_BAG           = 31,
    BUY_RANK_6_COIN          = 32,

    // Rank 7
    SHOP_ITEM_GIGANTIQUE_BAG = 38082,
    SHOP_ITEM_FORTUNE_COIN   = 32465,
    BUY_RANK_7_BAG           = 33,
    BUY_RANK_7_COIN          = 34,

    // Rank 8
    SHOP_ITEM_GIGANTIQUE_BAG = 38082,
    SHOP_ITEM_FORTUNE_COIN   = 32465,
    BUY_RANK_8_BAG           = 35,
    BUY_RANK_8_COIN          = 36,
*/
};

class npc_brawlers_vendor : public CreatureScript
{
public:
    npc_brawlers_vendor() : CreatureScript("npc_brawlers_vendor") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (player->GetQuestStatus(QUEST_BRAWLERS_GUILD) == QUEST_STATUS_REWARDED)
        {
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Set my hearthstone here.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INN);
            AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, "Show my bank.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_BANK);
            if (player->HasItemCount(ITEM_BRAWLERS_GOLD))
                AddGossipItemFor(player, GOSSIP_ICON_TABARD, "Browse Brawler's Guild.", GOSSIP_SENDER_MAIN, OPEN_SHOP);
        }

        SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature*  creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);

        switch (action)
        {
            case GOSSIP_ACTION_TRADE:
                player->GetSession()->SendListInventory(creature->GetGUID());
                break;
            case GOSSIP_ACTION_INN:
                player->GetSession()->SendBindPoint(creature);
                break;
            case GOSSIP_ACTION_BANK:
                player->GetSession()->SendShowBank(creature->GetGUID());
                break;
            case OPEN_SHOP:
                {
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t Welcome to the shop. |TInterface\\Icons\\inv_misc_elvencoins:16|t \n\n Rank up to unlock more! \n\n", GOSSIP_SENDER_MAIN, OPEN_SHOP);

                    QueryResult result = CharacterDatabase.Query("SELECT `Rank` FROM `brawlersguild` WHERE `CharacterGUID` = '{}'", player->GetGUID().GetCounter());
                    if (result)
                    {
                        Field *fields = result->Fetch();
                        uint32 rank = fields[0].Get<uint32>();

                        if (rank == 0)
                        {
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_shirt_guildtabard_01:16|t Rank 0 |TInterface\\Icons\\inv_shirt_guildtabard_01:16|t", GOSSIP_SENDER_MAIN, OPEN_SHOP);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_coin_02:16|t100| Buy Rank 1", GOSSIP_SENDER_MAIN, BUY_RANK_0);
                        }
                        if (rank >= 1)
                        {
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_shirt_guildtabard_01:16|t Rank 1 |TInterface\\Icons\\inv_shirt_guildtabard_01:16|t", GOSSIP_SENDER_MAIN, OPEN_SHOP);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t50  | x1 Arctic Fur", GOSSIP_SENDER_MAIN, BUY_RANK_1_FUR);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t50  | x20 Saronite Bar", GOSSIP_SENDER_MAIN, BUY_RANK_1_BAR);
                        }
                        if (rank >= 2)
                        {
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_shirt_guildtabard_01:16|t Rank 2 |TInterface\\Icons\\inv_shirt_guildtabard_01:16|t", GOSSIP_SENDER_MAIN, OPEN_SHOP);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t100| x1 'Gigantique' Bag", GOSSIP_SENDER_MAIN, BUY_RANK_2_BAG);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t100| x1 Fortune Coin (pet)", GOSSIP_SENDER_MAIN, BUY_RANK_2_COIN);
                        }
                        if (rank >= 3)
                        {
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_shirt_guildtabard_01:16|t Rank 3 |TInterface\\Icons\\inv_shirt_guildtabard_01:16|t", GOSSIP_SENDER_MAIN, OPEN_SHOP);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t150| x1 Naxxramas Deathcharger Reins", GOSSIP_SENDER_MAIN, BUY_RANK_3_NAXX);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t150| x1 Epic Purple Shirt", GOSSIP_SENDER_MAIN, BUY_RANK_3_SHIRT);
                        }
                        if (rank >= 4)
                        {
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_shirt_guildtabard_01:16|t Rank 4 |TInterface\\Icons\\inv_shirt_guildtabard_01:16|t", GOSSIP_SENDER_MAIN, OPEN_SHOP);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t200| x1 Dread Pirate Ring (heirloom)", GOSSIP_SENDER_MAIN, BUY_RANK_4_RING);
                            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t200| x20 Emblems of Heroism", GOSSIP_SENDER_MAIN, BUY_RANK_4_EOH);
                        }
                    }

                    SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
                    break;
                }

            // Rank 0
            case BUY_RANK_0:
                {
                    if (player->HasEnoughMoney(1000000))
                    {
                        // Only accessible at rank 0, don't require any checks.
                        CharacterDatabase.DirectExecute("REPLACE INTO `brawlersguild` (`CharacterGUID`, `Progress`, `Rank`) VALUES ('{}', '2', '1');", player->GetGUID().GetCounter());
                        player->ModifyMoney(-1000000);
                        ChatHandler(player->GetSession()).SendNotification("You have been promoted to Rank 1.");
                    }
                    else
                    {
                        ChatHandler(player->GetSession()).SendNotification("Not enough gold.");
                    }
                    CloseGossipMenuFor(player);
                    break;
                }
            // Rank 1
            case BUY_RANK_1_FUR:
                {
                    if (HasGold(player, 50))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 50, true);
                            player->AddItem(SHOP_ITEM_ARCTIC_FUR, 1);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }
            case BUY_RANK_1_BAR:
                {
                    if (HasGold(player, 50))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 50, true);
                            player->AddItem(SHOP_ITEM_SARONITE_BAR, 20);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }

            // Rank 2
            case BUY_RANK_2_BAG:
                {
                    if (HasGold(player, 100))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 100, true);
                            player->AddItem(SHOP_ITEM_GIGANTIQUE_BAG, 1);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }
            case BUY_RANK_2_COIN:
                {
                    if (HasGold(player, 100))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 100, true);
                            player->AddItem(SHOP_ITEM_FORTUNE_COIN, 1);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }
            // Rank 3
            case BUY_RANK_3_NAXX:
                {
                    if (HasGold(player, 150))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 150, true);
                            player->AddItem(SHOP_ITEM_NAXX_HORSE, 1);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }
            case BUY_RANK_3_SHIRT:
                {
                    if (HasGold(player, 150))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 150, true);
                            player->AddItem(SHOP_ITEM_EPIC_SHIRT, 1);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }
            // Rank 4
            case BUY_RANK_4_RING:
                {
                    if (HasGold(player, 200))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 200, true);
                            player->AddItem(SHOP_ITEM_DREAD_RING, 1);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }
            case BUY_RANK_4_EOH:
                {
                    if (HasGold(player, 200))
                        {
                            player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 200, true);
                            player->AddItem(SHOP_ITEM_EOH, 20);
                            CloseGossipMenuFor(player);
                        }
                    break;
                }
        }
        return true;
    }

    bool HasGold(Player* player, uint32 gold)
    {
        if (!player || !gold)
            return false;

        if  (player->HasItemCount(ITEM_BRAWLERS_GOLD, gold) && player->GetFreeInventorySpace())
            return true;
        else
            ChatHandler(player->GetSession()).SendNotification("Not enough bag space or gold.");
            return false;
    }
};

// NOTE TO SELF: CreatureScripts cannot have BOTH GOSSIP & UPDATEAI/DOACTION <> <> <>
class npc_brawlers_gambler : public CreatureScript
{
public:
    npc_brawlers_gambler() : CreatureScript("npc_brawlers_gambler") {}

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (BrawlersGuild_Gambler)
        {
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t Are you willing to bet your coins? |TInterface\\Icons\\inv_misc_elvencoins:16|t", GOSSIP_SENDER_MAIN, 0);
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "-------------------------------------", GOSSIP_SENDER_MAIN, 0);

            if (player->GetItemCount(ITEM_BRAWLERS_GOLD) >= 5)
            {
                std::stringstream balance;
                balance << "Your current balance is :" << player->GetItemCount(ITEM_BRAWLERS_GOLD);
                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, balance.str(), GOSSIP_SENDER_MAIN, 0);
            }
            else
                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Come back when you earn more brawlers gold. (Min 5)", GOSSIP_SENDER_MAIN, 0);

            // Check if we already bet
            if ((std::find(betFor.begin(), betFor.end(), player) == betFor.end()) && (std::find(betAgainst.begin(), betAgainst.end(), player) == betAgainst.end()))
            {
                if (CurrentPlayer && creature->HasAura(SPELL_MARKER) && (player->GetItemCount(ITEM_BRAWLERS_GOLD) >= 5))
                {
                    std::string playername = CurrentPlayer->ToPlayer()->GetName().c_str();
                    std::stringstream name;
                    name << ">> Bet on " << playername << " or against! <<";
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, name.str(), GOSSIP_SENDER_MAIN, 0);

                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "-------------------------------------", GOSSIP_SENDER_MAIN, 0);

                    name.str("");
                    name << "|TInterface\\Icons\\Achievement_pvp_h_12:64|t Bet 5 on " << playername << "!";
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, name.str(), GOSSIP_SENDER_MAIN, BET_FOR);

                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "-------------------------------------", GOSSIP_SENDER_MAIN, 0);

                    name.str("");
                    name << "|TInterface\\Icons\\inv_misc_bone_dwarfskull_01:64|t Bet 5 against " << playername << "!";
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, name.str(), GOSSIP_SENDER_MAIN, BET_AGAINST);
                }
            }
            else
                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1,"You've already placed a bet on this fight.", GOSSIP_SENDER_MAIN, GOODBYE);
        }
        else
        {
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t Are you willing to bet your coins? |TInterface\\Icons\\inv_misc_elvencoins:16|t", GOSSIP_SENDER_MAIN, GOODBYE);
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "I'm currently out of business.", GOSSIP_SENDER_MAIN, GOODBYE);
        }

        SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        switch (action)
        {
            case BET_FOR:
            {
                if (player->HasItemCount(ITEM_BRAWLERS_GOLD, 5))
                {
                    player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 5, true);
                    ChatHandler(player->GetSession()).SendNotification("Your bid on winning has been accepted.");

                    betFor.push_back(player);
                    CloseGossipMenuFor(player);
                }
                break;
            }
            case BET_AGAINST:
            {
                if (player->HasItemCount(ITEM_BRAWLERS_GOLD, 5))
                {
                    player->DestroyItemCount(ITEM_BRAWLERS_GOLD, 5, true);
                    ChatHandler(player->GetSession()).SendNotification("Your bid on defeat has been accepted.");

                    betAgainst.push_back(player);
                    CloseGossipMenuFor(player);
                }
                break;
            }
            case GOODBYE:
            {
                CloseGossipMenuFor(player);
                break;
            }
        }

        return true;
    }
};

enum VIPArea
{
    // Gossip
    VIP_TELE_ARENA  = 1,
    VIP_TELE_ISLAND = 2,

    // AreaIDs
    VIP_ARENA_ID    = 1637,
    VIP_ISLAND_ID   = 2317
};

const Position VipArena  = {2203.38f, -4795.52f, 65.617493f, 1.73f};
const Position VipIsland = {-11342.36f, -4759.87f, 6.637663f, 2.38f};

class go_brawlers_vip : public GameObjectScript
{
public:
    go_brawlers_vip() : GameObjectScript("go_brawlers_vip") {}

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        uint32 areaId = player->GetAreaId();
        
        AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "This teleporter is only available to those that have reached the highest rank.", GOSSIP_SENDER_MAIN, 0);
        AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "-------------------------------------", GOSSIP_SENDER_MAIN, 0);

        QueryResult result = CharacterDatabase.Query("SELECT `Rank` FROM `brawlersguild` WHERE `CharacterGUID` = '{}';", player->GetGUID().GetCounter());
        if (result)
        {
            Field *fields = result->Fetch();
            uint32 rank = fields[0].Get<uint32>();
            if (rank >= 8 || player->IsGameMaster())
            {
                if (areaId == VIP_ISLAND_ID)
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\achievement_arena_2v2_7:64|t To the Arena!", GOSSIP_SENDER_MAIN, VIP_TELE_ARENA);
                if (areaId == VIP_ARENA_ID)
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_bijou_gold:64|t To the VIP Area!", GOSSIP_SENDER_MAIN, VIP_TELE_ISLAND);
            }
        }

        SendGossipMenuFor(player, GOSSIP_HELLO, go->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, GameObject* go, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        switch(action)
        {
            case VIP_TELE_ARENA:
            {
                player->TeleportTo(1, VipArena.GetPositionX(), VipArena.GetPositionY(), VipArena.GetPositionZ(), VipArena.GetOrientation());
                CloseGossipMenuFor(player);
                break;
            }
            case VIP_TELE_ISLAND:
            {
                player->TeleportTo(1, VipIsland.GetPositionX(), VipIsland.GetPositionY(), VipIsland.GetPositionZ(), VipIsland.GetOrientation());
                CloseGossipMenuFor(player);
                break;
            }
            default:
                break;
        }

        return true;
    }
};

void AddBrawlersGuildScripts()
{
    new BrawlersGuild_conf();
    new BrawlersGuild_Announce();
    new npc_brawlers_guild();
    new npc_player_detector();
    new npc_other_players_detector();
    new npc_arena_announcer();
    new npc_anti_stuck();
    new npc_brawlers_vendor();
    new npc_brawlers_gambler();
    new go_brawlers_vip();
}
