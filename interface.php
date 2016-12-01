<?php

	include dirname(__FILE__).'/interface_define.php';
	include dirname(__FILE__).'/src/utils/handler_define.php';

	$params = $_REQUEST;

	//$json_obj = json_decode($params["packet"]);

	//$arr = array(1000000004, 1000000005, 5, "hello world");
	$arr = array(1000000005, 1000000004);
	$handler = NULL;

	if ($params["handler"] === "account" ) {
		include  account;
		$handler = new account();		
	}
	else if ($params["handler"] === "message" ) {
		include  message;
		$handler = new message();		
	}
	else if ($params["handler"] === "friend" ) {
		include  friend;
		$handler = new friend();		
	}
	else
	{
		echo "handler error";
	}


	$function = $GLOBALS["handlers"][$params["handler"]][$params["findex"]];

	$result = $handler->process($function, $arr);
	echo $result;
?>