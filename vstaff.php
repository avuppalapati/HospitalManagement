<?php
$title = "Search Staff";
include 'header.php';
?>

<html>
    <body>
        <section class="main">
            <div class="container">
                <div class="box">
                <h1>Employee Lookup</h1>
                    <form action="vstaffquery.php" method="get">
                        <label>Filter by Staff Type:</b></label><br>
                        <input type="radio" id="all" name="staffType" value="All" CHECKED>
                        <label for="all">All</label><br>
                        <input type="radio" id="doctor" name="staffType" value="Doctors">
                        <label for="doctor">Doctor</label><br>
                        <input type="radio" id="nurse" name="staffType" value="Nurses">
                        <label for="nurse">Nurse</label><br><br>

                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob"><br><br>

                        <label>Sex:</label><br>
                        <input type="radio" id="none" name="sex" value="" CHECKED>
                        <label for="none">None</label><br>
                        <input type="radio" id="male" name="sex" value="M">
                        <label for="male">Male</label><br>
                        <input type="radio" id="female" name="sex" value="F">
                        <label for="female">Female</label><br>
                        <input type="radio" id="other" name="sex" value="O">
                        <label for="other">Other</label><br><br>

                        <label>Department: </label><br>
                        <select name="departments" id="departments">
                            <option value="">Select Department</option>
                            <?php 
                                $query = 'select dname from departments';
                                $result = mysqli_query($con, $query);
                                while($row = mysqli_fetch_array($result)){
                                    ?> <option value="<?php echo $row['dname'];?>"><?php echo $row['dname']; };?> </option> 
                            </select> <br><br>

                        <input type="submit">
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>