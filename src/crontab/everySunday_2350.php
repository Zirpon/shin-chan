<?php

	require_once dirname(__FILE__).'/../activity/seaVentureMgr.php';
	require_once dirname(__FILE__).'/../message/message.php';

	seaVentureMgr::cleanRanklist();
	message::cleanMsg();

?>