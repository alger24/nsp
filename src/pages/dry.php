<?php

/* 
*   @index.php header & footer template 
*/
function __headerindex($title) {
return <<<HTML
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$title</title>
<link rel="stylesheet" href="css/temp-style.css">
</head>
<body>
<div class="app">
HTML;
}

function __footerindex() {
return <<<HTML
</div>
<script src="js/main.js"></script>
</body>
</html>
HTML;
}

// Nav outside php folder NOTE: Edit later
function __headernav() {
return <<<HTML
<nav>
<div class="navLinks">
<a href="./index.php">Home</a>
<a href="./register.php">Register</a>
</div>
</nav>
HTML;
}
?>