<footer class="footer" role="contentinfo">

	<div class="upper">
        <div class="container">
            <div class="upper-content">
        		<div class="footer-menu-container">
                    <% if FooterMenu %>
                        <ul class="footer-menu">
                            <% loop FooterMenu %>
                                <li>
                                    <a href="$Link">$MenuTitle</a>
                                </li>
                            <% end_loop %>
                        </ul>
                    <% end_if %>      
                </div>
                <div class="credit-icon">
                    <a href="http://www.carboncrayon.com" target="_BLANK">
                        <img src="themes/SSB/images/cc-footer-icon.png" alt="Carbon Crayon">
                    </a>
                </div>
            </div>
        </div>
	</div>   

	<div class="lower">
    	<div class="container">
    		<div class="lower-content">
    		
        		<div class="copyright">	
        			<p>Copyright Carbon Crayon $Now.Year | site crafted by <a href="http://www.carboncrayon.com" target="_BLANK">Carbon Crayon</a> in <a href="http://www.silverstripe.org" target="_BLANK">Silverstripe</a></p>
        		</div>
        		<div class="credit">
                    <p>
                    	This site is not affiliated to Silverstripe Ltd.
                    </p>
        		</div>
    			
    		</div>
		</div><!-- /Lower Container-->
	</div>
</footer>