<?php

	require_once dirname(__FILE__).'/../activity/seaVentureMgr.php';
	require_once dirname(__FILE__).'/../player/seaVenture.php';

	seaVenture::cleanVenture();
	seaVentureMgr::recordRanklist();

?>