SET @ID := 200000;
SET @GUID := 3000000;

-- Helix (Main)
DELETE FROM `creature_template` WHERE (`entry` = @ID+0);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+0, 0, 0, 0, 0, 0, 'Helix', 'Brawler\'s Guild', '', 0, 80, 80, 0, 35, 3, 1, 1, 1, 1, 1, 2, 3, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 400, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_brawlers_guild', 0);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+0;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+0, 0, 30076, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+0);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+0, @ID+0, 0, 0, 1, 0, 0, 1, 1, 0, 2204.28, -4781.21, 65.8329, 2.55355, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL);


-- Selena (Vendor)
DELETE FROM `creature_template` WHERE (`entry` = @ID+1);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+1, 0, 0, 0, 0, 0, 'Selena', 'Brawler\'s Guild', 'Speak', 0, 80, 80, 0, 35, 129, 1, 1, 1, 1, 1, 2, 3, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 400, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_brawlers_vendor', 0);

DELETE FROM `npc_vendor` WHERE (`entry` = @ID+1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES
(@ID+1, 0, 33445, 0, 0, 0, 0),
(@ID+1, 0, 40202, 0, 0, 0, 0);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+1;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+1, 0, 10746, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+1);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+1, @ID+1, 0, 0, 1, 0, 0, 1, 1, 0, 2214.9, -4772.83, 64.9912, 4.01499, 300, 0, 0, 2136800, 0, 0, 0, 0, 0, '', NULL, 0, NULL);


-- El Rato (Get out of Arena)
DELETE FROM `creature_template` WHERE (`entry` = @ID+2);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+2, 0, 0, 0, 0, 0, 'El Rato', 'Brawler\'s Guild', '', 0, 80, 80, 0, 35, 1, 1, 1, 1, 1, 1, 3, 3, 0, 1, 0, 0, 0, 0, 1, 768, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 400, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_anti_stuck', 0);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+2;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+2, 0, 1141, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+2);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+2, @ID+2, 0, 0, 1, 0, 0, 1, 1, 0, 2200.73, -4769.51, 55.1391, 2.72533, 300, 0, 0, 2136800, 0, 0, 0, 0, 0, '', NULL, 0, NULL);


-- Brawler's Medic (AoE Resurrect)
DELETE FROM `creature_template` WHERE (`entry` = @ID+3);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+3, 0, 0, 0, 0, 0, 'Brawler\'s Medic', '', NULL, 0, 20, 20, 0, 35, 0, 1.2, 1.14286, 1, 1, 20, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 12340);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+3;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+3, 0, 3943, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+3);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+3, @ID+3, 0, 0, 1, 0, 0, 1, 1, 0, 2151.15, -4748.14, 67.73, 5.768, 300, 0, 0, 484, 0, 0, 0, 0, 0, '', NULL, 0, NULL);

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+3, 0, 0, 0, 60, 0, 100, 0, 30000, 30000, 30000, 30000, 0, 0, 11, 200003, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Brawler\'s Medic - On Update - Cast \'Mass Resurrect\'');


-- Arena Spectator
DELETE FROM `creature_template` WHERE (`entry` = @ID+4);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+4, 0, 0, 0, 0, 0, 'Arena Spectator', NULL, NULL, 0, 70, 80, 0, 35, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 2000, 2000, 1, 1, 2, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 12340);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+4;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+4, 0, 9069, 1, 1, 0),
(@ID+4, 1, 9070, 1, 1, 0),
(@ID+4, 2, 9071, 1, 1, 0),
(@ID+4, 3, 9072, 1, 1, 0);

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+4);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+4, 0, 0, 0, 11, 0, 50, 0, 0, 0, 0, 0, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - On Respawn - Set Flag Standstate Sit Down'),
(@ID+4, 0, 1, 2, 1, 0, 50, 0, 10000, 30000, 10000, 30000, 0, 0, 10, 22, 4, 5, 11, 21, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - Out of Combat - Play Random Emote'),
(@ID+4, 0, 2, 0, 61, 0, 50, 0, 0, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - Out of Combat - Remove FlagStandstate Sit Down'),
(@ID+4, 0, 3, 0, 1, 0, 50, 0, 30000, 50000, 30000, 50000, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - Out of Combat - Set Flag Standstate Sit Down');

DELETE FROM `creature` WHERE (`id1` = @ID+4);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+4, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2187.68, -4799.1, 69.2771, 1.83551, 300, 0, 0, 4042, 3809, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+5, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2191.09, -4801.61, 71.7994, 1.9219, 300, 0, 0, 4042, 3809, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+6, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2195.24, -4800.17, 71.9483, 1.92976, 300, 0, 0, 3722, 3561, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+7, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2195.05, -4796.63, 69.5951, 1.96903, 300, 0, 0, 3422, 3309, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+8, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2153.2, -4791.66, 70.2852, 0.790929, 300, 0, 0, 3240, 3155, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+9, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2145.96, -4786.94, 72.0682, 0.790929, 300, 0, 0, 3722, 3561, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+10, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2138.08, -4774.16, 72.8311, 0.115486, 300, 0, 0, 4155, 3893, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+11, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2148.36, -4741.24, 71.4997, 5.72323, 300, 0, 0, 4155, 3893, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+12, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2142, -4756.69, 70.2852, 5.99026, 300, 0, 0, 3933, 3725, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+13, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2174.18, -4723.97, 72.8293, 4.67865, 300, 0, 0, 3933, 3725, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+14, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2184.07, -4727.8, 70.8666, 4.45481, 300, 0, 0, 3240, 3155, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+15, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2185.48, -4728.08, 70.9617, 4.3959, 300, 0, 0, 3519, 3387, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+16, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2209.51, -4743.88, 70.2847, 3.8422, 300, 0, 0, 3519, 3387, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+17, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2212.99, -4758.6, 69.1504, 3.29635, 300, 0, 0, 3933, 3725, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+18, @ID+4, 0, 0, 1, 0, 0, 1, 1, 0, 2217.33, -4767.35, 71.7272, 3.15105, 300, 0, 0, 4274, 3994, 0, 0, 0, 0, '', NULL, 0, NULL);


-- Arena Spectator 2
DELETE FROM `creature_template` WHERE (`entry` = @ID+5);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+5, 0, 0, 0, 0, 0, 'Arena Spectator', NULL, NULL, 0, 70, 80, 0, 35, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 2000, 2000, 1, 1, 2, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 12340);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+5;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+5, 0, 29572, 1, 1, 0),
(@ID+5, 1, 29579, 1, 1, 0),
(@ID+5, 2, 25431, 1, 1, 0),
(@ID+5, 3, 2860, 1, 1, 0);

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+5);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+5, 0, 0, 0, 11, 0, 50, 0, 0, 0, 0, 0, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - On Respawn - Set Flag Standstate Sit Down'),
(@ID+5, 0, 1, 2, 1, 0, 50, 0, 10000, 30000, 10000, 30000, 0, 0, 10, 22, 4, 5, 11, 21, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - Out of Combat - Play Random Emote'),
(@ID+5, 0, 2, 0, 61, 0, 50, 0, 0, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - Out of Combat - Remove FlagStandstate Sit Down'),
(@ID+5, 0, 3, 0, 1, 0, 50, 0, 30000, 50000, 30000, 50000, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Arena Spectator - Out of Combat - Set Flag Standstate Sit Down');

DELETE FROM `creature` WHERE (`id1` = @ID+5);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+19, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2190.74, -4800.09, 70.7193, 2.03971, 300, 0, 0, 3240, 3155, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+20, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2165.96, -4800.58, 70.2852, 1.2229, 300, 0, 0, 4155, 3893, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+21, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2158.61, -4800.81, 72.8294, 1.01869, 300, 0, 0, 3422, 3309, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+22, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2150.26, -4791.61, 71.8545, 0.73595, 300, 0, 0, 3519, 3387, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+23, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2150.21, -4786.92, 69.7826, 0.767366, 300, 0, 0, 4274, 3994, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+24, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2143.42, -4777.62, 70.2849, 0.374666, 300, 0, 0, 3422, 3309, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+25, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2143.52, -4747.77, 71.9087, 5.80962, 300, 0, 0, 3519, 3387, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+26, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2147.19, -4746.18, 70.2849, 5.80962, 300, 0, 0, 3722, 3561, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+27, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2150.17, -4743.57, 69.564, 5.80962, 300, 0, 0, 3422, 3309, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+28, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2158.69, -4728.57, 72.8306, 5.05564, 300, 0, 0, 3240, 3155, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+29, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2167.72, -4729.34, 70.2861, 4.98888, 300, 0, 0, 3825, 3643, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+30, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2190.43, -4731.62, 69.5029, 4.52549, 300, 0, 0, 4155, 3893, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+31, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2203.03, -4732.09, 72.8298, 4.12494, 300, 0, 0, 4274, 3994, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+32, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2215.83, -4747.27, 72.8298, 3.59087, 300, 0, 0, 3519, 3387, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+33, @ID+5, 0, 0, 1, 0, 0, 1, 1, 0, 2213.75, -4762.85, 69.425, 3.33954, 300, 0, 0, 3519, 3387, 0, 0, 0, 0, '', NULL, 0, NULL);


-- Goblin Firework Tonk
DELETE FROM `creature_template` WHERE (`entry` = @ID+6);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+6, 0, 0, 0, 0, 0, 'Goblin Firework Tonk', '', NULL, 0, 1, 1, 0, 35, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 2000, 2000, 1, 1, 2, 768, 0, 0, 0, 0, 0, 0, 0, 9, 1048576, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 12340);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+6;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+6, 0, 15381, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+6);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+34, @ID+6, 0, 0, 1, 0, 0, 1, 1, 0, 2203.25, -4762.87, 60.7895, 3.27511, 300, 0, 0, 41, 60, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+35, @ID+6, 0, 0, 1, 0, 0, 1, 1, 0, 2188.07, -4787.94, 60.7898, 1.95957, 300, 0, 0, 41, 60, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+36, @ID+6, 0, 0, 1, 0, 0, 1, 1, 0, 2184.3, -4740.96, 60.7894, 4.48462, 300, 0, 0, 41, 60, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+37, @ID+6, 0, 0, 1, 0, 0, 1, 1, 0, 2157.35, -4752.09, 60.7901, 5.72555, 300, 0, 0, 41, 60, 0, 0, 0, 0, '', NULL, 0, NULL),
(@GUID+38, @ID+6, 0, 0, 1, 0, 0, 1, 1, 0, 2159.7, -4781.09, 60.7898, 0.753985, 300, 0, 0, 41, 60, 0, 0, 0, 0, '', NULL, 0, NULL);

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+6);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+6, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 0, 0, 11, 11543, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Goblin Firework Tonk - On Data Set 1 1 - Cast \'Red, White and Blue Firework\'');


-- Arena Annnouncer
DELETE FROM `creature_template` WHERE (`entry` = @ID+7);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+7, 0, 0, 0, 0, 0, 'Jesse', '', NULL, 0, 1, 1, 0, 35, 0, 1, 1, 1, 1, 1, 1.5, 0, 0, 1, 2000, 2000, 1, 1, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 9, 1048576, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 100, 1, 0, 0, 2, 'npc_arena_announcer', 12340);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+7;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+7, 0, 17192, 1, 1, 0);

DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+7);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+7, @ID+7*10, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_template_movement` WHERE (`CreatureId` = @ID+7);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES
(@ID+7, 0, 0, 2, 0, 0, 0, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+7);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+39, @ID+7, 0, 0, 1, 0, 0, 1, 1, 0, 2197.32, -4766.33, 75, 2.05853, 120, 0, 0, 1, 0, 2, 0, 0, 0, '', 0, 0, NULL);

DELETE FROM `waypoint_data` WHERE `id` = @ID+7*10;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@ID+7*10, 1, 2197.32, -4766.33, 75, 2.05853, 0, 0, 0, 100, 0),
(@ID+7*10, 2, 2184.99, -4747.26, 75, 2.8832, 0, 0, 0, 100, 0),
(@ID+7*10, 3, 2162.1, -4753.4, 75, 4.06915, 0, 0, 0, 100, 0),
(@ID+7*10, 4, 2163.26, -4777.66, 75, 5.41925, 0, 0, 0, 100, 0),
(@ID+7*10, 5, 2186, -4784.54, 75, 0.56549, 0, 0, 0, 100, 0);

-- Chip (Gambler)
DELETE FROM `creature_template` WHERE (`entry` = @ID+8);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+8, 0, 0, 0, 0, 0, 'Chip', 'The Gambler', NULL, 0, 1, 1, 0, 35, 0, 1, 1, 1, 1, 1, 1.5, 0, 0, 1, 2000, 2000, 1, 1, 1, 768, 0, 0, 0, 0, 0, 0, 0, 9, 1048576, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 100, 1, 0, 0, 2, 'npc_arena_gambler', 12340);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+8;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+8, 0, 22525, 1, 1, 0);

DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+8);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+8, 0, 0, 0, 0, 0, 0, '51126');


-- ### Trigger NPCS ### > @ID+20
-- Player Healing Reduce (25%)
DELETE FROM `creature_template` WHERE (`entry` = @ID+20);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+20, 0, 0, 0, 0, 0, 'Player Healing Reduce (25%)', '', '', 0, 1, 1, 0, 35, 0, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 130, '', 0);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+20;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+20, 0, 169, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+20);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+40, @ID+20, 0, 0, 1, 0, 0, 1, 1, 0, 2178.22, -4764.79, 55.1381, 1.12705, 300, 0, 0, 42, 0, 0, 0, 33554432, 0, '', NULL, 0, NULL);

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+20);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+20, 0, 0, 0, 101, 0, 100, 0, 1, 25, 10000, 10000, 10000, 0, 11, 200002, 2, 0, 0, 0, 0, 201, 200002, 1, 25, 0, 0, 0, 0, 0, 'Player Healing Reduce (25%) - On 1 or More Players in Range - Add Aura \'=25% healing\'');

-- Other Players Detector
DELETE FROM `creature_template` WHERE (`entry` = @ID+21);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+21, 0, 0, 0, 0, 0, 'Other Players Detector', '', '', 0, 1, 1, 0, 35, 0, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 130, 'npc_other_players_detector', 0);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+21;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+21, 0, 169, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+21);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+41, @ID+21, 0, 0, 1, 0, 0, 1, 1, 0, 2178.22, -4764.79, 55.1381, 0.942478, 300, 0, 0, 42, 0, 0, 0, 33554432, 0, '', NULL, 0, NULL);

-- Player Detector (Logic NPC, npc_player_detector)
DELETE FROM `creature_template` WHERE (`entry` = @ID+22);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+22, 0, 0, 0, 0, 0, 'Player Detector', '', '', 0, 1, 1, 0, 35, 0, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 130, 'npc_player_detector', 0);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+22;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+22, 0, 169, 1, 1, 0);

DELETE FROM `creature` WHERE (`id1` = @ID+22);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(@GUID+42, @ID+22, 0, 0, 1, 0, 0, 1, 1, 0, 2178.22, -4764.79, 55.1381, 4.1, 300, 0, 0, 42, 0, 0, 0, 33554432, 0, '', NULL, 0, NULL);
