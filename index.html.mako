<%inherit file="_templates/site.mako" />
<section id="intro">  
    <header>  
        <h2>Welcome to my site.</h2>  
    </header>  
    <p>Here you find some information from me and about me. It is still work in progress. Below is my latest blog post.</p>  
</section>
    % for post in bf.config.blog.posts[:1]:
        <%include file="post.mako" args="post=post" />
        <hr class="interblog"/>
    % endfor

