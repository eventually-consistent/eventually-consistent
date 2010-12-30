<% import urlparse %>
<header>
    <h1><a href="/">${bf.config.blog.name}</a></h1>
</header>
<nav>
    <ul>
    % for nav_items in bf.config.navigation:
        % for nav_item, nav_url in nav_items.items():
            <li class="selected"><a href="${nav_url}">${nav_item}</a></li>
        % endfor
    % endfor
     
    </ul>
    <!--div id="search">    
        <form id="searchform" method="get" action="http://www.google.com/search">
          <input type="hidden" name="ie" value="UTF-8">
          <input type="hidden" name="oe" value="UTF-8">
          <input type="hidden" name="domains" value="${urlparse.urlparse(bf.config.site.url)[1]}">
          <input type="hidden" name="sitesearch" value="${urlparse.urlparse(bf.config.site.url)[1]}">
          <input name="q" id="q" size="20" value="search in blog..." onfocus="if(this.value==this.defaultValue) this.value='';" type="text">
        </form>
    </div-->
</nav>
