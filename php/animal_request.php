<?php
error_reporting(E_ALL);
require "./classes/mysql.php";

define('sql_s_animal_in_vallere',
"
INSERT INTO `web-animals`.animal_request(
    request_date
   ,first_name
   ,last_name
   ,contact_phone
   ,id_animal
  )
  VALUES
  (
    NOW() -- request_date - DATETIME NOT NULL
   ,?s -- first_name - VARCHAR(50) NOT NULL
   ,?s -- last_name - VARCHAR(50) NOT NULL
   ,?s -- contact_phone - VARCHAR(9) NOT NULL
   ,?i -- id_animal - MEDIUMINT(9)
  )
"
);

$db = new SafeMySQL();
$data = $db->query(sql_s_animal_in_vallere, $_POST['firstName'], $_POST['lastName'], $_POST['contactPhone'], $_POST['idAnimal']);
?>