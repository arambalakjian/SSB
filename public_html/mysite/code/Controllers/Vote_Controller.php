<?php

class Vote_Controller extends Controller
{
	const URLSegment = 'vote';


	static $allowed_actions = array(
		'article',
		'site',
		'sitewinner'
	);
	
	/**
	 * Handle votes for article ideas
	 */
	public function article()
	{
		if($params = $this->request->params())
		{
			if(isset($params['ID']))
			{
				if($articleIdea = ArticleIdea::get()->byID($params['ID']))
				{
					if($memberID = Member::currentUserID())
					{
						if($articleVote = ArticleVote::get()->filter(array('MemberID' => $memberID, 'ArticleIdeaID' => $articleIdea->ID))->First())
						{
							Page_Controller::setAlert('You can only vote for each article once', 'danger');
							return $this->redirectBack();
						}
						else
						{
							$vote = ArticleVote::create();
							$vote->MemberID = $memberID;
							$vote->ArticleIdeaID = $articleIdea->ID;
							$vote->write();

							Page_Controller::setAlert('Your vote has been added', 'success');
							return $this->redirectBack();
						}
					}
				}
			}
		}
	}

	/**
	 * Handle votes for site of the month
	 */
	function site()
	{
		if($params = $this->request->params())
		{
			if(isset($params['ID']))
			{
				if($site = SOTMNominee::get()->byID($params['ID']))
				{
					if($site->Month == date('n') && $site->Year == date('Y'))
					{
						if($memberID = Member::currentUserID())
						{
							if($siteVote = SiteVote::get()->filter(array('MemberID' => $memberID, 'Month' => $site->Month, 'Year' => $site->Year))->First())
							{
								Page_Controller::setAlert('You have already voted for "' . $siteVote->SOTMNominee()->Title . '" this month.', 'danger');
								return $this->redirectBack();
							}
							else
							{
								$vote = SiteVote::create();
								$vote->MemberID = $memberID;
								$vote->SOTMNomineeID = $site->ID;
								$vote->Month = $site->Month;
								$vote->Year = $site->Year;
								$vote->write();

								Page_Controller::setAlert('Your vote has been registered', 'success');
								return $this->redirectBack();
							}
						}
					}
					else
					{
						Page_Controller::setAlert('Voting for ' . $site->getMonthName() . ' is currently closed.', 'danger');
						return $this->redirectBack();
					}
				}
			}
		}
	}

	/**
	 * assign the site of the month winner and create a new post
	 */
	public function sitewinner()
	{
		//get the previous month/year
		$year = date('Y');
		$month = date('n');
		if($month == 1)
		{
			$year = $year-1;
			$month = 12;
		}
		else $month = $month-1;

		//find the winner
		$winner = SOTMNominee::get()->filter(array('Accepted' => true, 'Month' => $month, 'Year' => $year))->sort('Rating', 'DESC')->First();
		$winner->Winner = true;
		//create a post
		if($winner->write())
		{
			$post = SOTMPost::create();
			$post->Title = "Site of the Month: " . $winner->getMonthName();
			$post->SOTMNomineeID = $winner->ID;
			$post->PublishDate = date('Y-m-d H:i:s');
			$post->write();
		}
	}

	/**
	 * get the urlsegment 
	 * 
	 * @return String
	 */
	public function getURLSegment()
	{
		return self::URLSegment;
	}

	/**
	 * Get a link to the controller 
	 * 
	 * @return String
	 */
	public function Link()
	{
		return Director::baseURL() . $this->getURLSegment() .'/';
	}
}