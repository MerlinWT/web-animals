<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT
  a.id_animal as id
  ,a.name
  ,at.id_animal_type id_type
  ,at.name type
  ,IFNULL(a.comment,'')
  ,CASE WHEN a.foto IS NULL THEN 'нет'
        ELSE 1
   END AS foto
  ,IFNULL(v.id_vallere, '') id_vallere
  ,IFNULL(v.label, '') vallere
  FROM animal a
  JOIN animal_type at ON a.id_animal_type = at.id_animal_type
  LEFT JOIN animal_in_vallere aiv ON a.id_animal = aiv.id_animal
  LEFT JOIN vallere v ON aiv.id_vallere = v.id_vallere
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