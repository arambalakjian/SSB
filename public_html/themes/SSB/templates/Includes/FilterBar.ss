<div class="section-header-bar">
    <div class="section-header-buttons">
        <% loop $Filters %><div data-toggle="collapse" href="#filter-$Title"  class="section-header-button section-header-filter-button $Title <% if Last %>margin-right<% end_if %>">$Title <i class="icon-chevron-down right"></i></div><% end_loop %>
    </div>
    
    <div class="section-title">
        <h2>$Title</h2>
    </div>
</div>
<% loop $Filters %>
    <div id="filter-$Title" class="panel-collapse collapse filter-options-container">
        <div class="col-sm-12 filter-options $Title">
            <ul>
                <% loop $Options %>
                    <li><a class="$LinkingMode" href="$Link"><i class="icon-ok"></i>$Title</a></li>
                <% end_loop %>
            </ul>   
        </div>            
    </div>
<% end_loop %>

