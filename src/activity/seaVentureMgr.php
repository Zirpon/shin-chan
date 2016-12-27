<?php
	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../utils/utils.php';
	require_once dirname(__FILE__).'/seaVentureMgr.config';

/**
* 
*/
class seaVentureMgr extends handler
{
	
	function __construct()
	{
		self::loadRanklist();		
	}

	public function __destruct()
	{
		self::saveRanklist();
	}


	static protected $m_arrRanklist;

	public function loadRanklist()
	{
		$db = new db_mysql();
		$config = $GLOBALS['g_arrSeaVentureMgrConfig'];

		$szlimit = "";
		if ( $config["loadlistCount"] != 0 ) {
			$szlimit = " limit ".$config["loadlistCount"];
		}
		$result = $db->db_query_select(loadSeaVentureRank.$szlimit);
		if (isset($result)) {

			$ranklist = array();
			while ( $row = $result->fetch_assoc() ) {
				$row["score"] = intval($row["score"]);
				$row["rank"] = intval($row["rank"]);
				$ranklist[] = $row;
			}

			self::$m_arrRanklist = $ranklist;
			//echo self::showRanklist();
			return TRUE;
		}

		return FALSE;
	}

	public function showRanklist()
	{
		//echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
		if (false == self::onShow()) {
			return response::format(ERROR_SEAVENTURENOTONSHOW, "NOT ON SHOW");
		}
		
		return response::format(ERROR_OK, json_encode(self::$m_arrRanklist));
	}

	public function ranklistSort()
	{
		self::$m_arrRanklist = my_sort(self::$m_arrRanklist, "score");
		//echo self::showRanklist();
	}

	public function insertRanklist( $guid, $name, $sex, $score)
	{
		if (false == self::isOpened()) {
			return response::format(ERROR_SEAVENTURECLOSE, "SEA VENTURE CLOSE");
		}

		$record = array(
							'rank' => 0, 
							'guid' => $guid,
							'name' => $name,
							'sex'  => $sex,
							'score'=> $score);

		$ranklistCount = count(self::$m_arrRanklist);

		$min = self::$m_arrRanklist[$ranklistCount - 1];
		//var_dump($min);

		$bFound = false;
		for ($i=0; $i < $ranklistCount; $i++) { 
			$record = &self::$m_arrRanklist[$i];
			if ($guid == $record['guid']) {
				$record['score'] = $score > $record['score'] ? $score:$record['score'];
				$bFound = true;
			}
		}


		if ($bFound == false && $min['score'] < $record['score']) {
			self::$m_arrRanklist[] = $record;	
		}

		self::ranklistSort();
		self::$m_arrRanklist = updateRankIndex(self::$m_arrRanklist);

		return response::format(ERROR_OK, "SEA VENTURE CLOSE");
	}

	public function saveRanklist()
	{
		$db = new db_mysql();
		$szRanlist = "";

		$config = $GLOBALS['g_arrSeaVentureMgrConfig'];
		$saveDBRanklimit = $config["loadlistCount"];

		$ranklistCount = count(self::$m_arrRanklist);
		$saveDBRanklimit = ($saveDBRanklimit < $ranklistCount) ? $saveDBRanklimit:$ranklistCount;

		for ($i=0; $i <$saveDBRanklimit; $i++) { 
			$record = self::$m_arrRanklist[$i];
			$rank = $record['rank'];
			$guid = $record['guid'];
			$name = $record['name'];
			$sex  = $record['sex'];
			$score = $record['score'];

 			$szRecord = "($rank,$guid,\"$name\",$sex,$score)";
 			if ( $i < $saveDBRanklimit-1 ) {
 				$szRecord = $szRecord.",";
 			}

 			$szRanlist = $szRanlist.$szRecord;
		}

		$result = $db->db_query_select(cleanSeaVentureRank);
		/*
		if (isset($result)) {
			var_dump($result);
		}*/

		//echo saveSeaVentureRank.$szRanlist.";"."\n";
		$result = $db->db_query_insert(saveSeaVentureRank.$szRanlist.";");
		return $result;
	}

	public function isOpened()
	{
		$config = $GLOBALS['g_arrSeaVentureMgrConfig'];
		$beginTime = 0;
		$endTime   = 0;
		
		if (true == $config["defaultSetting"]) {
			$beginTime = getThisWeekdayTimestamp(1, 0);
			$endTime   = getThisWeekdayTimestamp(7, 22);
		}

		$current = time();
		if ($current < $beginTime || $current > $endTime) {
			return false;
		}
		else
		{
			return true;
		}
	}

	public function onShow()
	{
		$config = $GLOBALS['g_arrSeaVentureMgrConfig'];
		$beginTime = 0;
		$endTime   = 0;

		if (true == $config["defaultSetting"]) {
			$beginTime = getThisWeekdayTimestamp(1, 0);
			$endTime   = getThisWeekdayTimestamp(7, 23, 30);//strtotime('+1 week last monday');
		}

		$current = time();
		if ($current < $beginTime || $current > $endTime) {
			return false;
		}
		else
		{
			return true;
		}
	}

	//crontab execute Sun 22:10 check
	public function recordRanklist()
	{
		//debug set false condition
		if (true == self::isOpened()) {
			return false;	
		}

		$config = $GLOBALS['g_arrSeaVentureMgrConfig'];
		if (true == $config["defaultSetting"]) {
    		$date = date("Y_m_d", getThisWeekdayTimestamp(1, 0));	
		}
		$recordTableName = "t_seaventure_rank_".$date;

		$db = new db_mysql();
		$result = $db->db_query_select("show tables like \"$recordTableName\"");

		//var_dump($result);
		if ($result->num_rows == 1) {
			//this period seaventure already record;
			return false;
		}

		$sql = "CREATE TABLE `$recordTableName` select * from t_seaventure_rank;";
		$result = $db->db_query_select($sql);

		logger::write("recordRanklist write db:".$result, __CLASS__);

		$saveDBRanklimit = count(self::$m_arrRanklist);

		for ($i=0; $i < $saveDBRanklimit; $i++) { 
			$record = self::$m_arrRanklist[$i];
			$rank = $record['rank'];
			$guid = $record['guid'];
			$name = $record['name'];
			$sex  = $record['sex'];
			$score = $record['score'];
			$szRecord = "$rank \t $guid \t $name \t $sex \t $score";

			logger::write("recordRanklist:".$szRecord, __CLASS__);
		}

		//return true;
	}

	//crontab execute Sun 23:50 check
	public function cleanRanklist()
	{
		if (true == self::isOpened() || true == self::onShow()) {
			return false;
		}

		$db = new db_mysql();
		$result = $db->db_query_select(cleanSeaVentureRank);
	}
}

?>