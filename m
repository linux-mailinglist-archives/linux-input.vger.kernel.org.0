Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBF83B0138
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 12:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhFVKWA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Jun 2021 06:22:00 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:56187 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhFVKVy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Jun 2021 06:21:54 -0400
Received: from [192.168.1.155] ([95.117.21.172]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N49Yn-1lDGD730KX-0102cd; Tue, 22 Jun 2021 12:19:32 +0200
Subject: input devices vs. keyboard backlights [WAS: [PATCH v2] platform/x86:
 add support for Acer Predator LEDs]
To:     Hans de Goede <hdegoede@redhat.com>, leo60228 <leo@60228.dev>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
 <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
 <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
 <436b87c1-5c24-05ce-98fd-c3664c7765e2@metux.net>
 <5661323e-9a75-cbbe-0e16-777355bba9f5@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <45deb019-aca4-cddb-8edf-ae2987e31d7f@metux.net>
Date:   Tue, 22 Jun 2021 12:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5661323e-9a75-cbbe-0e16-777355bba9f5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G2FhHSPfDD/yP8f1zlgmFfE5jUiMUKzKkJ7cjr9NDOl7U+1U1wH
 vBw1vYH9safjKCphvoPrvSJVYvtTaprD9nQkA+cYk1ziByvHIRWVafZN9p7OZ8npVocm8Mq
 Pq35pP07IXR+dERWG0jbaQUzmM97FfwCeTLyMhyESyB/F7NoNjqgXCjS7Tcj/7Oz+sF5vgi
 XdFHrn0pryrMSdJN2GdxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WsRL5ObH97g=:DeCKyQZt2jkBIyWYzsq15n
 rnDOOsXQDYgWGZootoegUMga9+yarJpUvRlaukggn52SkBEEZdVSrUilQnN/sVOiNtH3Ks2z0
 +29Y7h13L6uGEeUI8ja/c/TF+HjERxxAZlFYo7RTLS1/wcuZ2cWxeJIbqRfP7aL6stPF5N+UV
 zB+gJINFC1T05J85rTkrXAV74roW3P8/LGMtfrClvtYXEwOdEliJxRdg4kOFMzYOTQWJ/uakF
 WsWzclmTxk+v9fmWQHZJFebiUrHWkbjP4eQjgyqs9LdaSbHbKCQFwN4n62VvvL6imBz9NzBSw
 MfqI3TIpaDYbmxvkXzdgWiZJY6+3jADz98L9RGvrm6lCPwY57TjFdZBr7rv3rHTiEXjBLXNyn
 qSwQ0YGJ/XdrgNimBVPEXFgujv+wohdxd8P39Tvh/B+Kt6cNr5j00CVaNcf131R+Yj24XdmuH
 pkFU108UU+mpY2R9lAEc2hvGsJgl3SyeXg8U3XjlGM09+5Dth8alM419hSksNVbwSrwJQjtXW
 PmWF09yKdmNAb5FO54PoIU=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 21.06.21 21:43, Hans de Goede wrote:

Hi,

> The LED API actually has specific features which are typically
> only used with kbd-backlights, such as the brightness_hw_changed
> attribute which was specifically added to allow userspace to
> monitor when a laptops embedded controller changes the kbd-backlight
> brightness in response to a Fn + somekey hotkey keypress, so that
> userspace can show an on-screen-display notification that the
> kbd brightness has changed (like how it typically does for
> audio volume changes too) and also showing the new brightness
> level. See: Documentation/ABI/testing/sysfs-class-led for
> the docs for the /sys/class/leds/<led>/brightness_hw_changed

yes, that's great. but it seems we're still lacking a direct standard
way for associating an input device with the corresponding backlight
LED.

Or am I missing something ?

>> Looks like a very complicated way to do that. But actually I've never
>> understood why I should use this strange upower thing anways :p
> 
> Just because you don't have a use for it does not mean that it
> is not useful (and widely used) in cases where people use Linux
> as a desktop OS, rather then for more embedded cases.

I'm actually using Linux on desktop for over 25 years now.

But let's go back to the kernel side.

>> In general, LED class isn't so bad, as it already gives us LED control
>> (*1), but I don't see any portable way for finding the corresponding
>> LED for some input device. In DRM I see the backlight as subdevice.
> 
> With USB-HID keyboards the LED class device will have the same HID-device
> as parent as the input device. If there is no HID parent-device, then any
> foo_kbd_backlight device will belong to the atkbd (PS/2) input-device.

Still a lot of if's and guessing :(

Why can't we make it appear the same way like the other leds (eg. caps-
lock) ?

Here's how it looks on my Portege:

| ~ ls -l /dev/input/input0:
|
| drwxr-xr-x 2 root root    0 Jun 22 11:42 capabilities
| lrwxrwxrwx 1 root root    0 Jun 22 11:42 device -> ../../../serio0
| drwxr-xr-x 3 root root    0 Jun 22 11:42 event0
| drwxr-xr-x 2 root root    0 Jun 22 11:42 id
| drwxr-xr-x 3 root root    0 Jun 22 11:37 input0::capslock
| drwxr-xr-x 3 root root    0 Jun 22 11:42 input0::numlock
| drwxr-xr-x 3 root root    0 Jun 22 11:42 input0::scrolllock
| -r--r--r-- 1 root root 4096 Jun 22 11:42 modalias
| -r--r--r-- 1 root root 4096 Jun 22 11:42 name
| -r--r--r-- 1 root root 4096 Jun 22 11:42 phys
| drwxr-xr-x 2 root root    0 Jun 22 11:42 power
| -r--r--r-- 1 root root 4096 Jun 22 11:42 properties
| lrwxrwxrwx 1 root root    0 Jun 22 11:42 subsystem ->
../../../../../../class/input
| -rw-r--r-- 1 root root 4096 Jun 22 11:42 uevent
| -r--r--r-- 1 root root 4096 Jun 22 11:42 uniq

I'd imagine also having some "input0::backlight" here.

These leds seem to be sub-devices of the keyboard device, that's perhaps
tricky to do with the current backlight drivers - but maybe just add
some symlink to it ?


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
