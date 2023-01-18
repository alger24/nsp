<?php
require './autload.php';


$userClass = new Control;

echo $userClass->userRegister();

if($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['signupBtn'])) {
    echo $userClass->userRegister();
}

// header('location: ../index.php')
?>