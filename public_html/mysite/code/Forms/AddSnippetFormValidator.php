<?php

class AddSnippetFormValidator extends RequiredFields
{
	/**
	* Allows validation of fields via specification of a php function for validation which is executed after
	* the form is submitted
	*/
	function php($data) 
	{
		$valid = true;
		
		$valid = parent::php($data);

		if($gistLink = isset($data['GistLink']))
		{
			//strip protocols
			$gistLink = str_replace('http://', '', $data['GistLink']);
			$gistLink = str_replace('https://', '', $data['GistLink']);

			if(substr($gistLink, 0, 4) != 'gist') 
			{
				$this->validationError(
					'GistLink',
					'Please ensure the url points to a valid Gist',
					"bad"
				);
				$valid = false;
			}
		}
		else
		{
			$valid = false;
		}
		
		

		return $valid;
	}
}