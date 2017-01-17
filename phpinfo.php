<?php

	require_once dirname(__FILE__).'/src/db/db_mysql.php';
	require_once dirname(__FILE__).'/src/log/logger.php';
	require_once dirname(__FILE__).'/src/message/message.php';
	require_once dirname(__FILE__).'/src/friend/friend.php';
	require_once dirname(__FILE__).'/src/activity/chapterMgr.php';
/*
	$db = new db_mysql();
	$param = array("aaaaa");
	$result = $db->db_proc("proc_get_recommendFriends", $param);
	var_dump($result);
	$row = $result->fetch_assoc();
	var_dump($row);
	$row = $result->fetch_assoc();
	var_dump($row);
	echo chapterMgr::db_init();
header('content-type:text/html;charset=utf-8');
ini_set('display_errors',0);
ini_set('date.timezone','PRC');
error_reporting(-1);
ini_set('log_errors',1);
ini_set('error_log','G:\error\adminLogin.log');
ini_set('ignore_repeated_errors','on');
ini_set('ignore_repeated_source','on');


$to = "735037139@qq.com";//收件人  
$subject = "Test";//邮件主题  
$message = "This is a test mail!";//邮件正文  
//ini_set('SMTP','smtp.163.com');//发件SMTP服务器  
//ini_set('smtp_port',25);//发件SMTP服务器端口  
//ini_set('sendmail_from',"admin@163.com");//发件人邮箱  
mail($to,$subject,$message);  
error_log("读发送打",1,"735037139@qq.com");
*/
	echo "hello world";
	logger::error("handleFatalPhpError:"."congra you got error", "php_error");

?>
