<?
error_reporting(E_ALL);
require "./classes/mysql.php";
define("sql_s_animal_in_vallere","select * from v_curent_animals");

$db = new SafeMySQL();
$data = $db->getAll(sql_s_animal_in_vallere);
$data = json_encode($data);

print($data);
?>