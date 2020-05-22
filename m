Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF41DDF54
	for <lists+linux-input@lfdr.de>; Fri, 22 May 2020 07:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgEVF2V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 May 2020 01:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgEVF2V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 May 2020 01:28:21 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AFEC061A0E
        for <linux-input@vger.kernel.org>; Thu, 21 May 2020 22:28:21 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id b71so9551550ilg.8
        for <linux-input@vger.kernel.org>; Thu, 21 May 2020 22:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwLvIgTs9pWHMBMg/CkvpGpvvvFGijAOPKCd4eFTIjE=;
        b=NtEDEpAq6nlPebZDWJ5QG4mxpO9a05NqmK8lnRPgwRHIi6Fa4PktC4gGFI1FoP5KkG
         JAB2GkW37n84mqzigC9hL7E01qhCCBtxBexXr6zKUuczGXhTKprcVC9o3WAoyYhr2ZJ6
         fFpO/ReA8XASPmtppeIq/2ogkviX0XkFhUmwzF2rzl6o2CPIPshLCi6JyfG6AXXTreaT
         Mr3ztvKGmfSdKY/MIddfXfFBnFV4k6pT/x8RYG+4+I7BLaAFah6psjV3QSBzdGDx4qwf
         aF+tdsmyJBqggTzBan7toli1kcY/2iV8FRDWU+oQ640Bm3A8lspt1Xg1fhML7c3T/Jn5
         tFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwLvIgTs9pWHMBMg/CkvpGpvvvFGijAOPKCd4eFTIjE=;
        b=k2d83LmpCstt6ZSfQuDjpZ5tO4Oqt/FBeYa6Jyp7W6VeFXjdX5nYNEe13XCsNvzKYg
         xqE6Xz+fm/Rml3x2LE/Y4sfgXCAleXBFJHGLhj2Y8/8cLInY4iroFn5jdvanoH9HwKLT
         UKawQJaxvVZFl8RxVnSGLB4JhWvTMzrxrH+rtfGu39kmDc9gTFq82QTOVGLgeKQVGXEY
         1ZElBQk/uuvwCLPzMrkFUxunYQTgcphxGFQN2XhyiVqibsEZYBL/xDkoreomX5KsDEeA
         TLvyr3Qw3MHjy1rNU3MldGr33UeajaLEkeRjSg89rCdlDuoa6r1uuKGHDGbiVxPb9QHS
         A/og==
X-Gm-Message-State: AOAM5332nRhsd6TcRk0ckvZIaGsBwvBDfuc1uAzLYmTavoP6EpYfEHrj
        GJywZZUMmo4KozpAsOo8TH10ZTaUdGLGVPOgnUY=
X-Google-Smtp-Source: ABdhPJz9FZ0UqumlwsOmraRrRzFqvw0Z62ao0VS3sobP1J77l6S6iuDIoq1kAG9wzqGQWTWd/nZmqSVmZ0Tjp2tH2UU=
X-Received: by 2002:a92:da52:: with SMTP id p18mr12176359ilq.173.1590125299658;
 Thu, 21 May 2020 22:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAEwx+QrfLk4SR=yn4Df3rD_Lm0Xht1hgAi4szmOTU1nkFhMwhw@mail.gmail.com>
 <20200511201118.GW89269@dtor-ws> <20200512051925.GA48688@koala> <CAEwx+QpN7c4i4qRfaVAP6yPFoydQ+W_0DOsv-NfgwU8Zb1BVZQ@mail.gmail.com>
In-Reply-To: <CAEwx+QpN7c4i4qRfaVAP6yPFoydQ+W_0DOsv-NfgwU8Zb1BVZQ@mail.gmail.com>
From:   Yariv <oigevald+kernel@gmail.com>
Date:   Fri, 22 May 2020 08:27:43 +0300
Message-ID: <CAEwx+QowRY3UTkFcwFvOD3h0=ejZSLL3miFQzdOMNT84w86M6g@mail.gmail.com>
Subject: Re: PROBLEM: Apple external Trackpad event timestamps are jittery (regression)
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I just noticed that I replied to the wrong mail, sorry for the mess.

My original reply (from May 12th) is at the bottom.
In it I created some logs using "libinput record", as suggested by
Peter Hutterer.
I also did some fresh recordings using evtest.

First, some timestamp deltas. These were taken using an external Apple
Trackpad, 1st generation, over Bluetooth.
I simply moved a single finger in circles on the trackpad in order to
generate the events.

...
0.0212481
0.011559
0.00718999
0
0.0157909
0.010725
0.0117009
0.00179601
0
0.0209122
0.0104909
0.00858903
...

Note that sometimes we get about 20ms between events. This device
usually sends an event about once per 11ms - i.e. around 90Hz.

Log snippet:
...
Event: time 1590122452.417506, -------------- SYN_REPORT ------------
Event: time 1590122452.425271, type 1 (EV_KEY), code 325
(BTN_TOOL_FINGER), value 2
Event: time 1590122452.425271, -------------- SYN_REPORT ------------
Event: time 1590122452.425271, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 156
Event: time 1590122452.425271, type 3 (EV_ABS), code 49
(ABS_MT_TOUCH_MINOR), value 188
Event: time 1590122452.425271, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value -659
Event: time 1590122452.425271, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value -423
Event: time 1590122452.425271, type 3 (EV_ABS), code 0 (ABS_X), value -659
Event: time 1590122452.425271, type 3 (EV_ABS), code 1 (ABS_Y), value -423
Event: time 1590122452.425271, -------------- SYN_REPORT ------------
Event: time 1590122452.440511, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 132
Event: time 1590122452.440511, type 3 (EV_ABS), code 49
(ABS_MT_TOUCH_MINOR), value 180
Event: time 1590122452.440511, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value -625
Event: time 1590122452.440511, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value -344
Event: time 1590122452.440511, type 3 (EV_ABS), code 0 (ABS_X), value -625
Event: time 1590122452.440511, type 3 (EV_ABS), code 1 (ABS_Y), value -344
Event: time 1590122452.440511, -------------- SYN_REPORT ------------
...

Same device, over a "good" kernel:
...
0.0112979
0.00781107
0.00329399
0.011565
0.0115449
0.0114291
0.00219297
0.00830007
0.011518
0.011142
...

Here the timestamps  are around 11ms as expected.

log snippet:
...
Event: time 1590123185.781886, -------------- SYN_REPORT ------------
Event: time 1590123185.793357, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 92
Event: time 1590123185.793357, type 3 (EV_ABS), code 49
(ABS_MT_TOUCH_MINOR), value 116
Event: time 1590123185.793357, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value -147
Event: time 1590123185.793357, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value -360
Event: time 1590123185.793357, type 3 (EV_ABS), code 0 (ABS_X), value -147
Event: time 1590123185.793357, type 3 (EV_ABS), code 1 (ABS_Y), value -360
Event: time 1590123185.793357, -------------- SYN_REPORT ------------
Event: time 1590123185.797932, type 1 (EV_KEY), code 325
(BTN_TOOL_FINGER), value 2
Event: time 1590123185.797932, -------------- SYN_REPORT ------------
Event: time 1590123185.803851, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 90
Event: time 1590123185.803851, type 3 (EV_ABS), code 49
(ABS_MT_TOUCH_MINOR), value 132
Event: time 1590123185.803851, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value -116
Event: time 1590123185.803851, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value -288
Event: time 1590123185.803851, type 3 (EV_ABS), code 0 (ABS_X), value -116
Event: time 1590123185.803851, type 3 (EV_ABS), code 1 (ABS_Y), value -288
Event: time 1590123185.803851, -------------- SYN_REPORT ------------
...

I also tested the 2nd generation of the Apple external trackpad. This
device had the correct timestamps, regardless if used over USB or
Bluetooth.

Timestamps from a 2nd gen device (these were ok both before and after
the regression, both over USB and Bluetooth):
...
0.011441
0.0105031
0.0118241
0.0114589
0.011461
0.0107341
0.0114439
0.0113852
...

log snippet:
...
Event: time 1590122942.746610, -------------- SYN_REPORT ------------
Event: time 1590122942.758101, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 340
Event: time 1590122942.758101, type 3 (EV_ABS), code 49
(ABS_MT_TOUCH_MINOR), value 416
Event: time 1590122942.758101, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value -318
Event: time 1590122942.758101, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 364
Event: time 1590122942.758101, type 3 (EV_ABS), code 0 (ABS_X), value -318
Event: time 1590122942.758101, type 3 (EV_ABS), code 1 (ABS_Y), value 364
Event: time 1590122942.758101, -------------- SYN_REPORT ------------
Event: time 1590122942.769358, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 332
Event: time 1590122942.769358, type 3 (EV_ABS), code 49
(ABS_MT_TOUCH_MINOR), value 408
Event: time 1590122942.769358, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value -293
Event: time 1590122942.769358, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 434
Event: time 1590122942.769358, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 18
Event: time 1590122942.769358, type 3 (EV_ABS), code 0 (ABS_X), value -293
Event: time 1590122942.769358, type 3 (EV_ABS), code 1 (ABS_Y), value 434
Event: time 1590122942.769358, type 3 (EV_ABS), code 24 (ABS_PRESSURE), value 18
Event: time 1590122942.769358, -------------- SYN_REPORT ------------

...

Some things I noticed: Gen2 didn't send "BTN_TOOL_FINGER" events,
while Gen1 did, even though I did not press any button. Note that Gen1
still had correct timestamps before the regression, even though it
sent these events.

Another difference (maybe it's the same one..): if you take a look at
the logs from my previous mail, you'll notice that Gen1 Trackpads
always send both SYN_REPORT (0) as well as SYN_REPORT (1), while 2nd
Gen Trackpads only sends SYN_REPORT (0).

GMail botched my links to the full logs from the previous mail, I hope
it will turn out correct here:

Gen1, before regression
https://drive.google.com/open?id=1W0XekSNyf1i-Um-VqxDJuMmJoWAGXIG5

Gen1, after regression:
https://drive.google.com/open?id=1nUNf2uOQPvFw_kE8h4mZB0c80kj3hu4F

Gen2, after regression:
https://drive.google.com/open?id=1pr508bqeax1Csle2HQuLcuXwinWksdjo

Thanks,
Yariv

(Original reply below)

On Tue, May 12, 2020 at 10:54 PM Yariv <oigevald+kernel@gmail.com> wrote:
>
> Thanks for following up!
>
> I took Peter's advice and used 'libinput recrod' to get some logs.
>
> I tested both a 1st gen as well as a 2nd gen Apple external trackpads.
> While the 1st gen is Bluetooth-only, the 2nd gen can be connected over
> both Bluetooth and USB.
>
> The 2nd gen external trackpad had no jitter, regardless if used over
> Bluetooth or USB.
>
> Following is a snippet of a 1st gen touchpad, showing only SYN_REPORT
> lines for brevity.
> This was taken on a kernel with the regression:
>
>     - [  7, 526745,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  7, 537376,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  7, 540141,   0,   0,       1] # ------------ SYN_REPORT (1)
> ---------- +3ms
>     - [  7, 540141,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +0ms
>     - [  7, 560065,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +20ms
>     - [  7, 571556,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  7, 580125,   0,   0,       1] # ------------ SYN_REPORT (1)
> ---------- +9ms
>     - [  7, 580125,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +0ms
>     - [  7, 594466,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +14ms
>     - [  7, 604987,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +10ms
>     - [  7, 616458,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  7, 624124,   0,   0,       1] # ------------ SYN_REPORT (1)
> ---------- +8ms
>     - [  7, 624124,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +0ms
>     - [  7, 639259,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +15ms
>     - [  7, 650772,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  7, 660130,   0,   0,       1] # ------------ SYN_REPORT (1)
> ---------- +10ms
>     - [  7, 660130,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +0ms
>
> Now a snippet of the 2nd gen trackpad, over Bluetooth, same kernel:
>
>     - [  9, 584965,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  9, 595860,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  9, 607147,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  9, 618610,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  9, 630279,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  9, 641047,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  9, 652429,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  9, 664148,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  9, 674600,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +10ms
>     - [  9, 686040,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  9, 697808,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  9, 709277,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  9, 719649,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +10ms
>
> I'm entirely clueless with regard to the input device protocols,
> however it is apparent that the 2nd gen trackpad has only SYN_REPORT
> (0) in its log, while the 1st gen has both SYN_REPORT (0) and
> SYN_REPORT (1).
>
> Last is a snippet of the 1st gen, this time on a kernel with my hack -
> so should behave as before the regression:
>
>     - [  6, 243965,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  6, 254576,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  6, 257637,   0,   0,       1] # ------------ SYN_REPORT (1)
> ---------- +3ms
>     - [  6, 265675,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +8ms
>     - [  6, 277512,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  6, 288059,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  6, 297642,   0,   0,       1] # ------------ SYN_REPORT (1)
> ---------- +9ms
>     - [  6, 299646,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +2ms
>     - [  6, 310849,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  6, 322000,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  6, 333265,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +11ms
>     - [  6, 337681,   0,   0,       1] # ------------ SYN_REPORT (1)
> ---------- +4ms
>     - [  6, 344588,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +7ms
>     - [  6, 356921,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +12ms
>     - [  6, 366979,   0,   0,       0] # ------------ SYN_REPORT (0)
> ---------- +10ms
>
> Here it seems that if we add the delta from each SYN_REPORT (1) to the
> delta of the following SYN_REPORT (0) we get sane timestamps.
>
> I also tested a USB mouse, and the timestamps were Ok.
> So to summarize my limited finding, only the 1st gen Apple external
> touchpad seems to be affected.
>
> Entire logs:
>
> https://drive.google.com/open?id=1nUNf2uOQPvFw_kE8h4mZB0c80kj3hu4F
> Gen1, after regression
> https://drive.google.com/open?id=1pr508bqeax1Csle2HQuLcuXwinWksdjo
> Gen2, after regression
> https://drive.google.com/open?id=1W0XekSNyf1i-Um-VqxDJuMmJoWAGXIG5
> Gen1, before regression
>
> Please let me know if I there is anything else I can do to help.
>
> Best regards,
> Yariv
