<?php

	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../activity/seaVentureMgr.php';

/**
* sea venture function
*/
class seaVenture extends handler
{
	
	function __construct()
	{
		# code...
	}

	public function doVenture($guid, $score)
	{
		$ptr = new seaVentureMgr();
		if ($ptr->isOpened() == false) {
			return response::format(ERROR_SEAVENTURECLOSE, "sea venture close");
		}

		$db = new db_mysql();

		$result = $db->db_query_select("select shell from t_char where guid = $guid;");
		$row = $result->fetch_assoc();
		$preScore = $row['shell'];
		$score += $preScore;

		$result = $db->db_query_select("update t_char set shell = $score where guid = $guid;");

		$result = $db->db_query_select("select name from t_char where guid = $guid;");
		$row = $result->fetch_assoc();
		var_dump($row);
		$name = $row['name'];

		$ptr->insertRanklist($guid, $name, 0, $score);

		return response::format(ERROR_OK);
	}

	//crontab execute hours check
	public function cleanVenture()
	{
		if (true == seaVentureMgr::isOpened()) {
			return false;	
		}

		$db = new db_mysql();

		$result = $db->db_query_select("update t_char set shell = 0;");
		return $result;
	}
}
?>