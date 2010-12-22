<% import urlparse %>
<div id="header" onclick="location.href='${bf.util.site_path_helper()}';" style="cursor: pointer;">
  <div id="plugbanner"></div>
  <div id="blog_logo"></div>
  <h1><a href="/">
      <span id="blog_name">
        ${bf.config.blog.name}
      </span>
    </a>
  </h1>
</div>
<div id="top_bar">
  <div class="ButtonBar">
    <ul>
      <li><a href="/">Home</a></li>
      <!--li><a href="${bf.util.site_path_helper('/community')}">Community</a></li-->
      <li><a href="${bf.config.util.site_path_helper(bf.config.blog.path)}">Blog</a></li>
    </ul>
  </div>
  <div id="search">    
    <form id="searchform" method="get" action="http://www.google.com/search">
      <input type="hidden" name="ie" value="UTF-8">
      <input type="hidden" name="oe" value="UTF-8">
      <input type="hidden" name="domains" value="${urlparse.urlparse(bf.config.site.url)[1]}">
      <input type="hidden" name="sitesearch" value="${urlparse.urlparse(bf.config.site.url)[1]}">
      <input name="q" id="q" size="20" value="search in blog..." onfocus="if(this.value==this.defaultValue) this.value='';" type="text">
    </form>
  </div>
</div>
