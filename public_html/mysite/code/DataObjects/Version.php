<?php

class Version extends DataObjectAsPageCategory
{
	private static $listing_page_class = "SnippetListingPage";

	private static $has_many = array(
		'Posts' => 'Post'
	);
}