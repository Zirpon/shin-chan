-- MySQL dump 10.13  Distrib 5.5.52, for Linux (x86_64)
--
-- Host: localhost    Database: shin_chan
-- ------------------------------------------------------
-- Server version	5.5.52-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_account`
--

DROP TABLE IF EXISTS `t_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_account` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `accname` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `passwd` varchar(50) CHARACTER SET latin1 NOT NULL,
  `guid` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `frozentime` int(11) DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '2',
  `gmlogin` tinyint(2) NOT NULL DEFAULT '0',
  `nickname` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `loginkey` int(11) DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `Index_accname` (`accname`),
  KEY `Index_accnameandtype` (`accname`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_billinglist`
--

DROP TABLE IF EXISTS `t_billinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_billinglist` (
  `billno` char(64) NOT NULL,
  `playerguid` int(11) NOT NULL,
  `itemindex` int(5) NOT NULL,
  `itemcount` int(5) NOT NULL,
  `fee` float(32,3) NOT NULL,
  `platform` int(11) NOT NULL,
  `status` int(5) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uinterface` int(11) NOT NULL DEFAULT '0',
  `interfaceorderid` varchar(500) NOT NULL DEFAULT '',
  `channelorderid` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`billno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_char`
--

DROP TABLE IF EXISTS `t_char`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_char` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `accname` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `acctype` int(11) NOT NULL DEFAULT '-1',
  `guid` int(11) unsigned NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `title` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `passwd` varchar(15) CHARACTER SET latin1 NOT NULL,
  `sex` smallint(6) NOT NULL,
  `lvl` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `logouttime` int(11) NOT NULL,
  `logintime` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `isvalid` smallint(6) NOT NULL,
  `mdata` text CHARACTER SET latin1 NOT NULL,
  `mflag` text CHARACTER SET latin1 NOT NULL,
  `firstlogin` int(11) NOT NULL DEFAULT '0',
  `silver` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `lastloginip` bigint(11) NOT NULL DEFAULT '0',
  `newcharname` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '@',
  PRIMARY KEY (`gid`),
  UNIQUE KEY `Index_guid` (`guid`),
  UNIQUE KEY `Index_name` (`name`) USING HASH,
  KEY `Index_accname` (`accname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_friend`
--

DROP TABLE IF EXISTS `t_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL COMMENT '玩家id',
  `friendid` int(11) NOT NULL COMMENT '好友id',
  `perm` int(11) NOT NULL COMMENT '权限',
  `favor` int(11) NOT NULL COMMENT '好友度',
  `msgcount` int(11) NOT NULL COMMENT '消息计数器',
  `giftcount` int(11) NOT NULL COMMENT 'gift计数器',
  `isvalid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `playerid` (`playerid`,`friendid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mail`
--

DROP TABLE IF EXISTS `t_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '邮件类型',
  `sourceId` int(11) NOT NULL COMMENT '发件人',
  `sourcename` varchar(50) NOT NULL,
  `targetId` int(11) NOT NULL COMMENT '收件人',
  `targetname` varchar(50) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `content` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `attach` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  `dead_time` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '是否已读',
  PRIMARY KEY (`id`),
  KEY `mail_target_id` (`targetId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_msgqueue`
--

DROP TABLE IF EXISTS `t_msgqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_msgqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderid` int(11) NOT NULL COMMENT '玩家id',
  `receiverid` int(11) NOT NULL COMMENT '好友id',
  `type` int(11) DEFAULT NULL COMMENT '消息类型',
  `status` int(11) DEFAULT NULL COMMENT '消息状态',
  `isvalid` int(11) NOT NULL COMMENT '消息flag',
  `content` int(11) DEFAULT NULL COMMENT '消息内容',
  `deadline` int(11) NOT NULL COMMENT '消息有效时间',
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`senderid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_var`
--

DROP TABLE IF EXISTS `t_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_var` (
  `maxcharguid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`maxcharguid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'shin_chan'
--
/*!50003 DROP PROCEDURE IF EXISTS `GameCheckAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GameCheckAccount`(paccname varchar(50) binary, ppasswd varchar(50) binary, ptype int(10), newkey int(11))
BEGIN
	declare result int default -1;
	declare cnt int default 0;
	declare  forbidtime int default 0;
	declare  _gmlogin int default 0;
	declare  _gmcnt int default 0;
	declare  _passwd varchar(50) default '';
	start transaction;
	select frozentime, gmlogin,passwd into forbidtime,_gmlogin,_passwd from t_account where accname = paccname and type = ptype;
	set cnt = found_rows();
	if cnt = 1 then
		set result = 1;
		if forbidtime >= UNIX_TIMESTAMP() then
			if _gmlogin = 1 THEN
				select count(*) into _gmcnt from t_gmaccount where passwd=ppasswd;
				if _gmcnt = 1 THEN
					set result = 1;
					update t_account set loginkey = newkey where accname = paccname and type = ptype;
				ELSE
					set result = 0;
				end if;
			else
				set result = 2;
			end if;
		ELSE
			if _passwd = ppasswd THEN
				if _gmlogin = 1 THEN
					update t_account set gmlogin=0 where accname=paccname and type=ptype;
				end if;
				set result = 1;
				update t_account set loginkey = newkey where accname = paccname and type = ptype;
			ELSE
				set result = 0;
			end if;
		end if;
	else
		set result = 0;
	end if;

	commit;
	SELECT result, newkey;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GameCreateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GameCreateAccount`(paccname varchar(50) binary, ppasswd varchar(50) binary, pcreatetime int, ptype int(10), newkey int(11))
BEGIN
	declare result int default -1;
	declare cnt int default 0;
	declare  forbidtime int default 0;
	start transaction;
	select count(gid),frozentime into cnt,forbidtime from t_account where accname = paccname and type = ptype;

	if cnt > 0 then
		set result = -2;
		if forbidtime >= UNIX_TIMESTAMP() then
			set result = -3;
		end if;
	else
		insert into t_account ( accname, passwd, createtime, type ) values ( paccname, ppasswd, pcreatetime, ptype );
		select row_count() into result;
	end if;
	update t_account set loginkey=newkey where accname = paccname and type = ptype;

	commit;
	SELECT result,newkey;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GameForbidAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GameForbidAccount`(paccname varchar(50) binary, ptype int(10), pforbidtime int(11))
BEGIN
	declare result int default -1;
	declare cnt int default 0;

	select count(*) into cnt from t_account where accname=paccname and type=ptype;
	if cnt = 1 then
		set result = 1;
		UPDATE t_account SET frozentime=(UNIX_TIMESTAMP()+pforbidtime) where accname=paccname and type=ptype;
	else
		set result = 0;
	end if;

	SELECT result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_add_msgcount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_add_msgcount`(psenderid int(11), preceicerid int(11))
BEGIN
	declare result int default -1;
	declare count int default 0;
	start transaction;

	select msgcount into count from t_friend where playerid = psenderid and friendid = receiverid;
	set count = count + 1;
	update t_friend set msgcount = count where playerid = psenderid and friendid = receiverid;

	commit;
	SELECT result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_check_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_check_account`(paccname varchar(50) binary, ppasswd varchar(50) binary, ptype int(10))
BEGIN
	declare result int default -1;
	declare cnt int default 0;

	select count(*) into cnt from t_account where accname=paccname and passwd = ppasswd and type=ptype;
	if cnt = 1 then
		set result = 1;
		#UPDATE t_account SET frozentime=(UNIX_TIMESTAMP()+pforbidtime) where accname=paccname and type=ptype;
	else
		set result = 0;
	end if;

	SELECT result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_check_charname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_check_charname`(pcharname varchar(50) binary)
BEGIN
	declare result int default -1;
	declare cnt int default 0;
	start transaction;
	select count(*) into cnt from t_char where charname = pcharname;

	if cnt > 0 then
		set result = -2;
	else
		insert into t_charnamelist (charname) values (pcharname);
		set result = 0;
	end if;

	commit;
	SELECT result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_charlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_charlist`(paccname varchar(50) binary, ptype int)
BEGIN
	declare result int default -1;
	declare cnt int default 0;
	#start transaction;
	select guid from t_account where accname = paccname and type = ptype;

	#commit;
	#SELECT result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_new_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_new_account`(paccname varchar(50) binary, ppasswd varchar(50) binary, ptype int, pcreatetime int)
BEGIN
	declare result int default -1;
	declare cnt int default 0;
	start transaction;
	select count(*) into cnt from t_account where accname = paccname;

	if cnt > 0 then
		set result = -2;
	else
		insert into t_account ( accname, passwd, type, createtime ) values ( paccname, ppasswd, ptype, pcreatetime );
		select row_count() into result;
	end if;

	commit;
	SELECT result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_new_char` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_new_char`(paccname varchar(50) binary, pacctype int, pcharname varchar(50) binary, pcreatetime int)
BEGIN
	declare rguid	bigint default -1;
	declare result	int default -1;

	start transaction;
	select guid into rguid from t_char where name=pcharname limit 1;

	if found_rows() = 0 then
		set rguid = -1;
		update t_var set maxcharguid=maxcharguid+1;
		select maxcharguid into rguid from t_var limit 1;

		if rguid <> -1 then
			insert into t_char(
#accname,acctype,guid,name,title,passwd,sex,lvl,hp,logouttime,logintime,createtime,isvalid,mdata,mflag,firstlogin,silver,gold,lastloginip,newcharname
accname,acctype,guid,name,logintime,createtime,isvalid,firstlogin
)
			values(paccname,pacctype,rguid,pcharname,pcreatetime,pcreatetime,1,pcreatetime);

			update t_account set guid = rguid where accname = paccname and type = pacctype;

			select row_count() into result;
		else
			#t_var 表有问题
			set result = -3;
		end if;
	else
		set result = -2;
	end if;
	
	commit;
	SELECT result,rguid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBillingPlatformStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBillingPlatformStatus`(pplatform int(11), pstatus int(5), pfee float(32), puinterface int(5), pinterfaceorderid char(64), pchannelorderid char(64), pbillno char(64) )
BEGIN
	declare result int default -1;
	declare _status int default 0;
	declare _count int default 0;

	select count(*) into _count from t_billinglist where billno=pbillno;
	if _count = 1 THEN

		select status into _status from t_billinglist where billno=pbillno;

		if _status = 1 THEN
			update t_billinglist set platform=pplatform, status=pstatus, fee=pfee, uinterface=puinterface, interfaceorderid=pinterfaceorderid, channelorderid=pchannelorderid where billno=pbillno;
			set result = 1;
		ELSE
			if _status = 3 THEN
				update t_billinglist set platform=pplatform, fee=pfee, uinterface=puinterface, interfaceorderid=pinterfaceorderid, channelorderid=pchannelorderid where billno=pbillno;
				set result = 2;
			ELSE
				set result = -2;
			end if;
		end if;
	end if;

	SELECT result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 15:51:24
