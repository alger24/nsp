<?php namespace App\Controllers;

use App\Models\UsersModel;
use Ramsey\Uuid\Uuid;

class UsersController extends UsersModel {
    public function generateUID()
    {
        $uuid = Uuid::uuid4();
        return $uuid->toString();
    }

    public function userRegister($data) {
        $table = ["tbl_user_main", "tbl_user_info"];
        $uuid = Uuid::uuid4();
        $this->user_uid = "user-".$uuid;
        $this->postInsert($table[0], $data);
    }
}