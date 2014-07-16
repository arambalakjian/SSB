<?php

class ViewAdmin extends DataObjectAsPageAdmin
{
	public static $managed_models = array(
		'View',
		'ViewTag'
	);

	static $url_segment = 'views';
	static $menu_title = 'Views';
}