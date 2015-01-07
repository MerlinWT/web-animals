<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT  v.label AS vallere,
        DATE_FORMAT(hr.wish_start_date, '%d.%m.%Y') AS SD,
        DATE_FORMAT(hr.wish_end_date, '%d.%m.%Y') AS ED,
        hr.first_name,
        hr.last_name,
        hr.comment,
        hr.contact_phone
  FROM hotel_registrate hr
  JOIN vallere v ON hr.id_vallere = v.id_vallere
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