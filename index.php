<?php 
include 'header.php';
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport:" content="width=device-width">
        <title>Hospital Management Interface | Home</title>
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
        
        <section class="main">
            <div class="container">
            <div class="box">
                    <h1>Registration</h1>
                    <div class="form">
                        <button class="buttons" onclick="location.href='newpatient.php'" type="button">New Patient</button>
                        <button class="buttons" onclick="location.href='newemp.php'" type="button">New Employee</button>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="box">
                    <h1>Lookups</h1>
                    <div class="form">
                        <button class="buttons" type="button">View Patients</button>
                        <button class="buttons" type="button">View Employees</button>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>