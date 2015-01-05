<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT  fr.id_found_request as id
       ,fr.latitude
       ,fr.longitude
       ,fr.first_name
       ,fr.last_name
       ,fr.phone
       ,fr.date_message
       ,fr.comment
       ,CASE WHEN fr.foto IS NULL THEN 'нет'
                ELSE 1
           END AS foto
  FROM found_request fr
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