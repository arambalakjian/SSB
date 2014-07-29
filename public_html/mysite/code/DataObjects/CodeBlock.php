<?php

class CodeBlock extends PostBlock
{
	static $db = array(
		'Content' => 'Text',
		'Caption' => 'Text'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();
		
		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Filename (include ".ext")'));

		$fields->addFieldToTab('Root.Main', new TextareaField('Content', 'Content'));
		$fields->addFieldToTab('Root.Main', new TextareaField('Caption', 'Caption'));
		
		return $fields;
	}

	/**
	 * strip the file type from the block title 
	 * 
	 * @return String
	 */
	public function getCodeType()
	{
		if($fileSplit = explode('.', $this->Title))
		{
			return $fileSplit[1];
		}
	}

	/**
	 * return the content html escaped for syntax highlighter 
	 * 
	 * @return String
	 */
	public function getEscapedContent()
	{
		return htmlspecialchars($this->Content);
	}
}