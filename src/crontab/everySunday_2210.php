<?php

	require_once dirname(__FILE__).'/../activity/seaVentureMgr.php';
	require_once dirname(__FILE__).'/../player/seaVenture.php';

	seaVenture::cleanVenture();
	seaVentureMgr::recordRanklist();
	logger::write("crontab run ".__FILE__."", "crontab");
?>