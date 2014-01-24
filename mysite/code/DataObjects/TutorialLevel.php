<?php

class TutorialLevel extends DataObjectAsPageCategory
{
	static $has_many = array(
		'Tutorials' => 'Tutorial'
	);
}