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

	static $summary_fields = array(
		'ClassName' => 'Class',
		'Title' => 'Title',
		'ContentPreview' => 'Content'		
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
	 * get a preview of the content for the block 
	 * 
	 * @return String
	 */
	public function ContentPreview()
	{
		return null;
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