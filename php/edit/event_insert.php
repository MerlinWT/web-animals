<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_insert',
"
INSERT INTO `web-animals`.event
(
 date
 ,text
)
VALUES
(
 IFNULL(STR_TO_DATE(?s, '{$date_format}'), NOW()) -- date - DATETIME NOT NULL
 ,?s  -- text - VARCHAR(1000) NOT NULL
)
"
);

$db = new SafeMySQL();
$data = $db->query(sql_insert, $_POST['date']
                             , $_POST['text']
                  );
$data = array('result' => 'success', 'request' => $_POST);
echo json_encode($data);
?>