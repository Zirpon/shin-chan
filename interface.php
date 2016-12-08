<?php

	include dirname(__FILE__).'/interface_define.php';
	include dirname(__FILE__).'/src/utils/handler_define.php';

	$params = $_GET;
	$data	= $_POST;

	//echo json_encode($params);
	//$json_data =  json_encode($data);
	if (!isset($params['handler']) || !isset($params['findex'])) {
		echo "request error".json_encode($params)."\n";
		return;
	}

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
	else if ($params["handler"] === "mail" ) {
		include  mail;
		$handler = new mail();		
	}
	else
	{
		echo "request error".json_encode($params)."\n";
		return;
	}


	$function = $GLOBALS["handlers"][$params["handler"]][$params["findex"]];

	$result = $handler->process($function, $data);
	echo $result."\n";
?>