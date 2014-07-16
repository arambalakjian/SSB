<?php

class Snippet extends Post
{
	static $listing_page_class = 'SnippetListingPage';

	static $db = array(
		'GistID' => 'Varchar(100)',
		'GistLink' => 'Varchar(255)'
	);

	static $many_many = array(
		'SnippetTags' => 'SnippetTag'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('SnippetTags');

		$fields->addFieldToTab('Root.Main', new ReadOnlyField('GistID', 'Gist ID'), 'Content');
		$fields->addFieldToTab('Root.Main', new ReadOnlyField('GistLink', 'Gist Link'), 'Content');

		$tagField = new CheckboxSetField('SnippetTags', 'Tags', SnippetTag::get()->sort('Title', 'ASC')->map('ID', 'Title'));
		$fields->addFieldToTab('Root.Tags', $tagField);

		return $fields;
	}

	/**
	 * Get a Gist from the ID 
	 * 
	 * @return Array
	 */
	public function getGist()
	{
	  	$siteConfig = SiteConfig::current_site_config();

		if(isset($this->GistID) && $this->GistID > 0)
		{
			if($git = new Github\Client())
			{
				$git->authenticate($siteConfig->GistAccountToken, null, Github\Client::AUTH_HTTP_TOKEN);
				if($gist = $git->api('gist')->show($this->GistID))
				{
					return $gist;
				}
			}
		}
	}

	/**
	 * get a gist embed code 
	 * 
	 * @return String
	 */
	public function getGistEmbed()
	{
		if(isset($this->GistLink))
		{
			return '<script src="' . $this->GistLink . '.js"></script>';
		}
		else
		{
			if($gist = $this->getGist())
			{
				return '<script src="' . $gist['html_url'] . '.js"></script>';
			}
		}
	}

	/**
	 * get a pipe separated string of the file names 
	 * 
	 * @return String
	 */
	public function getGistFileNameString()
	{
		if($gist = $this->getGist())
		{
			$numFiles = count($gist['files']);
			$i = 1;
			$string = '<span class="title">' . $numFiles . ' FILES</span> ';
			foreach($gist['files'] as $name => $content)
			{
				$string .= '<span class="filename">' . $name . '</span>';
				if($i < $numFiles)
				{
					$string .= ' | ';
				}
				$i++;
			}

			return $string;
		}
	}

	/**
	 * get a link to the gist page on github 
	 * 
	 * @return String
	 */
	public function getGistURL()
	{
		if($gist = $this->getGist())
		{
			return $gist['html_url'];
		}
	}

	/**
	 * return a block of html to render on the home page 
	 * 
	 * @return String
	 */
	public function getHomePageHTML()
	{
		return $this->renderWith('SnippetHomePageContent');
	}

	/**
	 * return a block of html to render on the listing page 
	 * 
	 * @return String
	 */
	public function getListingPageHTML()
	{
		return $this->renderWith('SnippetListingPageContent');
	}

	/**
	 * return a block of html to render on the dashboard page 
	 * 
	 * @return String
	 */
	public function getDashboardPageHTML()
	{
		return $this->renderWith('SnippetDashboardPageContent');
	}


	public function onAfterWrite()
	{
		parent::onAfterWrite();	

		$this->Author()->updateSnippetCount();
	}
	public function onAfterDelete()
	{
		parent::onAfterWrite();	

		$this->Author()->updateSnippetCount();
	}
	
	/**
	 * Generate the link to this edit this DataObject Item
	 */
	public function EditLink($action = null)
	{
		//Hack for search results
		if($item = DataObjectAsPage::get()->byID($this->ID))
		{
			//Build link
			if($listingPage = $item->getListingPage())
			{
				return Controller::join_links($listingPage->Link(), 'edit', $item->URLSegment, $action);
			}			
		}
	}
}