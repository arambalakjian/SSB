<?php

class TutorialTag extends DataObjectAsPageCategory
{
	private static $listing_page_class = "TutorialListingPage";
	private static $listing_page_filter_var = "TutorialTags";
	
	private static $belongs_many_many = array(
		'Tutorials' => 'Tutorial'
	);
}