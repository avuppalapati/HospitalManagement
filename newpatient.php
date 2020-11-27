<?php
include 'header.php';
?>
<HTML>
<title>Default Form</title>
<body>
<form action="formquery.php" method="post">
  <label for="pssn">Social Security:</label><br>
  <input type="password" id="pssn" name="pssn" placeholder="XXX-XX-XXXX" maxlength="9"><br><br>
  
  <label for="name">Name:</label><br>
  <input type="text" id="name" name="name" placeholder="John"><br><br>
  
  <input type="radio" id="male" name="sex" value="M">
  <label for="male">Male</label><br>
  <input type="radio" id="female" name="sex" value="F">
  <label for="female">Female</label><br>
  <input type="radio" id="other" name="sex" value="O">
  <label for="other">Other</label><br><br>
  
  <label for="birthday">Birthday:</label>
  <input type="date" id="birthday" name="birthday"><br><br>
  
  <label for="weight">Weight:</label>
  <input type="text" id="weight" name="weight" placeholder="100"><br><br>
  
  <label for="diagnosis">Diagnosis:</label>
  <input type="text" id="diagnosis" name="diagnosis"><br><br>
  
  <label for="doctor">Doctor</label>
  <select name="doctor" id="doctor">
  <?php 
    $query = 'select dname from doctors';
    $result = mysqli_query($con, $query);
    while($row = mysqli_fetch_array($result)){
        ?> <option value="<?php echo $row['dname'];?>"><?php echo $row['dname']; };?> </option> 
  </select> <br><br>
  
  <label for="nurse">Nurse</label>
  <select name="nurse" id="nurse">
  <?php 
    $query = 'select nname from nurses';
    $result = mysqli_query($con, $query);
    while($row = mysqli_fetch_array($result)){
        ?> <option value="<?php echo $row['nname'];?>"><?php echo $row['nname']; };?> </option> 
  </select> <br><br>
  
  <label for="insurance">Insurance</label>
  <select name="insurance" id="insurance">
  <?php 
    $query = 'select iname from insurance';
    $result = mysqli_query($con, $query);
    while($row = mysqli_fetch_array($result)){
        ?> <option value="<?php echo $row['iname'];?>"><?php echo $row['iname']; };?> </option> 
  </select> <br><br>
  
  <label for="ec">Emergency Contact</label>
  <select name="ec" id="ec">
  <?php 
    $query = 'select ecname from emergency_contact';
    $result = mysqli_query($con, $query);
    while($row = mysqli_fetch_array($result)){
        ?> <option value="<?php echo $row['ecname'];?>"><?php echo $row['ecname']; };?> </option> 
  </select> <br><br>
  
  
  <br>
<input type="submit"> <input type="reset">
</form>
</body>
</HTML>