<div class="container">

    $Alert

	<div class="section-header-bar">
		<div class="section-title">
			<h2>Register</h2>
		</div>
	</div>

	<% if CurrentMember %>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="login-to-submit">
					You are already registered <a href="{$BaseHref}Security/Login">return to profile</a>.
				</div>
			</div>
		</div>
	<% else %>
		<div class="row">
			$RegistrationForm
		</div>
	<% end_if %>
</div>