<?php
	//require_once dirname(__FILE__).'/../db/db_mysql.php';
	//require_once dirname(__FILE__).'/../log/logger.php';
	//require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../account/account.php';
	require_once dirname(__FILE__).'/../friend/friend.php';
	require_once dirname(__FILE__).'/message_define.php';

	class message extends handler
	{
		public function newMsg($senderid, $receiverid, $type, $content, $deadline = iMsgTimeOut_1day)
		{	
			if ( !account::bExistsChar($senderid) || !account::bExistsChar($receiverid) 
				|| $type > eMsgType_end ) {
				return response::format(ERROR_PARAMS, "$senderid $receiverid $type error");
			}

	        if ($type == eMsgType_requestGift) {
	        	$isRequestFriend = friend::isRequestFriend($senderid, $receiverid);
	        	if ($isRequestFriend == 1) {
	        		return response::format(ERROR_ISREQUESTFRIENDGIFT, "already request friend gift, wait your friend response");
	        	}
	        }

			//send msg counter ++
			$db = new db_mysql();
			$conn = $db->db_getConn();
	        $stmt = $conn->prepare(newMesssage);

	        if (!is_object($stmt)) {
	   			logger::error("newMsg error:".$senderid."|".$receiverid." ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
			}

	        //var_dump($stmt);
	        $stmt->bind_param($GLOBALS['sqlmould']["newMesssage"], $senderid, $receiverid, $type, $content, $deadline);
	        $stmt->execute();
	        $stmt->close();

	        if ($type == eMsgType_requestGift) {
	        	friend::requestFriend($senderid, $receiverid);
	        }

	        logger::write("newMsg success:".$senderid."|".$receiverid."|".$type."|".$content."|".$deadline, __CLASS__);

			return response::format(ERROR_OK, "send msg ok");
		}

		public function getMsgList( $guid )
		{
			if ( !account::bExistsChar($guid) ) 
			{
				return response::format(ERROR_PARAMS, $guid);
			}

			//filter the deadline msg and set isvalid to false
			$db = new db_mysql();
			$sql = "select * from t_msgqueue where isvalid = 1 and (senderid = ".$guid." or receiverid = ".$guid.");";
			$result = $db->db_query_select($sql);
			if (isset($result) && $result->num_rows > 0) {
				$msgList = array();
				while ( $row = $result->fetch_assoc() ) {
					$msgList[] = $row;
				}
				//var_dump($msgList);
				return response::format(ERROR_OK, json_encode($msgList));
			}

			return response::format(ERROR_MYSQL, "no msg");
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

		public function handleMsg( $guid, $msgid )
		{
			if ( !account::bExistsChar($guid) ) 
			{
				return response::format(ERROR_PARAMS, "guid error ".$guid);
			}

			$msg = self::getMsg($msgid);
			//var_dump($msg);

			if ($msg === NULL || intval($msg["receiverid"]) !== $guid || intval($msg['isvalid']) === 0) {
				logger::error("handleMsg error: ".json_encode($msg)." ".$guid, __CLASS__);
				return response::format(ERROR_PARAMS, "msgid or guid error ".$msgid." ".$guid);
			}

			logger::write("handleMsg : ".json_encode($msg)."|".$guid, __CLASS__);

			switch ($msg["type"]) {
				case eMsgType_addFriend:
					{
						$result = friend::createFriend($msg["senderid"], $msg["receiverid"]);
						if ( 0 !== $result )
						{
							logger::write("handleMsg : create friend error $result", __CLASS__);
							return response::format(ERROR_MYSQL, "create friend error");
						}
						
						self::readMsg($msgid);
					}
					break;

				case eMsgType_requestGift:
					{
						$sendername = account::sGetCharname($msg["senderid"]);
						$receivername = account::sGetCharname($msg["receiverid"]);

						if ($sendername === NULL || $receivername === NULL) {
							logger::write("handleMsg : names error $sendername $receivername", __CLASS__);
							return response::format(ERROR_MYSQL, "names error");
						}

						//receiver handle this msg with sending gift back
						$result = friend::sendGift($msg["senderid"], $sendername, $msg["receiverid"], $receivername);
						if ( 0 !==  $result )
						{
							logger::write("handleMsg : send gift error", __CLASS__);
							return response::format(ERROR_MYSQL, "send gift error");
						}
						
						self::readMsg($msgid);
					}
					break;

				case eMsgType_sendMsg:
					{
						friend::sendMsg();
						self::readMsg($msgid);
					}
					break;
				
				default:
					logger::error("readMsg error: ".$guid." ".$msgid." ".$row['type'], __CLASS__);
					break;
			}
			
			return response::format(ERROR_OK);
		}

		public function getTimestamp()
		{
			return response::format(ERROR_OK, time());
		}
	}
?>