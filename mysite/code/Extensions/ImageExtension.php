<?php

class ImageExtension extends DataExtension { 

    //set up non-admin permissions for the front end

    function canEdit($member) {
        return Permission::check('ADMIN');
    }
 
    function canDelete($member) {
        return Permission::check('ADMIN');
    }
}