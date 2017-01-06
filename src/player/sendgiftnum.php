<?php

	require_once dirname(__FILE__).'/../utils/handler.php';
	require_once dirname(__FILE__).'/../utils/utils.php';

	define("maxSendGiftNum", 20);
/**
* 
*/
class sendgiftnum extends handler
{
	
	function __construct()
	{
		# code...
	}

	public function load($guid)
	{
		$db = new db_mysql();
		$result = $db->db_query_select("select sendgiftnum form t_char where guid = $guid;");
		if (is_null($result)) {
			return -1;
		}

		$row = $result->fetch_assoc();
		$num = $row['sendgiftnum'];
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
		$result = $db->db_query_select("update t_char set sendgiftnum = $num where guid = $guid;");
		return $result;
	}

	public function clean()
	{
		$db = new db_mysql();
		$result = $db->db_query_select("update t_char set sendgiftnum = 0;");
		return $result;
	}

	public function bIsOver($guid)
	{
		$num = self::load($guid);
		if (maxSendGiftNum <= $num) {
			return true;
		}

		return false;
	}
}

?>