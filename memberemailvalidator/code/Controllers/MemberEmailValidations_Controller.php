<?php

class MemberEmailValidation_Controller extends Page_Controller {
	
	static $allowed_actions = array(
		'validateemail',
		'sendemailvalidation',
		'validated'
	);
	
	function init() 
	{
		parent::init();

	}

	public function validated()
	{
		$siteConfig = SiteConfig::current_site_config();
		
		$data = array(
			'Content' => $siteConfig->ValidationCompleteContent
		);
		
		return $this->customise($data);
	}
	
	public function getSelectedMember()
	{
		$Params = $this->request->latestParams();
		
		if($SelectedMember = DataObject::get_by_id('Member', (int)$Params['ID']))
		{
			return $SelectedMember;
		}
	}
	
	//action for validating email addresses
	function validateemail()
	{
		$code = Convert::raw2sql($this->request->getVar('code'));
		
		if($code && $member = DataObject::get_one('Member', "EmailValidationCode = '$code'"))
		{
			$member->ValidateEmail($code);
			$member->login();

			return $this->redirect($this->Link() . 'validated');
		}
		else
		{
			$this->setAlert('Oops something went wrong...we couldn\'t validate your email address.','bad');
			return $this->redirectBack();
		}
	}	
	
	//TEMPLATE For displaying membevrs
	function sendemailvalidation()
	{
		if($member = Member::CurrentUser())
		{
			$member->sendValidationEmail();
			$this->setAlert('Email has been sent, simply click the link in the email to validate your address.','good');
		}
		else
		{
			$this->setAlert('Oops, you need to be logged in to validate your address.','bad');
		}

		return $this->redirectBack();
	}
}