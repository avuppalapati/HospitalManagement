<?php
include 'header.php';
?>
<HTML>
    <head>
            <meta charset="utf-8">
            <meta name="viewport:" content="width=device-width">
            <title>Hospital Management Interface | New Patient</title>
            <link rel="stylesheet" href="./style.css">
    </head>
    <body>
        <header>
            <div class="container">
                <div id="logo">
                    <a href="index.php">Hospital Management System</a>
                </div>
            </div>
        </header>

        <section class="main">
                <div class="container">
                    <div class="box">
                    <form action="formquery.php" method="post">
                        <label for="pssn">Social Security:</label><br>
                        <input type="password" id="pssn" name="pssn" placeholder="XXX-XX-XXXX" maxlength="9"><br><br>
                        
                        <label for="name">Full Name:</label><br>
                        <input type="text" id="name" name="name" placeholder="John Doe"><br><br>
                        
                        <label>Sex</label><br>
                        <input type="radio" id="male" name="sex" value="M">
                        <label for="male">Male</label><br>
                        <input type="radio" id="female" name="sex" value="F">
                        <label for="female">Female</label><br>
                        <input type="radio" id="other" name="sex" value="O">
                        <label for="other">Other</label><br><br>
                        
                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob"><br><br>
                        
                        <label for="weight">Weight:</label>
                        <input type="number" id="weight" name="weight" placeholder="In pounds"><br><br>
                        
                        <label for="diagnosis">Diagnosis:</label><br>
                        <textarea name="diagnosis" id="diagnosis" cols="70" rows="10" placeholder="Type Here"></textarea><br><br>
                        
                        <label for="doctor">Doctor</label>
                        <select name="doctor" id="doctor">
                            <option value="" disabled selected hidden>Select Doctor</option>
                            <?php 
                                $query = 'select dname from doctors';
                                $result = mysqli_query($con, $query);
                                while($row = mysqli_fetch_array($result)){
                                ?>    <option value="<?php echo $row['dname'];?>"><?php echo $row['dname'];};?> </option> 
                        </select> <br><br>
                        
                        <label for="nurse">Nurse</label>
                        <select name="nurse" id="nurse">
                            <option value="" disabled selected hidden>Select Nurse</option>
                            <?php 
                                $query = 'select nname from nurses';
                                $result = mysqli_query($con, $query);
                                while($row = mysqli_fetch_array($result)){
                                    ?> <option value="<?php echo $row['nname'];?>"><?php echo $row['nname']; };?> </option> 
                            </select> <br><br>
                        
                        <label for="insurance">Insurance</label>
                        <select name="insurance" id="insurance">
                            <option value="" disabled selected hidden>Select Insurance</option>
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
                    </div>
                </div>
        </section>
    </body>
</HTML>