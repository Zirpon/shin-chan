<?php

	include dirname(__FILE__).'/interface_define.php';
	include dirname(__FILE__).'/src/log/logger.php';
	include dirname(__FILE__).'/src/utils/handler_define.php';
	include dirname(__FILE__).'/src/utils/error_code.php';

	$params = $_GET;
	$data	= $_POST;
	//$dddd 	= $_REQUEST;
	//var_dump($dddd);

  	logger::write("request:".json_encode($params)."\n"."data:".print_r($data, true), "interface");

	if (!isset($params['handler']) || !isset($params['findex'])) 
	{
		logger::error("request error".json_encode($params)."\n".print_r($data, true), "interface");
		return response::format(ERROR_PARAMS, "interface request error");
	}

	$packet = array();
	if (isset($data['json_data'])) {
		$json_data = $data['json_data'];
	//	echo "json:".$json_data."\n";
	//	echo "encode:".urldecode($json_data)."\n";
		//$json_data = addslashes($json_data);
		//$json_data = ltrim($json_data, "\"");
		//$json_data = rtrim($json_data, "\"");

		$packet = json_decode(urldecode($json_data), true);
		if (is_null($packet)) {
			logger::error("packet parse error", "interface");
			return response::format(ERROR_PARAMS, "packet parse error");
		}
	}

  	logger::write("request packet:".print_r($packet, true), "interface");


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
	else if ($params["handler"] === "chapter" ) {
		include  chapter;
		$handler = new chapter();
	}
	else
	{
		logger::error("request handler error".json_encode($params), "interface");
		return response::format(ERROR_PARAMS, "handler error");
	}


	$function = $GLOBALS["handlers"][$params["handler"]][$params["findex"]];

	$result = $handler->process($function, $packet);
	echo $result."\n";
?>