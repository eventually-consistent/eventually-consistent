<section id="contact">
    <header>
        <h3>About Me</h3>
    </header>
    <br/>
    <img src="/site_img/me.jpg"/>
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
<section id="on_twitter">
    <header>
        <h3>On Twitter <small>the good, the bad, and the ugly</small></h3>
    </header>
    <div id="mohlendo_tweets"></div>
    <a href="http://search.twitter.com/search?q=mohlendo" style="float: right">See more tweets</a>
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
