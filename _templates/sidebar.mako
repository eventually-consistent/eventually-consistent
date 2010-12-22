<div id="right_sidebar">
  <div id="contact">
    <h3>About Me</h3>
    <br/>
    <img src="site_img/me.jpg"/>
  </div>
  <div id="blog_post_list">
  <h3>Latest blog posts</h3>
  <ul>
% for post in bf.config.blog.posts[:5]:
    <li><a href="${post.path}">${post.title}</a></li>
% endfor
  </ul>
  </div>
  <div id="on_twitter">
    <h3>On Twitter <small>the good, the bad, and the ugly</small></h3>
    <div id="mohlendo_tweets"></div>
    <a href="http://search.twitter.com/search?q=mohlendo" style="float: right">See more tweets</a>
  </div>
  <div id="commits">
    <h3>Latest Commits</h3>
    <div id="commitsRSS">&nbsp;</div>
    <script type="text/javascript" src="http://www.google.com/reader/ui/publisher-en.js"></script>
<script type="text/javascript" src="http://www.google.com/reader/public/javascript/user/05822478891877038698/label/github?n=5&callback=commitsRSSRender"></script>
    <a href="http://github.com/mohlendo/" style="float: right">See more commits</a><br/>
  </div>
  <div id="categories">
    <h3>Categories</h3>
    <ul>
% for category, num_posts in bf.config.blog.all_categories:
     <li><a href="${category.path}">${category}</a> (<a href="${category.path}/feed">rss</a>) (${num_posts})</li>
% endfor
    </ul>
  </div> 
  <div id="archives">			
    <h3>Archives</h3>
    <ul>
% for link, name, num_posts in bf.config.blog.archive_links:
      <li><a href="${bf.util.site_path_helper(bf.config.blog.path,link)}/1" title="${name}">${name}</a>&nbsp;(${num_posts})</li>
% endfor
    </ul>
  </div>

</div>
