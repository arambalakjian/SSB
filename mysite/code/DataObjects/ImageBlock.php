<?php

class ImageBlock extends PostBlock
{
	static $db = array(
		'CaptionLeft' => 'Text',
		'CaptionRight' => 'Text'
	);

	static $has_one = array(
		'ImageLeft' => 'Image',
		'ImageRight' => 'Image'
	);

	public function getCMSFields()
	{
		$fields = parent::getCMSFields();

		$fields->addFieldToTab('Root.Main', $imageField = new UploadField('ImageLeft', 'Left Image'));
		$imageField->setFolderName('Uploads/content-block-images');
		$fields->addFieldToTab('Root.Main', new TextField('CaptionLeft', 'Left image caption'));

		$fields->addFieldToTab('Root.Main', $imageField = new UploadField('ImageRight', 'Right Image'));
		$imageField->setFolderName('Uploads/content-block-images');
		$fields->addFieldToTab('Root.Main', new TextField('CaptionRight', 'Right image caption'));
		
		return $fields;
	}
}