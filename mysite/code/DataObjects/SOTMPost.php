<?php

class SOTMPost extends Post
{
	static $has_one = array(
		'SOTMNominee' => 'SOTMNominee'		
	);

	public function Link($action = null)
	{
		if($site = $this->SOTMNominee())
		{
			//get the site of the month page page
			if($page = SOTMPage::get()->First())
			{
				return $page->Link() . 'show/' . $site->Year . '/' . $site->Month;
			}
		}
	}

	/**
	 * return a block of html to render on the listing page 
	 * 
	 * @return String
	 */
	public function getListingPageHTML()
	{
		return $this->renderWith('SOTMListingPageContent');
	}
}