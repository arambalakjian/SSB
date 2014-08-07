<?php
/*
 * Base Page Model/Controller classes
 * 
 * Carbon Crayon Ltd.
 * www.carboncrayon.com
 * 
 * author: Aram Balakjian
 * date: 20.06.2011
 * version: 1.0.0
 */
class Page extends SiteTree {
	
	private static $db = array(
		'ShowInFooter' => 'Boolean'	
	);
	
	function getCMSFields() 
	{
		$fields = parent::getCMSFields();
	
		//Fields 
		$fields->addFieldToTab('Root.Main', new CheckboxField('ShowInFooter', 'Show in footer menu?'), 'Content');	
	
		return $fields;	
	}

	/* Generate a list for the dropdown e.g.
	 * 	ClassName = The class of items in the dropdown
	 *  $TitleField = The Field used for the option title
	 *  $EmptyOption = If you want an empty options pass soimething like "--None--" in
	 *  $Filter = Filter the returned set
	 * 
	 *  Example usage: 
	 *  $Options = $this->getDropdownOptions('Page', 'Title', '--Choose--', 'ParentID = ' . $this->ID);
	 */
	function getDropdownOptions($ClassName, $TitleField = 'Title', $EmptyOption = Null, $Filter = Null)
	{
		if($Options = $ClassName::get()->where($Filter))
		{
			return $Options->map('ID', $TitleField, $EmptyOption);
		}
		else
		{
			return array('No ' . $ClassName . "'s Found");
		}
	}	
}


class Page_Controller extends ContentController 
{
	private static $allowed_actions = array(
		'OpauthLoginForm'
	);
	
	function init() 
	{
		parent::init();
		
        //Set our theme's CSS folder
        $themeFolder = $this->ThemeDir();
  
        //Set the folder to our theme so that relative image paths work
        Requirements::set_combined_files_folder($themeFolder . '/combinedfiles');

		/*
		 * CSS Includes
		 */
        //Add all the files to combine into an array
        $CSSFiles = array(
            $themeFolder . '/css/core.css'
        );

        //Combine!  
        Requirements::combine_files("combinedCSS.css", $CSSFiles);

		/*
		 * JS Includes
		 */
		
		//CDN
		Requirements::javascript("http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js");
		Requirements::javascript("http://ajax.microsoft.com/ajax/jquery.validate/1.8/jquery.validate.min.js");	

        //Add all the files to combine into an array
        $JSFiles = array(
			$themeFolder . "/js/script.js",
			$themeFolder . "/js/bootstrap/alert.js",
			$themeFolder . "/js/bootstrap/collapse.js",
			$themeFolder . "/js/bootstrap/transition.js"
        );	
         
        //Combine!  
        Requirements::combine_files("combinedJS.js", $JSFiles);
		
		//Add inline JS
		Requirements::customScript(<<<JS
			jQuery(document).ready(function() {
					
				jQuery('#MemberLoginForm_LoginForm').placeholderLabels();
				
				jQuery('#SearchForm_SearchForm_Search').clearField();

				//show/hide the login form
				jQuery('.sign-in-button').on('click', function(){

					jQuery('body, html').animate({scrollTop: 0});
					jQuery('#login-box').slideToggle();
				});

				//show hide the utility menu
				jQuery('.profile-utility-dropdown').on('click', function(){
					jQuery(this).find('i').toggleClass('icon-chevron-down');
					jQuery(this).find('i').toggleClass('icon-chevron-up');
					jQuery(this).find('.utility-links').slideToggle();
				});
				//show hide the filter buttons
				jQuery('.section-header-filter-button').on('click', function(){
					jQuery(this).find('i').toggleClass('icon-chevron-down');
					jQuery(this).find('i').toggleClass('icon-chevron-up');
				});
				//change show/hide reply button text
				jQuery('.reply-link').on('click', function(){
					var replies = jQuery(this).attr('href').split('#');
					if(jQuery('#' + replies[1]).is(':visible'))
					{
						jQuery(this).html('Show Replies <i class="icon-chevron-down"></i>');
					}
					else jQuery(this).html('Hide Replies <i class="icon-chevron-up"></i>');
				});
			});
JS
		);

	}


	public function OpauthLoginForm()
	{
		return new CustomOpauthLoginForm($this, 'OpauthLoginForm');
	}

	/*
	 * Grabs a single page type so you can do something like this in the template:
	 * 
	 * $PageType(ContactPage).Address
	 */
	function PageType($Class = 'Page')
	{
		return $Class::get()->first();
	}	

	/*
	 * Generates the footer menu
	 */
	public function getFooterMenu()
	{
		return Page::get()->filter('ShowInFooter', '1');
	}
	
	/**
	 * Feedback messages
	 * 
	 * e.g. (in Page_Controller extension)
	 *  $this->setMessage('bad', 'Error: Yo fool, foo is not bar');
	 *	$this->redirectBack();
	 * 
	 */
	public static function setAlert($message, $type)
    {   
        Session::set('Alert', array(
            'AlertType' => $type,
            'Message' => $message
        ));
    }

    public function getAlert()
    {
        if($message = Session::get('Alert')){
            Session::clear('Alert');
            $array = new ArrayData($message);
            return $array->renderWith('Alert');
        }
    }

}
