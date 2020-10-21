---
title: "Hunter Secretary"
date: 2020-09-21T11:52:50+02:00
description: "Bot receptionist for responding on messages from recruiters"
draft: false
tags: ["en", "recruiting", "java", "hunter-secretary", "gmail", "google-auth", "markdown", "html", "templates"]
categories: ["en", "recruiting", "tech"]
image: covers/hunter-secretary-mailbox.png
---

## Problem statement
I have quite a number of unprocessed mails and messages in variety of communication platforms from recruiters. I respect people, but unfortunately cannot respond everyone in a fast manner. It takes time and therefore creates a back-pressure problem in a condition of consumption performance is lower than producing one.

Number of incoming messages is growing every week.

## Solution
I want to read a message, review it and put a label or mark it somehow indicating appropriate type of response:
- `thank you` - thank you for your message, but I am not looking for a job at the moment;
- `later` (to be implemented) - additional time required for preparing a response, secretary collects messages of that kind and schedules an appointment in a calendar within available time-slot;
- `meeting` (foreseeable requirement, not in the roadmap at the moment) - respond with a `Google Meet` link.

Some service processes those marks and labels and composes a response with additional consideration of message language and how far time-wise it was received (extra apologies).

## Gmail
At the moment, `Gmail` based solution looks the most reachable one. Since Google provides quite comprehensive API, integration looks straight-forward.

{{< img src="mailbox.png" caption="Current situation in my mailbox" position="right" >}}

## Project
Nevertheless, project looks quite interesting in variety of aspects. It deals with Google auth, Gmail, language detection, markdown, HTML and general templates processing.

Project is available at Github https://github.com/nantipov/hunter-secretary .
