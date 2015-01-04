<?php
error_reporting(E_ALL);
require "../classes/mysql.php";
$action_map_table = array(
    //action => table_name
    'vallere' => 'vallere'
    ,'animal' => 'animal'
    ,'event' => 'event'
    ,'message' => 'found_request'
    ,'hotel' => 'hotel'
);

if (array_key_exists('values', $_POST)){

    define('sql_delete',
    "
    DELETE FROM {$action_map_table[$_POST['table']]}
    WHERE id_{$_POST['table']} IN (?a)
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