<?php
require_once dirname(__FILE__)."/logger_define.php";

Class logger
{
	//define("taobao", LOGGERPATH."taobao_debug.log");
	//define("jingdong", LOGGERPATH."taobao_debug.log");

	public function write( $log_str, $log_type )
	{
		if ($GLOBALS['LOGGER_SWITCH'] === FALSE) {
			return;	
		}

		$loggerType = $GLOBALS['LOGGER_TYPE'];
		var_dump($loggerType);

		if ( !is_null($loggerType[$log_type]) ) 
		{
			error_log(date("Y-m-d H:i:s [normal]").$log_str."\n", 3, $loggerType[$log_type] );
		}
	}

	public function debug( $log_str, $log_type)
	{
		if ($GLOBALS['LOGGER_DEBUG_SWITCH'] === FALSE) {
			return;	
		}

		$loggerType = $GLOBALS['LOGGER_TYPE'];
		var_dump($loggerType);

		if ( !is_null($loggerType[$log_type]) ) 
		{
			error_log(date("Y-m-d H:i:s [debug]").$log_str."\n", 3, $loggerType[$log_type] );
		}
	}

	public function error( $log_str, $log_type)
	{
		if ($GLOBALS['LOGGER_SWITCH'] === FALSE) {
			return;	
		}

		$loggerType = $GLOBALS['LOGGER_TYPE'];
		var_dump($loggerType);

		if ( !is_null($loggerType[$log_type]) ) 
		{
			error_log(date("Y-m-d H:i:s [error]").$log_str."\n", 3, $loggerType[$log_type] );
		}
	}
}

?>