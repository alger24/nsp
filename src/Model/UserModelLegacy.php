<?php namespace App\Model;

use App\ConnectDB;
use PDOException;

class UserModelLegacy {
    protected $conn;

    public function __construct()
    {
        $db = ConnectDB::getInstance();
        $this->conn = $db->getConnection();
        
        // test to see if connectdb works
        // var_dump($this->conn);
    }

    // Old Legacy Insert
    protected function insertLegacy(string $tblname, array $data) 
    {
        try {
            $this->conn->beginTransaction();

            // placeholder for sql query
            foreach ($data as $key => $value)
            {
                $fields[] = $key;
                $values[] = ":{$key}";
            }

            /* construct a SQL statement. */
            $sql = "INSERT INTO $tblname (";
            $sql .= implode(", ", $fields) . ") VALUES (";
            $sql .= implode(", ", $values) . ")";

            // prepare sql to bind value
            $stmt = $this->conn->prepare($sql);

            /* binding the values to the prepared statement. */
            foreach ($data as $key => $value)
            {
                $stmt->bindValue(':' . $key, $value);
            }

            $stmt->execute();

            $this->conn->commit();
        } catch(PDOException $e) {
            $this->conn->rollBack();
            echo "Catch Error: " . $e->getMessage();
        }
    }

    protected function initTables($user_uuid)
    {

    }
}