<?php

class SnippetAdmin extends DataObjectAsPageAdmin
{
	public static $managed_models = array(
		'Snippet',
		'SnippetTag',
	);

	static $url_segment = 'snippets';
	static $menu_title = 'Snippets';
}