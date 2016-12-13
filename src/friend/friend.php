<?php
	require_once dirname(__FILE__).'/../account/account.php';
	require_once dirname(__FILE__).'/../message/message_define.php';
	require_once dirname(__FILE__).'/../mail/mail.php';
	
	class friend extends handler
	{
		public function createFriend($playerid, $friendid)
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return response::format(ERROR_PARAMS, "id error $playerid $friendid");
			}
			$db = new db_mysql();
			$sql = createfriend;
			$format = "createfriend";

			$stmt = $db->db_getConn()->prepare($sql);
	        
	        if (!is_object($stmt)) {
	   			logger::error("newMsg error:".$playerid."|".$friendid." ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
			}

	        $stmt->bind_param($GLOBALS['sqlmould'][$format], $playerid, $friendid);
   	        $result = $stmt->execute();
   	        if (empty($result)) {
   	        	$sql = makeupfriend;
   	        	$format = "makeupfriend";
   	        	$stmt->close();
   	        }

			$stmt = $db->db_getConn()->prepare($sql);

	        if (!is_object($stmt)) {
	   			logger::error("newMsg error:".$playerid."|".$friendid." ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
			}

	        $stmt->bind_param($GLOBALS['sqlmould'][$format], $playerid, $friendid);
   	        $result = $stmt->execute();

	        $tmp = $playerid;
	        $playerid = $friendid;
	        $friendid = $tmp;
	        $b = $stmt->execute();
	        $stmt->close();

	        logger::write("createfriend success: "$playerid."|".$friendid, __CLASS__);

			return response::format(ERROR_OK);
		}

		public function sendGift($playerid, $playername, $friendid, $friendname )
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return -1;
			}

			return mail::sendMail(2, $playerid, $playername, $friendid, $friendname);
			//send gift time need to be restrict
			//bind_param param should be variable, can not be const value
	     
	        //send gift counter ++
		}

		public function unfriend($playerid, $friendid)
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return -1;
			}

			$db = new db_mysql();
			$stmt = $db->db_getConn()->prepare(unfriend);

	        if (!is_object($stmt)) {
	   			logger::error("newMsg error:".$playerid."|".$friendid." ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
			}

	        $stmt->bind_param($GLOBALS['sqlmould']["unfriend"], $playerid, $friendid);
	        $stmt->execute();

	        $tmp = $playerid;
	        $playerid = $friendid;
	        $friendid = $tmp;
	        $b = $stmt->execute();		        
	        $stmt->close();

	        logger::write("unfriend success: ".$playerid."|".$friendid, __CLASS__);

			return response::format(ERROR_OK);

		}
	
		public function requestGift(){}

		public function sendMsg(){}
	}
?>