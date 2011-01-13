---
categories: software
date: 2010/12/23 13:09:03
title: A nice new blog with blogofile and github 
tags: python blogofile git github hosting submodules
---
So, in my first blog post I will describe howto use [GitHub](http://www.github.com) to serve a [Blogofile](http://www.blogofile.com) Blog, which I have done with this blog.
###First, what is [Blogofile](http://www.blogofile.com)?###
Blogofile is a framework for static websites. You don't need a webserver and no database, only webspace. 
Blogofile provides templates, controllers and filters, almost like any other dynamic web frameworks and compiles them to a static website.
Right now it is more or less a blogging engine but you can actually create any website you want.
Have a look at the website for details.

And there comes [GitHub](http://www.github.com) into the play. [GitHub](http://www.github.com)
provides with [GitHub Pages](http://pages.github.com/) a very simple way of publishing content to the web. 
So why not using [GitHub](http://www.github.com) for serving your blogofile website.

###Github setup###
You need 2 public repositories for that, the source code repository and the website repository that contains the compiled pages. My two repos are:

* [http://github.com/mohlendo/manuel-ohlendorf.de](http://github.com/mohlendo/manuel-ohlendorf.de) with the source code
* [http://github.com/mohlendo/mohlendo.github.com](http://github.com/mohlendo/mohlendo.github.com) with the compiled HTML files

The later one is a special repository for user pages published with [GitHub Pages](http://pages.github.com/).

###Git setup###
The whole source code of your website with the Mako templates etc. will be pushed to the source code repository.
The command `blogofile build` compiles the website into the sub-folder `_site`. 
The contents of this directory is what we want to push to the website repository which GitHub will publish to the web. In order to do that we 
need to create a git [submodule](http://www.kernel.org/pub/software/scm/git/docs/git-submodule.html) with the command:
    
    git submodule add http://github.com/mohlendo/mohlendo.github.com _site
     
That creates a new submodule `_site`. Now everytime the site is rebuild, you can commit and push the changes to the website repository and github 
will automatically publish them - in my case to [http://mohlendo.github.com](http://mohlendo.github.com)

###_config.py changes###
Every time blogofile recreates the website it completely clears the `_site` directory 
and therefor also the `.git` directory of the submodule. 
This leads to a confusion of git and it cannot track changes on the compiled website anymore.

I wrote some small custom `pre_build()` and `post_build()` hooks that moves the 
`.git` directory to a temp folder and restores it after a successfull build.

$$code(lang=python)
### Pre/Post build hooks:
def pre_build():
    if not os.path.isdir("_tmp"):
        os.mkdir("_tmp")
    else:
        shutil.rmtree("_tmp")
        os.mkdir("_tmp")
    if os.path.isdir(os.path.join("_site",".git")):
        shutil.move(os.path.join("_site",".git"),"_tmp")    
    #Do whatever you want before the _site is built
    pass
def post_build():
    if os.path.isdir(os.path.join("_tmp",".git")):
        shutil.move(os.path.join("_tmp",".git"),"_site")    
    #Do whatever you want after the _site is built
$$/code

Sadly, blogofile only invokes the `post_build()` hook when everything works fine. When you have an error 
in your templates blogofile only invokes the `pre_build()` hook. But destroying your submodule is no problem since you have it 
on GitHub! Just delete the `_site` folder and update the submodule with `git submodule update` in the root folder of your blogofile project.

### That's it! ###
Quite cool, I think, because you don't need any webserver or webspace and still have quite a nice blog! 
As a start you can also fork my two github repos.
