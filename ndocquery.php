<?php
include 'header.php';

$dssn = $_POST["dssn"];
$dname = $_POST["dname"];
$dsex = $_POST["dsex"];
$ddob = $_POST["ddob"];
$dept = $_POST["dept"];

$query = "SELECT did FROM `databases`.`departments` WHERE dname = '$dept' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$depid = $row['did'];

$query = "INSERT INTO `databases`.`doctors`(`dssn`, `drname`, `dob`, `sex`, `dept_id`) 
VALUES ('$dssn', '$dname', '$ddob', '$dsex', '$depid')";
$result = mysqli_query($con, $query);

header('Location: index.php');
?>