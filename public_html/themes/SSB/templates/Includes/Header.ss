<header class="header navbar navbar-default navbar-fixed-top" role="banner">
	<div class="container">
		<div class="row">
			<div class="header-left">
				<div class="navbar-header">
					<a href="$BaseHref" class="navbar-brand" rel="home">
						<img src="themes/SSB/images/ssb-logo.png" alt="SS Bits" />
					</a>
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<i class="icon-reorder"></i>
					</button>
				</div>
			</div>
			<div class="collapse navbar-collapse">
				<div class="header-mid">
					<% include PrimaryNavigation %>
				</div>
				<div class="header-right">
					<% if CurrentMember %>
						<div class="profile-utility-dropdown">
							<% with CurrentMember %>$Image.CroppedImage(42,42)<% end_with %><i class="icon-chevron-down"></i>
							<ul class="utility-links">
								<li><a href="{$PageType(ProfilePage).Link}">Profile</a></li>
								<li><a href="/Security/Logout">Logout</a></li>
							</ul>
						</div>
					<% else %>
						<span class="sign-in-button">Sign In</span>
					<% end_if %>
					$SearchForm
				</div>
			</div>
		</div>
	</div>
</header>