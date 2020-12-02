<?php
$title = "Hospital Management Interface | Search Patients";
include 'header.php';
?>

<HTML>
<title>Default Form</title>
<body>
<section class="main">
                <div class="container">
                    <div class="box">
                    <form action="vpatientquery.php" method="get">
                        <label for="diagnosis"><b>Filter by Diganosis:</b></label><br>
                        <textarea name="diagnosis" id="diagnosis" cols="70" rows="10" placeholder="Type Here"></textarea><br><br>
                        <input type="submit"> <input type="reset">
                    </form>
                    </div>
                </div>
        </section>
    </body>
</HTML>
                        