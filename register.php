<?php
require 'php/dry.php';
?>

<?= __headerindex('NSP - Register')  ?>
<!-- BODY START -->

<header>
    <nav>
        <img src="#" alt="neust logo" class="logo">
        <div class="boxLinks">
            <a href="php/admin.php">Admin</a>
            <a href="php/staff.php">Staff</a>
        </div>
    </nav>
</header>

<main>
    <div class="registerBox">
        <form action="<?php __DIR__.'php/handler.php'?>" method="post"></form>

        <a href="php/handler.php" target="_blank" rel="noopener noreferrer">UWU</a>
        
        <button type="submit" name="signupBtn" class="signupBtn" id="signupBtn">
            Register
        </button>
    </div>
</main>

<footer>
    <span class="footerText">Copyright&copy;2023 - MIT</span>
</footer>

<!-- BODY END -->
<?= __footerindex() ?>