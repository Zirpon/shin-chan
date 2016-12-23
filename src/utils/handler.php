<?php

	require_once dirname(__FILE__).'/error_code.php';
	require_once dirname(__FILE__).'/../db/db_mysql.php';
	require_once dirname(__FILE__).'/../log/logger.php';
	require_once dirname(__FILE__).'/elapsedTime.php';

class handler
{
	public function process($function, $packet)
	{
		return call_user_func_array(array($this, $function), $packet);
	}
}

?>