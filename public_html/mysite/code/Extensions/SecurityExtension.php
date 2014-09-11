<?php

class SecurityExtension extends Extension { 

    //overwrite the login function to remove unneccesary styles and scripts
	public function onBeforeInit()
	{
		Requirements::block(FRAMEWORK_DIR . '/thirdparty/jquery/jquery.js');
		Requirements::block(FRAMEWORK_DIR . '/thirdparty/jquery-ui/jquery-ui.js');
		Requirements::block(FRAMEWORK_DIR . '/thirdparty/jquery-entwine/dist/jquery.entwine-dist.js');
		Requirements::block(THIRDPARTY_DIR . '/jquery-ui-themes/smoothness/jquery-ui.css');
		Requirements::block(FRAMEWORK_DIR . '/css/Security_login.css');
		Requirements::block(FRAMEWORK_DIR . '/javascript/TabSet.js');
	}

}