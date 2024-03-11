<?php
header('Access-Control-Allow-Origin: *');

$host = "localhost"; // Host name 
$db_username = "id19500520_user"; // Mysql username 
$db_password = "HuiMo5eratreydsy@"; // Mysql password 
$db_name = "id19500520_db"; // Database name 
$db_table = "users"; // Table name

if(!empty($_GET['email']) && !empty($_GET['senha'])){

    $con = mysqli_connect($host, $db_username, $db_password, $db_name);

    //Lightly sanitize the GET's to prevent SQL injections and possible XSS attacks
    $email = strip_tags(mysqli_real_escape_string($con, $_GET['email']));
    $senha = strip_tags(mysqli_real_escape_string($con, $_GET['senha']));
    
    $sql = mysqli_query($con, "INSERT INTO $db_name.$db_table (email, senha)
                               VALUES ('$email','$senha');" );
    if($sql){

        //The query returned true - now do whatever you like here.
        echo 'Cadastro salvo com sucesso!!!';
        
    }else{
     
        //The query returned false - you might want to put some sort of error reporting here. Even logging the error to a text file is fine.
        echo 'Erro ao cadastrar, tente novamente!!!';
    }

    mysqli_close($con);//Close off the MySQL connection to save resources.

}else{
    echo 'Email ou senha não informado, tente novamente!!!';
}
?>