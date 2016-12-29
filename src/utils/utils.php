<?php

    function my_sort( $arrays, $sort_key, $sort_order=SORT_ASC, $sort_type=SORT_NUMERIC ){   
        //echo "-----------------------------------------------------------\n";

        //echo json_encode($arrays);
        
        if(is_array($arrays)){

			$len = count($arrays);

			for($i=1; $i< $len; $i++)
			{ 
				for($k=0; $k<$len-$i; $k++)
				{
					if ( is_array($arrays[$k+1]) && is_array($arrays[$k])) {
	        			$value = $arrays[$k+1][$sort_key];
	        			$prevalue = $arrays[$k][$sort_key];

	        			if ($value > $prevalue) {
	        				$tmp = $arrays[$k+1];
	        				$arrays[$k+1] = $arrays[$k];
	        				$arrays[$k] = $tmp;

	        				//echo "\nswap $k\n";
	        			}
	        		}
				}
			}

        } else {   
            return false;   
        }
        //echo "-----------------------------------------------------------\n";
        //echo json_encode($arrays);
        //echo "-----------------------------------------------------------\n";

        return $arrays;   
    }

    function updateRankIndex($ranklist)
    {

        for ($i=0; $i < count($ranklist); $i++) { 
            $ranklist[$i]["rank"] = $i + 1;
            //echo json_encode($ranklist[$i])."\n";
        }

        return $ranklist;
    }


    function getThisWeekdayTimestamp($weekday, $hour = 0, $min = 0, $sec = 0)
    {
    	if ($weekday < 0 || $weekday > 7) {
    		return -1;
    	}
    	$date = date("Ymd",(time()-((date("w")==0?7:date("w"))-$weekday)*24*3600));	
    	//echo $date;

    	$timeOffset = $hour * 3600 + $min * 60 + $sec;
    	$time = strtotime($date) + $timeOffset;

    	return $time;
    }


?>