<?php

class TutorialLevel extends DataObject
{
	static $db = array(
		'Title' => 'Varchar(40)'
	);

	static $has_one = array(
		'TutorialListingPage' => 'TutorialListingPage'		
	);

	static $has_many = array(
		'Tutorials' => 'Tutorial'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('TutorialListingPageID');
		$fields->removeByName('Tutorial');

		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));

		return $fields;
	}
}