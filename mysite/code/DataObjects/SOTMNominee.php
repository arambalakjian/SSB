<?php

class SOTMNominee extends DataObject
{
	static $db = array(
		'Title' => 'Text',
		'Rating' => 'Int',
		'Description' => 'Text',
		'SiteURL' => 'Varchar(255)',
		'Month' => 'Int',
		'Year' => 'Int',
		'Accepted' => 'Boolean',
		'Winner' => 'Boolean'
	);

	static $has_one = array(
		'Image' => 'Image',
		'Member' => 'Member'
	);

	static $has_many = array(
		'SiteVotes' => 'SiteVote'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->removeByName('Winner');

		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));
		if($this->Winner)
		{
			$fields->addFieldToTab('Root.Main', new HeaderField('winner', 'Winner'));
		}
		$fields->addFieldToTab('Root.Main', new ReadOnlyField('Rating', 'Rating'));
		$fields->addFieldToTab('Root.Main', new TextField('SiteURL', 'Site URL'));
		$fields->addFieldToTab('Root.Main', new NumericField('Month', 'Month'));
		$fields->addFieldToTab('Root.Main', new NumericField('Year', 'Year'));
		$fields->addFieldToTab('Root.Main', new TextareaField('Description', 'Description'));
		$fields->addFieldToTab('Root.Main', $imageField = new UploadField('Image', 'Image'));
		$imageField->setFolderName('Uploads/sotm-images');
		$fields->addFieldToTab('Root.Main', new CheckboxField('Accepted', 'Accepted'));
		$fields->addFieldToTab('Root.Main', new CheckboxField('Winner', 'Winner'));
		$fields->addFieldToTab('Root.Main', new DropdownField('MemberID', 'Submitted by', Member::get()->map('ID', 'Name')));

		$gridFieldConfig = new GridFieldConfig_RecordEditor();
		$list = $this->SiteVotes();
		$gridField = new GridField('SiteVotes', 'SiteVotes', $list, $gridFieldConfig);
		$fields->addFieldToTab('Root.SiteVotes', $gridField);

		return $fields;
	}


	public function onBeforeWrite()
	{
		//if the accepted flag is set to true then set the month and year
		$changed = $this->getChangedFields();
		if(isset($changed['Accepted']) && $changed['Accepted']['before'] == false && $changed['Accepted']['after'] == true)
		{
			if($changed['Accepted']['after'])
			{
				$year = date('Y');
				$month = date('n');

				if($month == 12)
				{
					$this->Month = 1;
					$this->Year = $year+1;
				}
				else
				{
					$this->Month = $month+1;
					$this->Year = $year;
				}
			}
		}

		parent::onBeforeWrite();
	}

	/**
	 * update the current rating
	 */
	public function updateRating($rating = null)
	{
		if(isset($rating))
		{
			$this->Rating = $rating;
			$this->write();
		}
		else if($numVotes = SiteVote::get()->filter(array('SOTMNomineeID' => $this->ID))->Count())
		{
			$this->Rating = $numVotes;
			$this->write();
		}
	}

	/**
	 * Check whether the current user is allowed to vote for the site 
	 * 
	 * @return Boolean
	 */
	public function getAllowVote()
	{
		if($memberID = Member::currentUserID())
		{
			if($SiteVote = SiteVote::get()->filter(array('MemberID' => $memberID, 'Month' => $this->Month, 'Year' => $this->Year))->First())
			{
				return false;
			}
			else return true;
		}
	}

	/**
	 * Return a link to vote for the Site 
	 * 
	 * @return String
	 */
	public function getVoteLink()
	{
		return singleton('Vote_Controller')->Link() . 'site/' . $this->ID;
	}

	/**
	 * Get the month it was entered into as a string 
	 * 
	 * @return String
	 */
	public function getMonthName($format = 'F Y')
	{
		if(isset($this->Month) && isset($this->Year))
		{
			return date($format, mktime(0, 0, 0, $this->Month, 1, $this->Year));
		}
	}

	/**
	 * Get the month it was entered into as a shortened string 
	 * 
	 * @return String
	 */
	public function getMonthNameShort()
	{
		return $this->getMonthName('M y');
	}

	/**
	 * Get vote percentage 
	 * 
	 * @return Int
	 */
	public function getVotePercentage()
	{
		if($allFinalists = SOTMNominee::get()->filter(array('Accepted' => true, 'Year'=>$this->Year, 'Month'=>$this->Month)))
		{
			$totalVotes = 0;
			foreach($allFinalists as $finalist)
			{
				$totalVotes += $finalist->Rating;
			}
		}

		return round((($this->Rating/$totalVotes)*100),1);
	}
}