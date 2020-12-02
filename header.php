<?php 
$host="127.0.0.1";
$port=3306;
$socket="";
$user="root";
$password="";
$dbname="databases";
$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
or die ('Could not connect to the database server' . mysqli_connect_error());

//$con->close();
?>



<!DOCTYPE html>
	<html lang="en" dir="ltr">
            <meta charset="utf-8">
            <meta name="viewport:" content="width=device-width">
            <link rel="stylesheet" href="./style.css">
        <head>
        <title> <?php echo $title ?></title>
    	</head>
            <header>
            <div class="container">
                <div id="logo">
                    <a href="index.php">Hospital Management System</a>
                </div>
            </div>
        </header>
</HTML>