<?php
include 'header.php';

$pssn = $_POST["pssn"];
$pname = $_POST["name"];
$sex = $_POST["sex"];
$dob = $_POST["birthday"];
$weight = $_POST["weight"];
$diagnosis = $_POST["diagnosis"];
$dname = $_POST["doctor"];
$nname = $_POST["nurse"];
$iname = $_POST["insurance"];
$ecname = $_POST["ec"];

$query = "SELECT dssn FROM `databases`.`doctors` WHERE dname = '$dname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$dssn = $row['dssn'];

$query = "SELECT nssn FROM `databases`.`nurses` WHERE nname = '$nname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$nssn = $row['nssn'];

$query = "SELECT iid FROM `databases`.`insurance` WHERE iname = '$iname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$iid = $row['iid'];

$query = "SELECT essn FROM `databases`.`emergency_contact` WHERE ecname = '$ecname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$essn = $row['essn'];

$query = "INSERT INTO `databases`.`patients` (`pssn`, `pname`, `sex`, `dob`, `weight`, `diagnosis`, `doctor_id`, `insurance_id`, `nurse_id`, `ec_id`) VALUES ('$pssn', '$pname', '$sex', '$dob', '$weight', '$diagnosis', '$dssn', '$nssn', '$iid', '$essn')";
$result = mysqli_query($con, $query);

//header('Location: index.php/');
?>