<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_update',
"
UPDATE`web-animals`.event
SET
 date = STR_TO_DATE(?s, '{$date_format}')
 ,text = ?s
WHERE id_event = ?s
"
);

$db = new SafeMySQL();
$data = $db->query(sql_update, $_POST['date']
                             , $_POST['text']
                             , $_POST['id']
                  );
$data = array('result' => 'success', 'request' => $_POST);
echo json_encode($data);
?>