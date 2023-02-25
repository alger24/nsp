<?php namespace App;

require_once dirname(__DIR__, 1) . '/vendor/autoload.php';

use PDO;
use Dotenv;
use Medoo\Medoo;

// load vlucas/phpdotenv to use $_ENV
$dotenv = Dotenv\Dotenv::createImmutable(dirname(__DIR__, 1));
$dotenv->load();

// Set define variables first
define("DB_TYPE", $_ENV['DB_TYPE']);
define("DB_HOST", $_ENV['DB_HOST']);
define("DB_NAME", $_ENV['DB_NAME']);
define("DB_USER", $_ENV['DB_USER']);
define("DB_PASS", $_ENV['DB_PASS']);
define("DB_CHAR", $_ENV['DB_CHAR']);
define("DB_COL", $_ENV['DB_COL']);
define("DB_TEST", $_ENV['DB_TEST']);

class MedooConnect
{
    public $MedooDB;
    
    public function __construct()
    {
        $this->MedooDB = new Medoo([
            // [required]
            'type' => DB_TYPE,
            'host' => DB_HOST,
            'database' => DB_NAME,
            'username' => DB_USER,
            'password' => DB_PASS,
            'charset' => DB_CHAR,
            'collation' => DB_COL,
            'logging' => true, // enable logging
            'option' => [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION], // enable exceptions

            // [test mode for dummys]
            'testmode' => DB_TEST
        ]);

        if ($this->MedooDB->error) return "Error Connection: " . $this->MedooDB->error;
    }
}
