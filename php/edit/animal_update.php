<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_update',
"
UPDATE `web-animals`.animal
SET
  name = ?s
 ,id_animal_type = ?s
 ,comment = ?s
WHERE id_animal = ?s
"
);
define('sql_update_foto',
"
UPDATE `web-animals`.animal
SET
  foto = ?s
WHERE id_animal = ?s
"
);

$db = new SafeMySQL();
$data = $db->query(sql_update, $_POST['name']
                             , $_POST['id_type']
                             , $_POST['comment']
                             , $_POST['id']
                  );
if (file_exists('../.' . $_POST['foto'])){
$data = $db->query(sql_update_foto, file_get_contents('../.' . $_POST['foto'])
                             , $_POST['id']
                  );
};
$data = array('result' => 'success', 'request' => $_POST);
echo json_encode($data);
?>