<?php

require_once dirname(__FILE__)."/../log/logger.php";

/**
*  caculate program running time 
*/
class elapsedTime
{
	private  $start_time ;
	private  $end_time   ;

	private  $mFunName ;

	function __construct($funName)
	{
		list($msec, $sec) = explode(" ", microtime());
		$this->start_time = (float)$sec + (float)$msec;
		$this->mFunName = $funName;
	}

	function __destruct()
	{
		list($msec, $sec) = explode(" ", microtime());
		$this->end_time = ((float)$sec + (float)$msec);

		$cost_time = $this->end_time - $this->start_time;
		logger::write($this->mFunName." cost time ".$cost_time, __CLASS__);
		//echo "hello world";
	}

}

?>