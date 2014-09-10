<div class="post-block image-block">
	<div class="row">
		<% if $ImageLeft %>
			<div class="image <% if $ImageRight %>col-sm-6<% else %>col-sm-12<% end_if %>">
				$ImageLeft
				<p class="caption">$CaptionLeft</p>
			</div>
		<% end_if %>
		<% if ImageRight %>
			<div class="image col-sm-6">
				$ImageRight
				<p class="caption">$CaptionRight</p>
			</div>
		<% end_if %>
	</div>
</div>