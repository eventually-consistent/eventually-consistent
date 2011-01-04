<section id="contact">
    <header>
        <h3>About Me</h3>
    </header>
    <image src="/site_img/me.jpg" width="100" height="150"/>
    <div>
        If you want to contact me, send an <a href="mailto:mail@manuel.ohlendorf.de">email</a> or use one of my social networking profiles:
        <ul>
            <li><a href="http://twitter.com/mohlendo"/>twitter</a></li>
            <li><a href="http://www.flickr.com/photos/14257612@N02/"/>flickr</a></li>
            <li><a href="http://www.facebook.com/mohlendo"/>facebook</a></li>
        </ul>
    </div>
</section>
<section>
    <header>
        <h3>Latest blog posts</h3>
    </header>
    <ul>
    % for post in bf.config.blog.posts[:5]:
        <li><a href="${post.path}">${post.title}</a></li>
    % endfor
    </ul>
</section>
% if hasattr(bf.config, "github"):
    <%include file="github.mako" />
% endif 

<section id="categories">
    <header><h3>Categories</h3></header>
    <ul>
    % for category, num_posts in bf.config.blog.all_categories:
        <li>
            <a href="${category.path}">${category}&nbsp;(${num_posts})</a><!--a href="${category.path}/feed">rss</a-->
        </li>
    % endfor
    </ul>
</section> 
<section id="archives">			
    <header><h3>Archives</h3></header>
    <ul>
    % for link, name, num_posts in bf.config.blog.archive_links:
        <li><a href="${bf.util.site_path_helper(bf.config.blog.path,link)}/1" title="${name}">${name}&nbsp;(${num_posts})</a></li>
    % endfor
    </ul>
</section>
