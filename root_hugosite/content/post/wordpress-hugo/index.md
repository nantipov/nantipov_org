---
title: "Converting site from Wordpress into Hugo"
type: post
author: Nikolai Antipov
date: 2019-12-14T12:34:57+01:00
publishdate: 2019-12-14
lastmod: 2019-12-14
draft: false
description: "Converting Wordpress into Hugo web-site"
toc: true
tags: ["tech", "en", "ru", "wordpress", "hugo", "java", "spring-batch", "converter", "freemarker", "jsoup"]
categories: ["tech", "en", "ru", "fix", "java"]
---

## What actually happened?

My wife owns a [web-site](https://orangelvira.com) which was powered by _Wordpress_.
Some time ago we decided to switch into static solution without databases and constantly running page generating / rendering process.

Idea was great, but I came to it quite late - just a day before hosting contract should be prolonged.
Trick was in switching also into another environment where only static files can be served. Having this, the
old hosting with `apache httpd`, `mysql database` and `php interpreter` could be safely decommissioned saving some money.

Well, I quickly found a plugin (forgot its name; there are a few of them) for Wordpress which does static pages generating effectively rendering posts and keeping the entire structure. Sounds very good.
This totally works as a temporary solution till the moment my wife adds new posts and content.

I quickly got the package of static `html` and `css` files. Then "copied" them into new environment and checked if it works.

It worked well, so I initiated DNS settings amendment and closed old hosting contract. Wow! That was a good job.

Next day, DNS records are fully propagated and old hosting was stopped. Suddenly, my wife asked me to check if her web-site is working. She received a couple of messages from friends indicating that something goes wrong :-).

I quickly checked and found out that only posts written in English are okay, others just lost (`404`).

It turned out, that plugin does not support encodings and slightly corrupted the content and links for post written in Russian (95%). And my quick check was done on the randomly picked English article (I am so stupid).

Yes, that was embarrassing. We placed an announcement that site is temporary under construction.

{{< fig figcaption="Embarrassing 'not found' announcement" >}}
  {{< img src="not_found_screenshot.png" alt="Embarrassing 'not found' announcement" >}}
{{< /fig >}}

## What I had on my table?

* Entire backup (Yes, of course, I made a backup before ending the hosting contract);
  * All files hosted on a machine;
  * Hosting configuration files;
  * Database dumps (`sql` files);
* Hardly workable web-site as number of static files;
* Intention to "manage" all this content with one of statically-oriented solutions (e.g. `Hugo`, `Hexo`, `Jekyll`, etc.).

Well, files I have are mostly:
* Wordpress PHP code;
* Huge number of images and photos;
* Unstructured and corrupted static pages.

The only way to restore the structured content was extracting it from the database accompanying with images and photos.

## Writing own converter

Here is a simple home crafted solution based on:
* Java;
* Spring Batch;
* Freemarker;
* Jsoup.

https://github.com/nantipov/wordhugopress

Maybe later I will add a dockerized version will all tools inside (e.g. `java`, `mysql`, `go`, `hugo`), but it is another story.
By the way, fill free to contribute in a project.

## Configure, build and run

Well, I introduced a simple configuration within simple `Spring`'s settings file.

```yaml
app:
  sources:
    source-1:
      wordpress-home: /optional/path/to/public_html1
      wordpress-remote-base-url: http://optional.website1.org/
      database:
        url: jdbc:mysql://localhost:3306/database1
        username: root
        password: mysql
      tags:
        - 'regular'
      categories:
        - 'Basic posts'
    source-2:
      wordpress-home: /optional/path/to/public_html2
      wordpress-remote-base-url: http://optional.website2.org/
      target-resource-suffix: "-s"
      database:
        url: jdbc:mysql://localhost:3306/database2
        username: root
        password: mysql
      tags:
        - 'extra'
      categories:
        - 'Limited edition posts'
  target:
    hugo-site-content-items-dir: output/blog/content/posts
```

### Sources

Here multiple sources could be declared. Local or remote or both locations could be specified, tool automatically tries to find a resource. So if you do not have a local copy, but there a workable website, just put it.

Also setting `wordpress-remote-base-url` helps for detecting inner-site or external links. Because inner-site links should be transformed into the new "folders" structure.

### Tags, categories and other taxomonies

Special `tags` or `categories` could be assigned for specific sources. And, of course, original tokens will also be migrated.

### Typical content page layout

Check file `resources/templates/empty-post.ftl` (`Freemarker` template) to get an idea about configuring the target post composition.

```
<#function taxname tax>
    <#if tax == "category"><#return "categories"/><#elseif tax == "post_tag"><#return "tags"/><#else><#return tax/></#if>
</#function>
---
title: '${post.title}'
author: ${post.author}
date: ${post.createdAt?iso_local}
publishdate: ${post.createdAt?iso_local}
lastmod: ${post.modifiedAt?iso_local}
draft: ${post.draft?string("true", "false")}
description: '${post.title}'
<#if post.thumbnailFilename?has_content>
cover: 'posts/${post.postDirectoryName}/${post.thumbnailFilename}'
</#if>
<#list post.taxonomy.keySet() as taxomony>
${taxname(taxomony)}: [${post.taxonomy.get(taxomony)?map(t -> "'" + t + "'")?join(", ")}]
</#list>
---

${post.processedContent}
```

All fields from original `Wordpress` posts are propagated into `post` object. With some additions:
* `postDirectoryName` - path to the target `hugo` directory for the specific post;
* `thumbnailFilename` - path to the thumbnail file;
* `taxonomy` - taxonomy data as map <taxonomy name> -> <list> (e.g. `post_tag` -> `['hey', 'happy']`).

### Output `hugo` structure

Just create an empty `hugo` site.

```sh
hugo new site blog
```

And put its path to the tool configuration.

For example.
```yaml
target:
  hugo-site-content-items-dir: output/blog/content/posts
```

### Build the thing and run it

```sh
./gradlew clean build run
```

## Working web-site https://orangelvira.com

{{< fig figcaption="Working web-site" >}}
  {{< img src="working_website.png" alt="Working web-site" >}}
{{< /fig >}}
