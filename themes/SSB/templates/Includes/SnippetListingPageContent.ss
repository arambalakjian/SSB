<div class="listing-block snippet">
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
		<div class="comments-button-container"><a href="{$Link}#comments" class="comments-button"><% if Author.Image %><% with Author %><div class="author-image">$Image.CroppedImage(42,42)</div><% end_with %><% end_if %>Comments</a></div><div class="read-more-button-container"><a href="$Link" class="read-more">Read More <i class="icon icon-chevron-right"></i></a></div>
	</div>
</div>