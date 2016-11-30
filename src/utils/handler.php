<?php

class handler
{
	public function process($funcion, $packet)
	{
		return call_user_func_array(array($this, $funcion), $packet);
	}
}

?>