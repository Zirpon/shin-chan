<?php
	$handlers = array(
		"account"	=> array(
			2001	=> "newAccount",
			2002	=> "checkAccount",
			2003	=> "newChar",
			2004	=> "login",
		),

		"message"	=> array(
			2005	=> "newMsg",
			2006	=> "getMsgList",
		//	2007	=> "getMsg",
		//	2008	=> "readMsg",
			2009	=> "handleMsg",
		),

		"friend"	=> array(
			2010	=> "createFriend",
			2011	=> "sendGift",
			2012	=> "unfriend",
			2013	=> "requestGift",
			2014	=> "sendMsg",
		),
	);
?>