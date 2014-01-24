<div class="section-header-buttons">
    <% loop $Filters %>
        <div class="section-header-button $Title <% if Last %>margin-right<% end_if %>">
            $Title <i class="icon-chevron-down right"></i>
            <div class="filter">
                <ul class="clearfix">
                    <% loop $Options %>
                        <li><a class="$LinkingMode greyGradientButton" href="$Link"><span></span>$Title</a></li>
                    <% end_loop %>
                </ul>               
            </div>
        </div>
    <% end_loop %>
</div>