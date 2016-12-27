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

	public function getfriendRanklist($guid)
	{
		$json_friendlist = friend::getFriendlist($guid);
		$arr_json_friendlist = json_decode($json_friendlist, true);
		$arr_json_friendlist_result = $arr_json_friendlist['result'];

		$arr_friendlist = json_decode($arr_json_friendlist_result, true);
		var_dump($arr_friendlist);
		$db = new db_mysql();
		$friendRanklist = array();
		foreach ($arr_friendlist as $value) {
			$friendid = $value['friendid'];
			$result = $db->db_query_select("select shell from t_char where guid = $friendid");
			if (is_null($result)) {
				continue;
			}
			$row = $result->fetch_assoc();
			$score = intval($row['shell']);
			$friendRecord = array("rank"=>0,"friendid"=>intval($value),"score"=>$score);
			$friendRanklist[] = $friendRecord;
		}

		$friendRanklist = my_sort($friendRanklist, "score");
		//echo json_encode($friendRanklist);
		$friendRanklist = updateRankIndex($friendRanklist);

		return response::format(ERROR_OK, json_encode($friendRanklist));
	}
}
?>