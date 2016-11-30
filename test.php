<?php
    require_once dirname(__FILE__).'/db/db_mysql.php';
    require_once dirname(__FILE__).'/log/logger.php';
    //////////////////////////////////
    $db = new db_mysql("testdb");

    ////////////////////////////////////
    // class proc
    $arr = array("John", 100 );
    $result =  $db->db_proc("proc_out_guest_info", $arr);

    if ($result->num_rows > 0) 
    {
    // 输出每行数据     
    while($row = $result->fetch_assoc()) {
       // echo "<br> id: ". $row["id"]. " - Name: ". $row["firstname"]. " " . $row["lastname"];
    }
    } else {
        echo "0 个结果";
    }
    //$result->free();
    $result->close();
    //mysqli_free_result($result);
    echo "<br>";


    ////////////////////////////////////////
    //class insert
    $sql = "INSERT INTO t_guest (firstname, lastname, email) VALUES ('Julie', 'Dooley', 'julie@example.com')";
    if ($db->db_getConn()->next_result()) 
    {
        $db->db_query_insert($sql);
    }
    

    //////////////////////////////////////////
    //class select
    $sql = "select * from t_guest;";
    $result = $db->db_query_select($sql);
    /*
    if ($result->num_rows > 0) 
    {
        // 输出每行数据
        while($row = $result->fetch_assoc()) 
        {
            echo "<br> id: ". $row["id"]. " - Name: ". $row["firstname"]. " " . $row["lastname"];
        }
    }
    else 
    {
        echo "0 个结果";
    }
    $result->free();
    */

    /* Get field information for all columns */
    while ($finfo = $result->fetch_field()) {

        /* get fieldpointer offset */
        $currentfield = $result->current_field;

        printf("Column %d:\n", $currentfield);
            echo "<br>";

        printf("Name:     %s\n", $finfo->name);
    echo "<br>";

        printf("Table:    %s\n", $finfo->table);
    echo "<br>";

        printf("max. Len: %d\n", $finfo->max_length);
    echo "<br>";
        printf("Flags:    %d\n", $finfo->flags);
            echo "<br>";

        printf("Type:     %d\n\n", $finfo->type);
            echo "<br>";

    }


    $result->close();

    ///////////////////////////////////
    //log module 
    //error_log("hello world", 1, "zirpon.cheung@qq.com");
    //error_log(date("Y-m-d H:i:s ")."testing"."\n", 3, "php-error.log");
    logger::write("hello world  ddddd", "taobao");

?>
