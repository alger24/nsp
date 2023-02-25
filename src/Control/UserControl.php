<?php namespace App\Control;

use App\Model\UserModel;

require_once dirname(__DIR__, 2) . '/vendor/autoload.php';

class UserControl extends UserModel {
    public function registerUserControl(array $postData) {
        $database = $this->MedooDB;

        // guard check if email exist
        if($database->has('user_personal_information', ['user_email' => $postData['user_email']])) return "Email incorrect or already exist.";
        
        
        unset($postData['signUpBtn']);

        // insert user_uuid => $new_uuid to beginning of newArray later
        $new_uuid = Ramsey\Uuid\Uuid::uuid4()->toString();
        $postData['user_uuid'] = $new_uuid;

        return $postData;

        // if all steps above are satisfied run the actual insert
        $this->registerUserModel($postData);
    }
}
