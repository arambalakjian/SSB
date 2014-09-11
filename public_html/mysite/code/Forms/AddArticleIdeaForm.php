<?php


class AddArticleIdeaForm extends Form 
{
	
    function __construct($controller, $name) 
	{
		//Get the requirements
		$this->getJS($controller);
		
		//Get the fields
	    $fields = $this->getInputFields();
	 	
	    // Create action
	    $actions = new FieldList(
	    	new FormAction('AddArticleIdea', 'Submit Idea')
	    );
		
		// get the Validator
		$validator = $this->getValidator();

        parent::__construct($controller, $name, $fields, $actions, $validator);
    
    }
   
   	function getInputFields()
	{
		return new FieldList(
		    new TextField('Title', 'Idea')
		);
	}
   
   	function getValidator()
	{
		return new RequiredFields('Title');
	}
   
   	function getJS($controller)
	{		
		Requirements::customScript('
			jQuery(document).ready(function() 
			{
				jQuery("#AddArticleIdeaForm_AddArticleIdeaForm").validate({
					rules: {
						Title: "required"
					},
					messages: {
						Title: "Please add an idea."
					}
				});		
			});
		');	
		
	}
   
	function AddArticleIdea($data, $form) 
	{      
		$idea = ArticleIdea::create();
		$form->saveInto($idea);

		if($memberId = Member::currentUserId())
		{
			$idea->MemberID = $memberId;
		}
		else
		{
			Page_Controller::setAlert('You need to be logged in to submit an idea.', 'danger');
			return $form->controller->redirect($form->controller->Link());
		}

		if($idea->write())
		{
			//create an initial vote for the current member
			$vote = ArticleVote::create();
			$vote->ArticleIdeaID = $idea->ID;
			$vote->MemberID = $memberId;

			if($vote->write())
			{
				return $this->success($form);
			}
		}
	}  

	public function success($form)
	{
		Page_Controller::setAlert('Your idea has been added', 'success');
		return $form->controller->redirect($form->controller->Link());
	}

}