<?php
	
	define('eMsgType_begin', 			0);
	
	define("eMsgType_addFriend",	eMsgType_begin+1);
	define("eMsgType_sendGift",		eMsgType_begin+2);
	define("eMsgType_requestGift",	eMsgType_begin+3);
	define("eMsgType_sendMsg",		eMsgType_begin+4);
	define("eMsgType_sendMail",		eMsgType_begin+5);
	define("eMsgType_end",			eMsgType_begin+6);

/////////////////////////////////////////////////////////////////

	define("iMsgTimeOut_5min",		5*60);
	define("iMsgTimeOut_1day",		1*24*60*60);
	define("iMsgTimeOut_1week",		iMsgTimeOut_1day*7);
	define("iMsgTimeOut_1month",	iMsgTimeOut_1day*30);

?>