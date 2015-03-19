<?php

class MemberEmailValidationSiteConfig extends DataExtension
{
	private static $db = array(
		'ValidationEmailContent' => 'Text',
		'ValidationCompleteContent' => 'HTMLText'
	);
}
