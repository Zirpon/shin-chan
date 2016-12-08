<?php
	require_once dirname(__FILE__).'/../account/account.php';
	require_once dirname(__FILE__).'/mail.config';

	class mail extends handler
	{
		public function sendMail($type, $sourceid, $sourcename, $receiverid, $receivername)
		{
			if ( !account::bExistsChar($sourceid) || !account::bExistsChar($receiverid) ) 
			{
				return response::format(ERROR_PARAMS, "id error $sourceid $receiverid");
			}

			$db = new db_mysql();
			//if prepare return no object, copy the sql string to query
			$stmt = $db->db_getConn()->prepare(sendmail);
			if (is_object($stmt)) {
				
				$mail = $GLOBALS['mail_config'][$type];

				//send gift time need to be restrict
				//bind_param param should be variable, can not be const value
		        $stmt->bind_param($GLOBALS['sqlmould']["sendmail"],
		        					$type, $sourceid, $sourcename, $receiverid, $receivername,
		        					$mail["title"], $mail["content"], $mail["attach"],
		        					time(), $mail["deadline"]);

		        $stmt->execute();	        
		        $stmt->close();
	   		}
	   		else
	   		{
	   			logger::error("sendmail error:".$type."|".$sourceid."|".$sourcename."|".$receiverid."|".$receivername." "
	   										.$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
	   		}

	   		logger::write("sendmail success:".$type."|".$sourceid."|".$sourcename."|".$receiverid."|".$receivername, __CLASS__);

			return response::format(ERROR_OK);
		}

		public function loadMail($mailid)
		{
			$db = new db_mysql();
			$result = $db->db_query_select("select * from t_mail where status = 1 and id = ".$mailid);
			if (!is_object($result)) {
	   			logger::error("loadmail error:".$mailid." ".$db->db_getConn()->error, __CLASS__);
				return NULL;
			}
			$mail = $result->fetch_assoc();
			return $mail;
		}

		public function readMail($playerid, $mailid)
		{
			if ( !account::bExistsChar($playerid) ) 
			{
				return response::format(ERROR_PARAMS, "no $playerid");
			}

			$mail = self::loadMail($mailid);
			if ( $mail === NULL || intval($mail['targetId']) !== $playerid ) {
	   			logger::error("readMail error:".$playerid."|".$mailid."|".json_encode($mail), __CLASS__);
				return response::format(ERROR_MYSQL, "$mailid error");
			}

			$db = new db_mysql();
			$stmt = $db->db_getConn()->prepare(readmail);
			if (!is_object($stmt)) {
	   			logger::error("sendmail error:".$playerid."|".$mailid." ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
			}

	        $stmt->bind_param($GLOBALS['sqlmould']["readmail"], $mailid);
	        $stmt->execute();	        
	        $stmt->close();

	        logger::write("sendmail success:".$playerid."|".$mailid, __CLASS__);

			return response::format(ERROR_OK);
		}

		public function loadMailList($guid)
		{
			if ( !account::bExistsChar($guid) ) 
			{
				return response::format(ERROR_PARAMS, "no $guid");
			}
			//filter the deadline msg and set isvalid to false
			$db = new db_mysql();
			$sql = "select * from t_mail where status = 1 and targetId = ".$guid;
			$result = $db->db_query_select($sql);
			if (isset($result) && $result->num_rows > 0) {
				$msgList = array();
				while ( $row = $result->fetch_assoc() ) {
					$msgList[] = $row;
				}
				//var_dump($msgList);
				return response::format(ERROR_OK, json_encode($msgList));
			}

			return response::format(ERROR_MYSQL, "no mail");
		}
	}
?>