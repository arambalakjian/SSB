<?php

class MemberEmailValidationExtension extends DataExtension
{
	private static $db = array(
		'EmailValidated' => 'Boolean',
		'EmailValidationCode' => 'Varchar(30)'
	);

	
	function onBeforeWrite()
	{
		if($this->owner->isChanged('Email') || !$this->owner->EmailValidationCode)
		{	
			$this->owner->EmailValidationCode = $this->generateValidationCode();
		}
		if($this->owner->isChanged('Email'))
		{
			$this->owner->EmailValidated = false;
		}
	}
	
	//Get the members comments
	function ValidateEmail($code)
	{
		if($code == $this->owner->EmailValidationCode)
		{
			$this->owner->EmailValidated = true;
			return $this->owner->write();
		}
	}
	
	//Get the members comments
	function getEmailValidationLink()
	{
		return Singleton("MemberEmailValidation_Controller")->absoluteLink() . 'validateemail?code=' . $this->owner->EmailValidationCode;
	}	
		
	function getSendValidationEmailLink()
	{
		return Singleton("MemberEmailValidation_Controller")->Link('sendemailvalidation');
	}	
	
	private function generateValidationCode()
	{
	    $length = 20;
	    $characters = "0123456789abcdefghijklmnopqrstuvwxyz";
	    $string = '';    
	    for ($p = 0; $p < $length; $p++) {
	        $string .= $characters[mt_rand(0, (strlen($characters)-1))];
	    }
	    return $string;
	}
		
	function sendValidationEmail()
	{
		$member = $this->owner;
		
		if($member && $siteConfig = SiteConfig::current_site_config())
		{
			$email = new Email($siteConfig->SendFormsFrom, $member->Email, 'Please Validate your Email address');
				
			$email->setTemplate('MemberEmailValidationEmail');
			
			$data = array(
				'Member' => $member,
				'Content' => $siteConfig->ValidationEmailContent,
				'Link' => $member->getEmailValidationLink()
			);
	
			$email->populateTemplate($data);
			
			$email->send();			
		}
	}	
}
