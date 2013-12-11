<?php

class Version extends DataObject
{
	static $db = array(
		'Title' => 'Varchar(40)'
	);

	static $has_many = array(
		'Posts' => 'Post'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));

		return $fields;
	}
}