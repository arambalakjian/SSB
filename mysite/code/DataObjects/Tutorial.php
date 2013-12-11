<?php

class Tutorial extends Post
{
	static $listing_page_class = 'TutorialListingPage';

	static $db = array(
		'GitLink' => 'Varchar(200)'
	);

	static $has_one = array(
		'TutorialLevel' => 'TutorialLevel'		
	);

	static $many_many = array(
		'TutorialTags' => 'TutorialTag'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('TutorialTags');

		$fields->addFieldToTab('Root.Main', new TextField('GitLink', 'Git Link'));

		$levelField = new DropdownField('TutorialLevelID', 'Level', TutorialLevel::get()->map('ID', 'Title'));
		$levelField->setEmptyString('Please select...');
		$fields->addFieldToTab('Root.Main', $levelField);

		$tagField = new CheckboxSetField('TutorialTags', 'Tags', TutorialTag::get()->sort('Title', 'ASC')->map('ID', 'Title'));
		$fields->addFieldToTab('Root.Tags', $tagField);

		return $fields;
	}

	/**
	 * return a block of html to render on the listing page 
	 * 
	 * @return String
	 */
	public function getListingPageHTML()
	{
		return $this->renderWith('TutorialListingPageContent');
	}

	/**
	 * Check if the tutorial has a code block () 
	 * 
	 * @return Boolean
	 */
	public function hasCodeBlock()
	{
		if($blocks = $this->PostBlocks()->filter(array('ClassName'=>'CodeBlock')))
		{
			return true;
		}
	}
}