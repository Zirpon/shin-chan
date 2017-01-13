<?php
	require_once dirname(__FILE__).'/../friend/friend.php';
	require_once dirname(__FILE__).'/../player/gotgiftnum.php';
	require_once dirname(__FILE__).'/../player/sendgiftnum.php';

	friend::cleanRequestGiftStatus();
	friend::cleanSendGiftStatus();
	gotgiftnum::clean();
	sendgiftnum::clean();

	logger::write("crontab run ".__FILE__."", "crontab");
?>