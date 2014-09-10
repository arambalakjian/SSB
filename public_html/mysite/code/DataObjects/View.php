<?php

class View extends Post
{
	static $listing_page_class = 'ViewListingPage';

	static $db = array(
		'GitLink' => 'Varchar(200)'
	);

	static $many_many = array(
		'ViewTags' => 'ViewTag'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('ViewTags');
		$fields->removeByName('VersionID');

		$fields->addFieldToTab('Root.Main', new TextField('GitLink', 'Git Link'), 'Content');

		$tagField = new CheckboxSetField('ViewTags', 'Tags', ViewTag::get()->sort('Title', 'ASC')->map('ID', 'Title'));
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
		return $this->renderWith('ViewListingPageContent');
	}
}