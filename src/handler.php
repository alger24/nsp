<?php 
use Medoo\Medoo;
use App\MedooConnect;
use Ramsey\Uuid\Uuid;

require_once dirname(__DIR__, 1) . '/vendor/autoload.php';

// Set Connection
$MedooConnect = new MedooConnect;
$database = $MedooConnect->MedooDB;

// script for registering new users
if (isset($_POST['signUpBtn']) && $_SERVER['REQUEST_METHOD'] === 'POST') {
    // generates uuidv4 for user id
    $uuid = Uuid::uuid4();
    $user_uuid = $uuid->toString();

    // hash user password with bcrypt
    $user_password = $_POST['user_password'];
    /*
    ENABLE THIS LATER BEFORE PRODUCTION
    $user_password = password_hash($user_password, PASSWORD_BCRYPT);
    */

    // create's new user w/ id & hashed pass
    $database->insert('user_main_tbl', [
        'user_uuid' => $user_uuid,
        'user_password' => $user_password,
        'created_at' => Medoo::raw('NOW()')
    ]);

    // remove pass & empty value
    unset($_POST['user_password'], $_POST['signUpBtn']);

    // check if email already exist
    // if ($database->select('user_personal_information', 'user_email', ['user_email' => $_POST['user_email']])) {
    //     return 'Data Error: Email is invalid or already used.';
    // }

    // if email is new then proceed
    $database->insert('user_personal_information', [
        'user_uuid' => $user_uuid,
        'user_first_name' => $_POST['user_first_name'],
        'user_middle_name' => $_POST['user_middle_name'],
        'user_last_name' => $_POST['user_last_name'],
        'user_birth_date' => $_POST['user_birth_date'],
        'user_email' => $_POST['user_email']
    ]);
}

// get the successful queries executed within the transaction
echo $database->log();

var_dump($queries);

// Javascript auto-close tab delay for testing
echo "<script type='text/javascript'>setTimeout('window.close();', 10000);</script>";
