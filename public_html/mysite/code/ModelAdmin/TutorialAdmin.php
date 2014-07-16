<?php

class TutorialAdmin extends DataObjectAsPageAdmin
{
	public static $managed_models = array(
		'Tutorial',
		'TutorialTag',
		'TutorialLevel'
	);

	static $url_segment = 'tutorials';
	static $menu_title = 'Tutorials';
}