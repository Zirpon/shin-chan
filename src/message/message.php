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
				return -1;
			}

			//send msg counter ++
			$db = new db_mysql();
			$conn = $db->db_getConn();
	        $stmt = $conn->prepare(newMesssage);
	        //var_dump($stmt);
	        $stmt->bind_param($GLOBALS['sqlmould']["newMesssage"], $senderid, $receiverid, $type, $content, $deadline);
	        $stmt->execute();
	        $stmt->close();

			return 0;
		}

		public function getMsgList( $guid )
		{
			if ( !account::bExistsChar($guid) ) 
			{
				return -1;
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
				return json_encode($msgList);
			}

			return -2;
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
	        $stmt->execute();
	        $stmt->close();

		}

		public function handleMsg( $guid, $msgid )
		{
			if ( !account::bExistsChar($guid) ) 
			{
				return -1;
			}

			$msg = self::getMsg($msgid);
			//var_dump($msg);

			if ($msg === NULL || intval($msg["receiverid"]) !== $guid || intval($msg['isvalid']) === 0) {
				return -2;
			}

			switch ($msg["type"]) {
				case eMsgType_addFriend:
					{
						if ( 0 === friend::createFriend($msg["senderid"], $msg["receiverid"]) )
						{
							self::readMsg($msgid);
						}
					}
					break;
				/*
				case eMsgType_sendGift:
					{
						friend::sendGift($msg["senderid"], $msg["receiverid"]);
						self::readMsg($msgid);
					}
					break;
				*/
				case eMsgType_requestGift:
					{
						//receiver handle this msg with sending gift back
						if ( 0 === friend::sendGift($msg["senderid"], $msg["receiverid"]) )
						{
							self::readMsg($msgid);
						}
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
			
			return 0;
		}
	}
?>