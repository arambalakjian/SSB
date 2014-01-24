<?php

class ViewTag extends DataObjectAsPageCategory
{
	static $belongs_many_many = array(
		'Views' => 'View'
	);
}