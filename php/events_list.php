<?
error_reporting(E_ALL);
require "./classes/mysql.php";
define("sql_select","
SELECT text
,      date
FROM event
ORDER BY DATE DESC
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