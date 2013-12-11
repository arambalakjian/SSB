<?php

class ViewListingPage extends DataObjectAsPageHolder
{

	/**
	 * get a list of all the view types 
	 * 
	 * @return DataList
	 */
	public function getViewTypes()
	{
		return ViewType::get()->sort('Title', 'ASC');
	}
}

class ViewListingPage_Controller extends DataObjectAsPageHolder_Controller
{
	static $item_class = 'View';
	
	public function init()
	{
		parent::init();	

		Requirements::customScript(<<<JS

			jQuery(document).ready(function(){
				//match the latest column heights
				jQuery('.view-list, .tweets').equalHeight();
				jQuery('.post-info, .post-content').equalHeight();
			});
JS
		);
	}
	
}