<?php

class HomePage extends Page
{
	
}

class HomePage_Controller extends Page_Controller
{
	public function init()
	{
		parent::init();	

		Requirements::customScript(<<<JS

			jQuery(document).ready(function(){
				//match the latest column heights
				jQuery('.latest-posts, .latest-snippets').equalHeight();
			});
JS
		);
	}

	/**
	 * get a list of the most recent posts 
	 * 
	 * @return DataList
	 */
	public function getLatestPosts($limit = 5)
	{
		return Post::get()->sort('Created', 'DESC')->exclude(array('ClassName'=>'Snippet'))->limit($limit);
	}

	/**
	 * get a list of the most recent snippets 
	 * 
	 * @return DataList
	 */
	public function getLatestSnippets($limit = 8)
	{
		return Snippet::get()->sort('Created', 'DESC')->limit($limit);
	}
}