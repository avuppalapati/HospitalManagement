<?php
include 'header.php';

$nssn = $_POST["nssn"];
$nname = $_POST["nname"];
$nsex = $_POST["nsex"];
$ndob = $_POST["ndob"];

$query = "INSERT INTO `databases`.`nurses`(`nssn`, `nname`, `sex`, `dob`) VALUES ('$nssn', '$nname', '$nsex', '$ndob')";
$result = mysqli_query($con, $query);

header('Location: index.php');
?>