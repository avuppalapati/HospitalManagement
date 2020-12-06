<?php
$title = "Hospital Management Interface | Staff Results";
include 'header.php';

echo "<section class=\"main\">";
echo "<div class=\"container\">";
echo "<div class=\"box\">";
echo "<table>"; // start a table tag in the HTML

$staff = $_GET["staffType"];
$sex = $_GET["sex"];
$dob = $_GET["dob"];
$departments = $_GET['departments'];

if($staff == "Nurses"){
    $query = "SELECT nname, sex, dob FROM nurses WHERE 1 = 1";
        if (!empty($sex)){
            $query = $query." AND sex = '$sex'";
        }
        if(!empty($dob)){
            $query = $query." AND dob = '$dob'";
        }
        echo $query;
    $result = mysqli_query($con, $query);
    echo "<tr><td><b>Name</b></td><td><b>Sex</b></td><td><b>Date of Birth</b></td></tr>";
    while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
        echo "<tr><td>" . $row['nname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['dob'] . "</td>";  //$row['index'] the index here is a field name
    }
}

else if ($staff == "Doctors"){
    $query = "SELECT doc.drname, doc.sex, doc.dob, dep.dname FROM doctors doc, departments dep, works_in w WHERE doc.dept_id = dep.did AND w.did_works_in = w.drssn_works_in";
    if (!empty($sex)){
        $query .= " AND sex = '$sex'";
    }
    if(!empty($dob)){
        $query .= " AND dob = '$dob'";
    }
    if(!empty($departments)){
        $query .= " AND dep.dname = '$departments'";
    }
    $result = mysqli_query($con, $query);
    echo "<tr><td><b>Name</b></td><td><b>Sex</b></td><td><b>Date of Birth</b></td><td><b>Department</b></td></tr>";
    while($row = mysqli_fetch_array($result)){
        echo "<tr><td>" . $row['drname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['dob'] . "</td><td>" . $row['dname'] . "</td></tr>";
    }

} 

else {
    $query = "SELECT doc.drname, doc.sex, doc.dob, dep.dname FROM doctors doc, departments dep WHERE doc.dept_id = dep.did";
    if (!empty($sex)){
        $query .= " AND sex = '$sex'";
    }
    if(!empty($dob)){
        $query .= " AND dob = '$dob'";
    }
    if(!empty($departments)){
        $query .= " AND dep.dname = '$departments'";
    }
    $result = mysqli_query($con, $query);
    echo "<tr><td><b>Name</b></td><td><b>Sex</b></td><td><b>Date of Birth</b></td><td><b>Department</b></td></tr>";
    while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
        echo "<tr><td>" . $row['drname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['dob'] . "</td><td>" . $row['dname'] . "</td></tr>";
    }

    $query = "SELECT nname, sex, dob FROM nurses WHERE 1 = 1";
    if (!empty($sex)){
        $query .= " AND sex = '$sex'";
    }
    if(!empty($dob)){
        $query .= " AND dob = '$dob'";
    }
    $result = mysqli_query($con, $query);
    while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
        echo "<tr><td>" . $row['nname'] . "</td><td>" . $row['sex'] . "</td><td>" . $row['dob'] . "</td><td> Nurse </td></tr>";
    }
    
}

echo "</table>"; //Close the table in HTML
?>

