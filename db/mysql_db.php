<?php

    $DB_IP   = "localhost";
    $DB_USER = "root";
    $DB_PWD  = "root";
 

 class db_mysql
 {
    public function __construct( $DB_NAME = "" )
    {
        // 创建连接
        if ( $DB_NAME === "") {
            $conn = new mysqli($DB_IP, $DB_USER, $DB_PWD);
        }
        else
        {
            $conn = new mysqli($DB_IP, $DB_USER, $DB_PWD, $DB_NAME);
        }
         
        // 检测连接
        if ($conn->connect_error) {
            die("连接失败: " . $conn->connect_error);
        } 
        echo "连接成功<br>";
    }

    public function __destruct()
    {
        $conn->close();
        echo "当对象销毁时会调用！！！<br>";
    }

    public function db_query_insert( $sql_str )
    {
        if ( !isset($sql_str) || empty($sql_str) ) {
            return FALSE;
        }

        if ($conn->query($sql_str) === TRUE) {
            echo "新记录插入成功";
            return TRUE;
        } else {
            echo "Error: " . $sql_str . "<br>" . $conn->error;
            return FALSE;
        }
    }

    public function db_query_select( $sql_str )
    {
        if ( !isset($sql_str) || empty($sql_str) ) {
            return NULL;
        }

        $result = $conn->query($sql_str);

        return $result;

        /*

        if ($result->num_rows > 0) {
            // 输出每行数据
            while($row = $result->fetch_assoc()) {
                echo "<br> id: ". $row["id"]. " - Name: ". $row["firstname"]. " " . $row["lastname"];
            }
        } else {
            echo "0 个结果";
        }
        */
    }



 }






// 预处理及绑定
$stmt = $conn->prepare("INSERT INTO t_guest (firstname, lastname, email) VALUES(?, ?, ?)");
$stmt->bind_param("sss", $firstname, $lastname, $email);

// 设置参数并执行
$firstname = "John";
$lastname = "Doe";
$email = "john@example.com";
$stmt->execute();

$firstname = "Mary";
$lastname = "Moe";
$email = "mary@example.com";
$stmt->execute();

$firstname = "Julie";
$lastname = "Dooley";
$email = "julie@example.com";
$stmt->execute();

echo "<br>";
echo "新记录插入成功";
echo "<br>";

$name = '';
$sql = "call proc_out_guest_info('{$name}')";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // 输出每行数据
    while($row = $result->fetch_assoc()) {
        echo "<br> id: ". $row["id"]. " - Name: ". $row["firstname"]. " " . $row["lastname"];
    }
} else {
    echo "0 个结果";
}


$arr = array(   
                "a"=>"aaa",
                "b"=>"bbb",
                "c"=>3
            );
echo "<br>";
var_dump($arr);
echo "<br>";
$json_str = json_encode($arr);
echo $json_str;
echo "<br>";

$request = $_REQUEST;
echo "<br>";
echo $request['aa'];
echo "<br>";
echo $request['dd'];
echo "<br>";
var_dump($request);

?>
