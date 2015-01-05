<?php
header("Content-type: image/png");
error_reporting(E_ALL);
require "./classes/mysql.php";
require "./mapping.php";
$table = $action_map_table[$_GET['from']];
define("sql_s_animal_image","select foto from {$table} where id_{$table} = ?i");

$db = new SafeMySQL();
$data = $db->getRow(sql_s_animal_image, $_GET['id']);

echo $data['foto'];
?>