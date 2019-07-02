Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 205855DA76
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2019 03:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfGCBML (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 21:12:11 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:39220 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfGCBMK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 21:12:10 -0400
Received: by mail-pf1-f180.google.com with SMTP id j2so321231pfe.6
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2019 18:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vcfi7YRyiOjafduyZBOlkU18T8DHqDD6n7v9S7FSteg=;
        b=PqntX9wqJ3H848kdYDEmP0rhT5R/f87007U9XDlLQ28T+vfu6JMl5sfRTOwTw01aC3
         hI8Z+MonWBohP8101j6uDXOqWz3E2HZ+61O0w8Cjk/VW5ddpQcv2919boFGxd3ytGP2r
         /Fe8MczlySG9nDvouFRcnOo2xCqVdcrEABiBrS2VdGr771fUh1KpIjmodfzRSpc7WkKU
         XJwgYnvFWZKRylwvy5NEs6w7X+ldbi3aMHG64MA6/NyRfR6dz4PatpRRWxxqtDBuTvsq
         wJR9iEi3qHfnHsnskmNackmJyyoNNRaw6qoGrr6Mdl/tRQq7+PpupEROuqQfKRk44aCr
         NfUA==
X-Gm-Message-State: APjAAAWz24z4ABt4KukwWYttYVo4bz9azpv8U5wxjI1u6p89l3XV89PJ
        UE/hJPgKGx4PhIJbGs8d1G96MQrPnAU=
X-Google-Smtp-Source: APXvYqxhqLHIlBMIKmK+i9Zlzk3mwgTGGLYoLRIdPmA43skjaSn/utDEOJ4pjEUZwMEjbZEWQL1Cmw==
X-Received: by 2002:a17:90a:2641:: with SMTP id l59mr7769979pje.55.1562107083944;
        Tue, 02 Jul 2019 15:38:03 -0700 (PDT)
Received: from [192.168.1.200] (117-20-69-142.751445.bne.nbn.aussiebb.net. [117.20.69.142])
        by smtp.gmail.com with ESMTPSA id y12sm155090pgi.10.2019.07.02.15.38.01
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 15:38:03 -0700 (PDT)
Subject: Re: FocalTech Touchpad (v2) PS/2 Reverse Engineering
To:     Hamza Farooq <hamza.farooq15@yahoo.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>
References: <5cfd4836.1c69fb81.2b5c2.00b9SMTPIN_ADDED_MISSING@mx.google.com>
 <7effd3c6-99a8-274f-3871-981c90e67ff0@redhat.com>
 <40c0c4b0-376e-12e1-579b-ac348e2ff612@redhat.com>
 <5d1bc64a.1c69fb81.222e1.3a0dSMTPIN_ADDED_MISSING@mx.google.com>
From:   Peter Hutterer <peter.hutterer@redhat.com>
Message-ID: <67719544-4ae5-2b5e-290c-912cb2b42316@redhat.com>
Date:   Wed, 3 Jul 2019 08:36:47 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5d1bc64a.1c69fb81.222e1.3a0dSMTPIN_ADDED_MISSING@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 3/7/19 7:01 am, Hamza Farooq wrote:
> Thank you very much taking your time and for your help. Wanted to reply 
> yesterday, but I thought I should try it and then reply with my findings.
> 
> I fixed the tap to click, just as Hans said finger release was being 
> reported, while finger was still active (little buggy sometimes, more or 
> less same on windows too; so not a issue with driver I think).
> 
> Next I’ll look into ABS_MT_TOUCH_MAJOR/MINOR (as peter advised, may be 
> tomorrow).
> 
> Two finger scroll is working but I just noticed that in settings the 
> toggle resets to off when I leave the Mouse/Touchpad settings menu (but 
> that doesn’t affect its working).

that seems like GNOME control center bug.

> Also scrolling doesn’t have "inertial 
> scrolling” scroll with higher force should scroll more lines (although 
> this effect is present in Test Touchpad window inside 
> Setting->Devices->Mouse/Touchpad, but not in other apps including chrome)

intertial scrollking is implemented client-side, i.e. GTK in this case.
https://wayland.freedesktop.org/libinput/doc/latest/faqs.html#kinetic-scrolling-does-not-work

> 
> Edge Scrolling is not working (not that I need it); I think it has 
> something to do with the device resolution because back in the days when 
> I tried with wrong resolution (before figuring out the right one) Edge 
> scrolling used to work in specific region of touchpad, but when I used 
> resolution from windows driver all fingers started working and whole 
> touchpad surface became responsive, but Edge scrolling doesn’t work anymore.

edge scrolling is in a fixed area on the right edge of the touchpad. If 
your touchpad sends the wrong axis ranges, then you may never enter that 
area. Use libevdev's touchpad-edge-detector to verify what the real data 
vs kernel data is and adjust accordingly please. If it still doesn't 
work with the right axis ranges applied, use libinput debug-events 
--verbose to check what the state of the edge scroll is (there are 
debugging messages printed). If that looks sane but it doesn't work, 
please submit a libinput bug.

Cheers,
   Peter


> 
> Thanks again for your help, really appreciate it.
> 
> Hamza
> 
> *From: *Peter Hutterer <mailto:peter.hutterer@redhat.com>
> *Sent: *Tuesday, July 2, 2019 8:06 AM
> *To: *Hans de Goede <mailto:hdegoede@redhat.com>; Hamza Farooq 
> <mailto:hamza.farooq15@yahoo.com>
> *Subject: *Re: FocalTech Touchpad (v2) PS/2 Reverse Engineering
> 
> Hi Hamza
> 
> On 2/7/19 3:50 am, Hans de Goede wrote:
> 
>  > Hi Hamza,
> 
>  >
> 
>  > Sorry for the slow reply.
> 
>  >
> 
>  > It really is better to discuss things like this on the mailinglist, then
> 
>  > more then one person can help / respond to you.
> 
>  >
> 
>  > Please send your next mail to "linux-input@vger.kernel.org" with me and
> 
>  > Peter Hutterer (added to the Cc here) in the Cc.
> 
>  >
> 
>  > On 09-06-19 19:55, Hamza Farooq wrote:
> 
>  >> Hello,
> 
>  >>
> 
>  >> I got Haier Y11C earlier this year, it is available for about a year
> 
>  >> now here in Pakistan. its touchpad only worked in standard mode under
> 
>  >> Linux (one finger, no gestures). bios device name “FTE0001” and its
> 
>  >> protocol is totally different that the older FocalTech touchpads
> 
>  >> (FLT0101, FLT0102, FLT0103).
> 
>  >>
> 
>  >> I think I have managed to get it working (almost) 4-Fingers are
> 
>  >> working under Linux now (Windows driver also reports 4-Fingers at
> 
>  >> maximum), 2-finger scrolling is also working,
> 
>  >>
> 
>  >> some gestures are working with external tools
> 
>  >>  (https://github.com/cunidev/gestures) With this 2 finger zoom(may be
> 
>  >> rotation works too haven’t tested) and 3 or 4 Finger swipes are also
> 
>  >> working.
> 
>  >>
> 
>  >> Only thing not working properly is the Tap to Click, while is works
> 
>  >> but not as it should. Enabling it form settings. Every packet is
> 
>  >> treated as “Tap”, so if I’m using one finger, each packet triggers
> 
>  >> click. Same for two fingers with two secondary click is initiated.
> 
>  >
> 
>  > If everything is seen as a tab you are likely reporting a release of the
> 
>  > finger
> 
>  > to userspace shortly after reporting it down.
> 
> use `sudo libinput debug-events --verbose` to debug, it will show you
> 
> the various device states. that'll likely help you identify the source
> 
> of the issue.
> 
>  >> I didn’t write It up from scratch, I used existing FocalTech.c source
> 
>  >> file and just modified some methods because i’m not familiar with
> 
>  >> Linux programming and don’t know anything about API’s involved here.
> 
>  >>
> 
>  >> 
> https://github.com/torvalds/linux/blob/master/drivers/input/mouse/focaltech.c 
> 
> 
>  >>
> 
>  >>
> 
>  >> Right now I have a lot of confusions but some documentation will
> 
>  >> really help.
> 
>  >>
> 
>  >> Windows Driver is reporting each Fingers area, length, and width, is
> 
>  >> it used under Linux? If yes how or where to report it.
> 
>  >
> 
>  > This is probably better answered by someone on the mailinglist who knows
> 
>  > this better then me. I guess Peter may have a sensible answer here, 
> Peter?
> 
> we have ABS_MT_TOUCH_MAJOR/MINOR which are effectively length/width as
> 
> long as you account for orientation. it's axes are *supposed* to be
> 
> meaningful but for most devices it's fairly random. So I guess don't
> 
> fret too much about getting the dimensions exact.
> 
> those two translate to "touch size" in libinput and you *will* need a
> 
> device-specific quirk to set the thresholds to the correct value. More
> 
> info is here:
> 
> https://wayland.freedesktop.org/libinput/doc/latest/touchpad-pressure-debugging.html
> 
> we don't use "area" as such. there's ABS_MT_WIDTH_MAJOR/MINOR but afaik
> 
> no-one really uses it. area is often translated to pressure anyway (as
> 
> you push down, your finger widens thus big area == high pressure).
> 
> but where major/minor are available we (libinput) prefer that over
> 
> pressure anyway so at least for me it won't matter whether you expose it :)
> 
> we don't use ABS_TOOL_WIDTH in libinput atm
> 
>  >
> 
>  >> This is a Touchpad with two physical buttons (original source code had
> 
>  >> __set_bit(INPUT_PROP_BUTTONPAD, dev->propbit)) should I change
> 
>  >> PROP_BUTTONPAD to something else?
> 
>  >
> 
>  > If the touchpad has physical buttons, then INPUT_PROP_BUTTONPAD should
> 
>  > be removed. You do no need to replace it with something, just remove it.
> 
>  >
> 
>  >> what else is supposed to happen in focaltech_set_input_params() method?
> 
>  >>
> 
>  >> In this method there is a region where author is says Now set up our
> 
>  >> capabilities, how do I know what to set and what not?
> 
>  >
> 
>  > Well you have width info, so if you start actually reporting that then
> 
>  > you would do:
> 
>  >      input_set_abs_params(dev, ABS_TOOL_WIDTH, 0, 15, 0, 0);
> 
>  > where 15 is the max reported width. If you start also doing something
> 
>  > with lenght / area
> 
>  > you need similar lines for those.
> 
>  >
> 
>  >> I also wanted to get some visual info about Finger too, something like
> 
>  >> https://github.com/jnordberg/FingerMgmt this one is for macOS. Tried
> 
>  >> these (https://wiki.ubuntu.com/Multitouch/Testing) methods none of
> 
>  >> them worked. But with with that Gestures tool I came to know at least
> 
>  >> all four fingers are working fine. And now only have to fix Tap and
> 
>  >> those area/length/width values.
> 
> two useful tools are
> 
> https://github.com/bentiss/mtdiag-qt
> 
> https://github.com/whot/mtview
> 
> and libinput debug-gui (in the build directory) has a blue rectangle
> 
> that shows the touchpoints as read from the kernel. no pressure handling
> 
> there, just position. but that'll also show you all other events so it's
> 
> going to be useful in general.
> 
> Cheers,
> 
>     Peter
> 
>  >
> 
>  > This too is probably best asked on the mailinglist.
> 
>  >
> 
>  >> And above all how to merge code? I have seen elantech/synaptics source
> 
>  >> files there are similar named method with v1/v2/v3 postfix, but i’m
> 
>  >> not sure how to set version based on Bios Device Name “FTE0001” ;
> 
>  >> means to say it will be easy to combine both codes but how to only
> 
>  >> call one needed, lets call older devices v1 the FLT ones and they all
> 
>  >> share same logic, and how to merge both in same file focaltech.c
> 
>  >
> 
>  > Your new device seems entirely different, so I would add a new
> 
>  > focaltech_v2.c file which
> 
>  > exports focaltech_v2_detect and focaltech_v2_init functions and hook
> 
>  > those up in
> 
>  > drivers/input/mouse/psmouse-base.c in the same way as the existing
> 
>  > focaltech functions
> 
>  > are hooked up.
> 
>  >
> 
>  > Regards,
> 
>  >
> 
>  > Hans
> 

