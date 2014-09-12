<div class="container full-post-page">
	$Alert
	<div class="section-header-bar">
		<div class="section-header-buttons">
			<a class="section-header-button" href="$Link"><i class="icon-chevron-left"></i> Back</a>
		</div>
		<div class="section-title">
			<h2>Submit your site</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">

			<% if CurrentMember %>
				$AddSiteForm
			<% else %>
				<div class="login-to-submit">
					You need to be <a href="{$BaseHref}Security/Login?BackURL={$Link}/add">signed in</a> to submit a site.
				</div>
			<% end_if %>
			
		</div>
	</div>
</div>