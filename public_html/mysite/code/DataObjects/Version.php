<?php

class Version extends DataObjectAsPageCategory
{
	private static $listing_page_class = "SnippetListingPage";
	private static $listing_page_filter_var = "Version";

	private static $has_many = array(
		'Posts' => 'Post'
	);
}