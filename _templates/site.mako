<%inherit file="base.mako" />
<!doctype html> 
<html lang="en">
  <head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;"> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
  </head>
  <body>
      ${self.header()}
      <div id="content">
        <div id="mainContent">
            ${next.body()}
        </div>
	<div id="right_sidebar">
          <aside>
            ${self.sidebar()}
          </aside>
	</div>
      </div>
      <footer>
        ${self.footer()}
      </footer>
  </body>
</html>
<%def name="head()">
    <%include file="head.mako" />
</%def>
<%def name="header()">
    <%include file="header.mako" />
</%def>
<%def name="footer()">
    <%include file="footer.mako" />
</%def>
<%def name="sidebar()">
    <%include file="sidebar.mako"  args="posts=posts" />
</%def>
