<?php

class SnippetListingPage extends FilteredListingPage
{
	
}

class SnippetListingPage_Controller extends FilteredListingPage_Controller
{
	static $item_class = 'Snippet';
	
	static $allowed_actions = array(
		'add',
		'edit',
		'AddSnippetForm',
		'filefields'
	);

	private static $ajax_filter = false;	

    private static $filter_settings = array(
        'SnippetTags' => array(
            'Title' => 'Tags',   //Required - Define the Title of the Filter
            'ClassName' => 'SnippetTag', //Required - The Class of the category you are filtering by (the one that extends DataObjectAsPageCategory)
            'Preposition' => 'with',          //Optional - Define the preposition in the filter message, e.g. Products IN x or y category (Defaults to "in")
            'MultiSelect' => true,         //Optional - Select Multiple options at once (default is true)
            'MatchAll' => true             //Optional - Match all the multi selected items, i.e. select a Product which has category x AND y. Requires a Many_Many or Has_Many
        ),
        'Version' => array(
            'Title' => 'Version',   //Required - Define the Title of the Filter
            'ClassName' => 'Version', //Required - The Class of the category you are filtering by (the one that extends DataObjectAsPageCategory)
            'Preposition' => 'of' ,
            'MultiSelect' => false        //Optional - Define the preposition in the filter message, e.g. Products IN x or y category (Defaults to "in")
        )
    );
	
	public function init()
	{
		parent::init();	

		Requirements::customScript(<<<JS

			jQuery(document).ready(function(){
				//match the latest column heights
				jQuery('.snippet-list, .top-snippers').equalHeight();
			});
JS
		);
	}

	public function AddSnippetForm() 
	{
	    return new AddSnippetForm($this, 'AddSnippetForm');
	}

	public function Success()
	{
		return isset($_REQUEST['success']) && $_REQUEST['success'] == "1";
	}

	public function filefields()
	{
		if($urlID = $this->request->param('ID'))
		{
			$data = array(
				'count' => $urlID
			);

			return $this->customise($data)->renderWith(array('GistFileTemplate'));
		}
	}

	/**
	 * return a list of the top snippers 
	 * 
	 * @return DataList
	 */
	public function getTopSnippers($limit = 10)
	{
		return Member::get()->exclude(array('SnippetCount'=>0))->sort('SnippetCount', 'DESC')->limit($limit);
	}
}