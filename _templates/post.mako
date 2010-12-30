<%page args="post"/>

<% 
import re
post_id = re.sub("[ ?]","-",post.title.lower()) %>

<section>
	<article class="blogPost" id="${post_id}">
		<header>
			<a class="blogPostTitle" name="${post.title}" />
            <h2 class="blogPostTitle"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h2>
			<p><time datetime="${post.date.strftime("%Y-%m-%dT%H:%M:%S%z")}">${post.date.strftime("%B %d, %Y at %I:%M %p")}</time> | categories: 
<% 
   category_links = []
   for category in post.categories:
       if post.draft:
           #For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category.name)
       else:
           category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>
${", ".join(category_links)}
% if bf.config.blog.disqus.enabled:
 | <a href="${post.permalink}#disqus_thread">View Comments</a>
% endif
  </p>
  </header>
    <div>
        ${self.post_prose(post)}
	</div>
    </article>
</section>

<%def name="post_prose(post)">
  ${post.content}
</%def>
