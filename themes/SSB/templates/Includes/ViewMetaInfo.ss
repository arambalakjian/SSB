
<div class="meta-info">
	<div class="tag-links">
		<% if ViewTags %>
			<% loop ViewTags %>
				<a href="$Link" class="tag-button">$Title</a>
			<% end_loop %>
		<% end_if %>
	</div>
	<span class="published">$PublishDate.Ago</span>
</div>