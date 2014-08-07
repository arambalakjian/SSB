<?php

class ViewTag extends DataObjectAsPageCategory
{
	private static $listing_page_class = "ViewListingPage";
	private static $listing_page_filter_var = "ViewTags";

	private static $belongs_many_many = array(
		'Views' => 'View'
	);
}