<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT v.id_vallere
,      v.label
  FROM vallere v
  LEFT JOIN animal_in_vallere aiv ON aiv.id_vallere = v.id_vallere
  LEFT JOIN hotel_registrate hr ON v.id_vallere = hr.id_vallere
  WHERE v.id_vallere_type = 2
    AND (aiv.id_animal IS NULL
         OR (aiv.start_date > STR_TO_DATE(?s, '{$date_format}') OR aiv.end_date < STR_TO_DATE(?s, '{$date_format}'))
    )
    AND (hr.id_hotel_registrate IS NULL
         OR (hr.wish_start_date > STR_TO_DATE(?s, '{$date_format}') OR hr.wish_end_date < STR_TO_DATE(?s, '{$date_format}'))
    )
"
);

$request = $_POST;

$db = new SafeMySQL();
$data = $db->getAll(sql_select, $_POST['ed'], $_POST['sd'], $_POST['ed'], $_POST['sd']);

$response = array(
    'request' => $request,
    'data' => $data
);
print(json_encode($response));
?>