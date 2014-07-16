<?php

class EditProfileFormValidator extends RequiredFields
{
	/**
	* Allows validation of fields via specification of a php function for validation which is executed after
	* the form is submitted
	*/
	function php($data) 
	{
		$valid = true;
		
		$valid = parent::php($data);
		
		if(isset($data['Empty']) && $data['Empty'] != '')
		{
			$this->validationError(
				'Empty',
				'Please leave this field empty',
				"bad"
			);
			$valid = false;
		}
		
		if(isset($data['Username']) && $member = Member::get()->filter(array('Username' => $data['Username']))->First())
		{
			if(Member::currentUserID() != $member->ID)
			{
				$this->validationError(
					'Username',
					'Sorry, that username is already in use.',
					"bad"
				);
				$valid = false;
			}
		}
		
		if(isset($data['Email']) && $member = Member::get()->filter(array('Email' => $data['Email']))->First())
		{
			if(Member::currentUserID() != $member->ID)
			{
				$this->validationError(
					'Email',
					'Sorry, that email address is already in use.',
					"bad"
				);
				$valid = false;
			}
		}

		return $valid;
	}
}