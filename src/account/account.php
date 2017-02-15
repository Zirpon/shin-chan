<?php
	require_once dirname(__FILE__).'/../db/db_mysql.php';
	require_once dirname(__FILE__).'/../log/logger.php';
	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../utils/elapsedTime.php';
	require_once dirname(__FILE__).'/../player/chapter.php';

	define("dayu", 1);
	define("guest", 2);

	class account extends handler
	{
		public function newAccount($account, $pwd, $type)
		{
			if (!isset($account) || !isset($pwd) || !isset($type)) {
				$error = "param error:$account $type $pwd";
				logger::error($error, __CLASS__);
				return response::format(ERROR_PARAMS, $error);
			}

			$db = new db_mysql("shin_chan");

			if (dayu === $type && empty($pwd)) {
				$error = "$account $type: empty pwd";
				logger::error($error, __CLASS__);
				//return response::format(ERROR_PARAMS, $error);
			}

			$arr = array($account, md5($pwd), $type, time());
  			$result =  $db->db_proc("proc_new_account", $arr);

  			if (!is_object($result)) {
  				$error = "$account $pwd $type $result is null";
  				logger::error($error, __CLASS__);
  				return response::format(ERROR_MYSQL, $error);
  			}
  			$row = $result->fetch_assoc();
  			if ( $row["result"] < 0 ) {
  				//account exists
  				$result->free();
  				logger::error("newAccount error: ".$account." ".$pwd."|".md5($pwd)." ".$type, "account");
				return response::format(ERROR_MYSQL, "$account type $type: exists account");
  			}

  			$result->free();

  			logger::write("newAccount success: ".$account." ".$pwd."|".md5($pwd)." ".$type, "account");
			return response::format(ERROR_OK, __CLASS__.":OK");
		}

		public function checkAccount($account, $pwd, $type)
		{
			$db = new db_mysql("shin_chan");

			$arr = array($account, md5($pwd), $type);
			$result = $db->db_proc("proc_check_account", $arr);

			//var_dump($result);
			$rows = $result->fetch_assoc();
 			if ( $rows["result"] <= 0 ) {
  				
  				$result->free();
  				logger::error("checkAccount error: ".$account." ".$pwd."|".md5($pwd)." ".$type, "account");
				return response::format(ERROR_FALSE, "no account or pwd error");
  			}

  			$result->free();

			logger::write("checkAccount success: ".$account." ".$pwd."|".md5($pwd)." ".$type, "account");
			return response::format(ERROR_TRUE, "account exists");
		} 

		public function newChar($account, $type, $charname)
		{
			$db = new db_mysql();

			$arr = array($account, $type);
			$result = $db->db_proc("proc_get_charlist", $arr);

			$rows = $result->fetch_assoc();
			//var_dump($rows);
			//echo "<br>hello<br>";
			if ( $rows["guid"] == 0 ) {
				$result->free();
				$db->db_cleanQuery();

				$arr = array($account, $type, $charname, time());
				$result = $db->db_proc("proc_new_char", $arr);

				$rows = $result->fetch_assoc();
				//var_dump($rows);
				//echo "<br>";
				if ($rows["result"] == 1 && intval($rows["rguid"]) > 0) {
					logger::write("newChar success: ".$account." ".$type." ".$charname." ".json_encode($rows), "account");
					return response::format(ERROR_OK, $rows['rguid']);
				}else if ($rows["result"] == -2)
				{
					logger::write("newChar error charname exists:".$account." ".$type." ".$charname." ".json_encode($rows), "account");
					return response::format(ERROR_MYSQL, $charname." exists");
				}
			}

			logger::write("newChar error: ".$account." ".$type." ".$charname." ".json_encode($rows), "account");
			return response::format(ERROR_MYSQL, "account got char");
		}

		public function login( $account, $type )
		{
			$db = new db_mysql();

			$arr = array($account, $type);
			//var_dump($arr);
			$result = $db->db_proc("proc_get_charlist", $arr);
			$rows = $result->fetch_assoc();
			//var_dump($rows);
			if ($rows["guid"] != 0) {
				$result->free();
				
				$db->db_cleanQuery();
				$sql = "update t_char set logintime = ".time()." where guid = ".$rows['guid'];
				$result = $db->db_query_select($sql);
				logger::write("login success: ".$account." ".$type." ".$rows['guid'], __CLASS__);
				//var_dump($result);
				return response::format(ERROR_OK, $rows["guid"]);
			}

			return response::format(ERROR_MYSQL, "account got char");
		}

		public function bExistsChar( $guid )
		{
			$db = new db_mysql();

			$result = $db->db_query_select(nExistsCharByGuid.$guid);

			if (isset($result) && $result->num_rows > 0) {
				$rows = $result->fetch_row();
				if (intval($rows[0]) > 0) {
					return TRUE;	
				}
			}
			return FALSE;

		}

		public function sGetCharname($guid)
		{
			$db = new db_mysql();

			$result = $db->db_query_select(sGetCharnameByGuid.$guid);

			if (isset($result) && $result->num_rows > 0) {
				$rows = $result->fetch_row();
				return $rows[0];	
			}
			return NULL;
		}

		public function guestLogin($account, $type, $charname)
		{
			$res_json = self::checkAccount($account, "", $type);
			$res_arr = json_decode($res_json, TRUE);
			//var_dump($res_arr);
			if ($res_arr['errCode'] == true) {
				$res_json = self::login($account, $type);
				$res_arr = json_decode($res_json, TRUE);
				if ($res_arr['errCode'] != ERROR_OK) {
					return self::newChar($account, $type, $charname);
				}
				else
				{
					return $res_json;
				}
			}
			else
			{
				$res_json = self::newAccount($account, "", $type);
				$res_arr = json_decode($res_json, true);
				//var_dump($res_arr);
				if (ERROR_OK == $res_arr['errCode']) {
					return self::newChar($account, $type, $charname);
				}
				else
				{
					return $res_json;
				}
				
			}
		}

		public function archive($guid, $data)
		{
			$time_cost = new elapsedTime(__CLASS__."::".__FUNCTION__);

			$db = new db_mysql();
			$stmt = $db->db_getConn()->prepare(archive);

	        if (!is_object($stmt)) {
	   			logger::error("archive error:".$guid."|".$data." ".$db->get_getConn()->error, __CLASS__);
				return response::format(ERROR_MYSQL, "db sql error");
			}

	        $stmt->bind_param($GLOBALS['sqlmould']["archive"], $data, $guid);
	        $stmt->execute();
	        $stmt->close();

	        logger::write("archive success: ".$guid."|".$data, __CLASS__);

			return response::format(ERROR_OK);
		}

		public function loadArchive($guid)
		{
			$time_cost = new elapsedTime(__CLASS__."::".__FUNCTION__);

			$db = new db_mysql();

			$result = $db->db_query_select(loadArchive.$guid);

			$errCode = ERROR_MYSQL;
			$res 	 = "";
			if (isset($result) && $result->num_rows > 0) {
				$rows = $result->fetch_row();

				$errCode = ERROR_OK;
				$res = $rows[0];
			}

			return response::format($errCode, $res);
		}

		public function charinfo($charguid)
		{
			$db = new db_mysql();

			$charinfo = array();
			$result = $db->db_query_select("select name,sex,logintime,sendgiftnum,gotgiftnum from t_char where guid = $charguid;");
			//var_dump($result);
			if ($result->num_rows <= 0) {
				return response::format(ERROR_MYSQL);
			}
			$record_row = $result->fetch_assoc();
			$charinfo['guid']		= $charguid;
			$charinfo['name'] 		= $record_row['name'];
			$charinfo['sex'] 		= $record_row['sex'];
			$charinfo['logintime'] 	= $record_row['logintime'];
			$charinfo['sendgiftnum'] 	= $record_row['sendgiftnum'];
			$charinfo['gotgiftnum'] 	= $record_row['gotgiftnum'];
			$charinfo['maxChapter']	= chapter::getMaxChapterLevel($charguid);
			$charinfo['totalStar'] 	= chapter::getTotalStar($charguid);

			return response::format(ERROR_OK, $charinfo);
		}
	}



	//$test = new account();
	//$test->newAccount("champon7", "aaaaaa", dayu);
	//echo $test->login("champon7", dayu);

?>
