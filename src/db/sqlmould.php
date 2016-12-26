<?php
	define("nExistsCharByGuid",		"select count(*) from t_char where guid = ");
	define("sGetCharnameByGuid",	"select name from t_char where guid = ");
	
	//achive
	define("archive",				"update t_char set mdata = ? where guid = ?");
	define("loadArchive",			"select mdata from t_char where guid = ");

	//message
	define("newMesssage",	"insert into t_msgqueue ( senderid, receiverid, type, status, isvalid, content, deadline ) 
							values ( ?, ?, ?, 0, 1, ?, ?);");
	define("readMsg",	"update t_msgqueue set isvalid = 0 where id = ?;");

	//friend
	define("createfriend", "insert into t_friend (playerid, friendid, isvalid) values (?, ?, 1);");
	define("makeupfriend", "update t_friend set isvalid = 1 where playerid = ? and friendid = ?;");
	define("unfriend", "update t_friend set isvalid = 0 where playerid = ? and friendid = ?;");
	define("searchFriendById", "select gid,guid,name,logintime,mflag from t_char where guid = ");

	// mail
	define("sendmail",	"insert into t_mail (type, sourceId, sourcename, targetId, targetname,
						title, content, attach, send_time, dead_time, status) 
						values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1);");
	define("readmail", "update t_mail set status = 0 where id = ?;");

	//chapter
	define("loadChapters", "select mflag from t_char where guid = ");
	define("saveChapters", "update t_char set mflag = ? where guid = ?");

	//seaVentureMgr
	define("loadSeaVentureRank", "select * from t_seaventure_rank order by score desc");
	define("saveSeaVentureRank", "insert into t_seaventure_rank (rank,guid,name,sex,score) VALUES ");
	define("cleanSeaVentureRank", "truncate t_seaventure_rank;");


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
		"saveChapters"	=> "si",
	);
?>