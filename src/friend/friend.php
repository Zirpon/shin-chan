<?php
	require_once dirname(__FILE__).'/../account/account.php';
	require_once dirname(__FILE__).'/../message/message_define.php';

	define("giftMail_title",	"hehe");
	define('giftMail_content',	'congratulation got gift from ');
	define('giftMail_attach',	"100");
	define('giftMail_deadtime', iMsgTimeOut_1day);
	
	class friend extends handler
	{
		public function createFriend($playerid, $friendid)
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return -1;
			}
			$db = new db_mysql();
			$sql = createfriend;
			$format = "createfriend";

			$stmt = $db->db_getConn()->prepare($sql);
	        $stmt->bind_param($GLOBALS['sqlmould'][$format], $playerid, $friendid);
   	        $result = $stmt->execute();
   	        if (empty($result)) {
   	        	$sql = makeupfriend;
   	        	$format = "makeupfriend";
   	        	$stmt->close();
   	        }

			$stmt = $db->db_getConn()->prepare($sql);
	        $stmt->bind_param($GLOBALS['sqlmould'][$format], $playerid, $friendid);
   	        $result = $stmt->execute();

	        $tmp = $playerid;
	        $playerid = $friendid;
	        $friendid = $tmp;
	        $b = $stmt->execute();	        
	        $stmt->close();

	        return 0;
		}

		public function sendGift( $playerid, $friendid )
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return -1;
			}

			$db = new db_mysql();
			$stmt = $db->db_getConn()->prepare(sendGift);

			$giftMail_title		= giftMail_title;
			$giftMail_content	= giftMail_content;
			$giftMail_attach	= giftMail_attach;
			$giftMail_deadtime	= giftMail_deadtime;

			//send gift time need to be restrict
			//bind_param param should be variable, can not be const value
	        $stmt->bind_param($GLOBALS['sqlmould']["sendGift"],
	        					$playerid, $friendid,
	        					$giftMail_title, $giftMail_content, $giftMail_attach,
	        					time(), $giftMail_deadtime);
	        //send gift counter ++

	        $stmt->execute();	        
	        $stmt->close();

	        return 0;
		}

		public function unfriend($playerid, $friendid)
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return -1;
			}

			$db = new db_mysql();
			$stmt = $db->db_getConn()->prepare(unfriend);

	        $stmt->bind_param($GLOBALS['sqlmould']["unfriend"], $playerid, $friendid);
	        $stmt->execute();

	        $tmp = $playerid;
	        $playerid = $friendid;
	        $friendid = $tmp;
	        $b = $stmt->execute();		        
	        $stmt->close();

	        return 0;

		}
	
		public function requestGift(){}

		public function sendMsg(){}
	}
?>