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

$query = "INSERT INTO `hospitaldb`.`patients` (`pssn`, `pname`, `sex`, `dob`, `weight`, `diagnosis`, `doctor_id`, 
`insurance_id`, `nurse_id`, `ec_id`) VALUES ('$pssn', '$pname', '$sex', '$dob', '$weight', '$diagnosis', '$dssn', 
'$iid', '$nssn', '$essn')";
$result = mysqli_query($con, $query);

header('Location: index.php');
?>
