<?php
/****************
 * 
 * Example SiteConfig
 * 
 */
class CommentableItem extends DataExtension {
	
	private static $has_many = array(
		'ItemComments' => 'ItemComment'
	);
	
	public function updateCMSFields(FieldList $fields) {
		
		$fields->removeFieldFromTab('Root.Main', 'ItemComments');

		$manager = new DataObjectManager(
			$this->owner,
			'Comments',
			'ItemComment'
		);
		$fields->addFieldToTab('Root.Comments', $manager);
   	}
	
	public function getComments()
	{
		return $this->owner->ItemComments('ParentCommentID = 0', 'Created ASC');
	}
}