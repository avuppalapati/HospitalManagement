<?php
include 'header.php';

$pssn = $_POST["pssn"];
$pname = $_POST["name"];
$sex = $_POST["sex"];
$dob = $_POST["dob"];
$weight = $_POST["weight"];
$diagnosis = $_POST["diagnosis"];
$drname = $_POST["doctor"];
$nname = $_POST["nurse"];
$iname = $_POST["insurance"];
$ecname = $_POST["ec"];

$query = "SELECT dssn FROM `hospitaldb`.`doctors` WHERE drname = '$drname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$dssn = $row['dssn'];

$query = "SELECT nssn FROM `hospitaldb`.`nurses` WHERE nname = '$nname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$nssn = $row['nssn'];

$query = "SELECT iid FROM `hospitaldb`.`insurance` WHERE iname = '$iname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$iid = $row['iid'];

$query = "SELECT essn FROM `hospitaldb`.`emergency_contact` WHERE ecname = '$ecname' ";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$essn = $row['essn'];

$query = "INSERT INTO `hospitaldb`.`patients` (`pssn`, `pname`, `sex`, `dob`, `weight`, `diagnosis`) VALUES ('$pssn', '$pname', '$sex', '$dob', '$weight', '$diagnosis')";
$result = mysqli_query($con, $query);

$query = "INSERT INTO `hospitaldb`.`treats` (`pssn_treats`, `nssn_treats`) VALUES ('$pssn', '$drssn')";
$result = mysqli_query($con, $query);

$query = "INSERT INTO `hospitaldb`.`has_ec` (`pssn_has_ec`, `ecssn_has_ec`) VALUES ('$pssn', '$ecssn')";
$result = mysqli_query($con, $query);

$query = "INSERT INTO `hospitaldb`.`insured` (`pssn_insured`, `iid_insured`) VALUES ('$pssn', '$iid')";
$result = mysqli_query($con, $query);

$query = "INSERT INTO `hospitaldb`.`diagnose` (`pssn_diagnose`, `dssn_diagnose`) VALUES ('$pssn', '$dssn')";
$result = mysqli_query($con, $query);

header('Location: index.php');
?>
