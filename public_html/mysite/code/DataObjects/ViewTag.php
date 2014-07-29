<?php

class ViewTag extends DataObjectAsPageCategory
{
	private static $listing_page_class = "ViewListingPage";

	private static $belongs_many_many = array(
		'Views' => 'View'
	);
}