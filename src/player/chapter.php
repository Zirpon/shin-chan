<?php

	require_once dirname(__FILE__).'/../utils/handler.php';
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
		$db = new db_mysql();
		$result = $db->db_query_select(loadChapters.$guid);
		if (isset($result)) {
			$row = $result->fetch_assoc();
			$sChapters = $row["mflag"];
			self::getChapters($sChapters);

			return TRUE;
		}

		return FALSE;
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

	public function getChapterResult( $str )
	{
		$result = explode("-", $str);
		return $result;
	}

	public function updateChapter($guid, $chapter, $star, $point, $firstFinishtime)
	{
		if ($chapter <= 0) {
			return response::format(ERROR_PARAMS, "chapter error:$chapter");
		}

		self::loadChapters($guid);


		if (isset($this->m_arrChapters[$chapter-1])) {

			$szChapterResult = $this->m_arrChapters[$chapter-1];

			$arrChapterResult = self::getChapterResult($szChapterResult);
			$arrChapterResult[0] = ($star > intval($arrChapterResult[0]))? $star : $arrChapterResult[0];
			$arrChapterResult[1] = ($point > intval($arrChapterResult[1]))? $point : $arrChapterResult[1];

			$this->m_arrChapters[$chapter-1] = self::formatChapter($arrChapterResult[0], $arrChapterResult[1], $arrChapterResult[2]);
		}
		else
		{
			$this->m_arrChapters[$chapter-1] = self::formatChapter($star, $point, $firstFinishtime);	
		}

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
			$arrChapterResult = self::getChapterResult($value);
			$totalStar += $arrChapterResult[0];
		}

		return $totalStar;
	}
}
?>