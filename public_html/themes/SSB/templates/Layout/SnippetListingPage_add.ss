<div class="container full-post-page">
	$Alert
	<div class="section-header-bar">
		<div class="section-header-buttons">
			<a class="section-header-button" href="$Link"><i class="icon-chevron-left"></i> Back</a>
		</div>
		<div class="section-title">
			<h2>Create a new snippet</h2>
		</div>
	</div>
	<% if CurrentMember %>
		<div class="snippet-form-container">
			<div class="snippet-details">
				$AddSnippetForm
			</div>
		</div>
	<% else %>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="login-to-submit">
					You need to be <a href="{$BaseHref}Security/Login">signed in</a> to submit a snippet.
				</div>
			</div>
		</div>
	<% end_if %>
</div>