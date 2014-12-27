<?php
header("Content-type: image/png");
error_reporting(E_ALL);
require "./classes/mysql.php";
define("sql_s_animal_image","select foto from animal where id_animal = ?i");

$db = new SafeMySQL();
$data = $db->getRow(sql_s_animal_image, $_GET['id']);

echo $data['foto'];
?>