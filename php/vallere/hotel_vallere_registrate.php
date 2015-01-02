<?php
error_reporting(E_ALL);
require "../classes/mysql.php";

define('sql_insert',
"
INSERT INTO `web-animals`.hotel_registrate
(
 id_vallere
 ,wish_start_date
 ,wish_end_date
 ,first_name
 ,last_name
 ,comment
 ,contact_phone
)
VALUES
(
   ?i -- id_vallere - MEDIUMINT(9) NOT NULL
 , STR_TO_DATE(?s, '{$date_format}') -- wish_start_date - DATETIME NOT NULL
 , STR_TO_DATE(?s, '{$date_format}') -- wish_end_date - DATETIME NOT NULL
 , ?s -- first_name - VARCHAR(50) NOT NULL
 , ?s -- last_name - VARCHAR(50) NOT NULL
 , ?s -- comment - VARCHAR(255) NOT NULL
 , ?s -- contact_phone - VARCHAR(10) NOT NULL
)
"
);

$db = new SafeMySQL();
$data = $db->query(sql_insert
                 , $_POST['idVallere']
                 , $_POST['sd']
                 , $_POST['ed']
                 , $_POST['firstName']
                 , $_POST['lastName']
                 , $_POST['comment']
                 , $_POST['contactPhone']
);
$request = $_POST;
$response = array(
    'request' => $request,
    'data' => array('result' => 'success')
);
echo json_encode($response);
?>