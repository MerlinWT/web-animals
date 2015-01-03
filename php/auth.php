<?
error_reporting(E_ALL);
define("user","admin");
define("pass","admin");

if (user == $_POST['user'] && pass == $_POST['pass']){
    $response = array('result' => true);
}else{
    $response = array('result' => false);
}
print(json_encode($response));
?>