<?php

class Post extends DataObjectAsPage
{
	static $db = array(
		'PublishDate' => 'Date'		
	);
	static $has_one = array(
		'Image' => 'Image',
		'Author' => 'Member',
		'Version' => 'Version'
	);

	static $has_many = array(
		'PostBlocks' => 'PostBlock'
	);

	static $plural_name = "posts";
	static $singular_name = "post";

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('AuthorID');
		$fields->removeByName('PostBlocks');
		$fields->removeByName('ItemComments');

		$fields->addFieldToTab('Root.Main', $dateField = new DateField('PublishDate', 'Publish Date'), 'Content');
		$dateField->setConfig('showcalendar', true);

		$memberDropdown = new DropdownField('AuthorID', 'Author', $this->getMembersForDropdown());
		$memberDropdown->setEmptyString('Please select...');
		$fields->addFieldToTab('Root.Main', $memberDropdown, 'URLSegment');

		$versionDropdown = new DropdownField('VersionID', 'Version', $this->getVersionsForDropdown());
		$versionDropdown->setEmptyString('Please select...');
		$fields->addFieldToTab('Root.Main', $versionDropdown, 'URLSegment');

		$fields->addFieldToTab('Root.Image', $imageField = new UploadField('Image', 'Image'));
		$imageField->setFolderName('Uploads/post-images');

		
		//Content blocks
		$gridConfig = GridFieldConfig_RecordEditor::create();
		$gridConfig->removeComponentsByType('GridFieldAddNewButton');
		$gridConfig->addComponent(new GridFieldAddNewMultiClass());
		$gridConfig->addComponent(new GridFieldOrderableRows('Sort'));
		$gridField = new GridField('PostBlocks', 'Post blocks', $this->PostBlocks(), $gridConfig);
		$fields->addFieldToTab('Root.Blocks', $gridField);

		return $fields;
	}

	/**
	 * Get a list of Versions for the dropdown menu 
	 * 
	 * @return Array
	 */
	public function getVersionsForDropdown()
	{
		if($versions = Version::get())
		{
			return $versions->map('ID', 'Title');
		}
		else
		{
			return array('No Versions have been created');
		}
	}

	/**
	 * Get a list of Members for the dropdown menu 
	 * 
	 * @return Array
	 */
	public function getMembersForDropdown()
	{
		if($Members = Member::get())
		{
			return $Members->map('ID', 'Title');
		}
		else
		{
			return array('No Members have been created');
		}
	}

	/**
	 * get a shortened version of the content for the home page listings 
	 * 
	 * @return String
	 */
	public function getContentPreview($maxChars = 60)
	{
		if($content = strip_tags($this->Content))
		{
			if(strlen($content) <= $maxChars)
			{
				return $content;
			}
			else return substr($content, 0, $maxChars-3) . '...';
		}
	}
}