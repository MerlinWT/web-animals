<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT
   aiv.id_animal_in_vallere AS id
  ,v.id_vallere
  ,v.label as vallere
  ,vt.name vallere_type
  ,IFNULL(a.id_animal, 'пусто') AS id_animal
  ,IFNULL(a.name, 'пусто') AS animal
  ,IFNULL(DATE_FORMAT(aiv.start_date, '{$date_format}'), '') AS SD
  ,IFNULL(DATE_FORMAT(aiv.end_date, '{$date_format}'), '') AS ED
  FROM vallere v
  LEFT JOIN animal_in_vallere aiv ON v.id_vallere = aiv.id_vallere
  LEFT JOIN animal a ON aiv.id_animal = a.id_animal
  LEFT JOIN vallere_type vt ON v.id_vallere_type = vt.id_vallere_type
WHERE 0 = 0 -- v.id_vallere_type = 2
ORDER BY v.id_vallere_type, v.id_vallere, aiv.start_date
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