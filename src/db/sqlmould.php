<?php
	define("bExistsCharByGuid",	"select count(*) from t_char where guid = ");
	define("newMesssage",	"insert into t_msgqueue ( senderid, receiverid, type, status, isvalid, content, deadline ) 
							values ( ?, ?, ?, 0, 1, ?, ?);");
	define("readMsg",	"update t_msgqueue set isvalid = 0 where id = ?;");

	define("createfriend", "insert into t_friend (playerid, friendid) values (?, ?);");



//////////////////////////////////////////////////////////////////////////////////////	
	$sqlmould = array(
		"bExistsCharByGuid" => "i",
		"newMesssage" => "iiisi",
		"readMsg" => "i",
		"createfriend" => "ii",
	);
?>