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
				self::getChapters($sChapters);
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

		$strChapter = self::formatChapters();
        //var_dump($stmt);
        $stmt->bind_param($GLOBALS['sqlmould']["saveChapters"], $strChapter, $guid);
        $stmt->execute();
        $stmt->close();

        logger::write("saveChapters success:".$guid."|".$strChapter, __CLASS__);

		return response::format(ERROR_OK, "send msg ok");
	}

	public function formatChapters()
	{
		return implode("|", $this->m_arrChapters);
	}

	public function getChapters( $str )
	{
		$this->m_arrChapters = explode("|", $str);
	}

	public function formatChapter($star, $point, $firstFinishtime)
	{
		return $star."-".$point."-".$firstFinishtime;
	}

	public function formatChapterResult( $str )
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

		$maxFinishChapter = count($this->m_arrChapters);

		if ( ($maxFinishChapter+1) < $chapter ) {
			return response::format(ERROR_PARAMS, "chapter error:chapter $chapter > maxFinishChapter $maxFinishChapter");
		}

		$updateStar = $star;
		$updatePoint = $point;
		$firstFinishtime = time();
		if (isset($this->m_arrChapters[$chapter-1])) {

			$szChapterResult = $this->m_arrChapters[$chapter-1];

			$arrChapterResult = self::formatChapterResult($szChapterResult);
			$updateStar = ($star > intval($arrChapterResult[0]))? $star : $arrChapterResult[0];
			$updatePoint = ($point > intval($arrChapterResult[1]))? $point : $arrChapterResult[1];
			$firstFinishtime = ($point > intval($arrChapterResult[1]))? $firstFinishtime : $arrChapterResult[2];

			chapterMgr::updateRanklist($guid, $chapter, $updateStar, $updatePoint, $firstFinishtime);
		}
		else
		{
			chapterMgr::insertRanklist($guid, $chapter, $updateStar, $updatePoint, $firstFinishtime);
		}
		
		$this->m_arrChapters[$chapter-1] = self::formatChapter($updateStar, $updatePoint, $firstFinishtime);	
		
		self::saveChapters($guid);

		return response::format(ERROR_OK, "chapter update ok");
	}

	public function getMaxChapterLevel($guid)
	{
		self::loadChapters($guid);
		//var_dump($this->m_arrChapters);

		if ( count($this->m_arrChapters) == 1 && empty($this->m_arrChapters[0]) ){
			return 0;
		}

		return count($this->m_arrChapters);
	}

	public function getTotalStar($guid)
	{
		self::loadChapters($guid);

		$totalStar = 0;
		foreach ($this->m_arrChapters as $value) {
			$arrChapterResult = self::formatChapterResult($value);
			$totalStar += $arrChapterResult[0];
		}

		return $totalStar;
	}

	public function getChapterResult($guid, $chapter)
	{
		if ($chapter <= 0) {
			return response::format(ERROR_PARAMS, "chapter error:$chapter");
		}

		self::loadChapters($guid);

		if (isset($this->m_arrChapters[$chapter-1])) {

			$szChapterResult = $this->m_arrChapters[$chapter-1];

			$arrChapterResult = self::formatChapterResult($szChapterResult);
			return $arrChapterResult;
		}

		return NULL;

	}

	//every chapter point 
	public function getfriendRanklist($guid, $chapter)
	{
		$json_friendlist = friend::getFriendlist($guid);
		$arr_json_friendlist = json_decode($json_friendlist, true);
		$arr_json_friendlist_result = $arr_json_friendlist['result'];

		$arr_friendlist = json_decode($arr_json_friendlist_result, true);
		//echo json_encode($arr_friendlist);
		$db = new db_mysql();
		$friendRanklist = array();
		foreach ($arr_friendlist as $value) {
			$friendid = intval($value['friendid']);
			$arrChapterResult = self::getChapterResult($friendid, $chapter);

			$score = intval($arrChapterResult[1]);
			$friendRecord = array("rank"=>0,"friendid"=>$friendid,"score"=>$score);
			$friendRanklist[] = $friendRecord;
		}

		$arrMyChapterResult = self::getChapterResult($guid, $chapter);
		if (!is_null($arrMyChapterResult)) {
			$score = intval($arrMyChapterResult[1]);
			$myRecord = array("rank"=>0,"friendid"=>$guid,"score"=>$score);
			$friendRanklist[] = $myRecord;
		}

		$friendRanklist = my_sort($friendRanklist, "score");
		//echo json_encode($friendRanklist);
		$friendRanklist = updateRankIndex($friendRanklist);

		return response::format(ERROR_OK, json_encode($friendRanklist));
	}


}
?>