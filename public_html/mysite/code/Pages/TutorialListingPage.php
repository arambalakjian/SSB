<?php

class TutorialListingPage extends FilteredListingPage
{

	/**
	 * get a list of all the levels
	 * 
	 * @return DataList
	 */
	public function getTutorialLevels()
	{
		return TutorialLevel::get()->sort('Title', 'ASC');
	}
}

class TutorialListingPage_Controller extends FilteredListingPage_Controller
{
	private static $item_class = 'Tutorial';

	private static $allowed_actions = array(
		'AddArticleIdeaForm'		
	);
	
	private static $ajax_filter = false;	

    private static $filter_settings = array(
        'TutorialTags' => array(
            'Title' => 'Tags',   //Required - Define the Title of the Filter
            'ClassName' => 'TutorialTag', //Required - The Class of the category you are filtering by (the one that extends DataObjectAsPageCategory)
            'Preposition' => 'with',          //Optional - Define the preposition in the filter message, e.g. Products IN x or y category (Defaults to "in")
            'MultiSelect' => true,         //Optional - Select Multiple options at once (default is true)
            'MatchAll' => true             //Optional - Match all the multi selected items, i.e. select a Product which has category x AND y. Requires a Many_Many or Has_Many
        ),
        'TutorialLevel' => array(
            'Title' => 'Level',   //Required - Define the Title of the Filter
            'ClassName' => 'TutorialLevel', //Required - The Class of the category you are filtering by (the one that extends DataObjectAsPageCategory)
            'Preposition' => 'of' ,
            'MultiSelect' => false        //Optional - Define the preposition in the filter message, e.g. Products IN x or y category (Defaults to "in")
        )
    );
	
	public function init()
	{
		parent::init();	

		//add code highlighter
		//Set our theme's CSS folder
        $themeFolder = $this->ThemeDir();
		Requirements::javascript($themeFolder . '/js/syntaxhighlighter/scripts/shCore.js');
		Requirements::javascript($themeFolder . '/js/syntaxhighlighter/scripts/shBrushCss.js');
		Requirements::javascript($themeFolder . '/js/syntaxhighlighter/scripts/shBrushJScript.js');
		Requirements::javascript($themeFolder . '/js/syntaxhighlighter/scripts/shBrushPhp.js');
		Requirements::javascript($themeFolder . '/js/syntaxhighlighter/scripts/shBrushXml.js');

		Requirements::css($themeFolder . '/js/syntaxhighlighter/styles/shCore.css');
		Requirements::css($themeFolder . '/css/shThemeSSB.css');

		Requirements::customScript(<<<JS

			jQuery(document).ready(function(){
				//match the latest column heights
				jQuery('.tutorial-list, .article-ideas').equalHeight();
				jQuery('.post-info, .post-content').equalHeight();
				//clear the article idea field
				jQuery('#AddArticleIdeaForm_AddArticleIdeaForm').placeholderLabels();

				//slide down the article idea form
				jQuery('.article-ideas .submit-button').on('click', function(){
					jQuery('.submit-idea-container').slideToggle();
				});

				//run syntax highlighter
				SyntaxHighlighter.all()
			});
JS
		);
	}

	public function AddArticleIdeaForm()
	{
		return new AddArticleIdeaForm($this, 'AddArticleIdeaForm');
	}

	/**
	 * return a set of article ideas 
	 * 
	 * @return DataList 
	 */
	public function getArticleIdeas($limit = 10)
	{
		return ArticleIdea::get()->sort('Rating', 'DESC')->limit($limit);
	}
}