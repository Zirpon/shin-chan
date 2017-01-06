<?php

	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../utils/utils.php';

	define("maxGotGiftNum", 20);
/**
* 
*/
class gotgiftnum extends handler
{
	public function load($guid)
	{
		$db = new db_mysql();
		$result = $db->db_query_select("select gotgiftnum form t_char where guid = $guid;");
		if (is_null($result)) {
			return -1;
		}

		$row = $result->fetch_assoc();
		$num = $row['gotgiftnum'];
		return $num;
	}

	public function update($guid, $count)
	{
		if ($count <= 0) {
			return -1;
		}

		$num = self::load($guid);
		$num += $count;
		$db = new db_mysql();
		$result = $db->db_query_select("update t_char set gotgiftnum = $num where guid = $guid;");
		return $result;
	}

	public function clean()
	{
		$db = new db_mysql();
		$result = $db->db_query_select("update t_char set gotgiftnum = 0;");
		return $result;
	}

	public function bIsOver($guid)
	{
		$num = self::load($guid);
		if (maxGotGiftNum <= $num) {
			return true;
		}

		return false;
	}
}

?>