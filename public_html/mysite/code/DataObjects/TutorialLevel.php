<?php

class TutorialLevel extends DataObjectAsPageCategory
{
	private static $listing_page_class = "TutorialListingPage";

	private static $has_many = array(
		'Tutorials' => 'Tutorial'
	);
}