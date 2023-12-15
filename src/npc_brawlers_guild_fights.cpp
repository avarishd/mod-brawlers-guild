#include <sstream>
#include <string.h>
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "World.h"
#include "Player.h"
#include "Chat.h"

const Position ArenaCenter =  {2178.2f, -4764.79f, 55.2f};

enum CrashSpells
{
    SPELL_MASSIVE_CRASH  = 200004,
    SPELL_STAGGERED_DAZE = 66758,
};

enum CrashEvents
{
    EVENT_JUMP_MIDDLE         = 1,
    EVENT_SPELL_MASSIVE_CRASH = 2,
    EVENT_GAZE                = 3,
    EVENT_JUMP_BACK           = 4,
    EVENT_TRAMPLE             = 5,
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
        events.RescheduleEvent(EVENT_JUMP_MIDDLE, 20s);
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
            case EVENT_JUMP_MIDDLE:
            {
                // Charge highest threat target.
                if (Unit* target = SelectTarget(SelectTargetMethod::MaxThreat, 0, 0.0f, true))
                    TargetGUID = target->GetGUID();

                me->StopMoving();
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveIdle();
                me->SetReactState(REACT_PASSIVE);
                me->AttackStop();
                me->GetMotionMaster()->MoveJump(ArenaCenter.GetPositionX(), ArenaCenter.GetPositionY(), ArenaCenter.GetPositionZ(), 20.0f, 6.0f);
                //events.Reset();
                events.RescheduleEvent(EVENT_SPELL_MASSIVE_CRASH, 2s);
                break;
            }
            case EVENT_SPELL_MASSIVE_CRASH:
            {
                me->GetMotionMaster()->Clear();
                DoCastSelf(SPELL_MASSIVE_CRASH);

                events.RescheduleEvent(EVENT_GAZE, 2s);
                break;
            }
            case EVENT_GAZE:
            {
                if (Unit* target = ObjectAccessor::GetPlayer(*me, TargetGUID))
                {
                    me->SetFacingToObject(target);
                    me->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
                    events.RescheduleEvent(EVENT_JUMP_BACK, 2s);
                }
                else // in case something went wrong
                {
                    events.RescheduleEvent(EVENT_JUMP_MIDDLE, 30s, 50s);
                    me->GetMotionMaster()->MovementExpired();
                    me->SetReactState(REACT_AGGRESSIVE);
                }
            break;
            }
            case EVENT_JUMP_BACK:
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

                events.RescheduleEvent(EVENT_TRAMPLE, 2s);
                break;
            }
            case EVENT_TRAMPLE:
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
            events.RescheduleEvent(EVENT_JUMP_MIDDLE, 30s, 35s);

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


void AddBrawlersGuildScriptsFights()
{
    new bguild_crash();
}
