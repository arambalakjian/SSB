<div class="typography">
	$Alert
	<% if MonthlyWinner %>
		<div class="winner">
			<h2>Winner</h2>
			<% with MonthlyWinner %>
					<p class="date">$MonthName</p>
					<h3><a href="$SiteURL.URL">$Title</a></h3>
					<p class="author">submitted by <strong>$Member.Name</strong></p>
					<p class="description">$Description</p>
				</div>
			<% end_with %>
		</div>
	<% end_if %>
	
	<% if MonthlyNominees %>
		<div class="current-nominees">
			<h2>Runner ups</h2>
			<% loop MonthlyNominees %>
				<div class="nominee">
					<h3><a href="$SiteURL.URL">$Title - $Rating</a></h3>
					<p class="author">submitted by <strong>$Member.Name</strong></p>
					<p class="description">$Description</p>
				</div>
			<% end_loop %>
		</div>
	<% end_if %>
</div>
