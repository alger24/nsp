<?php namespace App\Model;

use App\MedooConnect;
use PDOException;

require_once dirname(__DIR__, 2) . '/vendor/autoload.php';

class UserModel extends MedooConnect
{
    protected function registerUserModel(array $newArray)
    {
        $database = $this->MedooDB;
        try {
            // begin transaction
            $database->pdo->beginTransaction();

            // creates new user id & insert pass
            $database->insert('user_main_tbl', [
                'user_uuid' => $newArray['user_uuid'],
                'user_password' => $newArray['user_password'],
                'created_at' => Medoo::raw('NOW()')
            ]);

            // insert user personal info
            $database->insert('user_personal_information', [
                'user_uuid' => $newArray['user_uuid'],
                'user_first_name' => $newArray['user_first_name'],
                'user_middle_name' => $newArray['user_middle_name'],
                'user_last_name' => $newArray['user_last_name'],
                'user_birth_date' => $newArray['user_birth_date'],
                'user_email' => $newArray['user_email']
            ]);

            // commmit if succesful
            $database->pdo->commit();
        } catch (PDOException $event) {
            $database->pdo->rollBack();
            return "Catch Error: " . $event->getMessage();
        }
    }
}
