<div class="container">
	<div class="section-header-bar">
		<div class="section-title">
			<h2>$Title</h2>
		</div>
	</div>
	<div class="row">
		<sidebar class="member-sidebar">
			<% with CurrentMember %>
				<% if Image %>
					<div class="image-container hidden-xs">
						$Image.CroppedImage(300,300)
					</div>
				<% end_if %>
			<% end_with %>
			<div class="utility-buttons">
				<a class="button" href="{$Link}edit">Edit Profile</a>
				<a class="button snippet-button" href="{$PageType(SnippetListingPage).Link}add"><i class="icon-edit"></i>Submit snippet</a>
			</div>
		</sidebar>
		<div class="profile-details">
			<% with CurrentMember %>
				<h3>$Name</h3>
				<div class="member-info">
					<% if Email %>
						<p><i class="icon-envelope-alt"></i> <a href="mailto: {$Email}">$Email</a></p>
					<% end_if %>
					<% if TwitterName %>
						<p><i class="icon-twitter"></i> <a href="http://www.twitter.com/{$Twittername}" target="_BLANK">@{$TwitterName}</a></p>
					<% end_if %>
					<% if GithubName %>
						<p><i class="icon-github"></i> <a href="http://www.github.com/{$GithubName}" target="_BLANK">$GithubName</a></p>
					<% end_if %>
					<% if LinkedinName %>
						<p><i class="icon-linkedin"></i> <a href="http://www/linkedin.com/{$LinkedinName}" target="_BLANK">$LinkedinName</a></p>
					<% end_if %>
					<% if Website %>
						<p><i class="icon-desktop"></i> <a href="{$Website.URL}" target="_BLANK">$Website</a></p>
					<% end_if %>
					<% if Bio %>
						<p><i class="icon-edit"></i> $Bio</p>
					<% end_if %>
				</div>
				<% if Snippets %>
					<div class="snippets">
						<h4>Snippets ({$SnippetCount})</h4>
						<% loop Snippets %>
							$DashboardPageHTML
						<% end_loop %>
					</div>
				<% end_if %>
			<% end_with %>
		</div>
	</div>
</div>