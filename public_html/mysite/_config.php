<?php

global $project;
$project = 'mysite';

global $databaseConfig;

// Use _ss_environment.php file for configuration
require_once("conf/ConfigureFromEnv.php");

//Standard stuff
MySQLDatabase::set_connection_charset('utf8');

GD::set_default_quality(95);

DataObjectAsPage::enable_versioning();
