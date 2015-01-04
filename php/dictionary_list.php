<?
error_reporting(E_ALL);
require "./classes/mysql.php";
define("sql_select","
SELECT t.{$_POST['id']} as value
,      t.{$_POST['value']} as text
FROM {$_POST['table']} t
WHERE 0 = 0%s
ORDER BY t.{$_POST['id']}
"
);

$request = $_POST;

$db = new SafeMySQL();
$where = '';
if (array_key_exists('where', $_POST)){
    foreach ($_POST['where'] as $key => $value){
        $where .= " AND t.{$key} = {$value}";
    }
}
$sql = sprintf(sql_select, $where);
$data = $db->getAll($sql);

$response = array(
    'sql' => $sql,
    'request' => $request,
    'data' => $data
);
print(json_encode($response));
?>