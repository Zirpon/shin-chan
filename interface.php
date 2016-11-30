<?php

	include dirname(__FILE__).'/interface_define.php';
	include dirname(__FILE__).'/src/utils/handler_define.php';

	$params = $_REQUEST;

	//$json_obj = json_decode($params["packet"]);

	$arr = array("champon9", "", 2);
	$handler = NULL;

	if ($params["handler"] === "account" ) {
		include  account;
		$handler = new account();		
	}

	$function = $GLOBALS["handlers"][$params["handler"]][$params["findex"]];

	$result = $handler->process($function, $arr);
	echo $result;
?>