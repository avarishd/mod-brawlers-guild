SET @ID := 200100;

-- Rank 1
DELETE FROM `creature_template` WHERE (`entry` = @ID+0);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+0, 0, 0, 0, 0, 0, 'Bob', 'S1 | Rank 1', '', 0, 81, 81, 0, 14, 0, 1.1, 1.25, 1, 1, 10, 1, 1, 0, 10, 0, 0, 0, 0, 1, 0, 0, 0, 46, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 105, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+0;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+0, 0, 25390, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+0, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 10000, 10000, 0, 0, 11, 16791, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bob - In Combat - Cast \'Furious Anger\''),
(@ID+0, 0, 1, 0, 9, 0, 100, 0, 0, 5000, 7000, 12000, 8, 40, 11, 61174, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Bob - Within 8-40 Range - Cast \'Slide\''),
(@ID+0, 0, 2, 0, 0, 0, 100, 0, 0, 8000, 12000, 16000, 0, 0, 11, 29578, 32, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Bob - In Combat - Cast \'Rend\''),
(@ID+0, 0, 3, 0, 2, 0, 100, 0, 20, 25, 0, 0, 0, 0, 11, 37023, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bob - Between 20-25% Health - Cast \'Frenzy\' (20% physical)');

DELETE FROM `creature_template` WHERE (`entry` = @ID+1);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+1, 0, 0, 0, 0, 0, 'Smiley', 'S1 | Rank 1', '', 0, 81, 81, 0, 14, 0, 1.1, 1.25, 1, 1, 10, 3, 1, 0, 10, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 105, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+1;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+1, 0, 682, 1, 1, 0);
DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+1);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+1, 0, 0, 0, 0, 0, 0, '29486');
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+1, 0, 0, 0, 0, 0, 100, 0, 8000, 16000, 16000, 20000, 0, 0, 11, 51137, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Smiley - In Combat - Cast \'Paralyzing Slime\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+2);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+2, 0, 0, 0, 0, 0, 'Dungeon Master Billy', 'S1 | Rank 1', '', 0, 81, 81, 0, 14, 0, 1.1, 1.25, 1, 1, 10, 1.5, 1, 0, 10, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 105, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+2;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+2, 0, 25558, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+2);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+2, 0, 0, 0, 9, 0, 100, 0, 0, 5000, 10000, 15000, 5, 30, 11, 49576, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Dungeon Master Billy - Within 5-30 Range - Cast \'Death Grip\''),
(@ID+2, 0, 1, 0, 9, 0, 100, 0, 6000, 8000, 6000, 12000, 0, 5, 11, 60924, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Dungeon Master Billy - Within 0-5 Range - Cast \'Lich Slap\''),
(@ID+2, 0, 2, 3, 0, 0, 100, 1, 25000, 50000, 0, 0, 0, 0, 224, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dungeon Master Billy - In Combat - Stop Attack (No Repeat)'),
(@ID+2, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 5, 94, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dungeon Master Billy - In Combat - Play Emote 94 (No Repeat)'),
(@ID+2, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 42741, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dungeon Master Billy - In Combat - Cast \'Pumped Up!\' (No Repeat)'),
(@ID+2, 0, 5, 6, 22, 0, 100, 1, 17, 1000, 1000, 0, 0, 0, 75, 62537, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dungeon Master Billy - Received Emote 17 - Add Aura \'Frog Love\' (No Repeat)'),
(@ID+2, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 75, 26034, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Dungeon Master Billy - Received Emote 17 - Add Aura \'Viscidus Slowed\' (No Repeat)');

DELETE FROM `creature_template` WHERE (`entry` = @ID+3);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+3, 0, 0, 0, 0, 0, 'Zerg', 'S1 | Rank 1', '', 0, 81, 81, 0, 14, 0, 1.1, 1.25, 1, 1, 10, 0.25, 1, 0, 10, 0, 0, 0, 0, 1, 0, 0, 0, 41, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 105, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+3;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+3, 0, 15695, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+3, 0, 0, 0, 0, 0, 100, 0, 3000, 6000, 3000, 6000, 0, 0, 11, 17470, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Zerg - In Combat - Cast \'Ravenous Claw\''),
(@ID+3, 0, 1, 0, 0, 0, 100, 0, 0, 8000, 5000, 10000, 0, 0, 11, 54115, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Zerg - In Combat - Cast \'Blight Crystal Explosion\'');


-- Rank 2
DELETE FROM `creature_template` WHERE (`entry` = @ID+4);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+4, 0, 0, 0, 0, 0, 'Electrified Golem', 'S1 | Rank 2', '', 0, 81, 81, 0, 14, 0, 1.1, 1.25, 1, 1, 10, 1.25, 1, 0, 10, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 110, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+4;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+4, 0, 26592, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+4);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+4, 0, 0, 0, 0, 0, 100, 0, 3000, 7000, 20000, 25000, 0, 0, 11, 55636, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Electrified Golem - In Combat - Cast \'Shockwave\''),
(@ID+4, 0, 1, 0, 0, 0, 100, 0, 15000, 25000, 25000, 30000, 0, 0, 11, 43362, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Electrified Golem - In Combat - Cast \'Electrified Net\''),
(@ID+4, 0, 2, 0, 9, 0, 100, 0, 5000, 10000, 12000, 22000, 0, 15, 11, 53071, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Electrified Golem - Within 0-15 Range - Cast \'Thunderstorm\''),
(@ID+4, 0, 3, 0, 0, 0, 100, 0, 35000, 40000, 40000, 45000, 0, 0, 11, 20542, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Electrified Golem - In Combat - Cast \'Static Conduit\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+5);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+5, 0, 0, 0, 0, 0, 'Bomb Bot', 'S1 | Rank 2', '', 0, 81, 81, 0, 14, 0, 1.1, 0.5, 1, 1, 10, 1, 1, 0, 8, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 110, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+5;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+5, 0, 6977, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+5);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+5, 0, 0, 0, 0, 0, 100, 0, 1000, 5000, 1000, 5000, 0, 0, 11, 35276, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Bomb Bot - In Combat - Cast \'Throw Dynamite\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+6);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+6, 0, 0, 0, 0, 0, 'Projection Unit', 'S1 | Rank 2', '', 0, 81, 81, 0, 14, 0, 1.1, 0.2, 1, 1, 10, 1.25, 1, 0, 10, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 100, 1, 1, 1, 0, 223, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+6;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+6, 0, 26937, 1, 1, 0);
DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+6);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+6, 0, 0, 50331648, 1, 0, 0, '');
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+6);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+6, 0, 0, 0, 0, 0, 100, 0, 0, 10000, 3000, 10000, 0, 0, 11, 47751, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Projection Unit - In Combat - Cast \'Spark\''),
(@ID+6, 0, 1, 0, 0, 0, 100, 0, 2000, 2000, 2000, 3000, 0, 0, 12, @ID+7, 3, 10000, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Projection Unit - In Combat - Summon Creature \'Projection Unit\''),
(@ID+6, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Projection Unit - On Just Died - Despawn Summons');

DELETE FROM `creature_template` WHERE (`entry` = @ID+7);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+7, 0, 0, 0, 0, 0, 'Projection Unit', '', '', 0, 81, 81, 0, 14, 0, 1.1, 1.25, 1, 1, 10, 1.25, 1, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 2, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+7;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+7, 0, 26937, 1, 1, 0);

DELETE FROM `creature_template` WHERE (`entry` = @ID+8);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+8, 0, 0, 0, 0, 0, 'King Dash', 'S1 | Rank 2', '', 0, 81, 81, 0, 14, 0, 1.1, 0.75, 1, 1, 10, 0.5, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 110, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+8;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+8, 0, 5240, 1, 1, 0);
DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+8);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+8, 0, 0, 0, 0, 0, 0, '25039');
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+8);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+8, 0, 0, 0, 0, 0, 100, 0, 8000, 16000, 15000, 20000, 0, 0, 11, 44531, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'King Dash - In Combat - Cast \'Dash\''),
(@ID+8, 0, 1, 0, 0, 0, 100, 0, 4000, 8000, 8000, 12000, 0, 0, 11, 4101, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'King Dash - In Combat - Cast \'Enraging Bite\'');


-- Rank 3
DELETE FROM `creature_template` WHERE (`entry` = @ID+9);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+9, 0, 0, 0, 0, 0, 'Mazhareen', 'S1 | Rank 3', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 0.8, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 115, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+9;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+9, 0, 28010, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+9, 0, 0, 0, 0, 0, 100, 0, 2000, 2000, 2000, 2000, 0, 0, 11, 50713, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Mazhareen - In Combat - Cast \'Unrelenting Onslaught\''),
(@ID+9, 0, 1, 0, 2, 0, 100, 0, 0, 25, 24000, 24000, 0, 0, 11, 52968, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Mazhareen - Between 0-25% Health - Cast \'Heartblood Rage\''),
(@ID+9, 0, 2, 0, 23, 0, 100, 0, 50713, 20, 5000, 7000, 0, 0, 11, 59840, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Mazhareen - On Aura \'Unrelenting Onslaught\' (20 stacks) - Cast \'Powerful Bite\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+10);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+10, 0, 0, 0, 0, 0, 'Gorenog', 'S1 | Rank 3', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1.5, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 115, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+10;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+10, 0, 26304, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+10, 0, 0, 0, 9, 0, 100, 0, 1000, 3000, 3000, 4000, 5, 30, 11, 55982, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Mazhareen - Within 5-30 Range - Cast \'Mammoth Charge\''),
(@ID+10, 0, 1, 0, 0, 0, 100, 0, 12000, 20000, 12000, 20000, 0, 0, 11, 62331, 32, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Gorenog - In Combat - Cast \'Impale\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+11);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+11, 0, 0, 0, 0, 0, 'Darkfeather', 'S1 | Rank 3', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 115, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+11;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+11, 0, 17864, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+11);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+11, 0, 0, 0, 0, 0, 100, 0, 10000, 15000, 10000, 15000, 0, 0, 11, 61672, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkfeather - In Combat - Cast \'Choking Cloud\''),
(@ID+11, 0, 1, 0, 0, 0, 100, 0, 2000, 2000, 2000, 2000, 0, 0, 11, 56891, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkfeather - In Combat - Cast \'Lightning Bolt\''),
(@ID+11, 0, 2, 0, 0, 0, 100, 0, 10000, 15000, 10000, 15000, 0, 0, 11, 37332, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkfeather - In Combat - Cast \'Frost Shock\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+12);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+12, 0, 0, 0, 0, 0, 'Ming Li', 'S1 | Rank 3', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 2.5, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 115, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+12;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+12, 0, 30414, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+12);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+12, 0, 0, 0, 0, 0, 100, 0, 30000, 40000, 30000, 40000, 0, 0, 11, 63784, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Ming Li - In Combat - Cast \'Bladestorm\''),
(@ID+12, 0, 1, 0, 0, 0, 100, 0, 5000, 7000, 5000, 7000, 0, 0, 11, 49648, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Ming Li - In Combat - Cast \'Summon Fissure\''),
(@ID+12, 0, 2, 0, 0, 0, 100, 0, 12000, 20000, 12000, 20000, 0, 0, 11, 25322, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Ming Li - In Combat - Cast \'Sweeping Slam\'');


-- Rank 4
DELETE FROM `creature_template` WHERE (`entry` = @ID+13);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+13, 0, 0, 0, 0, 0, 'Crash', 'S1 | Rank 4', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 240, 1, 1, 1, 0, 0, 1, 549666683, 0, 1074790400, 'bguild_crash', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+13;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+13, 0, 22486, 1, 1, 0);

DELETE FROM `creature_template` WHERE (`entry` = @ID+14);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+14, 0, 0, 0, 0, 0, 'Illaria the Illusionist', 'S1 | Rank 4', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 5, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 120, 10, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+14;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+14, 0, 7274, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+14);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+14, 0, 0, 0, 0, 0, 100, 0, 0, 0, 2500, 2500, 0, 0, 11, 42894, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Illaria the Illusionist - In Combat - Cast \'Arcane Blast\''),
(@ID+14, 0, 1, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 0, 0, 12, @ID+15, 3, 30000, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Illaria the Illusionist - In Combat - Summon Creature \'Illaria the Illusionist\''),
(@ID+14, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Illaria the Illusionist - On Just Died - Despawn Summons'),
(@ID+14, 0, 3, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Illaria the Illusionist - On Evade - Despawn Summons'),
(@ID+14, 0, 4, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 22581, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Illaria the Illusionist - On Respawn - Cast \'Glowy (Purple)\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+15);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+15, 0, 0, 0, 0, 0, 'Illaria the Illusionist', 'S1 | Rank 4', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 1, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 2, 10, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+15;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+15, 0, 7274, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+15);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+15, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3000, 3000, 0, 0, 11, 37930, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Illaria the Illusionist - In Combat - Cast \'Frostbolt\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+16);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+16, 0, 0, 0, 0, 0, 'Circuitron', 'S1 | Rank 4', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 120, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+16;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+16, 0, 30076, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+16);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+16, 0, 0, 0, 0, 0, 100, 0, 7000, 12000, 7000, 12000, 0, 0, 11, 69021, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Circuitron - In Combat - Cast \'Mighty Kick\''),
(@ID+16, 0, 1, 0, 2, 0, 100, 0, 0, 50, 10000, 10000, 0, 0, 11, 34619, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Circuitron - Between 0-50% Health - Cast \'Repair\''),
(@ID+16, 0, 2, 0, 23, 0, 100, 0, 34619, 1, 2500, 2500, 0, 0, 11, 19712, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Circuitron - On Aura \'Repair\' - Cast \'Arcane Explosion\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+17);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+17, 0, 0, 0, 0, 0, 'Terror', 'S1 | Rank 4', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 2, 1, 0, 12, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 120, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+17;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+17, 0, 12193, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+17);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+17, 0, 0, 0, 0, 0, 100, 0, 10000, 20000, 10000, 20000, 0, 0, 11, 22422, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Terrorel - In Combat - Cast \'Water\''),
(@ID+17, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 12000, 15000, 0, 0, 11, 61600, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Terrorel - In Combat - Cast \'Plague Strike\''),
(@ID+17, 0, 2, 0, 0, 0, 100, 0, 15000, 15000, 10000, 15000, 0, 0, 11, 65038, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Terrorel - In Combat - Cast \'Crush\''),
(@ID+17, 0, 3, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 55212, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Terrorel - On Respawn - Cast \'Blood Presence\'');


-- Rank 5
DELETE FROM `creature_template` WHERE (`entry` = @ID+18);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+18, 0, 0, 0, 0, 0, 'Shadowthorn', 'S1 | Rank 5', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 125, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+18;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+18, 0, 17781, 1, 1, 0),
(@ID+18, 1, 17718, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+18);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+18, 0, 0, 0, 0, 0, 100, 0, 5000, 12000, 8000, 12000, 0, 0, 11, 38880, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowthorn - In Combat - Cast \'Forked Lightning Tether\''),
(@ID+18, 0, 1, 0, 0, 0, 100, 0, 12000, 15000, 15000, 20000, 0, 0, 11, 20754, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowthorn - In Combat - Cast \'Rain of Fire\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+19);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+19, 0, 0, 0, 0, 0, 'Leper Gnome Quin', 'S1 | Rank 5', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 125, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+19;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+19, 0, 6921, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+19);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+19, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 19705, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Leper Gnome Quin - On Respawn - Cast \'Well Fed\''),
(@ID+19, 0, 1, 0, 0, 0, 100, 0, 55000, 55000, 55000, 55000, 0, 0, 11, 71163, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Leper Gnome Quin - In Combat - Cast \'Devour Humanoid\''),
(@ID+19, 0, 2, 0, 0, 0, 100, 0, 3000, 5000, 3000, 5000, 0, 0, 11, 200005, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Leper Gnome Quin - In Combat - Cast \'Leap\''),
(@ID+19, 0, 3, 0, 67, 0, 100, 0, 5000, 10000, 10000, 10000, 0, 5, 11, 15582, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Leper Gnome Quin - On Behind Target - Cast \'Backstab\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+20);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+20, 0, 0, 0, 0, 0, 'Darkfang', 'S1 | Rank 5', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 125, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, 'bguild_darkfang', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+20;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+20, 0, 26789, 1, 1, 0);

DELETE FROM `creature_template` WHERE (`entry` = @ID+21);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+21, 0, 0, 0, 0, 0, 'Trigger Jump Target', '', '', 0, 1, 1, 0, 35, 0, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 130, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+21;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+21, 0, 169, 1, 1, 0);
DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+21);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+21, 0, 0, 0, 0, 0, 0, '42171');

DELETE FROM `creature_template` WHERE (`entry` = @ID+22);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+22, 0, 0, 0, 0, 0, 'Klunk', 'S1 | Rank 5', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 125, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+22;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+22, 0, 30616, 1, 1, 0);
DELETE FROM `creature_equip_template` WHERE (`CreatureID` = @ID+22);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES
(@ID+22, 1, 1485, 0, 0, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+22);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+22, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 54647, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Klunk - On Respawn - Cast \'Spirit Burn\''),
(@ID+22, 0, 1, 2, 0, 0, 100, 0, 7000, 10000, 7000, 10000, 0, 0, 224, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Klunk - In Combat - Stop Attack'),
(@ID+22, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Klunk - In Combat - Set Reactstate Passive'),
(@ID+22, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 66, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Klunk - In Combat - Set Orientation Random'),
(@ID+22, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 63317, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Klunk - In Combat - Cast \'Flame Breath\''),
(@ID+22, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 80, @ID+22*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Klunk - In Combat - Run Script');
DELETE FROM `smart_scripts` WHERE (`source_type` = 9 AND `entryorguid` = @ID+22*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+22*100, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Klunk - Actionlist - Set Reactstate Aggressive');


-- Rank 6
DELETE FROM `waypoints` WHERE `entry`=@ID+23*10;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `point_comment`) VALUES
(@ID+23*10, 1, 2179.798, -4782.790, 55.13808, 0.24073, 0, 'NULL'),
(@ID+23*10, 2, 2190.824, -4779.494, 55.13808, 0.42530, 0, 'NULL'),
(@ID+23*10, 3, 2199.243, -4770.183, 55.13808, 1.62696, 0, 'NULL'),
(@ID+23*10, 4, 2197.612, -4758.468, 55.13808, 2.30240, 0, 'NULL'),
(@ID+23*10, 5, 2186.042, -4746.990, 55.13808, 2.75008, 0, 'NULL'),
(@ID+23*10, 6, 2175.645, -4745.033, 55.13808, 3.34698, 0, 'NULL'),
(@ID+23*10, 7, 2165.130, -4749.688, 55.13808, 4.07740, 0, 'NULL'),
(@ID+23*10, 8, 2158.761, -4761.024, 55.13808, 4.43083, 0, 'NULL'),
(@ID+23*10, 9, 2159.371, -4772.311, 55.13808, 5.27906, 0, 'NULL'),
(@ID+23*10, 10, 2166.691, -4780.736, 55.13808, 5.78172, 0, 'NULL'),
(@ID+23*10, 11, 2172, -4786, 55.13808, 5.78172, 0, 'NULL');
DELETE FROM `creature_template` WHERE (`entry` = @ID+23);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+23, 0, 0, 0, 0, 0, 'Shortneck', 'S1 | Rank 6', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 130, 1, 1, 1, 0, 0, 1, 1859889151, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+23;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+23, 0, 4270, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+23);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+23, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shortneck - On Respawn - Set Reactstate Passive'),
(@ID+23, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 53, 1, @ID+23*10, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shortneck - On Aggro - Start Patrol Path'),
(@ID+23, 0, 2, 0, 2, 0, 100, 0, 0, 75, 0, 0, 0, 0, 136, 1, 1, 30, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shortneck - Between 0-75% Health - Set Run Speed to 1.30'),
(@ID+23, 0, 3, 0, 2, 0, 100, 0, 0, 50, 0, 0, 0, 0, 136, 1, 1, 40, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shortneck - Between 0-50% Health - Set Run Speed to 1.40'),
(@ID+23, 0, 4, 0, 2, 0, 100, 0, 0, 25, 0, 0, 0, 0, 136, 1, 1, 50, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shortneck - Between 0-25% Health - Set Run Speed to 1.50'),
(@ID+23, 0, 5, 0, 2, 0, 100, 0, 0, 10, 0, 0, 0, 0, 136, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shortneck - Between 0-10% Health - Set Run Speed to 2.0'),
(@ID+23, 0, 6, 0, 0, 0, 100, 0, 5000, 10000, 20000, 25000, 0, 0, 11, 47981, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shortneck - In Combat - Cast \'Spell Reflection\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+24);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+24, 0, 0, 0, 0, 0, 'Shadowfeather', 'S1 | Rank 6', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 0.7, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 130, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+24;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+24, 0, 21492, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+24);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+24, 0, 0, 0, 0, 0, 100, 0, 9000, 14000, 14000, 18000, 0, 0, 11, 29505, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowfeather - In Combat - Cast \'Banshee Shriek\''),
(@ID+24, 0, 1, 0, 0, 0, 100, 0, 0, 0, 30000, 30000, 0, 0, 228, @ID+25, 30000, 4, 0, 20, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowfeather - In Combat - Do Radial Summon'),
(@ID+24, 0, 2, 0, 82, 0, 100, 0, 0, 2000, 2000, 0, 0, 0, 11, 16791, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowfeather - On Summoned Unit Dies - Cast \'Furious Anger\''),
(@ID+24, 0, 3, 0, 35, 0, 100, 0, 0, 1000, 1000, 0, 0, 0, 11, 31540, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowfeather - On Summon Despawned - Cast \'Enrage\'');
DELETE FROM `creature_template` WHERE (`entry` = @ID+25);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+25, 0, 0, 0, 0, 0, 'Lightfeather', 'Spawn of Shadowfeather', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 0.25, 1, 0, 1, 4000, 4000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 2.5, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+25;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+25, 0, 21492, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+25);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+25, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightfeather - On Just Died - Despawn Instant');

DELETE FROM `creature_template` WHERE (`entry` = @ID+26);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+26, 0, 0, 0, 0, 0, 'Scaleslash', 'S1 | Rank 6', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 130, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+26;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+26, 0, 25156, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+26);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+26, 0, 0, 1, 0, 0, 100, 0, 5000, 8000, 8000, 10000, 0, 0, 224, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Scaleslash - In Combat - Stop Attack'),
(@ID+26, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Scaleslash - In Combat - Set Reactstate Passive'),
(@ID+26, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 66818, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Scaleslash - In Combat - Cast \'Acidic Spew\''),
(@ID+26, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 80, @ID+26*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Scaleslash - In Combat - Run Script'),
(@ID+26, 0, 4, 0, 0, 0, 100, 0, 7000, 10000, 10000, 15000, 0, 0, 11, 55741, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Scaleslash - In Combat - Cast \'Desecration\'');
DELETE FROM `smart_scripts` WHERE (`source_type` = 9 AND `entryorguid` = @ID+26*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+26*100, 9, 0, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Scaleslash - Actionlist - Set Reactstate Aggressive');

DELETE FROM `creature_template` WHERE (`entry` = @ID+27);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+27, 0, 0, 0, 0, 0, 'Carl', 'S1 | Rank 6', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 130, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+27;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+27, 0, 10996, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+27);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+27, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 74826, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Reset - Cast \'Corporeality\''),
(@ID+27, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 8000, 12000, 0, 0, 11, 54251, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - In Combat - Cast \'Lava Burn\''),
(@ID+27, 0, 2, 0, 0, 0, 100, 0, 3000, 3000, 3000, 3000, 0, 0, 11, 16049, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - In Combat - Cast \'Emberseer Growing\''),
(@ID+27, 0, 3, 4, 23, 0, 100, 0, 16049, 10, 0, 0, 0, 0, 11, 74827, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' (10) - Cast \'Corporeality\' 15%'),
(@ID+27, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 74826, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' - Remove Aura \'Corporeality\' 0%'),
(@ID+27, 0, 5, 6, 23, 0, 100, 0, 16049, 15, 0, 0, 0, 0, 11, 74828, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' (15) - Cast \'Corporeality\' 30%'),
(@ID+27, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 74827, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' - Remove Aura \'Corporeality\' 15%'),
(@ID+27, 0, 7, 8, 23, 0, 100, 0, 16049, 20, 0, 0, 0, 0, 11, 74829, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' (20) - Cast \'Corporeality\' 60%'),
(@ID+27, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 74828, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' - Remove Aura \'Corporeality\' 30%'),
(@ID+27, 0, 9, 10, 23, 0, 100, 0, 16049, 25, 0, 0, 0, 0, 11, 74830, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' (25) - Cast \'Corporeality\' 100%'),
(@ID+27, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 74829, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' - Remove Aura \'Corporeality\' 60%'),
(@ID+27, 0, 11, 12, 23, 0, 100, 0, 16049, 30, 0, 0, 0, 0, 11, 74831, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' (30) - Cast \'Corporeality\' 200%'),
(@ID+27, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 74830, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Carl - On Aura \'Emberseer Growing\' - Remove Aura \'Corporeality\' 100%');


-- Rank 7
DELETE FROM `creature_template` WHERE (`entry` = @ID+28);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+28, 0, 0, 0, 0, 0, 'Springcoil', 'S1 | Rank 7', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 6, 2000, 2000, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 75, 20, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+28;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+28, 0, 26375, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+28);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+28, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 12, @ID+29, 3, 120000, 0, 0, 0, 1, 0, 0, 0, 0, -2, -2, 0, 0, 'Springcoil - On Respawn - Summon Creature \'Gadgetclank\''),
(@ID+28, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, @ID+29, 0, 70, 0, 0, 0, 0, 0, 'Springcoil - On Just Died - Despawn Instant'),
(@ID+28, 0, 2, 3, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 200006, 2, 0, 0, 0, 0, 9, @ID+29, 0, 70, 0, 0, 0, 0, 0, 'Springcoil - In Combat - Cast \'Shared Bonds\''),
(@ID+28, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 41363, 2, 0, 0, 0, 0, 9, @ID+29, 0, 70, 0, 0, 0, 0, 0, 'Springcoil - In Combat - Cast \'Shared Bonds\''),
(@ID+28, 0, 4, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, @ID+29, 0, 70, 0, 0, 0, 0, 0, 'Springcoil - On Evade - Despawn Instant'),
(@ID+28, 0, 5, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @ID+30, 70, 0, 0, 0, 0, 0, 0, 'Springcoil - On Just Died - Despawn Instant'),
(@ID+28, 0, 6, 0, 0, 0, 100, 0, 2000, 2000, 2000, 2000, 0, 0, 11, 36345, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Springcoil - In Combat - Cast \'Death Ray\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+29);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+29, 0, 0, 0, 0, 0, 'Gadgetclank', 'S1 | Rank 7', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 6, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 67.5, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+29;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+29, 0, 5435, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+29);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+29, 0, 0, 1, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 200006, 2, 0, 0, 0, 0, 9, @ID+28, 0, 70, 0, 0, 0, 0, 0, 'Gadgetclank - In Combat - Cast \'Shared Bonds\''),
(@ID+29, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 41363, 2, 0, 0, 0, 0, 9, @ID+28, 0, 70, 0, 0, 0, 0, 0, 'Gadgetclank - In Combat - Cast \'Shared Bonds\''),
(@ID+29, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @ID+30, 70, 0, 0, 0, 0, 0, 0, 'Gadgetclank - On Just Died - Despawn Shredder'),
(@ID+29, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Gadgetclank - On Just Died - Despawn Self'),
(@ID+29, 0, 4, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @ID+30, 70, 0, 0, 0, 0, 0, 0, 'Gadgetclank - On Evade - Despawn Shredder'),
(@ID+29, 0, 5, 0, 0, 0, 100, 0, 15000, 20000, 60000, 65000, 0, 0, 12, @ID+30, 4, 1000, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Gadgetclank - In Combat - Summon Creature \'Self Assembling Shredder\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+30);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+30, 0, 0, 0, 0, 0, 'Self Assembling Shredder', '', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 12, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+30;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+30, 0, 26612, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+30);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+30, 0, 0, 1, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 75, 66758, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Self Assembling Shredder - In Combat - Add Aura \'Staggered Daze\''),
(@ID+30, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 52663, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Self Assembling Shredder - In Combat - Cast \'Random Lightning Visual\''),
(@ID+30, 0, 2, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 0, 0, 28, 52663, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Self Assembling Shredder - In Combat - Remove Aura \'Random Lightning Visual\''),
(@ID+30, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Self Assembling Shredder - On Just Died - Despawn Instant'),
(@ID+30, 0, 4, 0, 0, 0, 100, 0, 8000, 12000, 8000, 12000, 0, 0, 11, 31042, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Self Assembling Shredder - In Combat - Cast \'Shred Armor\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+31);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+31, 0, 0, 0, 0, 0, 'Boltstrike', 'S1 | Rank 7', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 0.2, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 135, 1, 1, 1, 0, 0, 1, 549666683, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+31;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+31, 0, 18178, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+31);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+31, 0, 0, 0, 0, 0, 100, 0, 25000, 30000, 31000, 31000, 0, 0, 11, 29837, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - In Combat - Cast \'Fist of Stone\''),
(@ID+31, 0, 1, 2, 0, 0, 100, 0, 15000, 15000, 30000, 30000, 0, 0, 224, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - In Combat - Stop Attack'),
(@ID+31, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 80, @ID+31*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - In Combat - Run Script'),
(@ID+31, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - On Just Died - Despawn Instant'),
(@ID+31, 0, 4, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - On Evade - Despawn Instant');
DELETE FROM `smart_scripts` WHERE (`source_type` = 9 AND `entryorguid` = @ID+31*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+31*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - Actionlist - Set Reactstate Passive'),
(@ID+31*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 2178.8, -4764.79, 55.13, 0, 'Boltstrike - Actionlist - Move To Center'),
(@ID+31*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 0, 228, @ID+32, 30000, 12, 0, 30, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - Actionlist - Do Radial Summon 5y'),
(@ID+31*100, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 228, @ID+32, 30000, 18, 0, 20, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - Actionlist - Do Radial Summon 10y'),
(@ID+31*100, 9, 4, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 228, @ID+32, 30000, 24, 0, 15, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - Actionlist - Do Radial Summon 15y'),
(@ID+31*100, 9, 5, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 228, @ID+32, 30000, 36, 0, 10, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - Actionlist - Do Radial Summon 22y'),
(@ID+31*100, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Boltstrike - Actionlist - Set Reactstate Aggressive');

DELETE FROM `creature_template` WHERE (`entry` = @ID+32);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+32, 0, 0, 0, 0, 0, 'Unstable Mine', '', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 0, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1048576, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1087373334, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+32;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+32, 0, 6271, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+32);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+32, 0, 0, 0, 101, 0, 100, 0, 1, 1, 10000, 500, 500, 0, 11, 28433, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unstable Mine - On 1 or More Players in 1y - Cast \'Explode\''),
(@ID+32, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 1500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unstable Mine - On Just Died - Despawn Self'),
(@ID+32, 0, 2, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unstable Mine - On Respawn - Set Reactstate Passive');

DELETE FROM `creature_template` WHERE (`entry` = @ID+33);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+33, 0, 0, 0, 0, 0, 'Tyson Sanders', 'S1 | Rank 7', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 1, 0, 8, 2000, 2000, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 135, 10, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+33;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+33, 0, 18039, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+33);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+33, 0, 0, 0, 0, 0, 100, 0, 2000, 3000, 25000, 30000, 0, 0, 12, @ID+34, 2, 60000, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Tyson Sanders - In Combat - Summon Creature \'Unreliable Chicken\''),
(@ID+33, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Tyson Sanders - On Just Died - Despawn Summons'),
(@ID+33, 0, 2, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Tyson Sanders - On Evade - Despawn Summons');

DELETE FROM `creature_template` WHERE (`entry` = @ID+34);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+34, 0, 0, 0, 0, 0, 'Unreliable Chicken', '', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1.5, 0, 0, 10, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 6, 1, 1, 1, 0, 0, 1, 0, 0, 1083179028, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+34;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+34, 0, 6909, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+34);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+34, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 31, 1, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - In Combat - Set Phase Random Between 1-3'),
(@ID+34, 0, 1, 0, 0, 1, 100, 0, 3500, 3500, 3500, 3500, 0, 0, 11, 16791, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - In Combat - Cast \'Furious Anger\' (Phase 1)'),
(@ID+34, 0, 2, 0, 0, 2, 100, 0, 30000, 30000, 29500, 29500, 0, 0, 80, @ID+34*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - In Combat - Run Script (Phase 2)'),
(@ID+34, 0, 3, 0, 0, 4, 100, 0, 1000, 5000, 10000, 15000, 0, 0, 11, 52118, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - In Combat - Cast \'Pulsing Shards\' (Phase 3)');
DELETE FROM `smart_scripts` WHERE (`source_type` = 9 AND `entryorguid` = @ID+34*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+34*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - Actionlist - Set Reactstate Passive'),
(@ID+34*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 224, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - Actionlist - Stop Attack'),
(@ID+34*100, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 0, 11, 55928, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - Actionlist - Cast \'Flame Sphere Visual\''),
(@ID+34*100, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 0, 11, 54537, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - Actionlist - Cast \'Detonation\''),
(@ID+34*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 55928, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - Actionlist - Remove Aura \'Flame Sphere Visual\''),
(@ID+34*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Unreliable Chicken - Actionlist - Set Reactstate Aggressive');

DELETE FROM `creature_template` WHERE (`entry` = @ID+35);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+35, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot', 'S1 | Rank 7', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 5, 1, 0, 12, 2000, 2000, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 150, 1, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+35;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+35, 0, 26547, 1, 1, 0),
(@ID+35, 1, 26531, 1, 1, 0),
(@ID+35, 2, 26530, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+35);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+35, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 20000, 20000, 0, 0, 31, 1, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - In Combat - Set Phase Random Between 1-3'),
(@ID+35, 0, 1, 0, 0, 1, 100, 0, 2500, 3500, 5000, 9000, 0, 0, 11, 59330, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - In Combat - Cast \'Crush\' (Phase 1)'),
(@ID+35, 0, 2, 0, 0, 1, 100, 0, 4000, 6000, 10000, 15000, 0, 0, 11, 43529, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - In Combat - Cast \'Mortal Strike\' (Phase 1)'),
(@ID+35, 0, 3, 0, 0, 2, 100, 0, 1500, 3000, 8000, 10000, 0, 0, 11, 26143, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - In Combat - Cast \'Mind Flay\' (Phase 2)'),
(@ID+35, 0, 4, 0, 0, 2, 100, 0, 4000, 6000, 10000, 15000, 0, 0, 11, 30600, 64, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - In Combat - Cast \'Blast Wave\' (Phase 2)'),
(@ID+35, 0, 5, 0, 0, 4, 100, 0, 2500, 3500, 0, 0, 0, 0, 11, 33967, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - In Combat - Cast \'Thunderclap\' (Phase 3)'),
(@ID+35, 0, 6, 0, 0, 4, 100, 0, 4000, 6000, 10000, 15000, 0, 0, 11, 3651, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - In Combat - Cast \'Shield of Reflection\' (Phase 3)'),
(@ID+35, 0, 7, 0, 13, 0, 100, 0, 10000, 15000, 0, 0, 0, 0, 11, 67235, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'T800 Multi-Mode Robot - On Victim Casting  - Cast \'Pummel\'');


-- Rank 8
DELETE FROM `creature_template` WHERE (`entry` = @ID+36);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+36, 0, 0, 0, 0, 0, 'Lord Nelly', 'S1 | Rank 8', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 2, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 140, 10, 1, 1, 0, 0, 1, 1859895295, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+36;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+36, 0, 1070, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+36);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+36, 0, 0, 1, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - In Combat - Set Reactstate Passive'),
(@ID+36, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 224, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - In Combat - Stop Attack'),
(@ID+36, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 1, 0, 0, 0, 8, 0, 0, 0, 0, 2178.2, -4764.8, 55.13, 0, 'Lord Nelly - In Combat - Move To Position'),
(@ID+36, 0, 3, 4, 0, 0, 100, 0, 2500, 2500, 10000, 10000, 0, 0, 80, @ID+36*100, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - In Combat - Run Script'),
(@ID+36, 0, 4, 0, 61, 0, 100, 1, 0, 0, 0, 0, 0, 0, 66, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - In Combat - Set Orientation Random'),
(@ID+36, 0, 5, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - On Just Died - Despawn Summons'),
(@ID+36, 0, 6, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - On Evade - Despawn Summons'),
(@ID+36, 0, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - In Combat - Set Event Phase 1'),
(@ID+36, 0, 8, 0, 1, 1, 100, 0, 2000, 2000, 2000, 2000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - Out of Combat - Despawn Instant (Phase 1)');
DELETE FROM `smart_scripts` WHERE (`source_type` = 9 AND `entryorguid` = @ID+36*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+36*100, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 1, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0.3, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 2, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0.6, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0.9, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 4, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1.2, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 5, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1.5, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 6, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1.8, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 7, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2.1, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 8, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2.4, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 9, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2.7, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 10, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 11, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3.3, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 12, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3.6, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 13, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3.9, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 14, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4.2, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 15, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4.5, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 16, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4.8, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 17, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5.1, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 18, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5.4, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 19, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5.7, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 20, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\''),
(@ID+36*100, 9, 21, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 12, @ID+37, 3, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6.1, 'Lord Nelly - Actionlist - Summon Creature \'Living Flame\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+37);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+37, 0, 0, 0, 0, 0, 'Living Flame', '', '', 0, 80, 80, 0, 14, 0, 0.6, 0.6, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 1048576, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 130, 'living_flame', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+37;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+37, 0, 169, 1, 1, 0);
DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+37);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+37, 0, 0, 0, 0, 0, 0, '64561');

DELETE FROM `creature_template` WHERE (`entry` = @ID+38);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+38, 0, 0, 0, 0, 0, 'Karsh', 'S1 | Rank 8', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 0.3, 1, 0, 8, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 222, 10, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+38;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+38, 0, 7976, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+38);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+38, 0, 0, 0, 23, 0, 100, 0, 62055, 1, 4000, 4000, 0, 0, 11, 69585, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Karsh - On Aura \'Brittle Skin\' - Cast \'Hellfire Effect\''),
(@ID+38, 0, 1, 0, 0, 0, 100, 0, 6000, 8000, 6000, 8000, 0, 0, 11, 40505, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Karsh - In Combat - Cast \'Cleave\''),
(@ID+38, 0, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 50, 900002, 120000, 0, 0, 0, 0, 8, 0, 0, 0, 0, 2178.2, -4764.79, 55.13, 0, 'Karsh - In Combat - Summon Gameobject \'Heat Pillar\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+39);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+39, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher', 'S1 | Rank 8', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 0.5, 1, 0, 12, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 140, 10, 1, 1, 0, 0, 1, 1859895295, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+39;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+39, 0, 18649, 1, 1, 0);
DELETE FROM `creature_equip_template` WHERE (`CreatureID` = @ID+39);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES
(@ID+39, 1, 51389, 0, 0, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+39);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+39, 0, 0, 0, 0, 0, 100, 0, 5000, 9000, 9000, 12000, 0, 0, 11, 19643, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - In Combat - Cast \'Mortal Strike\''),
(@ID+39, 0, 1, 0, 9, 0, 100, 0, 15000, 20000, 15000, 20000, 8, 25, 11, 60067, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Within 8-25 Range - Cast \'Charge\''),
(@ID+39, 0, 2, 4, 2, 0, 100, 0, 0, 66, 0, 0, 0, 0, 12, @ID+40, 2, 10000, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Between 0-66% Health - Summon Creature \'Chains of Woe\''),
(@ID+39, 0, 3, 4, 2, 0, 100, 0, 0, 33, 0, 0, 0, 0, 12, @ID+40, 2, 10000, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Between 0-33% Health - Summon Creature \'Chains of Woe\''),
(@ID+39, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 20508, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Health 66 & 33 - Cast \'Charge\''),
(@ID+39, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 80, @ID+39*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Health 66 & 33 - Run Script'),
(@ID+39, 0, 6, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - On Just Died - Despawn Summons'),
(@ID+39, 0, 7, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - On Evade - Despawn Summons');
DELETE FROM `smart_scripts` WHERE (`source_type` = 9 AND `entryorguid` = @ID+39*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+39*100, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Actionlist - Set Reactstate Passive'),
(@ID+39*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 224, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Actionlist - Stop Attack'),
(@ID+39*100, 9, 2, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 0, 0, 11, 67541, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Actionlist - Cast \'Bladestorm\''),
(@ID+39*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Actionlist - Set Reactstate Aggressive'),
(@ID+39*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 72148, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Actionlist - Cast \'Enrage\''),
(@ID+39*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 136, 1, 0, 50, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Actionlist - Set Run Speed to 0.50'),
(@ID+39*100, 9, 6, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 0, 0, 136, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rom\'ogg Bonecrusher - Actionlist - Set Run Speed to 1.2');

DELETE FROM `creature_template` WHERE (`entry` = @ID+40);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+40, 0, 0, 0, 0, 0, 'Chains of Woe', '', NULL, 0, 80, 80, 0, 14, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1.75, 2000, 2000, 1, 1, 1, 393220, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 7, 1, 1, 1, 0, 0, 1, 0, 0, 1073741826, '', 12340);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+40;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+40, 0, 20367, 1, 1, 0);
DELETE FROM `creature_template_addon` WHERE (`entry` = @ID+40);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@ID+40, 0, 0, 0, 0, 0, 0, '63096');
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+40);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+40, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 0, 0, 75, 200007, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0, 'Chains of Woe - On Just Summoned - Add Aura \'Chains of Woe\''),
(@ID+40, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Chains of Woe - On Just Summoned - Set Rooted On'),
(@ID+40, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 200007, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 0, 'Chains of Woe - On Just Died - Remove Aura \'Chains of Woe\''),
(@ID+40, 0, 3, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 28, 200007, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 0, 'Chains of Woe - On Evade - Remove Aura \'Chains of Woe\'');

DELETE FROM `creature_template` WHERE (`entry` = @ID+41);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+41, 0, 0, 0, 0, 0, 'Deathstealer', 'S1 | Rank 8', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 0.4, 1, 0, 8, 2000, 2000, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 140, 10, 1, 1, 0, 0, 1, 0, 0, 1074790400, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+41;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+41, 0, 27983, 1, 1, 0);
DELETE FROM `creature_equip_template` WHERE (`CreatureID` = @ID+41);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES
(@ID+41, 1, 39245, 0, 0, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+41);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+41, 0, 0, 0, 0, 0, 100, 0, 4000, 8000, 2500, 3500, 0, 0, 12, @ID+42, 2, 60000, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathstealer - In Combat - Summon Creature \'Soulless Ghoul\''),
(@ID+41, 0, 1, 0, 0, 0, 100, 0, 10000, 25000, 10000, 25000, 0, 0, 11, 38046, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathstealer - In Combat - Buff Summons with \'Enrage\''),
(@ID+41, 0, 2, 0, 0, 0, 100, 0, 15000, 20000, 15000, 20000, 0, 0, 11, 36864, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathstealer - In Combat - Cast \'Lash of Pain\''),
(@ID+41, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathstealer - On Just Died - Despawn Summons'),
(@ID+41, 0, 4, 0, 7, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathstealer - On Evade - Despawn Summons');

DELETE FROM `creature_template` WHERE (`entry` = @ID+42);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ID+42, 0, 0, 0, 0, 0, 'Soulless Ghoul', '', '', 0, 81, 81, 0, 14, 0, 1.1, 1.2, 1, 1, 10, 1, 0, 0, 2, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 2, 1, 1, 1, 0, 0, 1, 0, 0, 1083179028, '', 0);
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ID+42;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ID+42, 0, 25526, 1, 1, 0),
(@ID+42, 1, 24999, 1, 1, 0),
(@ID+42, 2, 25527, 1, 1, 0),
(@ID+42, 3, 25528, 1, 1, 0);
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @ID+42);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ID+42, 0, 0, 0, 0, 0, 60, 0, 4000, 8000, 7000, 9000, 0, 0, 11, 50196, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Soulless Ghoul - In Combat - Cast \'Rotting Touch\''),
(@ID+42, 0, 1, 0, 2, 0, 50, 0, 0, 20, 0, 0, 0, 0, 11, 58137, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Soulless Ghoul - Between 0-20% Health - Cast \'Ghoulplosion\'');
