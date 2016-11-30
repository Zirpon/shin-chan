<?php

	include dirname(__FILE__).'/interface_define.php';
	include dirname(__FILE__).'/utils/handler_define.php';

	$params = $_REQUEST;

	//$json_obj = json_decode($params["packet"]);


	if ($params["handler"] === "account" ) {
		include  account;
		$account = new account();

		$arr = array("champon6", 1);

		$function = $GLOBALS["handlers"][$params["handler"]][2004];
		$account->process($function, $arr);
		
	}
?>