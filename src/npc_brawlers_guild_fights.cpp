#include <sstream>
#include <string.h>
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "World.h"
#include "Player.h"
#include "Chat.h"

const Position ArenaCenter =  {2178.2f, -4764.79f, 55.2f};

enum General
{
    SPELL_MARKER    = 42171, // Arrow marker
};

enum Crash
{
    EVENT_CRASH_JUMP_MIDDLE         = 1,
    EVENT_CRASH_SPELL_MASSIVE_CRASH = 2,
    EVENT_CRASH_GAZE                = 3,
    EVENT_CRASH_JUMP_BACK           = 4,
    EVENT_CRASH_TRAMPLE             = 5,

    SPELL_MASSIVE_CRASH             = 200004,
    SPELL_STAGGERED_DAZE            = 66758,
};

class bguild_crash : public CreatureScript
{
public:
    bguild_crash() : CreatureScript("bguild_crash") { }

    struct bguild_crashAI : public ScriptedAI
    {
        bguild_crashAI(Creature* creature) : ScriptedAI(creature) {}

    void JustEngagedWith(Unit* who) override
    {
        events.RescheduleEvent(EVENT_CRASH_JUMP_MIDDLE, 20s);
        TargetGUID.Clear();
    }

    void AttackStart(Unit* who) override
    {
        if (me->GetReactState() != REACT_PASSIVE)
            ScriptedAI::AttackStart(who);
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        switch (events.ExecuteEvent())
        {
            case EVENT_CRASH_JUMP_MIDDLE:
            {
                // Charge highest threat target (player only).
                if (Unit* target = SelectTarget(SelectTargetMethod::MaxThreat, 0, 0.0f, true))
                    TargetGUID = target->GetGUID();

                me->StopMoving();
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveIdle();
                me->SetReactState(REACT_PASSIVE);
                me->AttackStop();
                me->GetMotionMaster()->MoveJump(ArenaCenter.GetPositionX(), ArenaCenter.GetPositionY(), ArenaCenter.GetPositionZ(), 20.0f, 6.0f);
                //events.Reset();
                events.RescheduleEvent(EVENT_CRASH_SPELL_MASSIVE_CRASH, 2s);
                break;
            }
            case EVENT_CRASH_SPELL_MASSIVE_CRASH:
            {
                me->GetMotionMaster()->Clear();
                DoCastSelf(SPELL_MASSIVE_CRASH);

                events.RescheduleEvent(EVENT_CRASH_GAZE, 2s);
                break;
            }
            case EVENT_CRASH_GAZE:
            {
                if (Unit* target = ObjectAccessor::GetPlayer(*me, TargetGUID))
                {
                    me->SetFacingToObject(target);
                    me->HandleEmoteCommand(EMOTE_ONESHOT_BATTLE_ROAR);
                    events.RescheduleEvent(EVENT_CRASH_JUMP_BACK, 2s);
                }
                else // in case something went wrong
                {
                    events.RescheduleEvent(EVENT_CRASH_JUMP_MIDDLE, 30s, 50s);
                    me->GetMotionMaster()->MovementExpired();
                    me->SetReactState(REACT_AGGRESSIVE);
                }
            break;
            }
            case EVENT_CRASH_JUMP_BACK:
            {
                float angle;
                if (Unit* target = ObjectAccessor::GetPlayer(*me, TargetGUID))
                    angle = me->GetAngle(target);
                else // in case something went wrong
                    angle = rand_norm() * 2 * M_PI;

                float jumpangle = angle >= M_PI ? angle - M_PI : angle + M_PI;
                float dist = 22.0f;
                destX = ArenaCenter.GetPositionX() + cos(angle) * dist;
                destY = ArenaCenter.GetPositionY() + std::sin(angle) * dist;
                destZ = ArenaCenter.GetPositionZ() + 1.0f;
                me->StopMoving();
                me->GetMotionMaster()->MoveJump(ArenaCenter.GetPositionX() + cos(jumpangle) * 23.0f, ArenaCenter.GetPositionY() + std::sin(jumpangle) * 23.0f, ArenaCenter.GetPositionZ(), 20.0f, 6.0f);

                events.RescheduleEvent(EVENT_CRASH_TRAMPLE, 2s);
                break;
            }
            case EVENT_CRASH_TRAMPLE:
            {
                me->DisableSpline();
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveCharge(destX, destY, destZ + 1.0f, 15.0f);
                break;
            }
        }

        if (me->GetReactState() != REACT_PASSIVE)
            DoMeleeAttackIfReady();
    }

    bool DoTrampleIfValid()
    {
        if (Unit* p = ObjectAccessor::GetPlayer(*me, TargetGUID))
        {
            if( p->IsAlive() && p->GetExactDist(me) <= 8.0f )
            {
                p->KillSelf();
                return true;
            }
        }
        return false;
    }

    void MovementInform(uint32  /*type*/, uint32 id) override
    {
        if (id == EVENT_CHARGE)
        {
            //events.Reset();
            events.RescheduleEvent(EVENT_CRASH_JUMP_MIDDLE, 30s, 35s);

            float angle = me->GetAngle(&ArenaCenter);
            angle = angle >= M_PI ? angle - M_PI : angle + M_PI;

            me->UpdatePosition(destX, destY, destZ, angle, true);
            me->StopMovingOnCurrentPos();

            if (!DoTrampleIfValid())
            {
                me->CastSpell(me, SPELL_STAGGERED_DAZE, true);
                events.DelayEvents(15000);
            }

            me->SetReactState(REACT_AGGRESSIVE);
        }
    }

    void EnterEvadeMode(EvadeReason /*why*/) override
    {
        me->DespawnOrUnsummon();
    }

    private:
        EventMap events;
        ObjectGuid TargetGUID;
        float destX, destY, destZ;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new bguild_crashAI (creature);
    }

};

enum Darkfang
{
    EVENT_DARKFANG_SUMMON_TARGET = 1,
    EVENT_DARKFANG_JUMP          = 2,

    SPELL_THUNDERCLAP            = 36214,
    NPC_JUMP_TARGET              = 60024,
};

class bguild_darkfang : public CreatureScript
{
public:
    bguild_darkfang() : CreatureScript("bguild_darkfang") { }

    struct bguild_darkfangAI : public ScriptedAI
    {
        bguild_darkfangAI(Creature* creature) : ScriptedAI(creature), summons(me) {}

    void JustEngagedWith(Unit* who) override
    {
        events.RescheduleEvent(EVENT_DARKFANG_SUMMON_TARGET, 10s);
        chargeGUID.Clear();
    }

    void JustSummoned(Creature* cr) override
    {
        summons.Summon(cr);
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        switch (events.ExecuteEvent())
        {
            case EVENT_DARKFANG_SUMMON_TARGET:
            {
                if (Unit* target = me->GetVictim())
                {
                    if (Creature* cr = me->SummonCreature(NPC_JUMP_TARGET, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 2500))
                    {
                        chargeGUID = cr->GetGUID();
                    }
                    events.RescheduleEvent(EVENT_DARKFANG_JUMP, 2s);
                }
                break;
            }
            case EVENT_DARKFANG_JUMP:
            {
                if (Creature* target = ObjectAccessor::GetCreature(*me, chargeGUID))
                {
                    DoCastSelf(SPELL_THUNDERCLAP);
                    me->GetMotionMaster()->MoveJump(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 20.0f, 6.0f);
                    summons.DespawnAll();
                    events.RescheduleEvent(EVENT_DARKFANG_SUMMON_TARGET, 10s, 15s);
                    chargeGUID.Clear();
                }
                break;
            }
        }

        DoMeleeAttackIfReady();
    }

    bool InstaKillCheck()
    {
        if (Player* p = me->SelectNearestPlayer(5))
        {
            if (p->IsAlive() && p->GetExactDist(me) <= 5.0f)
            {
                p->KillSelf();
                return true;
            }
        }
        return false;
    }

    void MovementInform(uint32 type, uint32 /*id*/) override
    {
        if (type == 16) // Jump, called only once, upon landing
        {
            DoCastSelf(SPELL_THUNDERCLAP);
            InstaKillCheck();
        }
    }

    void EnterEvadeMode(EvadeReason /*why*/) override
    {
        me->DespawnOrUnsummon();
        summons.DespawnAll();
    }

    private:
        EventMap events;
        SummonList summons;
        ObjectGuid chargeGUID;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new bguild_darkfangAI (creature);
    }

};

void AddBrawlersGuildScriptsFights()
{
    new bguild_crash();
    new bguild_darkfang();
}
