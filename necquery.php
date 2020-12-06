<?php
include 'header.php';

$ecssn = $_POST["ecssn"];
$ecname = $_POST["name"];
$phone = $_POST["phone"];
$pssn = $_POST["pssn"];

$query = "INSERT INTO `hospitaldb`.`emergency_contact` (`essn`, `ecname`, `phone`) VALUES ('$ecssn', '$ecname', '$phone')";
$result = mysqli_query($con, $query);

$query = "INSERT INTO `hospitaldb`.`has_ec` (`essn_has_ec`, `pssn_has_ec`) VALUES ('$ecssn', '$pssn')";
$result = mysqli_query($con, $query);

header('Location: index.php');

?>