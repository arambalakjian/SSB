<?php

class ArticleIdea extends DataObject
{
	static $db = array(
		'Title' => 'Text',
		'Rating' => 'Int'
	);

	static $has_one = array(
		'Member' => 'Member'
	);

	static $has_many = array(
		'ArticleVotes' => 'ArticleVote'
	);

	static $summary_fields = array(
		'Title',
		'Rating'		
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));
		$fields->addFieldToTab('Root.Main', new ReadOnlyField('Rating', 'Rating'));

		$gridFieldConfig = new GridFieldConfig_RecordEditor();
		$list = $this->ArticleVotes();
		$gridField = new GridField('ArticleVotes', 'ArticleVotes', $list, $gridFieldConfig);
		$fields->addFieldToTab('Root.ArticleVotes', $gridField);

		return $fields;
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
		else if($numVotes = ArticleVote::get()->filter(array('ArticleIdeaID' => $this->ID))->Count())
		{
			$this->Rating = $numVotes;
			$this->write();
		}
	}

	/**
	 * Check whether the current user is allowed to vote for the idea 
	 * 
	 * @return Boolean
	 */
	public function getAllowVote()
	{
		if($member = Member::currentUser())
		{
			if($articleVote = ArticleVote::get()->filter(array('MemberID' => $member->ID, 'ArticleIdeaID' => $this->ID))->First())
			{
				return false;
			}
			else return true;
		}
	}

	/**
	 * Return a link to vote for the article 
	 * 
	 * @return String
	 */
	public function getVoteLink()
	{
		return singleton('Vote_Controller')->Link() . 'article/' . $this->ID;
	}
}