CREATE TABLE IF NOT EXISTS `brawlersguild` (
  `CharacterGUID` int(11) NOT NULL,
  `Progress` int(11) NOT NULL DEFAULT '0',
  `Rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CharacterGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
