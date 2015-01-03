<?php
error_reporting(E_ALL);
require "./classes/mysql.php";

define('sql_insert',
"
INSERT INTO `web-animals`.found_request
(
  foto
 ,latitude
 ,longitude
 ,first_name
 ,last_name
 ,phone
 ,date_message
 ,comment
)
VALUES
(
  ?s  -- foto - BLOB
 ,?s -- latitude - VARCHAR(255) NOT NULL
 ,?s -- longitude - VARCHAR(255) NOT NULL
 ,?s -- first_name - VARCHAR(50) NOT NULL
 ,?s -- last_name - VARCHAR(50) NOT NULL
 ,?s -- phone - VARCHAR(10) NOT NULL
 ,NOW() -- date_message - DATETIME NOT NULL
 ,?s -- comment - VARCHAR(1000)
)
"
);

$db = new SafeMySQL();
$data = $db->query(sql_insert, file_get_contents('.' . $_POST['foundImage'])
                             , $_POST['latitude']
                             , $_POST['longitude']
                             , $_POST['firsName']
                             , $_POST['lastName']
                             , $_POST['phone']
                             , $_POST['comment']
                  );

$data = array('result' => 'success');
echo json_encode($data);
?>