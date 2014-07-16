<div class="row">
    <div id="comments" class="comments-block col-sm-8 col-sm-offset-4">

        <% with $Item %>
    	   <h2>Comments (<% if $ItemComments %>$ItemComments.Count<% else %>0<% end_if %>)</h2>

			<ul class="commentList itemList">
				<% if $Comments %>
					<% loop Comments %>
						<% include ItemComment %>
					<% end_loop %>
				<% else %>
					<li><p>No comments yet...</p></li>
				<% end_if %>					
			</ul>
    	<% end_with %>
    	
    	<div class="comment-form-main">
            <div class="row">
                <% include ItemCommentForm %>
            </div>    	
    	</div>
    </div>  
</div>