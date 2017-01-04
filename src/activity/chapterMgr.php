<?php
	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../utils/utils.php';
	require_once dirname(__FILE__).'/chapterMgr.config';

/**
* 
*/
class chapterMgr extends handler
{
	
	function __construct()
	{
		# code...
	}

	//add chapter should be execute this init function 
	public function db_init()
	{
		$arrChapterMgrConfig = $GLOBALS['g_arrChapterMgrConfig'];
		$maxChapterLevel 	= $arrChapterMgrConfig['maxChapterLevel'];

		for ($i=1; $i <= $maxChapterLevel ; $i++) { 
			
			if ( true == self::isRanklistTableExists($i) ) {
				continue;
			}

			self::createTable($i);
		}
	}

	public function isRanklistTableExists( $chapterLevel )
	{

		$tableName = self::getRanklistTableName($chapterLevel);

		$db = new db_mysql();
		$result = $db->db_query_select("show tables like \"$tableName\"");

		if ($result->num_rows == 1) {
			echo "\n$tableName already exists\n";
			return true;
		}

		return false;
	}

	public function createTable( $chapterLevel )
	{

		$tableName = self::getRanklistTableName($chapterLevel);

		$sql = "CREATE TABLE `$tableName` (
						`rank` int(11) NOT NULL,
  						`guid` int(11) NOT NULL,
 						`name` varchar(50) NOT NULL,
						`sex` int(11) NOT NULL,
  						`star` int(11) NOT NULL,
  						`score` int(11) NOT NULL,
  						`achieveTime` int(11) NOT NULL
					) ENGINE=InnoDB DEFAULT CHARSET=latin1;";

		$db = new db_mysql();

		$result = $db->db_query_select($sql);

		if ($result == true) {
			echo "create table $tableName success\n";
		}

		return $result;
	}

	public function getRanklistTableName($chapterLevel)
	{
		$arrChapterMgrConfig = $GLOBALS['g_arrChapterMgrConfig'];

		$tablePrefix 		= $arrChapterMgrConfig['tablePrefix'];
		$maxChapterLevel 	= $arrChapterMgrConfig['maxChapterLevel'];

		$chapterLevel = sprintf("%03d", $chapterLevel);   
		
		$tableName = $tablePrefix.'_Level'.$chapterLevel;

		return $tableName;
	}

	public function insertRanklist($guid, $chapter, $star, $point, $achieveTime)
	{
		$db = new db_mysql();

		$tableName = self::getRanklistTableName($chapter);

		$result = $db->db_query_select("select name,sex from t_char where guid = $guid;");
		
		if ($result->num_rows < 1 ) {
			return false;
		}

		$row = $result->fetch_assoc();
		$name = $row['name'];
		$sex  = $row['sex'];

		$sql = "insert into $tableName (guid,name,sex,star,score,achieveTime) value 
				($guid, \"$name\", $sex, $star, $point, $achieveTime);";
		//echo $sql;

		$result = $db->db_query_select($sql);
	}

	public function updateRanklist($guid, $chapter, $star, $point, $achieveTime)
	{
		$db = new db_mysql();

		$tableName = self::getRanklistTableName($chapter);

		$sql = "update $tableName set star = $star, score = $point, achieveTime = $achieveTime where guid = $guid;";

		$result = $db->db_query_select($sql);
	}

	public function getRanklist($chapter)
	{
		$db = new db_mysql();

		$tableName = self::getRanklistTableName($chapter);

		$sql = "select * from $tableName order by score desc, achieveTime asc;";

		$result = $db->db_query_select($sql);
		if (is_null($result)) {
			$arrChapterMgrConfig = $GLOBALS['g_arrChapterMgrConfig'];
			$maxChapterLevel 	= $arrChapterMgrConfig['maxChapterLevel'];

			return response::format(ERROR_PARAMS, "chapter error:$chapter > $maxChapterLevel");
		}
		$ranklist = array();

		while ($rows = $result->fetch_assoc()) {
			//echo json_encode($rows)."\n";
			$ranklist[] = $rows;
		}

		$ranklist = my_sort($ranklist, "score");
		//echo json_encode($ranklist)."\n";
		$ranklist = updateRankIndex($ranklist);

		return response::format(ERROR_OK, $ranklist);
	}

}

?>