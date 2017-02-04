<?php

define("LOGGERPATH", "/var/log/shin-chan/");
	
$LOGGER_TYPE = array
(
	"account"	=> LOGGERPATH."account_".date("Y-m-d").".log",
	"message"	=> LOGGERPATH."message_".date("Y-m-d").".log",
	"friend"	=> LOGGERPATH."friend_".date("Y-m-d").".log",
	"mail"		=> LOGGERPATH."mail_".date("Y-m-d").".log",
	"interface"		=> LOGGERPATH."interface_".date("Y-m-d").".log",
	"elapsedTime"	=> LOGGERPATH."elapsedTime_".date("Y-m-d").".log",
	"chapter"		=> LOGGERPATH."chapter_".date("Y-m-d").".log",
	"seaVentureMgr"	=> LOGGERPATH."seaVentureMgr_".date("Y-m-d").".log",
	"db_mysql"		=> LOGGERPATH."db_mysql_".date("Y-m-d").".log",
	"php_error"		=> LOGGERPATH."php_error_".date("Y-m-d").".log",
	"crontab"		=> LOGGERPATH."crontab_".date("Y-m-d").".log",
);

$LOGGER_MAIL_RECEIVER = array(
	"735037139@qq.com",
	"zhangzhipeng@dayugame.net",
	"chengbowei@dayugame.net",
	"liangzhiyong@dayugame.net",
);

$LOGGER_SWITCH = TRUE;
$LOGGER_DEBUG_SWITCH = TRUE;

?>