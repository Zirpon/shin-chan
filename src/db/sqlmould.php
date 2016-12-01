<?php
	define("bExistsCharByGuid",	"select count(*) from t_char where guid = ");
	define("newMesssage",	"insert into t_msgqueue ( senderid, receiverid, type, status, isvalid, content, deadline ) 
							values ( ?, ?, ?, 0, 1, ?, ?);");
	define("readMsg",	"update t_msgqueue set isvalid = 0 where id = ?;");

	define("createfriend", "insert into t_friend (playerid, friendid, isvalid) values (?, ?, 1);");
	define("makeupfriend", "update t_friend set isvalid = 1 where playerid = ? and friendid = ?;");
	define("unfriend", "update t_friend set isvalid = 0 where playerid = ? and friendid = ?;");
	define("sendGift",	"insert into t_friendgift (type, sourceId, targetId, title, content, gift, send_time, dead_time, status) 
						values (0, ?, ?, ?, ?, ?, ?, ?, 0);");

//////////////////////////////////////////////////////////////////////////////////////	
	$sqlmould = array(
		"bExistsCharByGuid" => "i",
		"newMesssage" => "iiisi",
		"readMsg" => "i",
		"createfriend" => "ii",
		"makeupfriend" => "ii",
		"unfriend" => "ii",
		"sendGift" => "iisssii",
	);
?>