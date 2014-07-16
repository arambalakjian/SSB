<% if $CurrentUser %>            
    <div class="col-sm-3">
        <% if CurrentUser.Image %>
            <% with $CurrentUser %>
                $Image.CroppedImage(150,150)
            <% end_with %>
        <% end_if %>
    </div>
    
    <div class="col-sm-9">

        <% if $CurrentUser.EmailValidated %>                
            $ItemCommentForm
        <% else %>
            <p>You need to validate your email address before you can submit a comment.</p>
            <p><a href="$CurrentMember.SendValidationEmailLink">Click here</a> to send the email again.</p>
        <% end_if %>
  
    </div>
<% else %>
    <div class="col-sm-12">
        <p class="notice">You must <a href="Security/login?BackURL=$Item.Link">login</a> to comment.</p>

        <p>You can also login using Github or Twitter:</p>
        <p class="socialLogin"></p>
    </div>
<% end_if %>             