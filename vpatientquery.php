<?php
$title = "Hospital Management Interface | Patient Results";
include 'header.php';

echo "<section class=\"main\">";
echo "<div class=\"container\">";
echo "<div class=\"box\">";
echo "<table>"; // start a table tag in the HTML

$diagnosis = $_GET['diagnosis'];

if($diagnosis == ""){
    $query = "SELECT p.pname, p.sex, p.weight, p.diagnosis, doc.drname, ec.ecname, ec.phone
    FROM patients p, doctors doc, diagnose di, emergency_contact ec, has_ec he 
    WHERE p.pssn = di.pssn_diagnose AND di.dssn_diagnose = doc.dssn AND p.pssn = he.pssn_has_ec AND he.essn_has_ec = ec.essn";

    $result = mysqli_query($con, $query);
    echo "<tr><td><b>Name</b></td><td><b>Sex</b></td><td><b>Weight</b></td><td><b>Diagnosis</b></td><td><b>Doctor Name</b></td>
    <td><b>Emergency Contact</b></td><td><b>Phone</b></td></tr>";
    while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
        echo "<tr><td>" . $row['pname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['weight'] . "</td><td>" . $row['diagnosis'] . "</td><td>" . 
        $row['drname'] . "</td><td>". $row['ecname'] . "</td><td>" . $row['phone'] . "</td></tr>";
    }
}
else {
    $query = "SELECT p.pname, p.sex, p.weight, p.diagnosis, doc.drname, ec.ecname, ec.phone
    FROM patients p, doctors doc, diagnose di, emergency_contact ec, has_ec he 
    WHERE p.pssn = di.pssn_diagnose AND p.diagnosis = '$diagnosis' AND di.dssn_diagnose = doc.dssn AND p.pssn = he.pssn_has_ec AND he.essn_has_ec = ec.essn";

    $result = mysqli_query($con, $query);
    echo "<tr><td><b>Name</b></td><td><b>Sex</b></td><td><b>Weight</b></td><td><b>Diagnosis</b></td><td><b>Doctor Name</b></td>
    <td><b>Emergency Contact</b></td><td><b>Phone</b></td></tr>";
    while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
        echo "<tr><td>" . $row['pname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['weight'] . "</td><td>" . $row['diagnosis'] . "</td><td>" . 
        $row['drname'] . "</td><td>". $row['ecname'] . "</td><td>" . $row['phone'] . "</td></tr>";
    }
}

echo "</table>"; //Close the table in HTML
?>

