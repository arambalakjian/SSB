
<% if Tweets %>
	<% loop Tweets %>
		<div class="tweet-block">
			<div class="image-container">
				<img src="{$Image}">
			</div>
			<div class="content-container">
				<div class="author-bar">
					<a class="handle" href="http://www.twitter.com/{$Name}">@{$Name}</a>
					<span class="time">$Date.Ago</span>
				</div>
				<p class="content">
					$Title
				</p>
			</div>
		</div>
	<% end_loop %>
<% end_if %>
