<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_update',
"
UPDATE `web-animals`.vallere
SET
  label = ?s
 ,id_vallere_type = ?s
WHERE id_vallere = ?s
"
);
define('sql_update_image',
"
UPDATE `web-animals`.vallere
SET foto = ?s
WHERE id_vallere = ?s
"
);
$db = new SafeMySQL();
$data = $db->query(sql_update, $_POST['label']
                             , $_POST['id_vallere_type']
//                             , file_get_contents('../.' . $_POST['foto'])
                             , $_POST['id']
                  );
if (file_exists('../.' . $_POST['foto'])){
    $data = $db->query(sql_update_image, file_get_contents('../.' . $_POST['foto'])
                                 , $_POST['id']
    );
};
$data = array('result' => 'success', 'request' => $_POST);
echo json_encode($data);
?>