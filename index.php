<?php 
$title = "Hospital Management Interface | Home";
include 'header.php';
?>
    <body>
        <section class="main">
            <div class="container">
            <div class="box">
                    <h1>Registration</h1>
                    <div class="form">
                        <button class="buttons" onclick="location.href='newpatient.php'" type="button">New Patient</button>
                        <button class="buttons" onclick="location.href='newec.php'" type="button">New Emergency Contact</button>
                        <button class="buttons" onclick="location.href='newemp.php'" type="button">New Employee</button>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="box">
                    <h1>Lookups</h1>
                    <div class="form">
                        <button class="buttons" onclick="location.href='vpatient.php'" type="button">View Patients</button>
                        <button class="buttons" onclick="location.href='vstaff.php'" type="button">View Employees</button>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>