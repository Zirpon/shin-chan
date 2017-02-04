<?php

	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../activity/seaVentureMgr.php';
	require_once dirname(__FILE__).'/../friend/friend.php';

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
		//var_dump($row);
		$name = $row['name'];

		$ptr->insertRanklist($guid, $name, 0, $score);

		return response::format(ERROR_OK, "do doVenture success");
	}

	//crontab execute hours check
	public function cleanVenture()
	{
		//debug set false condition
		if (true == seaVentureMgr::isOpened()) {
			return false;	
		}

		$db = new db_mysql();

		$result = $db->db_query_select("update t_char set shell = 0;");
		return $result;
	}

	public function getfriendRanklist($guid)
	{
		$json_friendlist = friend::getFriendlist($guid);
		$arr_json_friendlist = json_decode($json_friendlist, true);
		$arr_friendlist = $arr_json_friendlist['result'];

		//var_dump($arr_friendlist);
		$db = new db_mysql();
		$friendRanklist = array();

		$arrLen = count($arr_friendlist);
		for ($i=0; $i < $arrLen; $i++) { 

			$friendRecord = &$arr_friendlist[$i];

			$friendid = intval($friendRecord['guid']);
			$result = $db->db_query_select("select shell from t_char where guid = $friendid");
			if (is_null($result)) {
				continue;
			}
			$row = $result->fetch_assoc();
			$score = intval($row['shell']);
			$friendRecord['rank']  = 0;
			$friendRecord['score'] = $score;
			// /echo json_encode($friendRecord)."\n";
			if ( 0 < $score ) {
				$friendRanklist[] = $friendRecord;
			}
		}

		$friendRanklist = my_sort($friendRanklist, "score");
		//echo json_encode($friendRanklist);
		$friendRanklist = updateRankIndex($friendRanklist);

		return response::format(ERROR_OK, $friendRanklist);
	}
}
?>