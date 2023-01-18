<?php

/* 
*   @index.php header & footer template 
*/
function __headerindex($title) {
return <<<HTML
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$title</title>
</head>
<body>
<div class="container">
HTML;
}

function __footerindex() {
return <<<HTML
</div>
<script src="js/index.js"></script>
</body>
</html>
HTML;
}
?>