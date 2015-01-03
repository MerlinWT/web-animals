<?php
$file = $_FILES['file'];
$upLoadDirectory = 'uploads/';
$tmpName = basename($file['tmp_name'], '.tmp');
$fileInfo = explode('.', $file['name']);
$fileExt = $fileInfo[1];
$fileName = $upLoadDirectory . $tmpName . '.' . $fileExt;
if (move_uploaded_file($file['tmp_name'], '../' . $fileName)){
    $data = array('file' => './' . $fileName);
}else{
    $data = array('file' => 'move_error');
}
echo json_encode($data);
?>