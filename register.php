<?php
require 'php/dry.php';
?>

<?= __headerindex('NSP - Register')  ?>
<!-- BODY START -->

<header>

    <?= __headernav() ?>

</header>

<main>
    <div class="registerBox">
        <form action="#" method="get" autocomplete="off">

            <input type="text" name="user_fname" placeholder="First Name" id="user_fname" class="user_fname">
            <input type="text" name="user_mname" placeholder="Middle Name" id="user_mname" class="user_mname">
            <input type="text" name="user_lname" placeholder="Last Name" id="user_lname" class="user_lname">
            <input type="date" name="user_bdate" id="user_bdate" class="user_bdate">
            <input type="email" name="user_email" placeholder="Email" id="user_email" class="user_email">
            <input type="password" name="user_password" placeholder="Password" id="user_password" class="user_password">

            <button type="submit" name="signupBtn" class="signupBtn" id="signupBtn">
                Register
            </button>
        </form>
    </div>
</main>

<footer>
    <span class="footerText">Copyright&copy;2023 - MIT</span>
</footer>

<!-- BODY END -->
<?= __footerindex() ?>