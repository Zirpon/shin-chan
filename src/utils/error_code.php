<?php
	define("ERROR_OK",		0);
	define("ERROR_PARAMS",	-1);
	define("ERROR_MYSQL",	-2);
	define("ERROR_TRUE",	 TRUE);
	define("ERROR_FALSE",	 FALSE);
	define("ERROR_EMPTY",	0);

	define("ERROR_SEAVENTURENOTONSHOW", -1);
	define("ERROR_SEAVENTURECLOSE", -1);
	define("ERROR_ISREQUESTFRIENDGIFT", -1);

	class response
	{

		public function format($type, $result = "")
		{
			$res = array(
				"errCode" => $type,
				"result"  => $result,
			);

			return json_encode($res);
		}
	}
?>