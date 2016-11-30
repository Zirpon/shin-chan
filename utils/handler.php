<?php

class handler
{
	public function process($funcion, $packet)
	{
		call_user_func_array(array($this, $funcion), $packet);
	}
}

?>