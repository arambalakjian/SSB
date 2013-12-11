
<div class="container">
	<div class="row">
		<p class="welcome-text hidden-xs">
			<% with SiteConfig %>
			$Tagline <% if AboutPage %><a href="$AboutPage.Link">More about ssbits <i class="icon icon-chevron-right"></i></a><% end_if %>
			<% end_with %>
		</p>

		<div class="latest-posts">
			<div class="section-header-bar small hidden-xs">
				<div class="section-title left">
					<h3>Latest Posts</h3>
				</div>
			</div>
			<% loop LatestPosts %>
				$ListingPageHTML
			<% end_loop %>
		</div>
		<sidebar class="latest-snippets hidden-xs">
			<div class="section-header-bar small hidden-xs">
				<div class="section-title right">
					<h3>Latest Snippets</h3>
				</div>
			</div>
			<% loop LatestSnippets %>
				$HomePageHTML
			<% end_loop %>
		</sidebar>
	</div>
</div>