<li id="comment_$ID" class="comment $Status <% if isAuthor %>author<% end_if %>">
    <% if Status = new %>
        <div class="row">
            <div class="col-sm-12">
                
                    <div class="messagebar">
                        <p class="message success">
                            Great, your comment has been added!                             
                        </p>
                    </div>
           
            </div>    
        </div>
    <% end_if %> 
    <div class="row">
        <% if ParentCommentID %>
            <i class="icon-sort-down"></i>
        <% end_if %>
        <div class="col-sm-3">
            <% if Author.Image %>
                <% with $Author %>
                    $Image.CroppedImage(150,150)
                <% end_with %>
            <% end_if %>
        </div>
        
        <div class="col-sm-9">
            <h3><a href="$Author.Link" title="View {$Author.Name}&#39;s Profile">$Author.Name</a> <span>$Created.Ago</span></h3>

            <p class="comment-text">$Comment</p>     

            <p class="toolbar clear">
                <% if isAuthor %>
                    <a class="edit btn" href="$EditLink">Edit</a>                      
                <% end_if %> 
                <% if $ParentCommentID = 0 %>
                    <a data-toggle="collapse" data-parent=".links" href="#reply-form-$ID" class="reply-link collapsed btn" title="Reply to this comment">Reply</a>
                    <% if $Replies %>
                        <a data-toggle="collapse" data-parent=".links" href="#replies-$ID" class="reply-link btn  btn-primary" title="Reply to this comment">Hide relplies <i class="icon-angle-up"></i></a>
                    <% end_if %>
                <% end_if %>
            </p>
        </div>
    </div>
    <% if $ParentCommentID = 0 %>
        <div id="reply-form-$ID" class="panel-collapse collapse row">
            <% include ItemCommentForm %>
        </div>
    
        <% if $Replies %>
            <ul id="replies-$ID" class="panel-collapse collapse in">
                <% loop $Replies %>
                    <% include ItemComment %>
                <% end_loop %>
            </ul>
        <% end_if %>
    <% end_if %>
</li>