<?php
include 'header.php';

$drssn = $_POST["dssn"];
$dname = $_POST["dname"];
$dsex = $_POST["dsex"];
$ddob = $_POST["ddob"];
$dept = $_POST["dept"];

$query = "SELECT did FROM departments WHERE dname = '$dept' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$depid = $row['did'];

$query = "INSERT INTO doctors(`dssn`, `drname`, `dob`, `sex`) 
VALUES ('$drssn', '$dname', '$ddob', '$dsex')";
$result = mysqli_query($con, $query);
echo $query;

$query = "INSERT INTO works_in(`dssn_works_in`, `did_works_in`)
VALUES ('$drssn', '$depid')";
$result = mysqli_query($con, $query);

header('Location: index.php');
?>
