<?php
$title = "Hospital Management Interface | Search Staff";
include 'header.php';
?>

<HTML>
<title>Default Form</title>
<body>
<section class="main">
                <div class="container">
                    <div class="box">
                    <form action="vstaffquery.php" method="get">
                        <label for="staffType"><b>Filter by Staff Type:</b></label><br>
                        <select name="staffType" id="staffType">
                        <option>All</option>
                        <option>Doctors</option>
                        <option>Nurses</option>
                        </select><br><br>
                        <input type="submit">
                    </form>
                    </div>
                </div>
        </section>
    </body>
</HTML>