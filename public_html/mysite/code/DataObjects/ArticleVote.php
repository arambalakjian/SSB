<?php

class ArticleVote extends DataObject
{
	static $has_one = array(
		'Member' => 'Member',
		'ArticleIdea' => 'ArticleIdea'
	);

	static $summary_fields = array(
		'Member.Name' => 'Member'		
	);

	/**
	 * Update the attached articles rating after creating/deleting the vote
	 */
	public function onAfterWrite()
	{
		parent::onAfterWrite();

		$this->ArticleIdea()->updateRating();
	}
	public function onAfterDelete()
	{
		parent::onAfterDelete();

		$idea = $this->ArticleIdea();
		$newRating = $idea->Rating - 1;
		$idea->updateRating($newRating);
	}
}