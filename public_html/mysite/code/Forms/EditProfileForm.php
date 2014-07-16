<?php


class EditProfileForm extends Form 
{
	
    function __construct($controller, $name) 
	{
		//Get the requirements
		$this->getJS();
		
		//Get the fields
	    $fields = $this->getInputFields();
	 	
	    // Create action
	    $actions = new FieldList(
	    	new LiteralField('cancelLink', '<p class="cancelChanges"><a href="' . $controller->Link() . 'edit">Cancel</a>'),
	    	new FormAction('Submit', 'Save Changes'),
	    	new LiteralField('cancelLinkClose', '</p>')
	    );
		
		// get the Validator
		$validator = $this->getValidator();

        parent::__construct($controller, $name, $fields, $actions, $validator);

        $this->loadDataFrom(Member::currentUser());
        //empty the password field
        $data = array('Password' => '');
    	$this->Fields()->setValues($data);
    }
   
   	function getInputFields()
	{
		$member = Member::currentUser();

		$imageField = new UploadField('Image', 'Profile Picture');
		$imageField->setCanAttachExisting(false);
		$imageField->setCanPreviewFolder(false);
		$imageField->setOverwriteWarning(false);
		$imageField->setAllowedMaxFileNumber(1);
		$imageField->setFileEditFields(null);
		$imageField->setFolderName('Uploads/profile-pictures');

		$passField = new ConfirmedPasswordField('Password', 'Password');
		$passField->canBeEmpty = true;

		return new FieldList(
			new HiddenField('MemberID', '', $member->ID),
		    new TextField('FirstName', 'First Name'),
		    new TextField('Surname', 'Surname'),
		    new TextField('Username', '* Username'),
		    new TextField('Email', '* Email'),
		    $passField,
		    new TextField('GithubName', 'Github Username'),
		    new TextField('TwitterName', 'Twitter Username'),
		    new TextField('LinkedInName', 'LinkedIn Username'),
		    new TextField('Website', 'Website'),
		    new TextareaField('Bio', 'Bio'),
		    $imageField
		);
	}
   
   	function getValidator()
	{
		return new EditProfileFormValidator('Username', 'Email');
	}
   
   	function getJS()
	{
		//block UploadFields forced jQuery
		Requirements::block(THIRDPARTY_DIR . '/jquery/jquery.js');

		Requirements::customScript('
			jQuery(document).ready(function() 
			{
				jQuery("#EditProfileForm_EditProfileForm").validate({
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
		if(isset($data['MemberID']) && $data['MemberID'] == Member::CurrentUserID())
		{
			$member = Member::currentUser();
			$form->saveInto($member);
	
			if($member->write())
			{
				//set a success message
				Page_Controller::setAlert('Your profile has been updated!', 'success');
			}
			else
			{
				//set a failure message
				Page_Controller::setAlert('Sorry, your profile could not be updated.  Please try again.', 'danger');
			}
	
						
		}
		else
		{
			Page_Controller::setAlert('Sorry, your profile could not be updated.  Please try again.', 'danger');
		}

		$this->controller->redirect($this->controller->Link() . 'edit');
	}

}