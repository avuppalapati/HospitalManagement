<?php
include 'header.php';

$drssn = $_POST["dssn"];
$dname = $_POST["dname"];
$dsex = $_POST["dsex"];
$ddob = $_POST["ddob"];
$dept = $_POST["dept"];

$query = "SELECT did FROM `databases`.`departments` WHERE dname = '$dept' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$depid = $row['did'];

$query = "INSERT INTO `databases`.`doctors`(`dssn`, `drname`, `dob`, `sex`, `dept_id`) 
VALUES ('$drssn', '$dname', '$ddob', '$dsex', '$depid')";
$result = mysqli_query($con, $query);

$query = "INSERT INTO `databases`.`works_in`(`dssn_works_in`, `did_works_in`)
VALUES ('$drssn', '$depid')";
$result = mysqli_query($con, $query);
header('Location: index.php');
?>