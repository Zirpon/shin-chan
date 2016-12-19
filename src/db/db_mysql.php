<?php

require_once dirname(__FILE__).'/sqlmould.php';


$GLOBALS['DB_IP']   = "localhost";
$GLOBALS['DB_USER'] = "root";
$GLOBALS['DB_PWD']  = "";
$GLOBALS['DB_PORT']  = "3306";
$GLOBALS['DB_SOCKET']  = "/data/lib/mysql/mysql.sock"; 

 class db_mysql
 {
    public $m_conn = NULL;

    public function __construct( $DB_NAME = "shin_chan" )
    {
        // 创建连接
        $this->m_conn = new mysqli
        (
            $GLOBALS['DB_IP'], $GLOBALS['DB_USER'], $GLOBALS['DB_PWD'], $DB_NAME,
            $GLOBALS["DB_PORT"], $GLOBALS["DB_SOCKET"]
        );
         
        // 检测连接
        if ($this->m_conn->connect_error) 
        {
            die("连接失败: " . $this->m_conn->connect_error);
            return;
        } 
        /*
        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }
        */
        //echo "连接成功<br>";
    }

    public function __destruct()
    {
        if ($this->m_conn != NULL) {
            $this->m_conn->close();
        }
      
        //echo "<br>当对象销毁时会调用！！！<br>";
    }

    public function db_query_insert( $sql_str )
    {
        if ( !isset($sql_str) || empty($sql_str) ) {
            return FALSE;
        }

        if ($this->m_conn->query($sql_str) === TRUE) {
            //echo "新记录插入成功";
            return TRUE;
        } else {
            echo "Error: " . $sql_str . "<br>" . $this->m_conn->error;
            return FALSE;
        }
    }

    public function db_query_select( $sql_str )
    {
        if ( !isset($sql_str) || empty($sql_str) ) 
        {
            return NULL;
        }

        $result = $this->m_conn->query($sql_str);
        if ($result == FALSE) {
            return NULL;
        }

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

    public function db_cleanQuery()
    {
        $this->m_conn->next_result();
    }

    public function db_getConn()
    {
        return $this->m_conn;
    }

    public function db_proc( $proc_name, $params )
    {
        $sql_str_head = "call $proc_name(";

        //var_dump($params);
        if (is_array($params) && !empty($params)) 
        {
            for($i=0; $i < sizeof($params); $i++)
            {
                $var = $params[$i];
                $var_str = "";

                if (is_string($var)) 
                {
                    $var_str = "\"".$var."\"";
                }
                else if (is_int($var)) //under expland
                {
                    $var_str = $var_str.$var;
                }

                if ($i != sizeof($params)-1) 
                {
                    $var_str = $var_str.",";    
                }

                $sql_str_head = $sql_str_head.$var_str;
            }

        }

        $sql_str_head = $sql_str_head.");";

        //echo  $sql_str_head;
        //echo "<br>";
        $result = $this->m_conn->query($sql_str_head);

        return $result;
    }

    public function db_prepare( $sql_str, $value_form, $params )
    {/*
        // 预处理及绑定
        $stmt = $this->m_conn->prepare($sql_str);
        $stmt->bind_param($value_form, $firstname, $lastname, $email);

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
    */
    }
 }

?>
