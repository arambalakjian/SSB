<?php


class AddSnippetForm extends Form 
{
	
    function __construct($controller, $name) 
	{
		//Get the requirements
		$this->getJS($controller);
		
		//Get the fields
	    $fields = $this->getInputFields();
	 	
	    // Create action
	    $actions = new FieldList(
	    	new FormAction('AddSnippet', 'Submit Snippet')
	    );
		
		// get the Validator
		$validator = $this->getValidator();

        parent::__construct($controller, $name, $fields, $actions, $validator);
    
    }
   
   	function getInputFields()
	{
		$typeOptions = array(
			'.php' => '.php',
			'.ss' => '.ss',
			'.js' => '.js',
			'.css' => '.css',
			'.html' => '.html'
		);

		$versionDropdown = new DropdownField('VersionID', 'Version', Version::get()->map('ID', 'Title'));
		$versionDropdown->setEmptyString('Please select...');

		// $imageField = new UploadField('Image', 'Image');
		// $imageField->setCanAttachExisting(false);
		// $imageField->setCanPreviewFolder(false);
		// $imageField->setOverwriteWarning(false);
		// $imageField->setAllowedMaxFileNumber(1);
		// $imageField->setFileEditFields(null);
		// $imageField->setFolderName('Uploads/post-images');

		return new FieldList(
			//new LiteralField('OpenCol1', '<div class="snippet-details">'),
			new HeaderField('left', 'Snippet Details'),
		    new TextField('Title', '* Title'),
		    new TextField('GistLink', '* Gist URL'),
		    new TextareaField('Content', 'Content'),
		    //new HiddenField('FileCount', 'FileCount', 1),
		    //$imageField,
		    $versionDropdown,
		    new CheckboxSetField('SnippetTags', 'Tags', SnippetTag::get()->map('ID', 'Title')->toArray())
		    // new LiteralField('GistFilesOpen', '</div><div id="gist-files" class="snippet-files">'),
		    // new HeaderField('right', 'Snippet Files'),
		    // new TextField('FileName1', 'File Name'),
		    // new DropdownField('FileType1', 'File Type', $typeOptions),
		    // new TextareaField('FileContent1', 'File Content'),
		    // new LiteralField('GistFilesClose', '<span id="add-file" class="btn btn-primary">Add a file</span></div>')
		);
	}
   
   	function getValidator()
	{
		return new AddSnippetFormValidator('Title', 'GistLink');
	}
   
   	function getJS($controller)
	{
		//block UploadFields forced jQuery
		Requirements::block(THIRDPARTY_DIR . '/jquery/jquery.js');
		
		Requirements::customScript('
			jQuery(document).ready(function() 
			{
				jQuery("#AddSnippetForm_AddSnippetForm").validate({
					rules: {
						Title: "required"
					},
					messages: {
						Title: "Please add a title."
					}
				});	

				jQuery("#gist-files #add-file").on("click", function(){
					var count = jQuery("#AddSnippetForm_AddSnippetForm_FileCount").val();
					count++;
					
					jQuery.ajax({
			       		url: "' . $controller->Link() .  'filefields/" + count
			       	}).done(function(data) {
		       			jQuery("#gist-files").append(data);
		       			jQuery("#AddSnippetForm_AddSnippetForm_FileCount").val(count);
		       		});
				});		
			});
		');	
		
	}
   
	//  OLD ADD SNIPPET METHOD FOR ADDING GISTS DIRECTLY 

	// function AddSnippet($data, $form) 
	// {      
	//   	$siteConfig = SiteConfig::current_site_config();
	 	
	//  	//create a new gist
	// 	if($git = new Github\Client())
	// 	{
	// 		$git->authenticate($siteConfig->GistAccountToken, null, Github\Client::AUTH_HTTP_TOKEN);

	// 		//loop through the files
	// 		$fileArray = array();
	// 		for($count = 1; $count <= $data['FileCount']; $count++)
	// 		{
	// 		    $fileArray[$data['FileName'.$count] . $data['FileType'.$count]] = array(
	// 		        'content' => $data['FileContent' . $count]
	// 		    );
	// 		}

	// 		//compile the gist data to send
	// 		$gistData = array(
	// 		    'files' => $fileArray,
	// 		    'public' => true,
	// 		    'description' => $data['Title']
	// 		); 
	// 		if($gist = $git->api('gist')->create($gistData))
	// 		{
	// 			$snip = Snippet::create();
	// 			$form->saveInto($snip);
	// 			$snip->GistID = $gist['id'];
	// 			$snip->GistLink = $gist['html_url'];

	// 			if($memberId = Member::currentUserId())
	// 			{
	// 				$snip->AuthorID = $memberId;
	// 			}

	// 			if($snip->write())
	// 			{
	// 				return $this->success($form);
	// 			}
	// 		}
	// 	}
	// }  

	function AddSnippet($data, $form) 
	{   
		$snip = Snippet::create();
		$form->saveInto($snip);

		if($memberId = Member::currentUserId())
		{
			$snip->AuthorID = $memberId;
		}

		if($snip->writeToStage('Stage', 1))
		{
			$snip->publish('Stage', 'Live');
			return $this->success($form);
		}
	}

	public function success($form)
	{
		Page_Controller::setAlert('Your snippet has been added', 'success');
		return $form->controller->redirect($form->controller->Link());
	}

}