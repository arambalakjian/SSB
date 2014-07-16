<?php


class AddSiteForm extends Form 
{
	
    function __construct($controller, $name) 
	{
		//Get the requirements
		$this->getJS($controller);
		
		//Get the fields
	    $fields = $this->getInputFields();
	 	
	    // Create action
	    $actions = new FieldList(
	    	new FormAction('AddSite', 'Submit Site')
	    );
		
		// get the Validator
		$validator = $this->getValidator();

        parent::__construct($controller, $name, $fields, $actions, $validator);
    
    }
   
   	function getInputFields()
	{
		$imageField = new UploadField('Image', 'Image');
		$imageField->setCanAttachExisting(false);
		$imageField->setCanPreviewFolder(false);
		$imageField->setOverwriteWarning(false);
		$imageField->setAllowedMaxFileNumber(1);
		$imageField->setFileEditFields(null);
		$imageField->setFolderName('Uploads/sotm-images');

		return new FieldList(
		    new TextField('Title', '* Title'),
		    new TextField('SiteURL', '* Site URL'),
		    $imageField,
		    new TextareaField('Description', 'Description')
		);
	}
   
   	function getValidator()
	{
		return new RequiredFields('Title');
	}
   
   	function getJS($controller)
	{		
		//block UploadFields forced jQuery
		Requirements::block(THIRDPARTY_DIR . '/jquery/jquery.js');

		Requirements::customScript('
			jQuery(document).ready(function() 
			{
				jQuery("#AddSiteForm_AddSiteForm").validate({
					rules: {
						Title: "required",
						SiteURL: "required"
					},
					messages: {
						Title: "Please add an idea.",
						SiteURL: "Please enter the site URL"
					}
				});		
			});
		');	
		
	}
   
	function AddSite($data, $form) 
	{     
		if($memberId = Member::currentUserId())
		{
			$site = SOTMNominee::create();
			$form->saveInto($site);
			$site->MemberID = $memberId;
			if($site->write())
			{
				return $this->success($form);
			}
		}
	}  

	public function success($form)
	{
		Page_Controller::setAlert('Your site has been submitted', 'success');
		return $form->controller->redirect($form->controller->Link());
	}

}