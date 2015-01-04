<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT
   v.id_vallere AS id
  ,v.label
  ,IFNULL(a.name, 'пусто') AS animel
  ,IFNULL(aiv.start_date, '') AS SD
  ,IFNULL(aiv.end_date, '') AS ED
  FROM vallere v
  LEFT JOIN animal_in_vallere aiv ON v.id_vallere = aiv.id_vallere
  LEFT JOIN animal a ON aiv.id_animal = a.id_animal
WHERE v.id_vallere_type = 2
ORDER BY v.id_vallere, aiv.start_date
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