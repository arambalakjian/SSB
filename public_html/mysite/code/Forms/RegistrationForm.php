<?php


class RegistrationForm extends Form 
{
	
    function __construct($controller, $name) 
	{
		//Get the requirements
		$this->getJS();
		
		//Get the fields
	    $fields = $this->getInputFields();
	 	
	    // Create action
	    $actions = new FieldList(
	    	new FormAction('Submit', 'Register')
	    );
		
		// get the Validator
		$validator = $this->getValidator();

        parent::__construct($controller, $name, $fields, $actions, $validator);
    }
   
   	function getInputFields()
	{

		$passField = new ConfirmedPasswordField('Password', 'Password');
		$passField->canBeEmpty = true;

		return new FieldList(
			new LiteralField('colleft', '<div class="col-sm-6">'),
		    new HeaderField('User', 'User'),
		    new TextField('Username', '* Username'),
		    new TextField('Email', '* Email'),
		    new LiteralField('colright', '</div><div class="col-sm-6">'),
		    new HeaderField('Pass', 'Password'),
		    $passField,
		    new LiteralField('colend', '</div>')
		);
	}
   
   	function getValidator()
	{
		return new RegistrationFormValidator('Username', 'Email');
	}
   
   	function getJS()
	{
		//block UploadFields forced jQuery
		Requirements::block(THIRDPARTY_DIR . '/jquery/jquery.js');

		Requirements::customScript('
			jQuery(document).ready(function() 
			{
				jQuery("#RegistrationForm_RegistrationForm").validate({
					rules: {
						Username: "required",
						Email: {
							required: true,
							email: true
						},
						"Password[_ConfirmPassword]": {
			                equalTo: "#Password-_Password"
			            }
					},
					messages: {
						Username: "Please enter a username.",
						Email: "Please enter a valid email address",
						"Password[_ConfirmPassword]": {
			                equalTo: "Your password needs to be the same as above"
			            }
					}
				});			
			});
		');	
		
	}

	/*
	 * Process the form
	 */
	function Submit($data, $form) 
	{
		$member = Member::create();
		$form->saveInto($member);

		if($member->write())
		{
			$member->logIn();
			//set a success message
			Page_Controller::setAlert('Your profile has been created!', 'success');
		}
		else
		{
			//set a failure message
			Page_Controller::setAlert('Sorry, your profile could not be created.  Please try again.', 'danger');
		}

		$this->controller->redirect($this->controller->Link() . 'edit');
	}

}