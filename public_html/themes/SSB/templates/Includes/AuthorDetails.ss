<div class="author">
	<div class="author-image">
		$Avatar.CroppedImage(75,75)
	</div>
	<div class="info">
		<p class="title">Author</p>
		<p class="name">$Name</p>
		<div class="social-links">
			<% if GithubName %>
				<a href="http://www.github.com/{$GithubName}"><i class="icon-github"></i></a>
			<% end_if %>
			<% if TwitterName %>
				<a href="http://www.twitter.com/{$TwitterName}"><i class="icon-twitter"></i></a>
			<% end_if %>
			<% if LinkedInName %>
				<a href="http://www.linkedin.com/{$LinkedInName}"><i class="icon-linkedin"></i></a>
			<% end_if %>
			<% if Website %>
				<a href="$Website"><i class="icon-desktop"></i></a>
			<% end_if %>
		</div>
	</div>
	<% if Bio %>
		<p class="bio">$Bio</p>
	<% end_if %>
</div>