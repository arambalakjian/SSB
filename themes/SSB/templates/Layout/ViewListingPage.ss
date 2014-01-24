<div class="container">
	$Alert
	<div class="row">

		<div class="view-list">
			<div class="section-header-bar">
                <% include FilterBar %>
				<div class="section-title">
					<h2 class="latest-section-title">Views</h2>
				</div>
			</div>
			<% loop Items %>
				$ListingPageHTML
			<% end_loop %>
		</div>
		<sidebar class="tweets hidden-xs">
			<div class="section-header-bar">
				<div class="section-title right">
					<h3 class="latest-section-title">Tweets</h3>
					<span class="hashtag visible-lg">#silverstripe</span>
				</div>
			</div>
			<% include Tweet %>
		</sidebar>
	</div>
</div>