---
title: "Fixing SAMSUNG LED UE49MU6179"
type: post
author: Nikolai Antipov
date: 2019-07-27T23:37:41+02:00
publishdate: 2019-07-27
lastmod: 2019-07-27
draft: false
description: "How I was fixing SAMSUNG LED UE49MU6179"
tags: ["tech", "en", "tv", "led", "samsung", "ue49mu6179", "bn94-12439c"]
categories: ["tech", "en"]
---

## What actually happened?

My TV stop working at some point in time. The red dot does not light up and nothing happens.

## Checking what is inside

Hope to have fuse problem which could be simply fixable.

### Disassembly

Start with two holes on the bottom for getting cover off and then pull the cover step by step, latch by latch.

{{< fig class="grid two" figcaption="Disassembly holes" >}}
  {{< img src="IMG_1730.JPG" alt="Left Disassembly hole" >}}
  {{< img src="IMG_1731.JPG" alt="Right Disassembly hole" >}}
{{< /fig >}}


### Ah, it is not a fuse issue

Here is what I saw.

{{< fig figcaption="Mother and power-supply boards" >}}
  {{< img src="IMG_1699.JPG" alt="Mother and power-supply boards" >}}
{{< /fig >}}

I have checked with multimeter and it turned out that fuse is not corrupted.

### Checking voltage output

Next step was checking that output voltage conforms for declared values (it is a small table near to power connector).
All output were fine which means the motherboard is most probably an issue.

## How to solve a problem with motherboard?

Well, that could be tricky.
Luckily, there are lot motherboards available on the second market (e.g. eBay) for adequate price (~ 30 EUR).
Therefore, I bought one and replaced.

{{< fig figcaption="Motherboards old and 'new' one" >}}
  {{< img src="IMG_1756.JPG" alt="Mother and power-supply boards" >}}
{{< /fig >}}

**Please note**, motherboard type and TV's screen size should be carefully checked.

{{< fig figcaption="Motherboard serial number" >}}
  {{< img src="IMG_1761.JPG" alt="Mother and power-supply boards" >}}
{{< /fig >}}

## Small note about remote control

Remote control could not be used together with the "new" board as they did not know each other.

Here is a tip how to initiate a remote control pairing procedure.

__Hold down the "Back" and "Play/pause" buttons on the remote to start the pairing process. Keep holding the buttons down until you get a message on the TV that it is connecting/pairing with the remote.__
