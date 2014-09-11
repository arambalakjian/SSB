<div class="listing-block snippet dashboard">
	<div class="image hidden-xs">
		<% if Image %>
			$Image.CroppedImage(252,252)
		<% else %>
			<i class="ssb-icon large $ClassName"></i>
		<% end_if %>
	</div>
	<div class="details">
		<h3>$Title</h3>
		<% include SnippetMetaInfo %>

		<p class="content">$getContentPreview(250)</p>
	</div>

	<div class="read-more-bar">
		<div class="edit-snippet-button-container"><a class="edit-snippet" href="{$EditLink}"><i class="icon-edit"></i>Edit snippet</a></div><div class="read-more-button-container"><a href="$Link" class="read-more">Read More <i class="icon icon-chevron-right"></i></a></div>
	</div>
</div>