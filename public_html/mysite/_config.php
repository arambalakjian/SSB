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


Object::add_extension('ViewListingPage', 'TwitterFeedExtension');

TwitterFeedExtension::$twitter_cache_enabled = false; //optional

TwitterFeedExtension::$twitter_cache_key = ''; //optional - required if $twitter_cache_enabled is true
TwitterFeedExtension::$twitter_cache_id = ''; //optional - required if $twitter_cache_enabled is true

TwitterFeedExtension::$twitter_consumer_key = 'zDglt0Syk4Odlk59V6cCjqsUw'; //required
TwitterFeedExtension::$twitter_consumer_secret = 'tmuYIpyQHggu7Ke3wgfeDRb8DyFHJGagxJAuAzsSaiCNcC9mea'; //required
TwitterFeedExtension::$twitter_oauth_token = '189499763-Ceda3fx17trpHuBU9N0UCDKgwGJHtUoTR0TXD9hB'; //required
TwitterFeedExtension::$twitter_oauth_token_secret = 'F3iJ8FXhgqUim9PdQYkcgmjTD98Vh56xiBBnNbRi6WARF'; //required

TwitterFeedExtension::$twitter_search_term = '#silverstripe';