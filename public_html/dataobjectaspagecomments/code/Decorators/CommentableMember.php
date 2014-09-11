<?php
/****************
 * 
 * Example SiteConfig
 * 
 */
class CommentableMember extends DataExtension {
	
	private static $has_many = array(
		'ItemComments' => 'ItemComment'
	);
	
	public function updateCMSFields(FieldList $fields) {
		
		$fields->removeByName('ItemComments');

		$gridConfig = GridFieldConfig_RecordEditor::create();
		$gridField = new GridField('ItemComments', 'Comments', $this->owner->ItemComments(), $gridConfig);
		$fields->addFieldToTab('Root.Comments', $gridField);
   	}
}