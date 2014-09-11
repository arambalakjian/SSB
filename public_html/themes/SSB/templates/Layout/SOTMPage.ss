<div class="container full-post-page">
	$Alert
    <div class="row">	
    	<div class="section-header-bar">
    		<div class="section-header-buttons">
    			<a class="section-header-button red" href="{$Link}add"><i class="icon-desktop"></i> Submit your site</a>
    		</div>
    		<div class="section-title">
    			<h2>Awards</h2>
    		</div>
    	</div>

    	<% if CurrentNominees %>
    		<div class="nominee-title">
    			<div class="image-container">
    				<i class="ssb-icon large red"></i>
    			</div>
    			<div class="title-text">
    				<h3>Nominees for $VotingMonth</h3>
    				<p class="closing-date">voting closes on the 1st of {$NextVotingMonth} at 12AM GMT</p>
    			</div>
    			<div class="results">
    				<a class="results-link" href="{$Link}voteresults">View results</a>
    			</div>
    		</div>
    		<div class="current-nominees">
    			<% loop getCurrentNominees(true) %>
    				<div class="nominee">
    					<div class="image-container">
    						$Image.CroppedImage(360,236)
    						<div class="overlay">
    							<div class="overlay-content">
    								<div class="buttons">
    									<% if AllowVote %>
    										<a class="button red" href="$VoteLink">Vote <i class="icon-thumbs-up"></i></a>
    									<% end_if %>
    									<a class="button blue" href="$SiteURL.URL" target="_BLANK">View site <i class="icon-external-link"></i></a>
    								</div>
    								<p class="description">$Description.LimitCharacters(220)</p>
    								<% with Member %>
    									<div class="author">submitted by <a class="member-link" href="{$ProfileLink}">$Name</a> $Image.CroppedImage(24,24)</div>
    								<% end_with %>
    							</div>
    						</div>
    					</div>
    					<h4>$Title</h4>
    				</div>
    			<% end_loop %>
    		</div>
    	<% end_if %>
    </div>
	<div class="row">
	
		<% if Winners %>
			<div class="previous-winners">
				<div class="section-header-bar small hidden-xs">
					<div class="section-title left">
						<h3>Previous Winners</h3>
					</div>
				</div>
				<% loop Winners %>
					<div class="nominee">
						<div class="row">
							<div class="image-column">
								<div class="image-container">
									<% if Image %>
										$Image.CroppedImage(358,254)
									<% else %>
										<img src="themes/SSB/images/site-placeholder.png">
									<% end_if %>
									<div class="overlay">
										<div class="overlay-content">
											<div class="buttons">
												<a class="button blue" href="$SiteURL.URL" target="_BLANK">View site <i class="icon-external-link"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="site-details">
								<p class="date">$MonthName</p>
								<h3><a class="site-name" href="$SiteURL.URL">$Title</a></h3>
								<p class="description">$Description</p>
								<% with Member %>
									<p class="author">$Image.CroppedImage(24,24) <a class="member-link" href="{$ProfileLink}">$Name</a></p>
								<% end_with %>
							</div>
						</div>
					</div>
				<% end_loop %>
			</div>
		<% end_if %>
		<sidebar class="recent-submissions hidden-xs">
			<div class="section-header-bar small hidden-xs">
				<div class="section-title right">
					<h3>Recent Submissions</h2>
				</div>
			</div>
			<% if RecentSites %>
				<% loop RecentSites %>
					<div class="nominee">
						<a href="$SiteURL.URL" target="_BLANK">$Image.croppedImage(85,54) $Title</a>
					</div>
				<% end_loop %>
			<% end_if %>
		</sidebar>
	</div>
    