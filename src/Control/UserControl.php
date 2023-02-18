<?php namespace App\Control;

require_once dirname(__DIR__, 2) . '/vendor/autoload.php';

use App\MedooConnect;
use Ramsey\Uuid\Uuid;

class UserControl extends MedooConnect {
    // Properties
    

    // Methods

    // Generates a universally unique identifier for user id using ramsey/uuid
    private function generateUID()
    {
        $uuid = Uuid::uuid4();
        return $uuid->toString();
    }

}