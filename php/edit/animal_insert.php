<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_insert',
"
INSERT INTO `web-animals`.animal
(
  name
 ,id_animal_type
 ,comment
 ,foto
)
VALUES
(
  ?s -- name - CHAR(30) NOT NULL
 ,?s -- id_animal_type - MEDIUMINT(9)
 ,?s -- comment - VARCHAR(255)
 ,?s -- foto - LONGBLOB
)
"
);

$db = new SafeMySQL();
$data = $db->query(sql_insert, $_POST['name']
                             , $_POST['id_type']
                             , $_POST['comment']
                             //, $_POST['id_vallere']
                             , file_get_contents('../.' . $_POST['foto'])
                  );
$data = array('result' => 'success', 'request' => $_POST);
echo json_encode($data);
?>