<?php

global $project;
$project = 'mysite';

global $databaseConfig;

//Include local DB settings
@include '../local-config.php';

//Standard stuff
MySQLDatabase::set_connection_charset('utf8');
SSViewer::set_theme('SSB');

SiteTree::enable_nested_urls();
GD::set_default_quality(95);

//Decorators
Object::add_extension('SiteConfig', 'CustomSiteConfig');
Object::add_extension('Image', 'ImageExtension');
Object::add_extension('Member', 'UserExtension');

//add voting controller
Director::addRules(100, array(
	Vote_Controller::URLSegment => 'Vote_Controller'
));

//Unset cache if flushing
if (isset($_GET['flush'])) {
	SS_Cache::set_cache_lifetime('any', -1, 100);
}

//Allow searching
FulltextSearchable::enable();
