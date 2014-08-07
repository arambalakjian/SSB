<?php


class EditSnippetForm extends Form 
{
	
    function __construct($controller, $name) 
	{
		//Get the requirements
		$this->getJS($controller);
		
		//Get the fields
	    $fields = $this->getInputFields($controller);
	 	
	    // Create action
	    $actions = new FieldList(
	    	new FormAction('EditSnippet', 'Save Changes')
	    );
		
		// get the Validator
		$validator = $this->getValidator();

        parent::__construct($controller, $name, $fields, $actions, $validator);
    
    }
   
   	function getInputFields($controller)
	{
		$snippet = $this->getCurrentSnippet($controller);

		$versionDropdown = new DropdownField('VersionID', 'Version', Version::get()->map('ID', 'Title'), $snippet->VersionID);
		$versionDropdown->setEmptyString('Please select...');

		return new FieldList(
			new HiddenField('SnippetID', 'SnippetID', $snippet->ID),
			new HeaderField('left', 'Snippet Details'),
		    new TextField('Title', '* Title', $snippet->Title),
		    new TextField('GistLink', '* Gist URL', $snippet->GistLink),
		    new TextareaField('Content', 'Content', $snippet->Content),
		    $versionDropdown,
		    new CheckboxSetField('SnippetTags', 'Tags', SnippetTag::get()->map('ID', 'Title')->toArray(), $snippet->SnippetTags()->map('ID', 'Title')->toArray())
		);
	}

	/**
	 * get the snippet being edited 
	 * 
	 * @return Snippet
	 */
	public function getCurrentSnippet($controller)
	{
		if($snippet = $controller->getCurrentItem())
		{
			return $snippet;
		}
		elseif(isset($_POST['SnippetID']))
		{
			return Snippet::get()->byID($_POST['SnippetID']);
		}
	}
   
   	function getValidator()
	{
		return new AddSnippetFormValidator('Title', 'GistLink', 'SnippetID');
	}
   
   	function getJS($controller)
	{
		//block UploadFields forced jQuery
		Requirements::block(THIRDPARTY_DIR . '/jquery/jquery.js');
		
		Requirements::customScript('
			jQuery(document).ready(function() 
			{
				jQuery("#EditSnippetForm_EditSnippetForm").validate({
					rules: {
						Title: "required"
					},
					messages: {
						Title: "Please add a title."
					}
				});		
			});
		');	
		
	} 

	function EditSnippet($data, $form) 
	{   
		if($snip = Snippet::get()->byID($data['SnippetID']))
		{
			if($memberId = Member::currentUserId())
			{
				if($memberId == $snip->AuthorID)
				{			
					$form->saveInto($snip);

					if($snip->writeToStage('Stage'))
					{
						$snip->publish('Stage', 'Live');
						return $this->success($form);
					}
					else return $this->fail($form, 'Your changes could not be saved, please try again.');
				}
				else return $this->fail($form, 'You do not have permission to edit the snippet.');
			}
			else return $this->fail($form, 'You do not have permission to edit the snippet.');
		}
		else return $this->fail($form, 'The snippet could not be found, please try again.');
	}

	public function success($form)
	{
		Page_Controller::setAlert('Your changes have been saved', 'success');
		return $form->controller->redirect($form->controller->Link());
	}

	public function fail($form, $message)
	{
		Page_Controller::setAlert($message, 'error');
		return $form->controller->redirect($form->controller->Link());
	}

}