
DROP TABLE IF EXISTS `ehm_role_func`;
CREATE TABLE `ehm_role_func` (
  `ID` int(11) NOT NULL auto_increment,
  `ROLE_ID` int(11) NOT NULL,
  `NAME` varchar(64) default NULL,
  `URL` varchar(64) NOT NULL,
  `FLAG` int(1) NOT NULL,
  PRIMARY KEY  (`ID`)
)
