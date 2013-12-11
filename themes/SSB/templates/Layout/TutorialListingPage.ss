<div class="container">
	$Alert
	<div class="row">

		<div class="tutorial-list">
			<div class="section-header-bar">
				<div class="section-header-buttons">
					<span class="section-header-button tag">Tags <i class="icon-chevron-down right"></i></span><span class="section-header-button level margin-right">Levels <i class="icon-chevron-down right"></i></span>
				</div>
				<div class="section-title">
					<h2>Latest Posts</h2>
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
