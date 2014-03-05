
<div class="container full-post-page">
	<div class="section-header-bar">
		<div class="section-header-buttons">
			<a class="section-header-button" href="$Link"><i class="icon-chevron-left"></i> Back</a>
		</div>
		<div class="section-title">
			<h2>Views</h2>
		</div>
	</div>
	<% with Item %>
		<div class="row">
			<sidebar class="post-info">
				<div class="image">
					$Image.CroppedImage(200,200)
					<i class="ssb-icon large $ClassName"></i>
				</div>
				<div class="share">

				</div>
				<% if GitLink %>
					<a class="github-link" href="$GitLink">View code on github</a>
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
				<% include ViewMetaInfo %>
				<div class="intro">$Content</div>
				<% if PostBlocks %>
					<% loop PostBlocks %>
						$BlockHTML
					<% end_loop %>
				<% end_if %>
			</article>
		</div>
	<% end_with %>

    <% include ItemComments %>          	
</div>