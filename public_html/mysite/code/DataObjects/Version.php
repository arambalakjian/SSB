<?php

class Version extends DataObjectAsPageCategory
{
	static $has_many = array(
		'Posts' => 'Post'
	);
}