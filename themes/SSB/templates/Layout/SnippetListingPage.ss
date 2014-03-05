<div class="container">
	$Alert
	<div class="row">

		<div class="snippet-list">
			<% include FilterBar %>
			<% loop Items %>
				$ListingPageHTML
			<% end_loop %>
		</div>
		<sidebar class="top-snippers hidden-xs">
			<div class="section-header-bar submit">
				<div class="section-header-buttons">
					<a class="section-header-button green" href="{$Link}add"><i class="icon-edit"></i>Submit Snippet</a>
				</div>
			</div>
			<div class="section-header-bar small">
				<div class="section-title right">
					<h3>Top Snippers</h3>
				</div>
			</div>
			<% if TopSnippers %>
				<% loop TopSnippers %>
					<div class="snipper">
						<div class="image hidden-sm hidden-md">
							$Image.CroppedImage(50,50)
						</div>
						<div class="name">$Name</div>
						<div class="count">$SnippetCount</div>
					</div>
				<% end_loop %>
			<% end_if %>
		</sidebar>
	</div>
</div>