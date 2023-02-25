<?php namespace App;

require_once dirname(__DIR__, 1) . '/vendor/autoload.php';

use PDO;
use PDOException;
use Dotenv;

// Loads the env file one directory above, that means it will load root nsp/.env
$dotenv = Dotenv\Dotenv::createImmutable(dirname(__DIR__, 1));
$dotenv->load();

// Define constant string to bind & connect to the database
define("DB_HOST", $_ENV['DB_HOST']);
define("DB_NAME", $_ENV['DB_NAME']);
define("DB_USER", $_ENV['DB_USER']);
define("DB_PASS", $_ENV['DB_PASS']);

class ConnectDB
{
    /* 
        Use these to connect to the database
        $db = ConnectDB::getInstance();
        $conn = $db->getConnection();
    */
    private $connection;
    private static $_instance;
    
    private $dbhost = DB_HOST; // Ip Address of database if external connection.
    private $dbname = DB_NAME; // DB Name
    private $dbuser = DB_USER; // Username for DB
    private $dbpass = DB_PASS; // Password for DB
    
    /*
        Get an instance of the Database
        @return Instance
        */
    public static function getInstance()
    {
        if (!self::$_instance) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    // Constructor
    public function __construct()
    {
        try {
            $this->connection = new PDO('mysql:host=' . $this->dbhost . ';dbname=' . $this->dbname, $this->dbuser, $this->dbpass);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // Error handling
        } catch (PDOException $e) {
            die("Failed to connect to DB: " . $e->getMessage());
        }
    }

    // Magic method clone is empty to prevent duplication of connection
    private function __clone()
    {
    }

    // Get the connection	
    public function getConnection()
    {
        return $this->connection;
    }
}


