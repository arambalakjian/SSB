<?php

class ItemComment_Controller extends DataExtension
{
	public static $comment_class = 'ItemComment';
	
	public static $allowed_actions = array(
		'ItemCommentForm',
		'EditCommentForm',
		'EditComment',
		'DeleteComment',
		'report'
	);

	public function onBeforeInit()
	{

		
		
	}
	
	public function ReplyToCommentForm()
	{
		if($commentID = $this->owner->getVar('replyto'))
		{
			$form = $this->ItemCommentForm($commentID);
			if($this->owner->getRequest()->isAjax())
			{
				return $form->forTemplate();			
			}
			else
			{
				$data = array('Form' => $form);
				return $this->owner->renderWith('Page', $data);
			}
		}
	}

	//Edit Profile form
	function ItemCommentForm($parentCommentID = null, $edit = null, $name = 'ItemCommentForm') 
	{
		if($Member = Member::CurrentUser())
		{
			$fields = new FieldList(
				new TextareaField('Comment', 'Comment'),
				new HiddenField('AuthorID', 'AuthorID', $Member->ID)
			);	
	
			//Set Current Item
			if($Item = $this->owner->getCurrentItem())
			{
				$fields->push(new HiddenField('ItemID', 'ItemID', $Item->ID));
			}
			
			//Set Reply to if applicable
			if($parentCommentID)
			{
				$fields->push(new HiddenField('ParentCommentID', 'ParentCommentID', $parentCommentID));
			}
		 	
		    // Create action
		    $actions = new FieldList(
				new FormAction('SubmitComment', 'Add comment >')
		    );
			// Create action
			$validator = new ItemCommentFormValidator('Comment');
		   
			$form = new Form($this->owner, $name, $fields, $actions, $validator);			
			
			$form->addExtraClass('addItemCommentForm');
			
			return $form;
		}
	}	
	
	/*
	 * THIS FUNCTION IS TOTALLY BESPOKE TO MY MUSWELL DUE TO AUTHOR EMAIL NOTIFICATIONS
	 */
	//Save profile
	function SubmitComment($data, $form)
	{
		if($member = Member::CurrentUser())
		{
			$comment = new ItemComment();
			$form->saveInto($comment);
			
			$comment->ItemID = $data['ItemID'];
			
			$comment->write();

			if($item = $this->owner->getCurrentItem($data['ItemID']))
			{
				//Email the author of the page
				$to = SiteConfig::current_site_config()->SendFormsTo;
				
				//Check for an author to notify
				if($member && $item->AuthorID && $member->ID != $item->AuthorID && $author = DataObject::get_by_id('Author', $item->AuthorID))
				{
					$to .= ', ' . $author->Member()->Email; 
				}
				
				 //Set data
				$from = SiteConfig::current_site_config()->SendFormsFrom;
				$subject = "MyMuswell - New Comment posted on " . $item->Title;  	  
				$email = new Email($from, $to, $subject);
				//set template
				$email->setTemplate('CommentPostedNotification');
				//populate template
				$CustomData = new ArrayData(array(
					'Data' => $data,
					'Page' => $item,
					'Member' => $member
				));
				$email->populateTemplate($CustomData);
				//send mail
				$email->send();							
			}

			if($this->owner->getRequest()->isAjax())
			{
				$comment->Status = 'new';
				return $this->owner->renderWith('ItemComment', $comment);
			}
			else
			{
				Controller::curr()->setAlert('Comment left!','success');
			    $this->owner->redirectBack();
			}
		}
		else
		{
			Controller::curr()->setAlert('You must <a href="Security/login">registered</a> and logged in to leave a comment', 'bad');
			$this->owner->redirectBack();
		}			
	}

	/*
	 * Edit Comment Form bits
	 * 
	 * 
	 */
	public function EditComment()
	{
		if($commentID = $this->owner->request->getVar('edit'))
		{
			if(is_numeric($commentID))
			{
				$form = $this->EditCommentForm($commentID);
				
				if($this->owner->getRequest()->isAjax())
				{
					return $form->forTemplate();
				}
				else
				{
					$data = array(
						'Form' => $form,
						'Title' => 'Edit your comment'
					);
					return $this->owner->renderWith('Page', $data);
				}					
			}
		}
	}
	
	//Edit comment form
	function EditCommentForm($commentID = null) 
	{
		$Member = Member::CurrentUser();

		$fields = new FieldList();

		if(is_numeric($commentID) && $comment = DataObject::get_by_id('ItemComment', $commentID))
		{			
			$fields->push(new TextareaField('Comment', '', $comment->Comment, 5, 10));
			$fields->push(new HiddenField('AuthorID', 'AuthorID', $Member->ID));
			$fields->push(new HiddenField('CommentID', 'CommentID', $commentID));				
		}
		
	    // Create action
	    $actions = new FieldList(
			new FormAction('SaveComment', 'Save'),
			new FormAction('CancelEdit', 'Cancel')
	    );
		// Create action
		$validator = new ItemCommentFormValidator('Comment');
	   
		$form = new Form($this->owner, 'EditCommentForm', $fields, $actions, $validator);	

		$form->addExtraClass('editItemCommentForm');
		
		return $form;			
	}

	//Cancel the edit
	function CancelEdit($data)
	{
		if(is_numeric($data['CommentID']) && $comment = DataObject::get_by_id('ItemComment', $data['CommentID']))
		{
			if($this->owner->getRequest()->isAjax())
			{
				return $comment->Comment;
			}
			else 
			{
				return $this->owner->redirect($comment->Item()->Link());
			}			
		}
	}
	
	//Edit Comment
	function SaveComment($data, $form)
	{
		$commentID = $data['CommentID'];
		
		if(($member = Member::CurrentUser()) && is_numeric($commentID) && ($comment = DataObject::get_by_id('ItemComment', $commentID)))
		{
			if($member->ID == $comment->AuthorID)
			{
				$comment->Comment = $data['Comment'];
				
				$comment->write();
	
				if($this->owner->getRequest()->isAjax())
				{
					return $comment->renderWith('CommentCenterCol');
				}
				else
				{
					Controller::curr()->setAlert('Comment saved!','Success');
				    $this->owner->redirect($comment->Item()->Link());
				}				
			}
		}		
	}

	function ConfirmDelete()
	{
		$HTML = '

		';	
		
		if($this->owner->isAjax())
		{
			return $HTML;
		}
		else
		{
			$data = array(
				'Title' => 'Delete your comment',
				'Content' => $HTML
			);
			
			return $this->owner->renderWith('Page', $data);
		}
	}

	//Delete a comment
	function DeleteComment()
	{
		//Check we have a comment
		if(($commentID = $this->owner->request->getVar('comment')) && $memberID = Member::currentUserID())
		{
			//Get the comment
			if(is_numeric($commentID) && $comment = DataObject::get_by_id('ItemComment', $commentID))
			{
				//Check permissions
				if($comment->AuthorID == $memberID)
				{
					$link = $comment->Item()->Link();
					$comment->delete();
					
					//Update Item
					if($item = $comment->Item())
					{
						$item->write();	
					}					
					
					if($this->owner->getRequest()->isAjax())
					{
						return true;
					}
					else 
					{
						return $this->redirect($link);
					}						
				}
				else
				{
					Security::PermissionFailure($this->owner, 'You can only delete your own comments!');
				}
			}
		}
		else
		{
			Security::PermissionFailure($this->owner, 'You must be logged in to delete a comment!');
		}		
	}
	
	function report()
	{

		// Send out admin email
		$config = SiteConfig::current_site_config();
		$params = $this->owner->request->latestParams();

		$email = new Email($config->SendFormsFrom,$config->SendFormsTo,'Offensive comment reported on MyMuswell');
		$email->setTemplate('ReportCommentEmail');
		
		if(($CommentID = $params['ID']) && is_numeric($params['ID']))
		{
			$Comment = DataObject::get_by_id('ItemComment', $CommentID);
			
			$templatedata = array(
				'Member' => Member::currentUser(),
				'Comment' => $Comment
			);
	
			$email->populateTemplate($templatedata);
			
			//$email->send();
	
			Page_Controller::setAlert('Thanks for letting us know, we will be looking into it shortly.','success');

			return $this->owner->redirectBack();
		}	
	}
}