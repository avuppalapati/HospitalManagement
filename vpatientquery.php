<?php
$title = "Hospital Management Interface | Patient Results";
include 'header.php';

echo "<section class=\"main\">";
echo "<div class=\"container\">";
echo "<div class=\"box\">";
echo "<table>"; // start a table tag in the HTML

$diagnosis = $_GET['diagnosis'];

if($diagnosis == ""){
    $query = "select p.pname, p.sex, p.weight, p.diagnosis, p.ec_id, d.dname from patients p, departments d where p.doctor_id=d.head";
    $result = mysqli_query($con, $query);
    echo "<tr><td><b>Name</b></td><td><b>Sex</b></td><td><b>Weight</b></td><td><b>Diagnosis</b></td><td><b>Emergency Contact ID</b></td><td><b>Department</b></td></tr>";
    while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
        echo "<tr><td>" . $row['pname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['weight'] . "</td><td>" . $row['diagnosis'] . "</td><td>" . $row['ec_id'] . "</td><td>" . $row['dname'] . "</td></tr>";  //$row['index'] the index here is a field name
    }
}else {
    $query = "select p.pname, p.sex, p.weight, p.ec_id, d.dname from patients p, departments d where p.doctor_id=d.head AND diagnosis='$diagnosis'";
    $result = mysqli_query($con, $query);
    echo "<tr><td><b>Name</b></td><td><b>Sex</b></td><td><b>Weight</b></td><td><b>Emergency Contact ID</b></td><td><b>Department</b></td></tr>";
    while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
       echo "<tr><td>" . $row['pname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['weight'] . "</td><td>" . $row['ec_id'] . "</td><td>" . $row['dname'] . "</td></tr>";  //$row['index'] the index here is a field name
    }
}

echo "</table>"; //Close the table in HTML
?>

