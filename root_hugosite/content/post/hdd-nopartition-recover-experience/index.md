---
title: "Recovering of data from damaged and quickly formatted HDD"
type: post
author: Nikolai Antipov
date: 2019-02-18T14:07:13+01:00
publishdate: 2019-02-18
lastmod: 2019-02-18
draft: true
description: "Text about this post"
tags: ["tech", "en", "hdd", "recover", "quick-format"]
categories: ["tech", "en"]
---

## What actually happened?

Friends asked me to check what can be done for "fixing" some "broken" hard-drive.

So, what we have?

* Hard-drive 2.5" 500 Gi SATA;
* Correctly detected by `Windows` machine in 3 over 10 times;
* There are lots of pictures, images, songs, videos very important for
owner and his wife in particular;
* Accidentally was formatted with quick-format
(_I did not really know it at the very beginning_);
* Initially had NTFS partition;
* And now has, but empty one.


**Quick remark:** I am not a professional data recovery guru, so here is just
my naive experience.

## First look

The hard drive is well detected on `Linux` as device, however, cannot be mounted
because of some partition issues.

It turned out that `partition table` has been damaged and cannot be read.

## Reading data image with `ddrescue`

I decided to carefully read disk image and store it as a single file in a
safe place for further investigation.

There is a good tool doing this in a brilliant way, called
[ddrescue](https://www.gnu.org/software/ddrescue/), it is a part of GNU project.
Please do not be confused with `dd_rescue` which is another tool doing the same,
but works mostly as a script solution and has not been really maintained
since 2015. So, I decided to go with `ddrescue`.

Quick installation for Debian / Ubuntu.
```sh
sudo apt-get install gddrescue
```

Quick installation for Mac (`brew`).
```sh
brew install ddrescue
```

Tool actually reads the entire disk and copies it onto another device
or image file. The process works in a few phases with forward and backward
passes among the disk. Basically, algorithm is written in a way of rescuing as
much data as possible with less harm. Most damaged places are skipped on
beginning and read carefully afterwards during additional recovering phases.

Also `ddrescue` writes a log, so you can interrupt the process any time and
resume it later.

In my case I read disk and stored it as `dd` compatible image file on another
device.
```sh
sudo ddrescue /dev/sdb1 \
              /media/recovery_1/recovery_001/recovered_image.double_d \
              /media/recovery_1/recovery_001/mapfile.dat
```
Where

* `/dev/sdb1` - device under recover;
* `/media/recovery_1/recovery_001/recovered_image.double_d` - where recovered
image should be stored;
* `/media/recovery_1/recovery_001/mapfile.dat` - path to the log file.

## What I found after building an image

\
**Empty disk.**

Seriously, it was well cleaned disk :-).
Yes, about `200 Mi` of data had been physically corrupted somewhere in the middle
of the disk. However, `partition table` was recovered well, but it appears empty.

Then, yes, my friend, said Windows offered him to format disk after some number of
attempts to read it. Mostly `Windows` was experiencing something like of handing
or freezing. However, finally it asked to format a disk and my friend accepted
the offer (accidentally).

## Quick format does not destroy the data and files itself
...Well, but makes them unreachable.

Disk was formatted with `quick-format` (default) approach. Which means data is
still there. But we lost the entire structure of folders/directories and files.
We are not aware about files location, size and fragmentation. It is data, but
we cannot reach it.

## Thank you `photorec`
I found a tool called [photorec](https://www.cgsecurity.org/wiki/PhotoRec).
This one is amazing solution helping you for recovering data even after destroying
the allocation table. It does not actually restores everything,
but does a great job anyway.

Quick installation for Debian / Ubuntu.
```sh
sudo apt-get install testdisk
```

Quick installation for Mac (`brew`).
```sh
brew install testdisk
```

So, what is the story behind. The `photorec` reads disk or image sector by
sector and tries to recognize the files. It has a library of most commonly known
file formats and does its best to solve the puzzle looking into raw data.

For example, it sees the sequence of bytes which looks like a beginning of
`JPEG` file. Then it tries to treat the data in context of `JPEG` file, following
its structure, reading the length of file, doing checksum magic and so on.
The same idea for video, audio and other files, but different algorithms for
every single filetype.

As a result you get some of your lost data back. It is not 100% data recover.
Because of files fragmentation or exotic files format which `photorec` is not
aware of.

Also even recovered files may look corrupted because of disk physical damages,
streaming content might appear unfinished and things like that.

Yes, and of course, filenames and allocation are totally lost.

So, here is how I run it.

```sh
cd /media/recovery_1/recovery_001/

photorec /log /d /media/recovery_1/recovery_001/data /media/recovery_1/recovery_001/recovered_image.double_d
```

Where

* `/log` - _Option_ to enable logging (for stop/resume abilities);
* `/d /media/recovery_1/recovery_001/data` - _Option_ to specify target
directory for recovered files;
* `/media/recovery_1/recovery_001/recovered_image.double_d` - points to `dd` compatible image under recovering.

## Organizing content

*TODO:* Do pictures, music and video sorting (e.g. [beets.io](http://beets.io), [phockup](https://github.com/ivandokov/phockup), [elodie](https://github.com/jmathai/elodie), [exiftool](https://sno.phy.queensu.ca/~phil/exiftool/)).


## Funny backlog
I did all my experiments running on `Raspberry Pi` device with `raspbian` OS
on it.
Here is how it actually looks like.

#### Reading and storing disk image with `ddrescue`
{{< optfigure src="img_1032_1" class="figure" title="Connections"
caption="Reading and storing disk image with `ddrescue`" >}}

{{< optfigure src="img_1031_1" class="figure" title="In progress"
caption="Reading and storing disk image with `ddrescue`" >}}

#### Extracting files with `photorec`
{{< optfigure src="img_1157_1" class="figure" title="Raspberry Pi with ice on top"
caption="Extracting files with `photorec`" >}}
