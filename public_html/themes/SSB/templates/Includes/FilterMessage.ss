<% if $CurrentFilterString %>
	<% if $CurrentFilterMessage %>
		<% with $CurrentFilterMessage %>	
			<div class="row">
				<div class="col-sm-12">	
					<div class="message filter-message-container $Class">	
						<div class="row">	
							<div class="col-sm-10 filter-message">
								<p>$Message</p>
							</div>
							<div class="col-sm-2 filter-clear">
								<a href="$Top.Link"><i class="icon-remove"></i> clear filters</a>
							</div>	
						</div>
					</div>
				</div>
			</div>
		<% end_with %>
	<% end_if %>
<% end_if %>