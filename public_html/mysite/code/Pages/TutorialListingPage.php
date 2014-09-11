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
            'Preposition' => 'in' ,
            'MultiSelect' => false        //Optional - Define the preposition in the filter message, e.g. Products IN x or y category (Defaults to "in")
        )
    );
	
	public function init()
	{
		parent::init();	

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
	
	/*
	 * Builds the message to return to the user after filtering
	 * 
	 * $Messages - an array of filter state messages telling the user the current filters applied
	 */
	public function CurrentFilterMessage()
	{
		if($filterSettings = $this->getFilterSettings())
		{
			$OutputMessages = array();
			
			//Loop through each message and build it if there is a filter applied for that var
			foreach($filterSettings as $varName => $settings)
			{
				if($this->getFilterValue($varName))
				{			
					$OutputMessages[] = $this->getIndividualFilterMessage($varName, $settings['Preposition'], $settings['ClassName'], $settings['MatchAll']);	
				}
			}
			
			if($Items = $this->Items())
			{
				$ItemCount = $Items->Count();			
			}
			else
			{
				$ItemCount = 0;
			}
	
			$ItemInstance = singleton($this->stat('item_class'));
				
			$PluralName = $ItemInstance->stat('plural_name') ? $ItemInstance->stat('plural_name') : 'items'; 
			$SinglularName = $ItemInstance->stat('singular_name') ? $ItemInstance->stat('singular_name') : 'item'; 				
			
			if(count($OutputMessages))
			{
	
				//Set the message class & count 
				//if Found some
				if($ItemCount > 0)
				{
					$ItemName = ($ItemCount == 1) ? $SinglularName : $PluralName;
					$Class = 'info';
	
					//Initial String
					$CompleteMessage = 'You are viewing ' . $PluralName; 
				}
				//None Found
				else
				{
					$ItemName = $PluralName;
					$Class = 'danger';
					
					//Initial String
					$CompleteMessage = 'There were no ' . $PluralName . ' found ';
				}
				
				//Construct single message from array
				$CompleteMessage .= implode(' and ', $OutputMessages);
			}
			else
			{
				$CompleteMessage = 'You are viewing all <span class="count">' . $ItemCount . ' ' . $PluralName . '</span>'; 
				$Class = 'info';
			}
			
			//Place into an array ready to return to the template
			$Output = new ArrayData(array(
				'Message' => $CompleteMessage,
				'Class' => $Class
			));
			
			return $Output;					
		}
	}
}