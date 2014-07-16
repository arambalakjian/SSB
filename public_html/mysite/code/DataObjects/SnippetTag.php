<?php

class SnippetTag extends DataObjectAsPageCategory
{
	static $belongs_many_many = array(
		'Snippets' => 'Snippet'
	);
}