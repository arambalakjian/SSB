<div class="article-idea-block">
	<div class="rating-container">
		<% if AllowVote %>
			<a class="vote" href="$VoteLink"><i class="ss-navigateup"></i></a>
		<% else %>
			<span class="vote"><i class="ss-navigateup"></i></span>
		<% end_if %>
		<span class="rating">$Rating</span>
	</div>
	<div class="title">$Title</div>
	<span class="rank">$pos</span>
</div>