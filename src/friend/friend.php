<?php
	require_once dirname(__FILE__).'/../account/account.php';
	require_once dirname(__FILE__).'/../message/message.php';
	require_once dirname(__FILE__).'/../mail/mail.php';
	require_once dirname(__FILE__).'/../player/chapter.php';
	require_once dirname(__FILE__).'/../player/sendgiftnum.php';

	define("sendFriendGiftLimit", 1);
	
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
	   			logger::error("newMsg error:".$playerid."|".$friendid."|$sql ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "create friend db sql error");
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
	   			logger::error("newMsg error:".$playerid."|".$friendid."|$sql ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "makeup friend db sql error");
			}

	        $stmt->bind_param($GLOBALS['sqlmould'][$format], $playerid, $friendid);
   	        $result = $stmt->execute();

	        $tmp = $playerid;
	        $playerid = $friendid;
	        $friendid = $tmp;
	        $b = $stmt->execute();
	        $stmt->close();

	        logger::write("createfriend success: ".$playerid."|".$friendid, __CLASS__);

			return response::format(ERROR_OK);
		}

		public function isFriend($playerid, $friendid)
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return -1;
			}

			$db = new db_mysql();
			$result = $db->db_query_select("select count(*) from t_friend where playerid = $playerid 
											and friendid = $friendid and isvalid = 1;");
			//var_dump($result);
			$row = $result->fetch_assoc();
			$isFriend = $row['count(*)'];
			
			return $isFriend;
		}

		public function requestGift($playerid, $friendid)
		{

			$bIsfriend = self::isFriend($playerid, $friendid);
			if ($bIsfriend == false) {
				return false;
			}

			$db = new db_mysql();
			$result = $db->db_query_select("update t_friend set requestGift = 1 where 
											playerid = $playerid and friendid = $friendid");
			//var_dump($result);
			if (is_null($result)) {
				return false;
			}

			return $result;
		}

		public function isRequestGift($playerid, $friendid)
		{
			$bIsfriend = self::isFriend($playerid, $friendid);
			if ($bIsfriend == false) {
				return -1;
			}

			$db = new db_mysql();
			$result = $db->db_query_select("select requestGift from t_friend where playerid = $playerid 
											and friendid = $friendid;");
			//var_dump($result);
			if ($result->num_rows <= 0) {
				return -1;
			}

			$row = $result->fetch_assoc();
			//var_dump($row);
			$isRequestGift = intval($row['requestGift']);

			return $isRequestGift;
		}

		public function sendGift($playerid, $playername, $friendid, $friendname )
		{
			if ( !account::bExistsChar($playerid) || !account::bExistsChar($friendid) ) 
			{
				return -1;
			}

			if (sendgiftnum::bIsOver($playerid) == true) {
				return -1;
			}

			//$res =  mail::sendMail(2, $playerid, $playername, $friendid, $friendname);
			$res =  self::sendMsg($playerid, $friendid, eMsgType_sendGift);
			//$arrRes = json_decode($res, true);
			//$errCode = $arrRes['errCode'];
			//var_dump($arrRes);
			
			if ($res == 0) {
				//$db = new db_mysql();
				//$result = $db->db_query_select("update t_friend set requestGift = 0 where playerid = $friendid and friendid = $playerid and isvalid = 1");
				sendgiftnum::update($playerid, 1);
			}


  			logger::write("sendGift:".$playerid.":".$playername."|".$friendid.":".$friendname, __CLASS__);

			return $res;
	    }

	    public function bIsSendGiftOver($playerid, $friendid)
	    {
			$bIsfriend = self::isFriend($playerid, $friendid);
			if ($bIsfriend == false) {
				return -1;
			}

			$db = new db_mysql();
			$result = $db->db_query_select("select giftcount from t_friend where playerid = $playerid 
											and friendid = $friendid;");
			//var_dump($result);
			if ($result->num_rows <= 0) {
				return -1;
			}

			$row = $result->fetch_assoc();
			//var_dump($row);
			$giftcount = intval($row['giftcount']);

			if (sendFriendGiftLimit > $giftcount) {
				return true;
			}

			return false;
	    }

	    public function sendGiftMsg($playerid, $friendid)
	    {
			$bIsfriend = self::isFriend($playerid, $friendid);
			if ($bIsfriend == false) {
				return -1;
			}

			$db = new db_mysql();
			$result = $db->db_query_select("update t_friend set giftcount = 1 where playerid = $playerid 
											and friendid = $friendid;");
			//var_dump($result);

			return $result;
	    }

	    public function cleanRequestGiftStatus()
	    {
	    	$db = new db_mysql();
	    	$result = $db->db_query_select("update t_friend set requestGift = 0");
	    	return $result;
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

		public function recommendFriends( $guid )
		{
			$db = new db_mysql();

			$param = array($guid);
			$result = $db->db_proc("proc_get_recommendFriends", $param);

			//var_dump($result);
			$ret = array();

			//var_dump($result);
			while ($rows = $result->fetch_assoc()) {

				//var_dump($rows);
				$friend = array();
				$friend['guid'] 		= $rows['guid'];
				$friend['name'] 		= $rows['name'];
				$friend['sex'] 			= intval($rows['sex']);
				$friend['logintime'] 	= $rows['logintime'];
				$friend['shell'] 		= intval($rows['shell']);
				$friend['maxChapter']	= chapter::getMaxChapterLevel($friend['guid']);//no new use member var any harm
				$friend['totalStar'] 	= chapter::getTotalStar($friend['guid']);

				$ret[] = $friend;
				//var_dump($friend);
				//$result->close();
				/*
				if ( true == $db->db_getConn()->more_results() )
				{
					$db->db_cleanQuery();
					$result = $db->db_getConn()->store_result();
					var_dump($result);
					echo "ddddd ".is_object($result);
				}
				if (!is_object($result)) {
					echo "hell";
					break;
				}*/
			}

			logger::write("recommendFriends success: ".print_r($ret, true), __CLASS__);
			return response::format(ERROR_OK, $ret);
		}
	
		public function searchFriendById($friendid)
		{
			$db = new db_mysql();

			$friendinfo = account::charinfo($friendid);
			if ($friendinfo != -1) {
				logger::write("searchFriendById success: ".print_r($friendinfo, true), __CLASS__);
				return response::format(ERROR_OK, $friendinfo);	
			}
			
			return response::format(ERROR_PARAMS, "id error $friendid");
		}

		public function getFriendlist( $guid )
		{
			$db = new db_mysql();
			$result = $db->db_query_select("select friendid from t_friend where playerid = $guid and isvalid = 1;");
			if (is_null($result)) {
				return -1;
			}

			$friendlist = array();
			
			$db_queryRecord = new db_mysql();
			//var_dump($result);
			while ( $rows = $result->fetch_assoc() ) {
				//var_dump($rows);
				$friendRecord =array();

				$friendid = $rows['friendid'];

				$friendRecord = account::charinfo($friendid);
				
				$friendlist[] = $friendRecord;
			}
			$myRecord = array();
			$myRecord = account::charinfo($guid);
			$friendlist[] = $myRecord;

			return response::format(ERROR_OK, $friendlist);
		}

		/*
		public function friendinfo($friendid)
		{
			$db = new db_mysql();

			$friendinfo = array();
			$result = $db->db_query_select("select name,logintime from t_char where guid = $friendid;");
			//var_dump($result);
			if ($result->num_rows <= 0) {
				return -1;
			}
			$record_row = $result->fetch_assoc();
			$friendinfo['friendid']		= $friendid;
			$friendinfo['name'] 		= $record_row['name'];
			$friendinfo['logintime'] 	= $record_row['logintime'];
			$friendinfo['maxChapter']	= chapter::getMaxChapterLevel($friendid);
			$friendinfo['totalStar'] 	= chapter::getTotalStar($friendid);
			return $friendinfo;
		}*/

		public function sendMsg($senderid, $receiverid, $type, $content = "", $deadline = iMsgTimeOut_1da)
		{
			$result = message::newMsg($senderid, $receiverid, $type, $content, $deadline = iMsgTimeOut_1day);
			$arrResult = json_decode($result, true);
			$errCode = $arrResult['errCode'];
			
			return $errCode;
		}
	}
?>