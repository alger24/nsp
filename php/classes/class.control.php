<?php
class Control extends Users {

    public function __construct()
    {
        $db = connDB::getInstance();
        $this->conn = $db->getConnection();
    }

    public function userRegister() {
        $this->setUID('1234567890');
        $new_uid = $this->getUID();
        return $new_uid;
    }
}


?>