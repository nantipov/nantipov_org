---
title: "Mono :: First Steps"
type: post
author: Nikolai Antipov
date: 2020-01-26T15:27:19+01:00
publishdate: 2020-02-24
lastmod: 2020-02-24
draft: false
image: "covers/IMG_2508.JPG"
description: "First steps with a small rover"
tags: ["tech", "tinker", "en", "mono", "robot", "rover", "raspberrypi"]
categories: ["tech", "tinker", "en", "mono"]
series: [mono]
---

## Introduction

Let me introduce `Mono`.

It is a small rover which I am going to build using simple set of existing modules.
As a base the ready chassis has been taken.
And here is the initial version for further experiments.

{{< img src="IMG_2508.JPG" caption="Mono view #1" >}}
{{< img src="IMG_2509.JPG" caption="Mono view #2" >}}

## Components

Let's start with the following things:
* Chassis with four motors;
* Motor drivers L298N (2x);
* Controller for generating PWM impulses PCA9685 (speed control);
* Brain as Raspberry PI Zero with WiFi;
* Batteries and power bank.

Yes, this is an experimental thing. Firstly, just try to make everything working in a simple way.
The current goal is ability to control four engines from the Raspberry PI.

For now, engines are powered by batteries (4 x 1.2 V = 4.8 V) and Raspberry PI is separately powered by the 5V power bank.

## Things to improve

The biggest thing to improve is that currently nothing actually works :-). Or I would say that does not work as expected.
I have made a small piece of software for controlling the engines, but nothing works.

After short verification it seems we experience the voltage drop on engines up to 1.5 Volts. After reading a little bit
around this, it seems problem with L298N motor drivers. It recommended to supply it with at least 9 Volts.

Therefore, let's aim for a small improvements:
- Power supply;
- Motor drivers with less "voltage consumption".
