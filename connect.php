<?php
$db = "mysql:host=localhost;dbname=PFA";
$user = "root";
$password = "";
$option = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
);

try {
    $con = new PDO($db, $user, $password, $option);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //   echo "You are connected <br>";

} catch (PDOException $e) {
    echo "La connexion a échoué ! " . $e->getMessage();
}