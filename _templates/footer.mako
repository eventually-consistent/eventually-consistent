<div>
<section id="about">
    <header><h3>About</h3></header>
    <p>Powered by <a href="http://www.blogofile.com">Blogofile</a>.</p>
</section>
<section>
    <header><h3>Feeds</h3></header>
<p>RSS feeds for <a href="${bf.util.site_path_helper(bf.config.blog.path,'feed')}">Entries</a>
% if bf.config.blog.disqus.enabled:
 and <a
href="http://${bf.config.blog.disqus.name}.disqus.com/latest.rss">Comments</a>.
% endif
</p>
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
% if bf.config.blog.disqus.enabled:
<script type="text/javascript">
//<![CDATA[
(function() {
		var links = document.getElementsByTagName('a');
		var query = '?';
		for(var i = 0; i < links.length; i++) {
			if(links[i].href.indexOf('#disqus_thread') >= 0) {
				query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
			}
		}
		document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/get_num_replies.js' + query + '"></' + 'script>');
	})();
//]]>
</script>
% endif
</div>
