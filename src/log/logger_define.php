<?php

define("LOGGERPATH", "/var/log/shin-chan/");
	
$LOGGER_TYPE = array
(
	"account"	=> LOGGERPATH."account_".date("Y-m-d").".log",
);

$LOGGER_SWITCH = TRUE;
$LOGGER_DEBUG_SWITCH = TRUE;

?>