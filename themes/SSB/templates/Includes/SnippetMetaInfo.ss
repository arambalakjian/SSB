<div class="meta-info">
	<div class="tag-links">
		<% if SnippetTags %>
			<% loop SnippetTags %>
				<a href="$Link" class="tag-button">$Title</a>
			<% end_loop %>
		<% end_if %>
		<% if Version %>
			<% with Version %>
				<a href="$Link" class="version-button">$Title</a>
			<% end_with %>
		<% end_if %>
	</div>
	<span class="published">$Created.Ago</span>
</div>