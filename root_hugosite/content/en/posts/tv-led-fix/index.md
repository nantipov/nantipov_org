---
title: "Fixing SAMSUNG LED UE49MU6179"
type: post
author: Nikolai Antipov
date: 2019-07-27T23:37:41+02:00
publishdate: 2019-07-27
lastmod: 2019-07-27
image: "covers/IMG_1699.JPG"
draft: false
description: "How I was fixing SAMSUNG LED UE49MU6179"
tags: ["tech", "en", "tv", "led", "samsung", "ue49mu6179", "bn94-12439c"]
categories: ["tech", "en", "fix"]
---

## What actually happened?

My TV stop working at some point in time. The red dot does not light up and nothing happens.

## Checking what is inside

Hope to have fuse problem which could be simply fixable.

### Disassembly

Start with two holes on the bottom for getting cover off and then pull it step by step, latch by latch.

{{< img src="IMG_1730.JPG" caption="Left Disassembly hole" width="200px" height="200px" position="right" >}}
{{< img src="IMG_1731.JPG" caption="Right Disassembly hole" width="200px" height="200px" position="right" >}}


### Ah, it is not a fuse issue

Here is what I saw.


{{< img src="IMG_1699.JPG" caption="Mother and power-supply boards" >}}


I have checked with multimeter and it turned out that fuse is not corrupted.

### Checking voltage output

Next step was checking that output voltage conforms to the declared values (it is a small table near to power connector).
All outputs were fine which means the motherboard most likely is an issue.

## How to solve a problem with motherboard?

Well, that could be tricky.
Luckily, there are lot of motherboards available on the second market (e.g. eBay) for adequate price (~ 30 EUR).
Therefore, I bought one and replaced.


{{< img src="IMG_1756.JPG" caption="Two motherboards - old (left) and new (right) one" >}}


**Please note**, motherboard type and TV's screen size should be carefully checked (in my case `bn94-12439c`, `ue49mu6179`, `49"`).

{{< img src="IMG_1761.JPG" caption="Mother board, serial number" >}}

## Small note about remote control

Remote control could not be used together with the "new" board as they did not know each other.

Here is a tip how to initiate a remote control pairing procedure.

> Hold down the "Back" and "Play/pause" buttons on the remote to start the pairing process. Keep holding the buttons down until you get a message on the TV that it is connecting/pairing with the remote.


## It is working

{{< img src="IMG_1763.JPG" caption="It works" >}}
