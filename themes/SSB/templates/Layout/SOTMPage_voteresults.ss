<div class="container full-post-page">
	$Alert
	<div class="section-header-bar">
		<div class="section-header-buttons">
			<a class="section-header-button" href="$Link"><i class="icon-chevron-left"></i> Back</a>
		</div>
		<div class="section-title">
			<h2>Results</h2>
		</div>
	</div>
	<% if CurrentNominees %>
		<div class="vote-results">
			<% loop CurrentNominees %>
				<div class="nominee">
					<h3>$Title</h3>
					<div class="graph-bar">
						<div class="site-info">
							$Image.CroppedImage(200,200)
						</div>
						<div class="filled" style="width: {$VotePercentage}%"></div>
						<div class="percentage">{$VotePercentage}%</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	<% end_if %>
</div>
