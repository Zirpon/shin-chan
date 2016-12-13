<?php
	$handlers = array(
		"account"	=> array(
			2001	=> "newAccount",
			2002	=> "checkAccount",
			2003	=> "newChar",
			2004	=> "login",
			//2005	=> "bExistsChar",
			//2006	=> "sGetCharname",
			2007	=> "guestLogin",
			2008	=> "archive",
			2009	=> "loadArchive",
		),

		"message"	=> array(
			2011	=> "newMsg",
			2012	=> "getMsgList",
		//	2013	=> "getMsg",
		//	2014	=> "readMsg",
			2015	=> "handleMsg",
			2016	=> "getTimestamp",
		),

		"friend"	=> array(
			2021	=> "createFriend",
			2022	=> "sendGift",
			2023	=> "unfriend",
			2024	=> "requestGift",
			2025	=> "sendMsg",
		),

		"mail"		=> array(
			2031	=> "sendMail",
			//2032	=> "loadMail",
			2033	=> "readMail",
			2034	=> "loadMailList",
		),
	);
?>