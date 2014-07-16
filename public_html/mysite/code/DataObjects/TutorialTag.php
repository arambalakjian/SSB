<?php

class TutorialTag extends DataObjectAsPageCategory
{
	static $belongs_many_many = array(
		'Tutorials' => 'Tutorial'
	);
}