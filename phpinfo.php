<?php

	require_once dirname(__FILE__).'/src/db/db_mysql.php';
	require_once dirname(__FILE__).'/src/log/logger.php';

	$db = new db_mysql();
	$param = array("aaaaa");
	$result = $db->db_proc("proc_get_recommendFriends", $param);
	var_dump($result);
	$row = $result->fetch_assoc();
	var_dump($row);
	$row = $result->fetch_assoc();
	var_dump($row);

?>