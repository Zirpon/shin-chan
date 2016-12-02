<?php

define("LOGGERPATH", "/var/log/shin-chan/");
	
$LOGGER_TYPE = array
(
	"account"	=> LOGGERPATH."account_".date("Y-m-d").".log",
	"message"	=> LOGGERPATH."message_".date("Y-m-d").".log",
	"friend"	=> LOGGERPATH."friend_".date("Y-m-d").".log",
	"mail"		=> LOGGERPATH."mail_".date("Y-m-d").".log",
);

$LOGGER_SWITCH = TRUE;
$LOGGER_DEBUG_SWITCH = TRUE;

?>