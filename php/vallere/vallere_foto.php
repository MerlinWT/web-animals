<?php
header("Content-type: image/png");
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_s_animal_image","
SELECT foto FROM vallere
 WHERE id_vallere = ?i
"
);

$db = new SafeMySQL();
$data = $db->getRow(sql_s_animal_image, $_GET['id']);

echo $data['foto'];
?>