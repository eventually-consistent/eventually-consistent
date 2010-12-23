<%inherit file="_templates/site.mako" />
<div class="blog_post">
  <span class="post_prose">    
    <h1>Welcome to my site.</h1>
    <p>Here you find some information from me and about me. It is still work in progress.</p>
    <p>Below you see my latest Blog posts.</p>
  </span>
  <hr class="interblog"/>
    % for post in bf.config.blog.posts[:2]:
        <%include file="post.mako" args="post=post" />
        <hr class="interblog"/>
    % endfor
</div>

