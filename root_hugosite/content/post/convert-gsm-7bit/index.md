---
title: "GSM 7bit PDU encoding algorithm in Java"
type: post
author: Nikolai Antipov
date: 2019-03-01T11:58:21+01:00
publishdate: 2019-03-01
lastmod: 2019-03-01
draft: true
description: "GSM 7bit PDU encoding algorithm in Java"
tags: ["tech", "en", "java", "gsm", "pdu", "7bit", "converted", "sms", "ussd",
"msisdn"]
categories: ["tech", "en", "java"]
---

## Text to 7-bit PDU string converter

Being honest I forgot why I had written this code some time ago. I put it here
from my another small blog page hosted on `blogpost`
([engnick.blogpost.com](https://engnick.blogspot.com/)).

Now I remember how was it and decided to bring this piece of code, as maybe
it might be useful for somebody. I wrote this code when I was working in
[MegaFon](http://corp.megafon.com/) as part of automated testing tool for
doing some tests against SMS handling billing solutions.

Using this you can encode messages for variety of modem devices working in
PDU mode for sending SMS and USSD requests to GSM network
([PDU mode](http://www.gsm-modem.de/sms-pdu-mode.html)).

As example, this code coverts text `hellohello` into `E8329BFD4697D9EC37`.
Or this can be used even for converting of `MSISDN` numbers.

```java
public static String stringTo7bitHex(String text) {
    StringBuilder output = new StringBuilder();
    byte[] bytes = text.getBytes();
    int f = 0;
    while (f < bytes.length - 1) {
        int t = (f % 8) + 1;
        if (t < 8) {
            byte b = (byte) (((bytes[f] >>> (t - 1)) | (bytes[f + 1] << (8 - t))) & 0x000000FF);
            output.append(intToHex(b & 0x000000FF));
        }
        f++;
    }
    if ((f % 8) + 1 < 8) {
        output.append(intToHex((bytes[f] >>> (f % 8)) & 0x000000FF));
    }
    return output.toString();
}

private static String intToHex(int i) {
    String hex = Integer.toHexString(i);
    if (hex.length() % 2 != 0) hex = 0 + hex;
    return hex.toUpperCase();
}
```
