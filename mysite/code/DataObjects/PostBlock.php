<?php

class PostBlock extends DataObject
{
	static $db = array(
		'Title' => 'Varchar(255)',
		'Sort' => 'Int'
	);

	static $has_one = array(
		'Post' => 'Post'
	);

	static $default_sort = 'Sort';

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('PostID');
		$fields->removeByName('Sort');
		
		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));

		return $fields;
	}

	/**
	 * return the blocks HTML 
	 * 
	 * @return String
	 */
	public function getBlockHTML()
	{
		return $this->renderWith($this->ClassName);
	}
}