<?php
#phpinfo();
	//echo "hello world";
	$str_json = '{	
					"status":0,
					"receipt":{
						"orderid":19284,
						"in_app":[
							{
								"quality":111,
								"count":1244,
								"str":"ddd"
							},
						],
						"odd":9098
					},
					"uid":12314
				}';
	$arr = json_decode($str_json,true);
	if (isset($arr)) {
		echo "ddd";
		var_dump($arr);
	}else
	{
		echo "arr is null";
	}
	//echo $arr->status;
	//echo $arr->receipt;
	/*"receipt":{
						"orderid":19284,
						"in_app":"ddd"
						"odd":9098,
					},*/
?>
