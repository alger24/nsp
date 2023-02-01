<?php
declare(strict_types=1);

require_once __DIR__ . '/vendor/autoload.php';

use Medoo\Medoo;

define('DB_HOST', $_ENV['DB_HOST']);
define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASS', getenv('DB_PASS'));

// Replace with .env
$pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
     
$database = new Medoo([
    // Initialized and connected PDO object.
    'pdo' => $pdo,
 
    // [optional] Medoo will have a different handle method according to different database types.
    'type' => 'mysql',
    'error' => PDO::ERRMODE_EXCEPTION,
    'testMode' => true
]);

if($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['signupBtn'])) {
    
}

// header('location: ../index.php')
?>