
<div class="meta-info">
	<div class="tag-links">
		<% if TutorialLevel %>
			<% with TutorialLevel %>
				<a href="$Link" class="level-button">$Title</a>
			<% end_with %>
		<% end_if %>
		<% if TutorialTags %>
			<% loop TutorialTags %>
				<a href="$Link" class="tag-button">$Title</a>
			<% end_loop %>
		<% end_if %>
		<% if Version %>
			<% with Version %>
				<a href="$Link" class="version-button">$Title</a>
			<% end_with %>
		<% end_if %>
	</div>
	<span class="published">$PublishDate.Ago</span>
</div>