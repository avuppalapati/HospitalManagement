<?php
$title = "New Emergency Contact";
include 'header.php';
?>
<html>
    <body>
        <section class="main">
            <div class="container">
                <div class="box">
                    <h1>New Emergency Contact</h1>
                    <form action="necquery.php" method="post">
                        <label for="ecssn">Social Security:</label><br>
                        <input type="password" id="ecssn" name="ecssn" placeholder="XXX-XX-XXXX" maxlength="9" required><br><br>
                        
                        <label for="name">Full Name:</label><br>
                        <input type="text" id="name" name="name" placeholder="John Doe" required><br><br>
                        
                        <label for="phone">Phone Number:</label>
                        <input type="tel" id="phone" name="phone" maxlength="11" required><br><br>

                        <label for="phone">Patient SSN:</label>
                        <input type="password" id="pssn" name="pssn" maxlength="9" required><br><br>
                        <input type="submit"> <input type="reset">
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>