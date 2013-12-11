<?php

class UserExtension extends DataExtension { 

    static $db = array(
		'Username' => 'Varchar(75)',
		'GithubName' => 'Varchar(100)',
		'TwitterName' => 'Varchar(25)',
		'LinkedInName' => 'Varchar(100)',
		'Website' => 'Varchar(255)',
		'Bio' => 'Text',
		'SnippetCount' => 'Int'
	);

	static $has_one = array(
		'Image' => 'Image'		
	);

	static $has_many = array(
		'Tutorials' => 'Tutorial',
		'Views' => 'View',
		'Snippets' => 'Snippet',
		'SOTMNominees' => 'SOTMNominee'		
	);
	
	public function updateCMSFields(FieldList $fields) 
	{	
		$fields->removeByName('SnippetCount');

		$fields->addFieldToTab('Root.Main', new TextField('Username', 'Username'), 'Email');
		$fields->addFieldToTab('Root.Main', new TextField('Website', 'Website'), 'Locale');
		$fields->addFieldToTab('Root.Main', new TextareaField('Bio', 'Bio'), 'Locale');

		//social media accounts
		$fields->addFieldToTab('Root.SocialMedia', new TextField('GithubName', 'Github name'));
		$fields->addFieldToTab('Root.SocialMedia', new TextField('TwitterName', 'Twitter Name'));
		$fields->addFieldToTab('Root.SocialMedia', new TextField('LinkedInName', 'LinkedIn Name'));

		//profile picture
		$fields->addFieldToTab('Root.Image', $imageField = new UploadField('Image', 'Image'));
		$imageField->setFolderName('Uploads/profile-pictures');

		//grid fields to show posts
		$gridConfig = GridFieldConfig_RecordEditor::create();
		$gridField = new GridField('Tutorials', 'Tutorials', $this->owner->Tutorials(), $gridConfig);
		$fields->addFieldToTab('Root.Tutorials', $gridField);	

		$gridConfig = GridFieldConfig_RecordEditor::create();
		$gridField = new GridField('Views', 'Views', $this->owner->Views(), $gridConfig);
		$fields->addFieldToTab('Root.Views', $gridField);

		$gridConfig = GridFieldConfig_RecordEditor::create();
		$gridField = new GridField('Snippets', 'Snippets', $this->owner->Snippets(), $gridConfig);
		$fields->addFieldToTab('Root.Snippets', $gridField);

		$gridConfig = GridFieldConfig_RecordEditor::create();
		$gridField = new GridField('SOTMNominees', 'SOTM Nominees', $this->owner->SOTMNominees(), $gridConfig);
		$fields->addFieldToTab('Root.SOTMNominees', $gridField);
   	}

   	/**
   	 * update the snippet count
   	 */
   	public function updateSnippetCount()
   	{
   		$numSnippets = Snippet::get()->filter(array('AuthorID' => $this->owner->ID))->count();
   		$this->owner->SnippetCount = $numSnippets;
   		$this->owner->write();
   	}

   	/**
   	 * get a link to the users profile page 
   	 * 
   	 * @return String
   	 */
   	public function getProfileLink()
   	{
   		if($profilePage = ProfilePage::get()->First())
   		{
   			return $profilePage->Link() . 'show/' . $this->owner->ID;
   		}
   	}
}