<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_update',
"
UPDATE `web-animals`.animal_in_vallere
SET
  start_date = STR_TO_DATE(?s, '{$date_format}')
 ,end_date = STR_TO_DATE(?s, '{$date_format}')
 ,id_animal = ?s
 ,id_vallere = ?s
WHERE id_animal_in_vallere = ?s
"
);

$db = new SafeMySQL();
$data = $db->query(sql_update, $_POST['sd']
                             , $_POST['ed']
                             , $_POST['id_animal']
                             , $_POST['id_vallere']
                             , $_POST['id']
                  );
$data = array('result' => 'success', 'request' => $_POST);
echo json_encode($data);
?>