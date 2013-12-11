<div class="post-block content-block">
	<div class="row">
		<% if Image %>
			<div class="image col-sm-4 <% if ImageAlign = right %>pull-right<% end_if %>">
				$Image
			</div>
		<% end_if %>
		<div class="content <% if Image %>col-sm-8<% else %>col-sm-12<% end_if %>">
			<h4>$Title</h4>	
			$Content
		</div>
	</div>
</div>