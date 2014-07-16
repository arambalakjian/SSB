
<div class="container full-post-page">
	<div class="section-header-bar">
		<div class="section-header-buttons">
			<a class="section-header-button" href="$Link"><i class="icon-chevron-left"></i> Back</a>
		</div>
		<div class="section-title">
			<h2>Tutorials</h2>
		</div>
	</div>

	<div class="row">
	    <% with $Item %>
			<sidebar class="post-info">

				<div class="image">
					$Image.CroppedImage(250,250)
					<i class="ssb-icon large $ClassName"></i>
				</div>
				<div class="share">
                    <p>Share 
                        <a href=""><i class="icon-twitter"></i></a>
                        <a href=""><i class="icon-facebook"></i></a>
                        <a href=""><i class="icon-linkedin"></i></a>
                    </p>
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
				<h1>$Title</h1>
				<% include TutorialMetaInfo %>
				<div class="intro">$Content</div>
				<% if PostBlocks %>
					<% loop PostBlocks %>
						$BlockHTML
					<% end_loop %>
				<% end_if %>

			</article>
		<% end_with %>	
	</div>
        
    <% include ItemComments %>  	
</div>