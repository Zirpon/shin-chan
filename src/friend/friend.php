<?php
	require_once dirname(__FILE__).'/../db/db_mysql.php';
	require_once dirname(__FILE__).'/../log/logger.php';
	require_once dirname(__FILE__).'/../utils/handler.php';

	class friend extends handler
	{
		public function createFriend($playerid, $friendid)
		{
			$db = new db_mysql();
			$stmt = $db->db_getConn()->prepare(createfriend);
	        $stmt->bind_param($GLOBALS['sqlmould']["createfriend"], $playerid, $friendid);
   	        $stmt->execute();

	        $tmp = $playerid;
	        $playerid = $friendid;
	        $friendid = $tmp;
	        $stmt->execute();	        
	        $stmt->close();
		}

		public function sendGift(){}
	
		public function requestGift(){}

		public function sendMsg(){}
	}
?>