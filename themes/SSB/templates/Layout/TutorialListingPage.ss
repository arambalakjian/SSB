<div class="container">
	$Alert
	<div class="row">

		<div class="tutorial-list">
			<div class="section-header-bar">
                <% include FilterBar %>
				<div class="section-title">
					<h2>$Title</h2>
				</div>
			</div>
			<% loop Items %>
				$ListingPageHTML
			<% end_loop %>
		</div>
		<sidebar class="article-ideas hidden-xs">
			<div class="section-header-bar">
				<div class="section-title right">
					<h3>Ideas</h3>
					<span class="submit-button">Submit idea</span>
				</div>
			</div>
			<div class="submit-idea-container">
				$AddArticleIdeaForm
			</div>
			<% loop ArticleIdeas %>
				<% include ArticleIdeaListingPageContent %>
			<% end_loop %>
			
		</sidebar>
	</div>
</div>
