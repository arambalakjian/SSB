<?php
/****************
 * 
 * Example SiteConfig
 * 
 */
class CustomSiteConfig extends DataExtension {
	
	static $db = array(
		'SendFormsTo' => 'Varchar(255)',
		'SendEmailsFrom' => 'Varchar(255)',
		'GistAccountToken' => 'Varchar(255)'
	);

	static $has_one = array(
		'AboutPage' => 'SiteTree',
		'WriteForUsPage' => 'SiteTree'		
	);
	
	public function updateCMSFields(FieldList $fields) {
		
		$fields->removeFieldFromTab('Root.Main', 'Theme');
		
		$fields->addFieldToTab("Root.Main", new TextField("SendFormsTo", 'Send submitted forms to (comma separated)'));
		$fields->addFieldToTab("Root.Main", new TextField("SendEmailsFrom", "Send emails 'from' this address (SPF record recommended)"));

		$fields->addFieldToTab('Root.Main', new TreeDropdownField('AboutPageID', 'About Page', 'SiteTree'));
		$fields->addFieldToTab('Root.Main', new TreeDropdownField('WriteForUsPageID', 'Write for us Page', 'SiteTree'));

		$fields->addFieldToTab("Root.Main", new HeaderField("git", "Github API"));
		$fields->addFieldToTab("Root.Main", new TextField("GistAccountToken", "Gist Account Token"));

		$gridFieldConfig = new GridFieldConfig_RecordEditor();
		$list = Version::get();
		$gridField = new GridField('Version', 'Version', $list, $gridFieldConfig);
		$fields->addFieldToTab('Root.Version', $gridField);
   	}
}