<?php
$servername = "localhost";
$username = "root";
$password = "root";
 
// 创建连接
$conn = new mysqli($servername, $username, $password, "testdb");
 
// 检测连接
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
} 
echo "连接成功<br>";

// 创建数据库
/*
$sql = "CREATE DATABASE testdb";
if ($conn->query($sql) === TRUE) {
    echo "数据库创建成功";
} else {
    echo "Error creating database: " . $conn->error;
}
*/

// 使用 sql 创建数据表
/*
$sql = "CREATE TABLE t_guest (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50),
reg_date TIMESTAMP
)";

if ($conn->query($sql) === TRUE) {
    echo "Table t_guest created successfully";
} else {
    echo "创建数据表错误: " . $conn->error;
}
*/

/*
$sql = "INSERT INTO t_guest (firstname, lastname, email)
VALUES ('John', 'Doe', 'john@example.com')";

if ($conn->query($sql) === TRUE) {
    echo "新记录插入成功";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
*/
/*
$sql = "INSERT INTO t_guest (firstname, lastname, email)
VALUES ('John', 'Doe', 'john@example.com');";
$sql .= "INSERT INTO t_guest (firstname, lastname, email)
VALUES ('Mary', 'Moe', 'mary@example.com');";
$sql .= "INSERT INTO t_guest (firstname, lastname, email)
VALUES ('Julie', 'Dooley', 'julie@example.com')";

if ($conn->multi_query($sql) === TRUE) {
    echo "muti 新记录插入成功";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
*/
/*
$sql = "SELECT id, firstname, lastname FROM t_guest";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // 输出每行数据
    while($row = $result->fetch_assoc()) {
        echo "<br> id: ". $row["id"]. " - Name: ". $row["firstname"]. " " . $row["lastname"];
    }
} else {
    echo "0 个结果";
}
*/

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


$conn->close();
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
