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
  ?s -- start_date - DATETIME NOT NULL
 ,?s -- end_date - DATETIME
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
var_dump($_POST);
$data = array('result' => 'success');
echo json_encode($data);
?>