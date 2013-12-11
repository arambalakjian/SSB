<?php

class SnippetListingPage extends DataObjectAsPageHolder
{
	
}

class SnippetListingPage_Controller extends DataObjectAsPageHolder_Controller
{
	static $item_class = 'Snippet';
	
	static $allowed_actions = array(
		'add',
		'edit',
		'AddSnippetForm',
		'filefields'
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