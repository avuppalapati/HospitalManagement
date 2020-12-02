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

//session_start();
?>

<!DOCTYPE html>
	<html lang="en" dir="ltr">
        <head>
            <meta charset="utf-8">
            <meta name="viewport:" content="width=device-width">
            <title> <?php echo $title ?></title>
            <link rel="stylesheet" href="./style.css">
    	</head>
        <body>
            <header>
                <div class="container">
                    <div id="logo">
                        <a href="index.php">Hospital Management System</a>
                    </div>
                </div>
            </header>
        </body>
</html>