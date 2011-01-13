<%inherit file="_templates/site.mako" />
<script type="text/javascript"> 
      $(document).ready(function () {
          $.getJSON("http://api.twitter.com/1/statuses/user_timeline/sai_venkat.json?count=1&include_rts=true&callback=?",
            function (data) {
              var tweet = data[0].text.replace(/("(\S[^"]*?\S)":)?(https?:\/\/\S*[^\s.,;?!])/, '<a href="$3">$3</a>');
              tweet = tweet.replace(/(@(\w+))/, '<a href="http://twitter.com/$2">$1</a>');
              $("#tweet").html('"'+tweet+'"');
              });
          });
    </script> 
<section id="intro">  
    <header>  
        <h2>Welcome to my site.</h2>  
    </header>  
    <p id="tweet"></p>
    <br/>
    <p>Here you find some information from me and about me. It is still work in progress. Below is my latest blog post.</p> 
</section>
    % for post in bf.config.blog.posts[:1]:
        <%include file="post.mako" args="post=post" />
        <hr class="interblog"/>
    % endfor

