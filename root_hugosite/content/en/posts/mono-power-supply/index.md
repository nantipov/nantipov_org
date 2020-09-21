---
title: "Mono :: Power supply"
type: post
author: Nikolai Antipov
date: 2020-02-01T13:05:13+01:00
publishdate: 2020-02-12
lastmod: 2020-02-12
draft: false
description: "Assembling a simply power supply module for Mono"
image: "covers/IMG_2520.JPG"
tags: ["tech", "tinker", "en", "mono", "robot", "rover", "power-supply", "lipo", "raspberry-pi"]
categories: ["tech", "tinker", "en"]
series: [Mono]
---

## Goal

The goal of this `Mono` iteration is improvement of the power supply setup. In the [previous post]({{< ref "posts/mono-first-steps/index.md" >}}) it was mentioned that the Raspberry Pi and other infrastructure would be supported with two separated sources.

## Single battery with huge capacity and 7.4V voltage

I came up into solution with `Li-Po` battery which is known as long lasting power supply.

This is a battery up to 5200 mAh capacity and 7.4V voltage. It should be enough for the purposes (4 DC motors accepting 3V - 9V and Raspberry PI).

{{< notice info >}}
Please be informed and cautious as `Li-Po` batteries should be charged **ALWAYS** under supervision.
{{< /notice >}}

{{< img src="lipo.jpg" caption="Li-Po battery Zeee 7.4V 50C 5200 mAh" >}}

## Step down to 5V

Here is a tiny module (`DC-DC step-down 6-24V to 5V`) for reducing the voltage till 5V with convenient USB connector.

{{< img src="step_down.jpg" caption="Step-down ANGEEK DC-DC 6-24V to 5V 3A" >}}

## Put all together

What I want to build:
- a compact module;
- which couples battery and the step down component;
- has number of additional terminals / connectors for 7.4V and 5V.

Here is what I built for a time being. Here blue terminals supply 7.4V and black headers supply 5V.
The "Dean" (red-brownish) connector serves battery communication.
And step down module with the USB connector is for the Raspeberry Pi.

{{< img src="IMG_2520.JPG" caption="Module built view #1" >}}
{{< img src="IMG_2521.JPG" caption="Module built view #2" >}}
{{< img src="IMG_2523.JPG" caption="Module built view #3" >}}

## Things to improve

There are some points I would like to elaborate in future:
- add a polarity guard for blue terminals;
- add a switcher to have ability quickly turn-off the entire circuit;
- add a voltage reading sensor in order to control battery discharge and handle such an event accordingly in software.
