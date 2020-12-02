<?php
$title = "Hospital Management Interface | New Employee";
include 'header.php';
?>

<HTML>
<title>Default Form</title>
<body>
<section class="main">
                <div class="container">
                    <div class="box">
                    <form action="nnursequery.php" method="post">
                        <label for="nssn">Nurse Social Security:</label><br>
                        <input type="password" id="nssn" name="nssn" placeholder="XXX-XX-XXXX" maxlength="9"><br><br>
                        
                        <label for="nname">Full Name:</label><br>
                        <input type="text" id="nname" name="nname" placeholder="John Doe"><br><br>
                        
                        <label>Sex</label><br>
                        <input type="radio" id="male" name="nsex" value="M">
                        <label for="male">Male</label><br>
                        <input type="radio" id="female" name="nsex" value="F">
                        <label for="female">Female</label><br>
                        <input type="radio" id="other" name="nsex" value="O">
                        <label for="other">Other</label><br><br>
                        
                        <label for="ndob">Date of Birth:</label>
                        <input type="date" id="dob" name="ndob"><br><br>
                        
                        <input type="submit"> <input type="reset">
                    </form>
                    </div>
                    <div class="box">
                    <form action="ndocquery.php" method="post">
                        <label for="dssn">Doctor Social Security:</label><br>
                        <input type="password" id="dssn" name="dssn" placeholder="XXX-XX-XXXX" maxlength="9"><br><br>
                        
                        <label for="dname">Full Name:</label><br>
                        <input type="text" id="dname" name="dname" placeholder="John Doe"><br><br>
                        
                        <label>Sex</label><br>
                        <input type="radio" id="male" name="dsex" value="M">
                        <label for="male">Male</label><br>
                        <input type="radio" id="female" name="dsex" value="F">
                        <label for="female">Female</label><br>
                        <input type="radio" id="other" name="dsex" value="O">
                        <label for="other">Other</label><br><br>
                        
                        <label for="ddob">Date of Birth:</label>
                        <input type="date" id="ddob" name="ddob"><br><br>
						
                        <select name="dept" id="dept">
                            <option value="" disabled selected hidden>Select Department</option>
                            <?php 
                                $query = 'select dname from departments';
                                $result = mysqli_query($con, $query);
                                while($row = mysqli_fetch_array($result)){
                                ?>    <option value="<?php echo $row['dname'];?>"><?php echo $row['dname'];};?> </option> 
                        </select> <br><br>
                        
                        <input type="submit"> <input type="reset">
                    </form>
                    </div>
                </div>
        </section>
    </body>
</HTML>