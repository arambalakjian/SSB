<?php

class ViewListingPage extends FilteredListingPage
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

class ViewListingPage_Controller extends FilteredListingPage_Controller
{
	static $item_class = 'View';
	
	private static $ajax_filter = false;	

    private static $filter_settings = array(
        'ViewTag' => array(
            'Title' => 'Tags',   //Required - Define the Title of the Filter
            'ClassName' => 'ViewTag', //Required - The Class of the category you are filtering by (the one that extends DataObjectAsPageCategory)
            'Preposition' => 'with',          //Optional - Define the preposition in the filter message, e.g. Products IN x or y category (Defaults to "in")
            'MultiSelect' => true,         //Optional - Select Multiple options at once (default is true)
            'MatchAll' => true             //Optional - Match all the multi selected items, i.e. select a Product which has category x AND y. Requires a Many_Many or Has_Many
        )
    );	
	
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