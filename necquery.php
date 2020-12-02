<?php
include 'header.php';

$ecssn = $_POST["ecssn"];
$ecname = $_POST["name"];
$phone = $_POST["phone"];

$query = "INSERT INTO `databases`.`emergency_contact` (`essn`, `ecname`, `phone`) VALUES ('$ecssn', '$ecname', '$phone')";
$result = mysqli_query($con, $query);
header('Location: index.php');

?>