<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT DATE_FORMAT(ar.request_date, '%d.%m.%Y') AS date,
       ar.first_name,
       ar.last_name,
       ar.contact_phone,
       a.name AS animal
  FROM animal_request ar
  JOIN animal a ON ar.id_animal = a.id_animal
"
);

$request = $_POST;

$db = new SafeMySQL();
$data = $db->getAll(sql_select);

$response = array(
    'request' => $request,
    'data' => $data,
    'sql' => sql_select
);
print(json_encode($response));
?>