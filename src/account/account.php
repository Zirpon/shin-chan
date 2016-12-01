<?php
	require_once dirname(__FILE__).'/../db/db_mysql.php';
	require_once dirname(__FILE__).'/../log/logger.php';
	require_once dirname(__FILE__).'/../utils/handler.php';

	define("dayu", 1);
	define("guest", 2);

	class account extends handler
	{
		public function newAccount($account, $pwd, $type)
		{
			$db = new db_mysql("shin_chan");

			if (dayu === $type && empty($pwd)) {
				return -1;
			}

			$arr = array($account, md5($pwd), $type, time());
  			$result =  $db->db_proc("proc_new_account", $arr);

  			$row = $result->fetch_assoc();
  			if ( $row["result"] < 0 ) {
  				//account exists
  				$result->free();
  				logger::error("newAccount error: ".$account." ".$pwd."|".md5($pwd)." ".$type, "account");
  				return -2;
  			}

  			$result->free();
  			logger::write("newAccount success: ".$account." ".$pwd."|".md5($pwd)." ".$type, "account");
  			
  			return 0;	
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
  				return 0;
  			}

  			$result->free();

			logger::write("checkAccount success: ".$account." ".$pwd."|".md5($pwd)." ".$type, "account");
	  		return 1;
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
					logger::write("newChar success: ".$account." ".$type." ".$charname." ".$rows["rguid"], "account");
					return $rows["rguid"];
				}
			}

			logger::write("newChar error: ".$account." ".$type." ".$charname." ".$rows["guid"], "account");
			return -1;			
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
				return $rows["guid"];
			}

			return -1;
		}

		public function bExistsChar( $guid )
		{
			$db = new db_mysql();

			$result = $db->db_query_select(bExistsCharByGuid.$guid);

			if (isset($result) && $result->num_rows > 0) {
				$rows = $result->fetch_row();
				if (intval($rows[0]) > 0) {
					return TRUE;	
				}
			}
			return FALSE;
		}
	}

	//$test = new account();
	//$test->newAccount("champon7", "aaaaaa", dayu);
	//echo $test->login("champon7", dayu);

?>