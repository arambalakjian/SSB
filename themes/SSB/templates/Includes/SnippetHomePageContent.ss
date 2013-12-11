<div class="snippet-home-block">
	<div class="author">
		<div class="image"><% with Author %>$Image.CroppedImage(45,45)<% end_with %></div>
		<div class="details">
			<p class="name">$Author.Name</p>
			<p class="created">$Created.Ago</p>
		</div>
	</div>
	<div class="title">$Title</div>
	<div class="description">$ContentPreview</div>
</div>