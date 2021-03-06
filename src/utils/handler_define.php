<?php
	$handlers = array(
		"account"	=> array(
			2001	=> "newAccount",//$account, $pwd, $type
			2002	=> "checkAccount",//$account, $pwd, $type
			2003	=> "newChar",//$account, $type, $charname
			2004	=> "login",//$account, $type
			2005	=> "charinfo",//$guid 
			//2006	=> "sGetCharname",//$guid 
			2007	=> "guestLogin",//$account, $type, $charname
			2008	=> "archive",//$guid, $data
			2009	=> "loadArchive",//$guid
		),

		"message"	=> array(
			2011	=> "newMsg",//$senderid, $receiverid, $type, $content, $deadline 
			2012	=> "getMsgList",//guid
		//	2013	=> "getMsg",//msgid
		//	2014	=> "readMsg",//msgid
			2015	=> "handleMsg",//guid msgid, $opt
			2016	=> "getTimestamp",
		),

		"friend"	=> array(
			//2021	=> "createFriend",//$playerid, $friendid
			2022	=> "sendGift",//$playerid, $playername, $friendid, $friendname 
			2023	=> "unfriend",//$playerid, $friendid
			2024	=> "requestGift",
			2025	=> "sendMsg",
			2026	=> "recommendFriends", // playerid
			2027	=> "searchFriendById",//guid friendId
			2028	=> "getFriendlist",//guid
		),

		"mail"		=> array(
			2031	=> "sendMail",//$type, $sourceid, $sourcename, $receiverid, $receivername
			//2032	=> "loadMail",//$mailid
			2033	=> "readMail",//$playerid, $mailid
			2034	=> "loadMailList",//$guid
		),

		"chapter"	=> array(
			2041	=> "loadChapters",//guid
			2042	=> "updateChapter",//$guid, $chapter, $star, $point  
			2043	=> "getfriendRanklist",//$guid, $chapter  
		),

		"seaVentureMgr"=> array(
			2051	=> "loadRanklist",//
			2052	=> "showRanklist",//
			2053	=> "getRanklist",//
			2054	=> "ranklistSort",//
			//2055	=> "saveRanklist",//
			2056	=> "recordRanklist",//test
		),

		"seaVenture" => array(
			2061	=> "doVenture", //$guid, $score
			2062	=> "getfriendRanklist",//guid
		),

		"chapterMgr" => array(
			2071	=> "db_init",
			2072	=> "getRanklist",
		),
	);
?>