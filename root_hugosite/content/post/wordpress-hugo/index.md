---
title: "Converting site from Wordpress into Hugo"
type: post
author: Nikolai Antipov
date: 2019-12-14T12:34:57+01:00
publishdate: 2019-12-14
lastmod: 2019-12-14
draft: true
description: "Converting Wordpress into Hugo web-site"
tags: ["tech", "en", "ru", "wordpress", "hugo", "java", "spring-batch", "converter"]
categories: ["tech", "en", "ru", "fix", "java"]
---

## What actually happened?

My wife owns a [web-site](https://orangelvira.com) which was powered by _Wordpress_.
Some time ago we decided to switch into static solution without databases and constantly running page generating / rendering process.

Idea was great, but I came into it quite late - a day before hosting contract should be prolonged.
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

## Working web-site https://orangelvira.com

{{< fig figcaption="Working web-site" >}}
  {{< img src="working_website.png" alt="Working web-site" >}}
{{< /fig >}}
