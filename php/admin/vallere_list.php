<?
error_reporting(E_ALL);
require "../classes/mysql.php";
define("sql_select","
SELECT v.id_vallere as id
      ,v.label
      ,vt.id_vallere_type as id_type_name
      ,vt.name as type_name
      ,CASE WHEN v.foto IS NULL THEN 'нет'
               ELSE 1
          END AS foto
      ,IFNULL(a.name,'') as animal
  FROM vallere v
  LEFT JOIN animal_in_vallere aiv ON v.id_vallere = aiv.id_vallere
  LEFT JOIN animal a ON aiv.id_animal = a.id_animal
  JOIN vallere_type vt ON v.id_vallere_type = vt.id_vallere_type
ORDER BY vt.name, v.label
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