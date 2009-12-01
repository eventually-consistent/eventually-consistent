import os
import shutil
from blogofile.cache import bf

def run():
    write_categories()

def write_categories():
    """Write all the blog posts in categories"""
    root = bf.util.path_join(bf.config.blog_path,bf.config.blog_category_dir)
    #Find all the categories:
    categories = set()
    for post in bf.posts:
        categories.update(post.categories)
    for category in categories:
        category_posts = [post for post in bf.posts \
                              if category in post.categories]
        #Update the categories sidebar models
        bf.all_categories.append((category,len(category_posts)))
        #Write category RSS feed
        bf.controllers.feed.write_feed(category_posts,bf.util.path_join(
                bf.config.blog_path, bf.config.blog_category_dir,
                category.url_name,"feed"),"rss.mako")
        bf.controllers.feed.write_feed(category_posts,bf.util.path_join(
                bf.config.blog_path, bf.config.blog_category_dir,
                category.url_name,"feed","atom"),"atom.mako")
        page_num = 1
        while True:
            path = bf.util.path_join(root,category.url_name,
                                str(page_num),"index.html")
            try:
                bf.util.mkdir(os.path.split(path)[0])
            except OSError:
                pass
            page_posts = category_posts[:bf.config.blog_posts_per_page]
            category_posts = category_posts[bf.config.blog_posts_per_page:]
            #Forward and back links
            if page_num > 1:
                prev_link = bf.util.path_join(
                    bf.config.blog_path, bf.config.blog_category_dir, category.url_name,
                                           str(page_num - 1))
            else:
                prev_link = None
            if len(category_posts) > 0:
                next_link = bf.util.path_join(
                    bf.config.blog_path, bf.config.blog_category_dir, category.url_name,
                                           str(page_num + 1))
            else:
                next_link = None
            bf.writer.materialize_template("chronological.mako", path, {
                    "posts": page_posts,
                    "prev_link": prev_link,
                    "next_link": next_link })
            #Copy category/1 to category/index.html
            if page_num == 1:
                shutil.copyfile(bf.util.path_join(bf.writer.output_dir,path),bf.util.path_join(
                        bf.writer.output_dir,root,category.url_name,
                        "index.html"))
            #Prepare next iteration
            page_num += 1
            if len(category_posts) == 0:
                break
