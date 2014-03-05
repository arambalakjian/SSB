<?php
class ItemComment extends DataObject {

	static $plural_name = 'Comments';
	static $singular_name = 'Comment';
	
	static $db = array (
		'Comment' => 'Text'
	);
	
	static $has_one = array(
		'Author'=>'Member',
		'Item' => 'DataObjectAsPage',
		'ParentComment' => 'ItemComment'
	);
	
	static $has_many = array(
		'Replies' => 'ItemComment'
	);
	
	public function getCMSFields() 
	{
		$fields = parent::getCMSFields();
		
		$fields->addFieldToTab('Root.Main', new TextareaField('Comment'));

		return $fields;
	}
	
	public function isAuthor()
	{
		return (Member::currentUserID() == $this->AuthorID);
	}
	
	public function EditLink()
	{
		if($controller = Controller::curr())
		{
			return $controller->Link() . 'EditComment?edit=' . $this->ID;
		}
	}
	
	public function DeleteLink()
	{
		if($controller = Controller::curr())
		{
			return $controller->Link() . 'DeleteComment?comment=' . $this->ID;
		}
	}
	
	public function ReportLink()
	{
		return Controller::Curr()->Link() . 'report/' . $this->ID;
	}
	
	public function Link()
	{
		return $this->Item()->Link() . '#comment_' . $this->ID;
	}
	
	public function AbsoluteLink($urlEncode = false)
	{
		$link = $this->Item()->AbsoluteLink() . '#comment_' . $this->ID;
		
		if($urlEncode) $link = urlencode($link);
		
		return $link;
	}
	
	public function URLComment($limitChars = 80)
	{
		$comment = $this->dbObject('Comment')->LimitCharacters($limitChars);
		
		return urlencode($comment);
	}
	
	public function ItemCommentForm()
	{
		return Controller::Curr()->ItemCommentForm($this->ID);
	}
}

