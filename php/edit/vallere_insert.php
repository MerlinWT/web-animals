<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_insert',
"
INSERT INTO `web-animals`.vallere
(
  label
 ,id_vallere_type
 ,foto
)
VALUES
(
  ?s -- label - VARCHAR(255) NOT NULL
 ,?s -- id_vallere_type - MEDIUMINT(9) NOT NULL
 ,?s -- foto - LONGBLOB
)
"
);

$db = new SafeMySQL();
$data = $db->query(sql_insert, $_POST['label']
                             , $_POST['id_vallere_type']
                             , file_get_contents('../.' . $_POST['foto'])
                  );
var_dump($_POST);
$data = array('result' => 'success');
echo json_encode($data);
?>