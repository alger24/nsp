<?php
// SWITCHING FROM THIS TO PSR-4 AUTLOAD

// It auto-loads any file it finds starting with class.<classname>.php (LOWERCASE), eg: class.from.php, class.db.php
    spl_autoload_register(function($class_name) {

        // Define an array of directories in the order of their priority to iterate through.
        $dirs = array(
            'php/classes/', // Core classes
            'php/tests/',   // Unit test classes, if using PHP-Unit
            'classes/', // Core classes, inside php
        );

        // Looping through each directory to load all the class files. It will only require a file once.
        // If it finds the same class in a directory later on, IT WILL IGNORE IT! Because of that require once!
        foreach( $dirs as $dir ) {
            if (file_exists($dir.'class.'.strtolower($class_name).'.php')) {
                require_once($dir.'class.'.strtolower($class_name).'.php');
                return;
            }
        }
    });
?>