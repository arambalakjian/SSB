<div class="container full-post-page">
	$Alert
	<div class="section-header-bar">
		<div class="section-header-buttons">
			<a class="section-header-button" href="$Link"><i class="icon-chevron-left"></i> Back</a>
		</div>
		<div class="section-title">
			<h2>Edit <% with CurrentItem %>$Title<% end_with %></h2>
		</div>
	</div>
	<% if CanEditSnippet %>
		<div class="snippet-form-container">
			<div class="snippet-details">
				$EditSnippetForm
			</div>
		</div>
	<% else %>
		<p>Sorry, you don't have permission to edit this snippet.</p>
	<% end_if %>
</div>