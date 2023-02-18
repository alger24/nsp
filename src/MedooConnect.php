<?php namespace App;

require_once dirname(__DIR__, 1) . '/vendor/autoload.php';

use PDO;
use Dotenv;
use Medoo\Medoo;

$dotenv = Dotenv\Dotenv::createImmutable(dirname(__DIR__, 1));
$dotenv->load();

define("DB_TYPE", $_ENV['DB_TYPE']);
define("DB_HOST", $_ENV['DB_HOST']);
define("DB_NAME", $_ENV['DB_NAME']);
define("DB_USER", $_ENV['DB_USER']);
define("DB_PASS", $_ENV['DB_PASS']);

class MedooConnect {
    protected object $conn;

    public function __construct()
    {
        $this->conn = new Medoo([
            // [required]
            'type' => DB_TYPE,
            'host' => DB_HOST,
            'database' => DB_NAME,
            'username' => DB_USER,
            'password' => DB_PASS,

            // [manual set error type]
            'error' => PDO::ERRMODE_EXCEPTION
        ]);

        if($this->conn->error) {
            $errMsg = "Error Connection: " . $this->conn->error;
            exit($errMsg);
        }
    }
}