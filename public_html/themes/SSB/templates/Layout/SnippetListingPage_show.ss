
<div class="container full-post-page">
	<div class="section-header-bar">
		<div class="section-header-buttons">
			<a class="section-header-button" href="$Link"><i class="icon-chevron-left"></i> Back</a>
		</div>
		<div class="section-title">
			<h2>$Title</h2>
		</div>
	</div>
	<% with Item %>
		<div class="row">
			<sidebar class="post-info">
				<div class="share">

				</div>
				<% if GistLink %>
					<a class="github-link" href="$GistLink" target="_BLANK">View code on github</a>
				<% end_if %>
				<% if Author %>
					<% with Author %>
						<% include AuthorDetails %>
					<% end_with %>
				<% end_if %>
				<% with Top %>
					<% if SiteConfig.WriteForUsPage %>
						<% with SiteConfig %><a class="write-for-us" href="$WriteForUsPage.Link">Want to write for SSBits?</a><% end_with %>
					<% end_if %>
				<% end_with %>
			</sidebar>
			<article class="post-content">
				<h3>$Title</h3>
				<% include SnippetMetaInfo %>
				<div class="intro">$Content</div>
				$GistEmbed
			</article>
		</div>
	<% end_with %>

    <% include ItemComments %>      	
</div>
