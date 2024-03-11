<?php
header('Access-Control-Allow-Origin: *');

$host = "localhost"; // Host name 
$db_username = "id19500520_user"; // Mysql username 
$db_password = "hstgfvaf%ttik7km"; // Mysql password 
$db_name = "id19500520_db"; // Database name 
$db_table = "users"; // Table name

// Connect to server and select database.
$con = mysqli_connect($host, $db_username, $db_password, $db_name);

$Email = strip_tags(mysqli_real_escape_string($con, $_GET['email']));
$Senha = strip_tags(mysqli_real_escape_string($con, $_GET['senha']));

$EfetuarLogin = mysqli_query($con, "SELECT * FROM users WHERE email = '$Email' AND senha = '$Senha';" );
$TotalLogin = mysqli_num_rows($EfetuarLogin);

$arrDados = mysqli_fetch_assoc($EfetuarLogin);
$nLinhas = count($arrDados);

if($nLinhas != 0){
    echo 1;
} else{
    echo 0;
}

// close MySQL connection 
mysqli_close($con);
?>