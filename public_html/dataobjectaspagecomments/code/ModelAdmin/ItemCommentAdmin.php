<?php

class ItemCommentAdmin extends ModelAdmin
{
	public static $managed_models = array(
		'ItemComment'
	);

	static $url_segment = 'comments';
	static $menu_title = 'Comments';
}