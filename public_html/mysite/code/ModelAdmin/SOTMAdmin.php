<?php

class SOTMAdmin extends DataObjectAsPageAdmin
{
	public static $managed_models = array(
		'SOTMNominee',
		'SOTMPost'
	);

	static $url_segment = 'site-of-the-month';
	static $menu_title = 'Site of the Month';
}