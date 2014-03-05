<div class="section-header-bar">
    <div class="section-header-buttons">
        <% loop $Filters %>
            <div data-toggle="collapse" href="#filter-$Title"  class="section-header-button $Title <% if Last %>margin-right<% end_if %>">
                $Title <i class="icon-chevron-down right"></i>
            </div>
        <% end_loop %>
    </div>
    
    <div class="section-title">
        <h2>$Title</h2>
    </div>
</div>
<% loop $Filters %>
    <div id="filter-$Title" class="$Title filter-options panel-collapse collapse  row">
        <ul class="clearfix">
            <% loop $Options %>
                <li><a class="$LinkingMode greyGradientButton" href="$Link"><span></span>$Title</a></li>
            <% end_loop %>
        </ul>               
    </div>
<% end_loop %>

