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
  `accname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `passwd` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `guid` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `frozentime` int(11) DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '2',
  `gmlogin` tinyint(2) NOT NULL DEFAULT '0',
  `nickname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `loginkey` int(11) DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `Index_accname` (`accname`),
  KEY `Index_accnameandtype` (`accname`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
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
-- Table structure for table `t_chapterRanklist_Level001`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level001` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level002`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level002`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level002` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level003`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level003` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level004`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level004`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level004` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level005`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level005`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level005` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level006`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level006`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level006` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level007`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level007`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level007` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level008`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level008` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level009`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level009`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level009` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level010`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level010` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level011`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level011` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level012`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level012` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level013`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level013`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level013` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level014`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level014`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level014` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level015`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level015` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level016`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level016`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level016` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level017`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level017`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level017` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level018`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level018` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level019`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level019`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level019` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level020`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level020` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level021`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level021`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level021` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level022`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level022`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level022` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level023`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level023`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level023` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level024`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level024`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level024` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level025`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level025`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level025` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level026`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level026`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level026` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level027`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level027`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level027` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level028`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level028`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level028` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level029`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level029`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level029` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level030`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level030` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level031`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level031`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level031` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level032`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level032`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level032` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level033`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level033`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level033` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level034`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level034`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level034` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level035`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level035`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level035` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level036`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level036`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level036` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level037`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level037`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level037` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level038`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level038`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level038` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level039`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level039`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level039` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level040`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level040`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level040` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level041`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level041`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level041` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level042`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level042`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level042` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level043`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level043`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level043` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level044`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level044`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level044` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level045`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level045`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level045` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level046`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level046`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level046` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level047`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level047`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level047` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level048`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level048`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level048` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level049`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level049`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level049` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level050`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level050`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level050` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level051`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level051`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level051` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level052`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level052`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level052` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level053`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level053`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level053` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level054`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level054`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level054` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level055`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level055`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level055` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level056`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level056`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level056` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level057`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level057`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level057` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level058`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level058`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level058` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level059`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level059`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level059` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level060`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level060` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level061`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level061`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level061` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level062`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level062`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level062` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level063`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level063`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level063` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level064`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level064`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level064` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level065`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level065`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level065` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level066`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level066`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level066` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level067`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level067`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level067` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level068`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level068`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level068` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level069`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level069`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level069` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level070`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level070`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level070` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level071`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level071`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level071` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level072`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level072`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level072` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level073`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level073`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level073` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level074`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level074`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level074` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level075`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level075`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level075` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level076`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level076`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level076` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level077`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level077`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level077` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level078`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level078`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level078` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level079`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level079`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level079` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level080`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level080`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level080` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level081`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level081`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level081` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level082`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level082`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level082` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level083`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level083`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level083` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level084`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level084`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level084` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level085`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level085`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level085` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level086`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level086`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level086` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level087`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level087`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level087` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level088`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level088`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level088` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level089`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level089`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level089` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level090`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level090`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level090` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level091`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level091`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level091` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level092`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level092`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level092` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level093`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level093`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level093` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level094`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level094`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level094` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level095`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level095`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level095` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level096`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level096`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level096` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level097`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level097`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level097` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level098`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level098`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level098` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level099`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level099`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level099` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level100`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level100` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level101`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level101` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level102`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level102` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level103`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level103`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level103` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level104`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level104`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level104` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level105`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level105`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level105` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level106`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level106` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level107`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level107` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level108`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level108` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level109`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level109`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level109` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level110`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level110` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level111`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level111` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level112`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level112`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level112` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level113`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level113`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level113` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level114`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level114` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level115`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level115`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level115` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level116`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level116`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level116` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level117`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level117`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level117` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level118`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level118`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level118` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level119`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level119`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level119` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level120`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level120`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level120` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level121`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level121`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level121` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level122`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level122`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level122` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level123`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level123`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level123` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level124`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level124`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level124` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level125`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level125`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level125` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level126`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level126`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level126` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level127`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level127`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level127` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level128`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level128`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level128` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level129`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level129`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level129` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level130`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level130`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level130` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level131`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level131`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level131` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level132`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level132`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level132` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level133`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level133`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level133` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level134`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level134`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level134` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level135`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level135`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level135` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level136`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level136`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level136` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level137`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level137`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level137` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level138`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level138`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level138` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level139`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level139`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level139` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level140`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level140`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level140` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level141`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level141`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level141` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level142`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level142`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level142` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level143`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level143`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level143` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level144`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level144`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level144` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level145`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level145`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level145` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level146`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level146`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level146` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level147`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level147`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level147` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level148`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level148`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level148` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level149`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level149`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level149` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level150`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level150`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level150` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level151`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level151`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level151` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level152`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level152`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level152` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level153`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level153`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level153` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level154`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level154`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level154` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level155`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level155`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level155` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level156`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level156`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level156` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level157`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level157`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level157` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level158`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level158`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level158` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level159`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level159`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level159` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level160`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level160`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level160` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level161`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level161`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level161` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level162`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level162`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level162` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level163`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level163`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level163` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level164`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level164`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level164` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level165`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level165`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level165` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level166`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level166`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level166` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level167`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level167`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level167` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level168`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level168`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level168` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level169`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level169`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level169` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level170`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level170`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level170` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level171`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level171`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level171` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level172`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level172`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level172` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level173`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level173`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level173` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level174`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level174`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level174` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level175`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level175`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level175` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level176`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level176`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level176` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level177`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level177`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level177` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level178`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level178`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level178` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level179`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level179`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level179` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level180`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level180`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level180` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level181`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level181`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level181` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level182`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level182`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level182` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level183`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level183`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level183` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level184`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level184`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level184` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level185`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level185`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level185` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level186`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level186`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level186` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level187`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level187`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level187` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level188`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level188`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level188` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level189`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level189`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level189` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level190`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level190`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level190` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level191`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level191`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level191` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level192`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level192`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level192` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level193`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level193`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level193` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level194`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level194`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level194` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level195`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level195`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level195` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level196`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level196`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level196` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level197`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level197`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level197` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level198`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level198`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level198` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level199`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level199`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level199` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_chapterRanklist_Level200`
--

DROP TABLE IF EXISTS `t_chapterRanklist_Level200`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chapterRanklist_Level200` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `achieveTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `shell` int(11) NOT NULL,
  `firstlogin` int(11) NOT NULL DEFAULT '0',
  `sendgiftnum` int(11) NOT NULL,
  `gotgiftnum` int(11) NOT NULL,
  `lastloginip` bigint(11) NOT NULL DEFAULT '0',
  `newcharname` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '@',
  PRIMARY KEY (`gid`),
  UNIQUE KEY `Index_guid` (`guid`),
  UNIQUE KEY `Index_name` (`name`) USING HASH,
  KEY `Index_accname` (`accname`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
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
  `requestGift` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `playerid` (`playerid`,`friendid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
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
  `content` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '消息内容',
  `deadline` int(11) NOT NULL COMMENT '消息有效时间',
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`senderid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_seaventure_rank`
--

DROP TABLE IF EXISTS `t_seaventure_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_seaventure_rank` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  UNIQUE KEY `index_guid` (`guid`),
  UNIQUE KEY `rank_index` (`rank`),
  KEY `score_index` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_seaventure_rank_2016_12_26`
--

DROP TABLE IF EXISTS `t_seaventure_rank_2016_12_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_seaventure_rank_2016_12_26` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_seaventure_rank_2017_01_09`
--

DROP TABLE IF EXISTS `t_seaventure_rank_2017_01_09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_seaventure_rank_2017_01_09` (
  `rank` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_recommendFriends` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_recommendFriends`(IN pplayerid int)
BEGIN
	declare result int default -1;
	
	#搜索3个人
	declare cnt int default 10;
		
	#一个月内登录过
	declare timeinterval int default 2592000;
	set timeinterval = UNIX_TIMESTAMP() - timeinterval;

CREATE TEMPORARY TABLE `t_recomfriends` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `guid` int(11) unsigned NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `sex` smallint(6) NOT NULL,
  `logintime` int(11) NOT NULL,
  `mflag` text CHARACTER SET latin1 NOT NULL,
  `shell` int(11) NOT NULL,
  PRIMARY KEY (`gid`),
  UNIQUE KEY `Index_guid` (`guid`),
  UNIQUE KEY `Index_name` (`name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	start transaction;

	#drop table if exists tmp_recomFriends;
	set @maxgid = (select MAX(gid) from t_char);
	#select "max gid is " + @maxgid;
	#一秒内刷新的推荐好友列表会一样
	set @rankseed = timeinterval;
	# 调试 set @times = 10;

	REPEAT
		set @rankseed = @rankseed + 1;
		#select @rankseed;
		set @num = RAND(RAND()*1000000);
		#SELECT @num;
		set @fix= @num*@maxgid;
		#select @fix;
		set @querygid = FLOOR(@num*@maxgid);
		#select @querygid;

		select COUNT(*) into @tmpExists from t_recomfriends where gid = @querygid;
		IF @tmpExists = 0 THEN
			set @recommendid = (select guid from t_char where gid = @querygid and isvalid = 1);
			#select @recommendid + "+++++++++++++++++++++++++++++++++++++++++++++++";
			#select @querygid;
			#select pplayerid;
			#IF ISNULL(@recommendid) then 
				#set @recommendid = 0;
				#select @recommendid;
			#END IF;

			IF @recommendid <> pplayerid THEN
				set @exists = 0;
				select count(*) into @exists from t_friend where playerid = pplayerid and friendid = @recommendid and isvalid = 1;
				#select @exists + "+++++++++";
				#select @recommendid + "==========================================";
				#已加好友继续找
				IF @exists = 0 THEN
					#select @querygid;
					INSERT INTO t_recomfriends (gid,guid,name,sex,logintime,mflag,shell)
					(select gid,guid,name,sex,logintime,mflag,shell from t_char where gid = @querygid);#and logintime > timeinterval and mflag != "";
					set cnt = cnt - 1;
				END IF;
			END IF;

		END IF;
	#调试 set @times = @times - 1;

	UNTIL cnt <= 0 or @times <= 0 END REPEAT;

	/*
	create TEMPORARY table tmp_recomFriends (
		select gid,guid,name,logintime,mflag from t_char where logintime > timeinterval and mflag != "" limit cnt
	);
	*/
	
	select * from t_recomfriends;
	commit;
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

-- Dump completed on 2017-01-16 14:47:43
