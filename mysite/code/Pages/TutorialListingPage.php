<?php

class TutorialListingPage extends DataObjectAsPageHolder
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

class TutorialListingPage_Controller extends DataObjectAsPageHolder_Controller
{
	static $item_class = 'Tutorial';
	
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

	static $allowed_actions = array(
		'AddArticleIdeaForm'		
	);

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