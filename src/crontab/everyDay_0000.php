<?php
	require_once dirname(__FILE__).'/../friend/friend.php';
	require_once dirname(__FILE__).'/../player/gotgiftnum.php';
	require_once dirname(__FILE__).'/../player/sendgiftnum.php';

	friend::cleanRequestGiftStatus();
	gotgiftnum::clean();
	sendgiftnum::clean();
?>