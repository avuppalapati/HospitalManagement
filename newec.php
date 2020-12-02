<?php
$title = "New Emergency Contact";
include 'header.php';
?>
<html>
    <body>
        <section class="main">
            <div class="container">
                <div class="box">
                    <form action="necquery.php" method="post">
                        <label for="ecssn">Social Security:</label><br>
                        <input type="password" id="ecssn" name="ecssn" placeholder="XXX-XX-XXXX" maxlength="9"><br><br>
                        
                        <label for="name">Full Name:</label><br>
                        <input type="text" id="name" name="name" placeholder="John Doe"><br><br>
                        
                        <label for="phone">Phone Number:</label>
                        <input type="tel" id="phone" name="phone" maxlength="11"><br><br>
                        <input type="submit"> <input type="reset">
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>