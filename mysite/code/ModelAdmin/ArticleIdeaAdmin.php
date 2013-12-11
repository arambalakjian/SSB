<?php

class ArticleIdeaAdmin extends DataObjectAsPageAdmin
{
	public static $managed_models = array(
		'ArticleIdea'
	);

	static $url_segment = 'article-ideas';
	static $menu_title = 'Article Ideas';
}