<?php
	//require_once dirname(__FILE__).'/../db/db_mysql.php';
	//require_once dirname(__FILE__).'/../log/logger.php';
	//require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../account/account.php';
	require_once dirname(__FILE__).'/../friend/friend.php';
	require_once dirname(__FILE__).'/../player/gotgiftnum.php';
	require_once dirname(__FILE__).'/../player/sendgiftnum.php';
	require_once dirname(__FILE__).'/message_define.php';

	class message extends handler
	{
		public function newMsg($senderid, $receiverid, $type, $content, $deadline = iMsgTimeOut_1day)
		{	
			if ( !account::bExistsChar($senderid) || !account::bExistsChar($receiverid) 
				|| $type > eMsgType_end ) {
	   			logger::error("newMsg error: $senderid $receiverid $type error", __CLASS__);
				return response::format(ERROR_PARAMS, "$senderid $receiverid $type error");
			}

			if ($type == eMsgType_addFriend) {
				if (true == self::bIsSendNewFriendMsg($senderid, $receiverid)) {
	   				logger::error("newMsg error: $senderid $receiverid $type already send new friend msg", __CLASS__);
					return response::format(ERROR_PARAMS, "$senderid $receiverid $type already send new friend msg");
				}
			}

	        if ($type == eMsgType_requestGift) {
	        	$isRequestGift = friend::isRequestGift($senderid, $receiverid);
	        	if ($isRequestGift == true) {
	   				logger::error("newMsg error:".$senderid."|".$receiverid." already request friend gift", __CLASS__);
	        		return response::format(ERROR_ISREQUESTFRIENDGIFT, "already request friend gift, wait your friend response");
	        	}	
	        }

	        if ($type == eMsgType_sendGift) {
	        	if (friend::bIsSendGiftOver($senderid, $receiverid) == true) {
	   				logger::error("newMsg error:".$senderid."|".$receiverid." already send friend gift", __CLASS__);
	        		return response::format(-1, "already send friend gift");
	        	}	
	        }

	        $res = array();
			//send msg counter ++
			$db = new db_mysql();
			$conn = $db->db_getConn();
	        $stmt = $conn->prepare(newMesssage);

	        if (!is_object($stmt)) {
	   			logger::error("newMsg error:".$senderid."|".$receiverid." ".$db->db_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
			}

	        //var_dump($stmt);
	        $createTime = time();
	        $deadline = $createTime + $deadline;
	        $stmt->bind_param($GLOBALS['sqlmould']["newMesssage"], $senderid, $receiverid, $type, $content, $deadline, $createTime);
	        $stmt->execute();
	        $stmt->close();

	        if ($type == eMsgType_requestGift) {
	        	friend::requestGift($senderid, $receiverid);
	        }

	        if ($type == eMsgType_sendGift) {
	        	$msgflag = friend::sendGiftMsg($senderid, $receiverid);

	        	if ( true == $msgflag ) {
		        	$res['sendgiftnum'] = sendgiftnum::load($senderid);
	        	}
	        	else 
	        	{
	        		logger::error("newMsg error:".$senderid."|".$receiverid." |$msgflag| send gift msg error", __CLASS__);
	        		return response::format(-1, "send gift msg error");
	        	}
	        }

	        logger::write("newMsg success:".$senderid."|".$receiverid."|".$type."|".$content."|".$deadline, __CLASS__);

	        $res['tips'] = "send msg ok";
			return response::format(ERROR_OK, $res);
		}

		public function getMsgList( $guid )
		{
			if ( !account::bExistsChar($guid) ) 
			{
				return response::format(ERROR_PARAMS, "guid error:".$guid);
			}

			//filter the deadline msg and set isvalid to false
			$db = new db_mysql();
			$sql = "select * from t_msgqueue where isvalid = 1 and (receiverid = ".$guid.");";//" or senderid = ".$guid.
			$result = $db->db_query_select($sql);
			if (isset($result) && $result->num_rows > 0) {
				$msgList = array();
				while ( $row = $result->fetch_assoc() ) {
					$msgList[] = $row;
				}
				//var_dump($msgList);
			}

			$listLen = count($msgList);

			for ($i=0; $i < $listLen; $i++) { 
				$msg = &$msgList[$i];
				$senderid = $msg['senderid'];
				$senderinfo = account::charinfo($senderid);
				$senderinfo['isRequestGift'] = friend::isRequestGift($guid, $senderid);
				$msg['senderinfo'] = $senderinfo;

				//echo json_encode($msg['senderinfo'])."\n";
			}

			return response::format(ERROR_OK, $msgList);
		}

		public function getMsg( $msgid )
		{
			$db = new db_mysql();
			$sql = "select * from t_msgqueue where id = ".$msgid.";";
			$result = $db->db_query_select($sql);
			if (isset($result) && $result->num_rows > 0) {
				$row = $result->fetch_assoc();
				return $row;
			}

			return NULL;
		}

		public function readMsg($msgid)
		{
			$db = new db_mysql();
 			$stmt = $db->db_getConn()->prepare(readMsg);
	        $stmt->bind_param($GLOBALS['sqlmould']["readMsg"], $msgid);
	        if (!is_object($stmt)) {
	   			logger::error("readMsg error:".$msgid." ".$db->get_getConn()->error, __CLASS__);
	   			return -1;
			}
	        $stmt->execute();
	        $stmt->close();

	   		logger::write("readMsg success:".$msgid, __CLASS__);

	        return 0;
		}

		public function handleMsg( $guid, $msgid, $opt)
		{
			if ( !account::bExistsChar($guid) ) 
			{
				return response::format(ERROR_PARAMS, "guid error ".$guid);
			}

			$msg = self::getMsg($msgid);
			//var_dump($msg);

			if ($msg == NULL || intval($msg["receiverid"]) != $guid || intval($msg['isvalid']) == 0) {
				logger::error("handleMsg error: ".json_encode($msg)." ".$guid, __CLASS__);
				return response::format(ERROR_PARAMS, "msgid or guid error ".$msgid." ".$guid);
			}

			logger::write("handleMsg : ".json_encode($msg)."|".$guid, __CLASS__);

			$res = array();
			$errCode = ERROR_OK;

			switch ($msg["type"]) {
				case eMsgType_addFriend:
					{
						if ( $opt == 1 ) {
							$result = friend::createFriend($msg["senderid"], $msg["receiverid"]);
							$arrResult = json_decode($result, true);
							$errCode = $arrResult['errCode'];

							if ( 0 !== $errCode )
							{
								logger::error("handleMsg : create friend error $result", __CLASS__);
								$errCode	= ERROR_MYSQL;
								$res[]		= "create friend error";
							}
						}						
					}
					break;

				case eMsgType_requestGift:
					{
						$sendername = account::sGetCharname($msg["senderid"]);
						$receivername = account::sGetCharname($msg["receiverid"]);

						if ($sendername === NULL || $receivername === NULL) {
							logger::write("handleMsg : names error $sendername $receivername", __CLASS__);
							$errCode = ERROR_MYSQL;
							$res[]   = "names error";
						}

						if ( $opt == 1 ) {
							//receiver handle this msg with sending gift back
							$result = friend::sendGift($msg["receiverid"], $receivername, $msg["senderid"], $sendername);
							if ( 0 !=  $result )
							{
								logger::write("handleMsg : send gift error", __CLASS__);
								$errCode = ERROR_MYSQL;
								$res[]   = "send gift error";
							}

							$res['sendgiftnum'] = sendgiftnum::load($guid);
						}						
					}
					break;

				case eMsgType_sendGift:
					{
						if (gotgiftnum::bIsOver() == true) {
							logger::write("handleMsg : got sendgift error over limit", __CLASS__);
							return response::format(-1, "got sendgift error over limit");
						}

						gotgiftnum::update($guid, 1);
						logger::write("handleMsg : got sendGift ".print_r($msg, true), __CLASS__);		
						$res['gotgiftnum'] = gotgiftnum::load($guid);
					}
					break;

				case eMsgType_sendMsg:
					{
						friend::sendMsg();
					}
					break;
				
				default:
					logger::error("readMsg error: ".$guid." ".$msgid." ".$row['type'], __CLASS__);
					break;
			}
			
			self::readMsg($msgid);
			
			return response::format($errCode, $res);
		}

		public function getTimestamp()
		{
			return response::format(ERROR_OK, time());
		}

		public function bIsSendNewFriendMsg($senderid, $receiverid)
		{
			$current = time();
			$db = new db_mysql();
			$sql = "select * from t_msgqueue where senderid = $senderid and friendid = $receiverid and type = 1 and isvalid = 1;";
			//echo $sql;
			$result = $db->db_query_select($sql);
			//var_dump($result);

			if (isset($result) && $result->num_rows > 0) {
				//$row = $result->fetch_assoc();
				return true;
			}

			return false;
		}

		public function removeMsg($msgid)
		{
			$db = new db_mysql();
			$result = $db->db_query_select("delete from t_msgqueue where id = $msgid;");
			//var_dump($result);
		}

		//clean msg func set isvalid = 0
		public function cleanMsg()
		{
			$current = time();
			$db = new db_mysql();
			$result = $db->db_query_select("update t_msgqueue set isvalid = 0 where deadline < $current");
			var_dump($result);
		}
	}
?>