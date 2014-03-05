<?php 

Object::add_extension('SiteConfig', 'MemberEmailValidationSiteConfig');
Object::add_extension('Member', 'MemberEmailValidationExtension');


//add voting controller
Director::addRules(100, array(
	'emailvalidation' => 'MemberEmailValidation_Controller'
));