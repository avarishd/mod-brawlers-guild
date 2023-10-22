#include <sstream>
#include <string.h>
#include "Configuration/Config.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedGossip.h"
#include "ScriptedCreature.h"
#include "ArenaTeam.h"
#include "ArenaTeamMgr.h"
#include "World.h"
#include "Player.h"
#include "Chat.h"

/* TODO
Queue - std list and call for it in order???
Check for players that are NOT the selected player
Defeat() - on creature despawn/player death?
Dampening - Might need to edit some unused spell in order to make it work
Respawn nearby dead players (every few seconds?)

--- FOR LAST ---
Arena Randomize/Hazards (+ boss specifics)
Visuals / Announcer / Crows (cosmetics)
Challenge Cards + Rare
*/

// Global settings
bool BrawlersGuild_Enabled;
bool BrawlersGuild_AnnounceModule;
uint8 BrawlersGuild_CurrentSeason;

class BrawlersGuild_conf : public WorldScript
{
public:
    BrawlersGuild_conf() : WorldScript("BrawlersGuild_conf") { }

    void OnBeforeConfigLoad(bool /*reload*/) override
    {
        BrawlersGuild_Enabled = sConfigMgr->GetBoolDefault("BrawlersGuild.Enabled", 1);
        BrawlersGuild_AnnounceModule = sConfigMgr->GetOption<bool>("BrawlersGuild.Announce", 1);
        BrawlersGuild_CurrentSeason = sConfigMgr->GetIntDefault("BrawlersGuild.CurrentSeason", 1);
    }
};

class BrawlersGuild_Announce : public PlayerScript
{
public:

    BrawlersGuild_Announce() : PlayerScript("BrawlersGuild_Announce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (BrawlersGuild_Enabled && BrawlersGuild_AnnounceModule)
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cffe67b09Brawlers Guild|r module.");
        }
    }
};

enum BrawlersGuild 
{
    GOSSIP_HELLO            = 11201,
    QUEST_BRAWLERS_GUILD    = 90000,
    ITEM_BRAWLERS_GOLD      = 43003,

    NPC_RAT                 = 59999,
    NPC_BRAWLERS_GUILD      = 60000,
    NPC_TARGET_SELECTOR     = 60001,

    ACTION_FIND_PLAYER = 1,

    EVENT_FIND_PLAYER = 2,
    EVENT_START       = 3,
    EVENT_NOT_FOUND   = 4,

    MY_RANK         = 10,
    ADD_TO_QUEUE    = 11,
    TOP_15          = 12,
    GOODBYE         = 13,
};

// ### Season 1 ###
// Bob, Smiley, Dungeon Master Billey, Zerg
const uint32 Rank1[4] = {60002, 60003, 60004, 60005};
const uint32 Rank2[1] = {60006};
const uint32 Rank3[1] = {60007};

const Position spawnPos = {2172, -4786, 55.13f, 1.15f};

static std::list<Player*> queueList;

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
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "What is my current rank progress?", GOSSIP_SENDER_MAIN, MY_RANK);
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Add me to the queue!", GOSSIP_SENDER_MAIN, ADD_TO_QUEUE);
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "Show me top 15!", GOSSIP_SENDER_MAIN, TOP_15);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "I am at the wrong place.", GOSSIP_SENDER_MAIN, GOODBYE);
        }
        SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* player, Creature*  creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);

        if (action == ADD_TO_QUEUE)// && !ArenaActive)
        {
            if (player->ToPlayer())
            {
                player->GetSession()->SendNotification("You have been added to the queue.");
                creature->AddAura(9454, player); // GM Sleep
                player->NearTeleportTo(2199, -4745, 55.13, 4.1);
                if (Creature* t = creature->FindNearestCreature(NPC_TARGET_SELECTOR, 40))
                    t->AI()->DoAction(ACTION_FIND_PLAYER);
                //queueList.push_back(player);
                //queueList.Remove(player)
            }
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

                std::stringstream buf;
                buf << "Current rank: " << rank;

                AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, buf.str(), GOSSIP_SENDER_MAIN, GOODBYE);
                buf.str("");
                buf << "Progress towards next rank: " << progress << " / 10";
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

            SendGossipMenuFor(player, GOSSIP_HELLO, creature->GetGUID());
            }
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
            player->AddItem(ITEM_BRAWLERS_GOLD, sConfigMgr->GetIntDefault("BrawlersGuild.CoinsStartingQuestReward", 10));

            // Register player upon quest completion
            QueryResult result = CharacterDatabase.Query("SELECT `CharacterGUID` FROM `brawlersguild` WHERE `CharacterGUID` = '{}'", player->GetGUID().GetCounter());
            if (!result)
            {
                // GUID, Progress, Rank
                CharacterDatabase.DirectExecute("REPLACE INTO `brawlersguild` (`CharacterGUID`, `Progress`, `Rank`) VALUES ('{}', '0', '1');", player->GetGUID().GetCounter());
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
        npc_player_detectorAI(Creature* creature) : ScriptedAI(creature), summons(me) {}

    void SummonedCreatureDespawn(Creature* /*summon*/)
    {
        if (Player* player = GetPlayer())
        {
            player->NearTeleportTo(2208.17f, -4778.42f, 65.41f, 3.1f);
            me->Whisper("You ran out of time!", LANG_UNIVERSAL, player, true);
            PlayerGUID.Clear();
        }
    }

    void SummonedCreatureDies(Creature* summon, Unit* /*killer*/)
    {
        if (Player* player = GetPlayer())
        {
            Victory(player);
            PlayerGUID.Clear();
        }

        if (summon)
        {
            summon->DespawnOrUnsummon();
        }
    }

    void Victory(Player* player)
    {
        if (player)
            {
            me->Whisper("Victory!", LANG_UNIVERSAL, player, true);
            player->AddItem(ITEM_BRAWLERS_GOLD, sConfigMgr->GetIntDefault("BrawlersGuild.CoinsVictoryReward", 2));
            player->NearTeleportTo(2208.17f, -4778.42f, 65.41f, 3.1f);

            QueryResult result = CharacterDatabase.Query("SELECT `Rank`, `Progress` FROM `brawlersguild` WHERE `CharacterGUID` = '{}';", player->GetGUID().GetCounter());
            if (result)
                {
                    Field *fields = result->Fetch();
                    uint32 rank = fields[0].Get<uint32>();
                    uint32 progress = fields[1].Get<uint32>();

                    // Update Rank and Progress if we reach the threshold, progress does not carry over upon a rank up.
                    if (progress + sConfigMgr->GetIntDefault("BrawlersGuild.RankWin", 1) >= (sConfigMgr->GetIntDefault("BrawlersGuild.RankRequired", 10)))
                    {
                        rank += 1;
                        std::stringstream rankup;
                        rankup << "You've reached Rank " << rank << "!";

                        me->Whisper(rankup.str(), LANG_UNIVERSAL, player, true);
                        CharacterDatabase.DirectExecute("UPDATE `brawlersguild` SET `Progress` = '0', `Rank` = '{}' WHERE `CharacterGUID` = '{}';", rank, player->GetGUID().GetCounter());
                    }
                    else
                    {
                        // Update Progress
                        progress += sConfigMgr->GetIntDefault("BrawlersGuild.RankWin", 1);
                        CharacterDatabase.DirectExecute("UPDATE `brawlersguild` SET `Progress` = '{}' WHERE `CharacterGUID` = '{}';", progress, player->GetGUID().GetCounter());
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
                        if (Player* player = me->SelectNearestPlayer(5.0f))
                        {
                            if (player->HasAura(9454))
                            {
                                PlayerGUID = player->GetGUID();
                            }
                        }
                        events.ScheduleEvent(EVENT_START, 2s);
                        events.ScheduleEvent(EVENT_NOT_FOUND, 5s);
                        break;
                    }
                    case EVENT_NOT_FOUND:
                    {
                        if (Player* player = GetPlayer())
                        {
                            player->NearTeleportTo(2208.17f, -4778.42f, 65.41f, 3.1f);
                            PlayerGUID.Clear();
                        }

                        AddRatGossip(true);
                        summons.DespawnAll();
                        break;
                    }
                    case EVENT_START:
                    {
                        if (Player* player = GetPlayer())
                        {
                            QueryResult result = CharacterDatabase.Query("SELECT `Rank` FROM `brawlersguild` WHERE `CharacterGUID` = '{}';", player->GetGUID().GetCounter());

                            if (result)
                            {
                                Field *fields = result->Fetch();
                                uint32 rank = fields[0].Get<uint32>();

                                // Max rank is 8, anything above that start spawning rares, with increased chance per higher rank (NYI)
                                // Maybe a better way to handle, hate repeating things multiple times...
                                switch (rank)
                                {
                                    case 1:
                                    {
                                        me->SummonCreature(Rank1[urand(0,3)], spawnPos.GetPositionX(), spawnPos.GetPositionY(), spawnPos.GetPositionZ(), 1.1, TEMPSUMMON_TIMED_DESPAWN, 1000 * sConfigMgr->GetIntDefault("BrawlersGuild.FightDuration", 120));
                                        break;
                                    }
                                    case 2:
                                    {
                                        me->SummonCreature(Rank2[0], spawnPos.GetPositionX(), spawnPos.GetPositionY(), spawnPos.GetPositionZ(), 1.1, TEMPSUMMON_TIMED_DESPAWN, 1000 * sConfigMgr->GetIntDefault("BrawlersGuild.FightDuration", 120));
                                        break;
                                    }
                                    case 3:
                                    {
                                        me->SummonCreature(Rank3[0], spawnPos.GetPositionX(), spawnPos.GetPositionY(), spawnPos.GetPositionZ(), 1.1, TEMPSUMMON_TIMED_DESPAWN, 1000 * sConfigMgr->GetIntDefault("BrawlersGuild.FightDuration", 120));
                                        break;
                                    }
                                }

                                AddRatGossip(false);
                                player->RemoveAura(9454);
                                me->Whisper("Begin!", LANG_UNIVERSAL, player, true);
                            }
                            else
                            {
                                // Something got messed up
                                AddRatGossip(true);
                            }
                            events.CancelEvent(EVENT_NOT_FOUND);
                        }
                        break;
                    }
                }
            }
        }
    }

    private:
        EventMap events;
        SummonList summons;
        ObjectGuid PlayerGUID;
        Player* GetPlayer() {return ObjectAccessor::GetPlayer(*me, PlayerGUID);}
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_player_detectorAI (creature);
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
                player->NearTeleportTo(2208.17f, -4778.42f, 65.41f, 3.1f);
            }
        }

    return true;
    }
};

enum Shop
{
    OPEN_SHOP                = 20,

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
    BUY_RANK_4_EOH          = 28,
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
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_shirt_guildtabard_01:16|t Rank 1 |TInterface\\Icons\\inv_shirt_guildtabard_01:16|t", GOSSIP_SENDER_MAIN, OPEN_SHOP);
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t50  | x1 Arctic Fur", GOSSIP_SENDER_MAIN, BUY_RANK_1_FUR);
                    AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\Icons\\inv_misc_elvencoins:16|t50  | x20 Saronite Bar", GOSSIP_SENDER_MAIN, BUY_RANK_1_BAR);

                    QueryResult result = CharacterDatabase.Query("SELECT `Rank` FROM `brawlersguild` WHERE `CharacterGUID` = '{}'", player->GetGUID().GetCounter());
                    if (result)
                    {
                        Field *fields = result->Fetch();
                        uint32 rank = fields[0].Get<uint32>();

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
            player->GetSession()->SendNotification("Not enough bag space or gold.");
            return false;
    }
};


void AddBrawlersGuildScripts()
{
    new BrawlersGuild_conf();
    new BrawlersGuild_Announce();
    new npc_brawlers_guild();
    new npc_player_detector();
    new npc_anti_stuck();
    new npc_brawlers_vendor();
}
