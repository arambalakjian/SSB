<?php

class TutorialLevel extends DataObjectAsPageCategory
{
	private static $listing_page_class = "TutorialListingPage";
	private static $listing_page_filter_var = "TutorialLevel";

	private static $has_many = array(
		'Tutorials' => 'Tutorial'
	);
}