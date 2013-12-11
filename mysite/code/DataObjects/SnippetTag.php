<?php

class SnippetTag extends DataObject
{
	static $db = array(
		'Title' => 'Varchar(50)'
	);

	static $belongs_many_many = array(
		'Snippets' => 'Snippet'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('Snippets');

		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));

		return $fields;
	}
}