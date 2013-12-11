<?php

class TutorialTag extends DataObject
{
	static $db = array(
		'Title' => 'Varchar(50)'
	);

	static $belongs_many_many = array(
		'Tutorials' => 'Tutorial'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('Tutorials');

		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));

		return $fields;
	}
}