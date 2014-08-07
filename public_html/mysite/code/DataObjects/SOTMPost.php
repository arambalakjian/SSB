<?php

class SOTMPost extends Post
{
	static $has_one = array(
		'SOTMNominee' => 'SOTMNominee'		
	);

	public function Link($action = null)
	{
		//get the site of the month page page
		if($page = SOTMPage::get()->First())
		{
			if($this->SOTMNomineeID && $site = $this->SOTMNominee())
			{
				return $page->Link() . 'show/' . $site->Year . '/' . $site->Month;
			}
			else return $page->Link();
		}
	}

	/**
	 * get the month off the nominations
	 */
	public function getNominationMonth()
	{
		if($this->SOTMNomineeID)
		{
			return $this->SOTMNominee()->MonthNameShort;
		}
		else 
		{
			return date('M y', strtotime($this->PublishDate));
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