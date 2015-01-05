<?php
error_reporting(E_ALL);
require "../classes/mysql.php";
require "../mapping.php";

if (array_key_exists('values', $_POST)){
    $table_name = $action_map_table[$_POST['table']];
    define('sql_delete',
    "
    DELETE FROM {$table_name}
    WHERE id_{$table_name} IN (?a)
    "
    );

    $db = new SafeMySQL();
    $data = $db->query(sql_delete, $_POST['values']);

    $data = array('result' => 'success', 'request' => $_POST, 'SQL' => sql_delete);
}else{
    $data = array('result' => 'bad filter');
}
echo json_encode($data);
?>