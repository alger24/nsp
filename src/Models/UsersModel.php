<?php namespace App\Models;

use App\Models\ConnectDB;
use PDOException;


class UsersModel extends ConnectDB
{
    /* 
        Properties 
    */
    public string $user_uid;
    protected $sql;
    protected $conn;

    /*
        Constructor
    */
    public function __construct() {
        $db = ConnectDB::getInstance();
        $this->conn = $db->getConnection();
    }

    public function __destruct() {
        $this->sql = null;
    }

    
    /* 
        Main Methods 
    */

    protected function cstmQuery($query) {
        try {
            $this->conn->beginTransaction();
            $stmt = $this->conn->prepare($query);
            $stmt->execute();

        } catch(PDOException $event) {
            $this->conn->rollBack();
            echo "Fatal Error: " . $event->getMessage();
        }
    }
    // Insert a new data column to an existing table
    protected function postInsert($tblname, $data) {
        try {
            $this->conn->beginTransaction();
            // NOTE: Replace the throw to return later
            if(!isset($tblname) || !isset($data)) throw new Exception("Error", 01);
            /* Creating an array of keys and values. */
            foreach ($data as $key => $value)
            {
                $fields[] = $key;
                $values[] = ":{$key}";
            }
            /* It's adding the user_uid to the fields and values array. */
            if($this->user_uid) {
                array_push($fields, 'user_uid');
                array_push($values, ':user_uid');
            }
            /* Creating a SQL statement. */
            $sql = "INSERT INTO $tblname (";
            $sql .= implode(", ", $fields) . ") VALUES (";
            $sql .= implode(", ", $values) . ")";
            $stmt = $this->conn->prepare($sql);
            /* It's binding the values to the prepared statement. */
            foreach ($data as $key => $value)
            {
                $stmt->bindValue(':' . $key, $value);
            }
            $this->user_uid ? $stmt->bindValue(":user_uid", $this->user_uid) : null;
            $stmt->execute();
            $this->conn->commit();
        } 
        catch(PDOException $e) {
            $this->conn->rollBack();
            echo "Fatal Error: " . $e->getMessage();
        }
        return;
    }

    // Read
    protected function read($tblname, $column, $user_uid, $id2name, $uid2) {
        try {
            $this->conn->beginTransaction();
            $sql = "";

            if(!$tblname || is_array($tblname)) {
                echo "Warning read only requires a single table name.";
                die;
            }
    
            if($column && !is_array($column)){
                $sql = "SELECT $column FROM $tblname";
            } else {
                $sql = "SELECT * FROM $tblname";
            }
    
            if($user_uid && $user_uid === $this->user_uid) {
                $sql .= " WHERE user_uid = :user_uid";
                if($id2name && $uid2) $sql .= " AND $id2name = :$id2name";
            }

            $stmt = $this->conn->prepare($sql);
            $stmt->bindValue(":user_uid", $this->user_uid);
            if($id2name && $uid2) $stmt->bindValue(":$id2name", $uid2);
            $stmt->execute();
            $this->conn->commit();
        } 
        catch(PDOException $e) {
            $this->conn->rollBack();
            echo "Fatal Error: " . $e->getMessage();
        }
        
        return $stmt->fetch_assoc();
    }

    // Update
    protected function update($tblname, $data, $id2name, $uid2) {
        if(!$tblname && !$data) {
            echo "Warning table or data are empty.";
            return;
        }

        try {
            $this->conn->beginTransaction();

            foreach ($data as $key => $value) {
                $pairs[] = "{$key} = :{$key}";
            }

            $sql = "UPDATE $tblname SET ";
            $sql .= implode(", ", $pairs) . " WHERE user_uid=:user_uid";
            if($id2name && $uid2) $sql .= " AND $id2name=:$id2name";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindValue(':user_uid', $this->user_uid);
            if($id2name && $uid2) $stmt->bindValue(":$id2name", $uid2);

            foreach ($data as $key => $value) {
                $stmt->bindValue(':' . $key, $value);
            }

            $stmt->execute();
            $this->conn->commit();
        }

        catch(PDOException $e) {
            $this->conn->rollBack();
            echo "Fatal Error: " . $e->getMessage();
        }

        return;
    }

    // Delete
    protected function delete($tblname, $id2name, $uid2) {
        if(!$this->user_uid && !$tblname) {
            echo "Warning User and table should not be empty!";
        }

        try {
            $this->conn->beginTransaction();
            $sql = "DELETE FROM $tblname WHERE user_uid=:user_uid";
            if($id2name && $uid2) $sql .= " AND $id2name=:$id2name";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindValue(":user_uid", $this->user_uid);
            if($id2name && $uid2) $stmt->bindValue(":$id2name", $uid2);
            $stmt->execute();
            $this->conn->commit();
        }

        catch(PDOException $e) {
            $this->conn->rollBack();
            echo "Fatal Error: " . $e->getMessage();
        }

        return;
    }

    // File uploud
    
}
