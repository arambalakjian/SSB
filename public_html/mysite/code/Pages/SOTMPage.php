<?php

class SOTMPage extends Page
{

	/**
	 * get a list of the previous winners 
	 * 
	 * @return DataList
	 */
	public function getWinners($limit = 4)
	{
		return SOTMNominee::get()->filter(array('Winner' => true))->sort(array('Year' => 'DESC', 'Month' => 'DESC'))->limit($limit);
	}

	/**
	 * Get Current Nominees 
	 * 
	 * @return DataList
	 */
	public function getCurrentNominees($rand = false)
	{
		$month = date('n');
		$year = date('Y');
		if($rand)
		{
			return SOTMNominee::get()->filter(array('Accepted' => true, 'Year'=>$year, 'Month'=>$month))->sort('RAND()');
		}
		else return SOTMNominee::get()->filter(array('Accepted' => true, 'Year'=>$year, 'Month'=>$month))->sort('Rating', 'DESC');
	}

	/**
	 * get recetly submitted sites 
	 * 
	 * @return DataList
	 */
	public function getRecentSites($limit = 8)
	{
		return SOTMNominee::get()->filter('winner', false)->sort('Created', 'DESC')->limit($limit);
	}

	/**
	 * get the current month 
	 *  
	 * @return Int 
	 */
	public function getCurrentMonth()
	{
		$month = date('n');
		$year = date('Y');
		return mktime(0, 0, 0, $month, 1, $year);
	}

	/**
	 * get the current month string 
	 * 
	 * @return String
	 */
	public function getVotingMonth($format = 'F Y')
	{
		return date($format, $this->getCurrentMonth());
	}

	/**
	 * get the next month string 
	 * 
	 * @return String
	 */
	public function getNextVotingMonth($format = 'F Y')
	{
		return date($format, strtotime('+1 month', $this->getCurrentMonth()));
	}
}

class SOTMPage_Controller extends Page_Controller
{
	static $allowed_actions = array(
		'AddSiteForm',
		'add',
		'show',
		'voteresults'		
	);

	public function init()
	{
		parent::init();

		Requirements::customScript(<<<JS

			jQuery(document).ready(function(){
				//match the latest column heights
				jQuery('.previous-winners, .recent-submissions').equalHeight();
				
			});
JS
		);
	}

	public function AddSiteForm()
	{
		return new AddSiteForm($this, 'AddSiteForm');
	}

	/**
	 * get the winner of a particular month (defined in the URL params)
	 * 
	 * @return SOTMNominee
	 */
	public function getMonthlyWinner()
	{
		if($params = $this->request->params())
		{
			if(isset($params['ID']) && isset($params['OtherID']))
			{
				return SOTMNominee::get()->filter(array('Winner' => true, 'Year' => $params['ID'], 'Month' => $params['OtherID']))->First();
			}
		}
	}

	/**
	 * get all the the nominees for a particlular month (defined in the URL params) 
	 * 
	 * @return DataList
	 */
	public function getMonthlyNominees()
	{
		if($params = $this->request->params())
		{
			if(isset($params['ID']) && isset($params['OtherID']))
			{
				return SOTMNominee::get()->filter(array('Winner' => false, 'Accepted' => true, 'Year' => $params['ID'], 'Month' => $params['OtherID']))->sort('Rating', 'DESC');
			}
		}
	}
}