<?php

class SnippetTag extends DataObjectAsPageCategory
{
	private static $listing_page_class = "ViewListingPage";

	private static $belongs_many_many = array(
		'Snippets' => 'Snippet'
	);
}