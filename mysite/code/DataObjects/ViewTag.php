<?php

class ViewTag extends DataObject
{
	static $db = array(
		'Title' => 'Varchar(50)'
	);

	static $belongs_many_many = array(
		'Views' => 'View'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('Views');

		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));

		return $fields;
	}
}