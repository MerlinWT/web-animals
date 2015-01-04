<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT
  e.id_event AS id
  ,e.date
  ,e.text
  FROM event e
"
);

$request = $_POST;

$db = new SafeMySQL();
$data = $db->getAll(sql_select);

$response = array(
    'request' => $request,
    'data' => $data
);
print(json_encode($response));
?>