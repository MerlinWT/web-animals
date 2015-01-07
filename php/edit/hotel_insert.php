<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_insert',
"
INSERT INTO `web-animals`.animal_in_vallere
(
  start_date
 ,end_date
 ,id_animal
 ,id_vallere
)
VALUES
(
  STR_TO_DATE(?s, '{$date_format}') -- start_date - DATETIME NOT NULL
 ,STR_TO_DATE(NULLIF(?s, ''), '{$date_format}') -- end_date - DATETIME
 ,?s -- id_animal - MEDIUMINT(9) NOT NULL
 ,?s -- id_vallere - MEDIUMINT(9) NOT NULL
)
"
);

$db = new SafeMySQL();
$data = $db->query(sql_insert, $_POST['sd']
                             , $_POST['ed']
                             , $_POST['id_animal']
                             , $_POST['id_vallere']
                  );
$data = array('result' => 'success', 'request' => $_POST);
echo json_encode($data);
?>