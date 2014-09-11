<div id="login-box" class="container <% if $InSecurity %>show<% end_if %>">
	<div class="login-section">
		<div class="login-container">
			<h3>Sign in to SSBits</h3>
			<div class="row">
				<div class="social-login">
					<p class="login-intro">Using your twitter or github account</p>
					$OpauthLoginForm
				</div>
				<div class="ssb-login">
					<p class="login-intro">Using your Email and Password</p>
					$LoginForm
				</div>
			</div>
			<div class="row">
				<p class="col-sm-8 col-sm-offset-2 registration-details">
					Not a member yet? <a href="{$BaseHref}profile/register">Register here</a>
				</p>
			</div>
		</div>
	</div>
</div>	