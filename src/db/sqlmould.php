<?php
	define("nExistsCharByGuid",		"select count(*) from t_char where guid = ");
	define("sGetCharnameByGuid",	"select name from t_char where guid = ");
	define("archive",				"update t_char set mdata = ? where guid = ?");
	define("loadArchive",			"select mdata from t_char where guid = ");

	define("newMesssage",	"insert into t_msgqueue ( senderid, receiverid, type, status, isvalid, content, deadline ) 
							values ( ?, ?, ?, 0, 1, ?, ?);");
	define("readMsg",	"update t_msgqueue set isvalid = 0 where id = ?;");

	define("createfriend", "insert into t_friend (playerid, friendid, isvalid) values (?, ?, 1);");
	define("makeupfriend", "update t_friend set isvalid = 1 where playerid = ? and friendid = ?;");
	define("unfriend", "update t_friend set isvalid = 0 where playerid = ? and friendid = ?;");
	define("sendmail",	"insert into t_mail (type, sourceId, sourcename, targetId, targetname,
						title, content, attach, send_time, dead_time, status) 
						values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1);");
	define("readmail", "update t_mail set status = 0 where id = ?;");

//////////////////////////////////////////////////////////////////////////////////////	
	$sqlmould = array(
		"archive" 		=> "si",
		"newMesssage"	=> "iiisi",
		"readMsg" 		=> "i",
		"createfriend" 	=> "ii",
		"makeupfriend" 	=> "ii",
		"unfriend" 		=> "ii",
		"sendmail" 		=> "iisissssii",
		"readmail" 		=> "i",
	);
?>