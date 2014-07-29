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
		
		$fields->removeByName('Root.Main', 'ItemComments');

		$gridFieldConfig = new GridFieldConfig_RecordEditor();
		$list = $this->owner->ItemComments();
		$gridField = new GridField('Comments', 'ArticleVotes', $list, $gridFieldConfig);
		$fields->addFieldToTab('Root.Comments', $gridField);
   	}
	
	public function getComments()
	{
		return $this->owner->ItemComments('ParentCommentID = 0', 'Created ASC');
	}
}