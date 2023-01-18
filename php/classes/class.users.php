<?php
class Users extends Conndb
{
    /* 
        Properties 
    */
    protected string $user_uid;
    protected string $extr_uid;
    protected $sql;
    protected $conn;

    /*
        Constructor
    */
    public function __construct() {
        $db = Conndb::getInstance();
        $this->conn = $db->getConnection();
    }

    /*
        Destruct
    */
    public function __destruct() {
        $this->sql = null;
        $this->conn = null;
    }


    /* 
        Getter & Setter
    */

    protected function getUID() {
        return $user_uid = $this->user_uid;
    }

    protected function setUID($setuser_uid) {
        $this->user_uid = $setuser_uid;
    }


    /* 
        Main Methods 
    */


    protected function sInsert($tblname, $data) {
        try {
            $this->conn->beginTransaction();
            



        } catch(PDOException $e) {
            $this->conn->rollBack();
            echo "Fatal Error: " . $e->getMessage();
        }
    }

    // Create
    protected function multiInsert($tblname, array $data) {
        try {
            $this->conn->beginTransaction();

            // create(Legacy)
            if($data && $tblname) {

                /* Creating an array of keys and values. */
                foreach ($data as $key => $value)
                {
                    $fields[] = $key;
                    $values[] = ":{$key}";
                }

                if($this->user_uid) {
                    array_push($fields, 'user_uid');
                    array_push($values, ':user_uid');
                }

                $sql = "INSERT INTO $tblname (";
                $sql .= implode(", ", $fields) . ") VALUES (";
                $sql .= implode(", ", $values) . ")";

                $stmt = $this->conn->prepare($sql);

                $this->user_uid ? $stmt->bindValue(":user_uid", $this->user_uid) : null;
                
                /* It's binding the values to the keys. */
                foreach ($data as $key => $value)
                {
                    $stmt->bindValue(':' . $key, $value);
                }

                $stmt->execute();
            }
            
            /*
            // If there are two ID's inserted
            // NOTE GET THIS OUT OF HERE TO USER CONTROL!!!
            if($id2name) {
                array_push($fields, $id2name);
                $sql .= ":{$id2name}";
                $stmt->bindValue(":{$id2name}", bin2hex(random_bytes(24)));
            }
            // Create only w/ id
            if(!$data && is_array($tblname)) {
                foreach($tblname as $table)
                {
                    $sql = "INSERT INTO $table (user_uid) VALUE ?";
                    $stmt = $this->conn->prepare($sql);
                    $stmt->execute($this->user_uid);
                }
            } 
            */

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
