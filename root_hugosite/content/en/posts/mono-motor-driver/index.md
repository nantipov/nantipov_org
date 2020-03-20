---
title: "Mono :: Motor driver"
type: post
author: Nikolai Antipov
date: 2020-02-09T13:05:34+01:00
publishdate: 2020-02-12
lastmod: 2020-02-12
draft: false
description: "Putting Pololu TB6612FNG motor driver into consideration"
image: "covers/IMG_2571.JPG"
tags: ["tech", "tinker", "en", "mono", "robot", "rover", "tb6612fng", "motor-driver", "pca9685", "raspberrypi"]
categories: ["tech", "tinker", "en"]
series: [Mono]
---

## Goal

The goal of this `Mono` iteration is replacing the motor driver. In the [earlier published post]({{< ref "posts/mono-first-steps/index.md" >}}) it was mentioned that `L298N` motor driver creates a significant voltage drop.

Well, I decided to go with the `TB6612FNG` chip as of the [Pololu motor driver](https://www.pololu.com/product/713).

{{< img src="IMG_2546.JPG" caption="Pololu motor driver TB6612FNG" >}}

## Designing the Mono driving module

### Requirements
Okay, we have
- four motors
- and two motor drivers with the following pinout.

{{< img src="pololu_tb6612fng_pinout.jpg" caption="Pololu motor driver TB6612FNG pinout" >}}

|Pin on the left|Description                        |<mark>I</mark>|Description                     |Pin of the right|
|:--------------|:----------------------------------|--------------|-------------------------------:|---------------:|
|`GND`          | Logic ground                      |<mark>I</mark>| PWM for the engine A           |`PWMA`          |
|`VCC`          | Logic VCC 2.7V-5.5V               |<mark>I</mark>| Direction Pin 2 <br> Engine A  |`AIN2`          |
|`AO1`          | Engine A output 1                 |<mark>I</mark>| Direction Pin 1 <br> Engine A  |`AIN1`          |
|`AO2`          | Engine A output 2                 |<mark>I</mark>| Standby Pin                    |`STBY`          |
|`BO1`          | Engine B output 1                 |<mark>I</mark>| Direction Pin 1 <br> Engine B  |`BIN1`          |
|`BO2`          | Engine B output 2                 |<mark>I</mark>| Direction Pin 2 <br> Engine B  |`BIN2`          |
|`VMOT`         | Engines V<sub>in</sub> 4.5V-13.5V |<mark>I</mark>| PWM for the engine B           |`PWMB`          |
|`GND`          | Engines ground                    |<mark>I</mark>| PWMs and xINy ground           |`GND`           |

Therefore, module should supply following communications:
- power supply for engines (`VMOT` / `GND` - power-supply 7.4V);
- power supply for logic (`VCC` / `GND` - power-supply 5V);
- speed control PWMs x4 (`PWMA`, `PWMB`, `GND` - PCA9685 PWM channels);
- directions pins x2 per motor, x8 in total (`AIN1`, `AIN2`, `BIN1`, `BIN2` - Raspberry Pi GPIO digital pins);
- standby pins x2 (`STBY` - Raspberry Pi GPIO digital pin; enables / disables both motors);
- output engine connectors as terminals x4 (`AO1`, `AO2`, `BO1`, `BO2` - engines).

### Sketch
Here is a small sketch.
{{< img src="IMG_2577.JPG" caption="Mono driving module sketch" >}}

## Manufacturing the module

### Soldering
{{< img src="IMG_2566.JPG" caption="Module on prototype board #1" >}}
{{< img src="IMG_2568.JPG" caption="Module on prototype board #2" >}}

### Assembling & installation
{{< img src="IMG_2571.JPG" caption="Assembled module" >}}
{{< img src="IMG_2575.JPG" caption="Installed module" >}}

## Demo

Here is a basic functionality demonstrated. I keep the software behind the scenes at the moment.
I will place an update on this later.

{{< youtube iXAFjfkrZSw >}}
