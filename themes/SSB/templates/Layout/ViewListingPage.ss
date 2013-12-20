<div class="container">
	$Alert
	<div class="row">

		<div class="view-list">
			<div class="section-header-bar">
				<div class="section-header-buttons">
					<div class="section-header-button tag margin-right">
						Tags <i class="icon-chevron-down right"></i>
						<ul>
							<li><a href="#">Tag link</a></li>
							<li><a href="#">Tag link</a></li>
							<li><a href="#">Tag link</a></li>
							<li><a href="#">Tag link</a></li>
						</ul>
					</div>
				</div>
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