<?php

class SiteVote extends DataObject
{
	static $db = array(
		'Month' => 'Int',
		'Year' => 'Year'		
	);

	static $has_one = array(
		'Member' => 'Member',
		'SOTMNominee' => 'SOTMNominee'
	);


	/**
	 * Update the attached Sites rating after creating/deleting the vote
	 */
	public function onAfterWrite()
	{
		parent::onAfterWrite();

		$this->SOTMNominee()->updateRating();
	}
	public function onAfterDelete()
	{
		parent::onAfterDelete();

		$idea = $this->SOTMNominee();
		$newRating = $idea->Rating - 1;
		$idea->updateRating($newRating);
	}
}