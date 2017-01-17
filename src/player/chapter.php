<?php

	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../friend/friend.php';
	require_once dirname(__FILE__).'/../utils/utils.php';
	require_once dirname(__FILE__).'/../activity/chapterMgr.php';

/**
* player class
*/
class chapter extends handler
{
	
	public function __construct()
	{

	}

	protected $m_arrChapters;

	public function loadChapters( $guid )
	{
		$this->m_arrChapters = array();
		$db = new db_mysql();
		$result = $db->db_query_select(loadChapters.$guid);
		//var_dump($result);

		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			$sChapters = $row["mflag"];
			//echo "\nddd".$sChapters."ddd\n";
			if (!empty($sChapters)) {
				self::initChapterRecord($sChapters);
				return 1;
			}
			return 0;
		}

		return -1;
	}

	public function saveChapters( $guid )
	{
		$db = new db_mysql();
		$conn = $db->db_getConn();
        $stmt = $conn->prepare(saveChapters);

        if (!is_object($stmt)) {
   			logger::error("saveChapters error:".saveChapters." ".$db->get_getConn()->error, __CLASS__);
			return response::format(ERROR_MYSQL, "db sql error");
		}

		$strChapter = self::patchChapterRecord();
        //var_dump($stmt);
        $stmt->bind_param($GLOBALS['sqlmould']["saveChapters"], $strChapter, $guid);
        $stmt->execute();
        $stmt->close();

        logger::write("saveChapters success:".$guid."|".$strChapter, __CLASS__);

		return response::format(ERROR_OK, "send msg ok");
	}
	
	public function patchChapterRecord()
	{
		$arrPatch = array();

		$len = count($this->m_arrChapters);
		//var_dump($this->m_arrChapters);

		foreach ($this->m_arrChapters as $key => $value) {

			$strRecord = self::formatChapterRecord($key, $value["star"], $value['point'], $value['firstFinishtime']);

			$arrPatch[] = $strRecord;	
		}

		return implode("|", $arrPatch);
	}

	public function initChapterRecord( $str )
	{
		$arrStrChapter = explode("|", $str);
		$arrLen = count($arrStrChapter);
		for ($i=0; $i < $arrLen; $i++) {
			$strChapterRecord = $arrStrChapter[$i];
			$arrChapterRecord = self::parseChapterRecord($strChapterRecord);

			$index = intval($arrChapterRecord[0]);
			$star = intval($arrChapterRecord[1]);
			$point = intval($arrChapterRecord[2]);
			$firstFinishtime = intval($arrChapterRecord[3]);

			$this->m_arrChapters[$index] = array(
				"star"				=> $star,
				"point" 			=> $point,
				"firstFinishtime"	=> $firstFinishtime,
				);
		}
	}

	public function formatChapterRecord($chapter, $star, $point, $firstFinishtime)
	{
		return $chapter."-".$star."-".$point."-".$firstFinishtime;
	}

	public function parseChapterRecord( $str )
	{
		$result = explode("-", $str);
		//var_dump($result);
		return $result;
	}

	public function updateChapter($guid, $chapter, $star, $point)
	{
		if ($chapter <= 0) {
			return response::format(ERROR_PARAMS, "chapter error:$chapter");
		}

		$res = self::loadChapters($guid);

		if ($res < 0) {
			return response::format(ERROR_PARAMS, "guid error:$guid");
		}

		$updateStar = $star;
		$updatePoint = $point;
		$firstFinishtime = time();
		if (isset($this->m_arrChapters[$chapter])) {

			$arrChapterResult = $this->m_arrChapters[$chapter];

			$updateStar = ($star > $arrChapterResult["star"])? 
								$star : $arrChapterResult["star"];

			$updatePoint = ($point > $arrChapterResult["point"])? 
								$point : $arrChapterResult["point"];

			$firstFinishtime = ($point > $arrChapterResult["point"])? 
								$firstFinishtime : $arrChapterResult["firstFinishtime"];
		}
		
		chapterMgr::updateRanklist($guid, $chapter, $updateStar, $updatePoint, $firstFinishtime);

		$this->m_arrChapters[$chapter] = array(
				"star"				=> $updateStar,
				"point" 			=> $updatePoint,
				"firstFinishtime"	=> $firstFinishtime,
				);
		self::saveChapters($guid);

		return response::format(ERROR_OK, "chapter update ok");
	}

	public function getMaxChapterLevel($guid)
	{
		self::loadChapters($guid);
		//var_dump($this->m_arrChapters);
		$maxLevel = 0;
		$len = count($this->m_arrChapters);
		foreach ($this->m_arrChapters as $key => $value) {
			$maxLevel = ($maxLevel > $key) ? $maxLevel : $key;
		}

		return $maxLevel;
	}

	public function getTotalStar($guid)
	{
		self::loadChapters($guid);

		$totalStar = 0;
		foreach ($this->m_arrChapters as $value) {
			$totalStar += $value["star"];
		}

		return $totalStar;
	}

	public function getChapterResult($guid, $chapter)
	{
		if ($chapter <= 0) {
			return response::format(ERROR_PARAMS, "chapter error:$chapter");
		}

		self::loadChapters($guid);

		if (isset($this->m_arrChapters[$chapter])) {

			$arrChapterResult = $this->m_arrChapters[$chapter];
			return $arrChapterResult;
		}

		return NULL;
	}

	//every chapter point 
	public function getfriendRanklist($guid, $chapter)
	{
		$json_friendlist = friend::getFriendlist($guid);
		$arr_json_friendlist = json_decode($json_friendlist, true);
		$arr_friendlist = $arr_json_friendlist['result'];

		//echo json_encode($arr_friendlist);
		$db = new db_mysql();
		$friendRanklist = array();

		$arrLen = count($arr_friendlist);
		for ($i=0; $i < $arrLen; $i++) { 

			$friendRecord = &$arr_friendlist[$i];

			$friendid = intval($friendRecord['guid']);
			$arrChapterResult = self::getChapterResult($friendid, $chapter);

			$score = intval($arrChapterResult["point"]);
			$friendRecord['rank']  = 0;
			$friendRecord['score'] = $score;
			// /echo json_encode($friendRecord)."\n";
			$friendRanklist[] = $friendRecord;
		}

		$friendRanklist = my_sort($friendRanklist, "score");
		//echo json_encode($friendRanklist);
		$friendRanklist = updateRankIndex($friendRanklist);

		return response::format(ERROR_OK, $friendRanklist);
	}

}
?>