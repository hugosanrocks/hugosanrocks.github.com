---
layout: page
title: Wellcome to Hugo's blog!
---
{% include JB/setup %}

{%Read [Jekyll Quick Start](http://jekyllbootstrap.com/usage/jekyll-quick-start.html)%}

Follow my FB profile at: [Hugo' FB](https://www.facebook.com/hugosamuel.sanchezreyes)

## Author

    title : My Home Page
    
      name : Hugo S. Sánchez-Reyes
      email : [hugo.geofisica@gmail.com](http://www.gmail.com)
      github : hugosanrocks


## My Posts

This blog contains my posts

    $ rm -rf _posts/core-samples

Here's my posts list.

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

## To-Do

Please let me know any broken link or doubt releated to this site.
