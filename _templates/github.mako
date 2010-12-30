% if bf.config.github.enabled:
<section id="github">
<header><h3>Github Projects</h3></header>
<ul>
% for project in bf.config.controllers.github.repo_list:
    <li><a href="${project.url}" title="${project.name}">${project.name}</a></li>
% endfor
</ul>
</section>
% endif
