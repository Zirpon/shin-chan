<?php

	include dirname(__FILE__).'/interface_define.php';
	include dirname(__FILE__).'/src/log/logger.php';
	include dirname(__FILE__).'/src/utils/handler_define.php';

	$params = $_GET;
	$data	= $_POST;
	//$dddd 	= $_REQUEST;
	//var_dump($dddd);

  	//logger::write("dd:".json_encode($dddd), "account");

	if (!isset($params['handler']) || !isset($params['findex']) || !isset($data['json_data'])) {
		logger::write("request error".json_encode($params)." ".json_encode($data)."\n", "interface");
		echo "interface request error";
		return;
	}

	$json_data = $data['json_data'];
//	echo "json:".$json_data."\n";
//	echo "encode:".urldecode($json_data)."\n";

	$packet = json_decode(urldecode($json_data), true);
	logger::write("receive packet:".$json_data, "interface");
	if (is_null($packet)) {
		logger::error("packet parse error", "interface");
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

	$result = $handler->process($function, $packet);
	echo $result."\n";
?>