<div class="container">
	$Alert
	<div class="row">

		<div class="tutorial-list">
            <% include FilterBar %>

            <% include FilterMessage %>
            
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
				<% if CurrentMember %>
					$AddArticleIdeaForm
				<% else %>
					<div class="login-to-submit">
					You need to be <a href="{$BaseHref}Security/Login">signed in</a> to submit an idea.
				</div>
				<% end_if %>
			</div>
			<% loop ArticleIdeas %>
				<% include ArticleIdeaListingPageContent %>
			<% end_loop %>
			
		</sidebar>
	</div>
</div>
