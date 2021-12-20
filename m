Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA7B47B35B
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 20:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbhLTTCY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 14:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53433 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240642AbhLTTCY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 14:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640026943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+04rndHiS0wxkr7d3QLK5akBRClvJLogjeBAIqdqS94=;
        b=ELBV1jerCTGIDWhWZno0/AWTIeP9K/RoWLCSkbAMAD5zx3fCYas1rZzPPQHlkkNaZVrGoX
        etre5zfX9MconRVLXpvk5W5HvoPgVlcolxdAuMTZ/bw/BOxG+FY5QFQwoVnpj/vjqWq24o
        KJ4t6wDrKNIcUPjotruwm5HKoNeAVLg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-dHyyLhsINT24M5juEdN_Jg-1; Mon, 20 Dec 2021 14:02:22 -0500
X-MC-Unique: dHyyLhsINT24M5juEdN_Jg-1
Received: by mail-pf1-f200.google.com with SMTP id h9-20020a628309000000b004ba70782342so4244236pfe.20
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 11:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+04rndHiS0wxkr7d3QLK5akBRClvJLogjeBAIqdqS94=;
        b=dgRbkU7vwRJAgaflfDwdq2iMlePaOkl/cMpoHA7C3TLV3hnJqBwqmNtnpXtBm5tasj
         xzcM9kyA+wrg8M/6z6IfzQ4F9eTFwTCCoSY18l5Hf18a8BXPqCP3YMXKwaZBf+3gKysD
         IAhWy8Eh2EGYxw+NH69delgLYVkEEVLeAlbL6DAUiXkBzI/TnHI9kJBmX4gdiByJuYy0
         uZebR3ByDyVlSclyEIQkxQEoQIrd5KeG/F03KhY20W5GIm9sEFMI0UgciJwCpQ2jLbRY
         ByDL+kDgRCiNMp3SQmfqmdAKzFreeUvaMnhJadSxKdeiK/rLxW3wnamOmqFSrV8dDhTu
         foWg==
X-Gm-Message-State: AOAM532uBdCHOe+Ky0boDtv/60gkIJM5LwRfrul3VlRSnI/vJKOydWUk
        4Iv9WcWrO1uXiQgT3lXqKfVt+4Z2C+RqOIJVL+TpH8jI4dfP65AYH717VS2RnBHW/VkR7G84poZ
        y5/VW0yhobnXVcLYLN3f4O1xrj/Ie08aOn3KbKb0=
X-Received: by 2002:a17:90a:8597:: with SMTP id m23mr403970pjn.173.1640026940086;
        Mon, 20 Dec 2021 11:02:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFGz9cBd3Piw8btQiEv3QUMHFFxzbUUaOMT2dDfggM/syiD26rseZjHdDV5ItW2CbIwzTTTnCM1sXsZJC8Iqc=
X-Received: by 2002:a17:90a:8597:: with SMTP id m23mr403928pjn.173.1640026939555;
 Mon, 20 Dec 2021 11:02:19 -0800 (PST)
MIME-Version: 1.0
References: <CAHtsx2rK9SE5fn=1hnEZ_GZV6EPVvFLM-O+0HPAk+h+LvsxL2w@mail.gmail.com>
 <7d5f55c6-d3e3-9cb9-2d33-de410efce88d@redhat.com> <CAHtsx2piKbTRsnnDBqQM8A-wc6Dej-6170dSM9o=JZ9VwDE59g@mail.gmail.com>
In-Reply-To: <CAHtsx2piKbTRsnnDBqQM8A-wc6Dej-6170dSM9o=JZ9VwDE59g@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 20 Dec 2021 20:02:08 +0100
Message-ID: <CAO-hwJJXjn2mtUe30yvPz4ieZWTrBg1aK85UFbAniaT_schF+Q@mail.gmail.com>
Subject: Re: Trouble parsing HID reports from PDP PS4 remote
To:     Jeremy Slemp <slempjeremy68@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 20, 2021 at 7:04 PM Jeremy Slemp <slempjeremy68@gmail.com> wrote:
>
> On Mon, Dec 20, 2021 at 6:44 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> > Basically, we might need to add support for this remote in the hid-sony
> > driver.
> >
> > Can you attach the full output of hid-recorder (from the hid-tools[3]
> > repository) when you press all of these buttons?
> >
> > This should give us enough information to reply the event sequence
> > locally and fix the drivers if we need.
>
> Sure thing!
>
> The remote looks like this:
> https://www.pdp.com/universal-media-remote-for-playstationr4
>
> hid-recorder output:

Thanks for the logs (though your email client mangled the long lines,
but not an issue TBH).

So this device is not known to the HID stack nor hid-sony or hid-playstation.
We will need to add a special case in one of those 2 drivers because
as you realized, the way these keys are used is not standard.

But I'd like to compare these logs to the PS5 remote that I have here.
Maybe the proprietary fields 0xff000021 is something common in the
PS4/PS5 world.

Also, what happens if you press 2 "special" keys at the same time
(pause and enter for example)?

However, I can not promise I'll work on that tomorrow. And then I'll
take a year end break.

If you don't see anything coming from me tomorrow or in early January,
feel free to re-raise this thread.

Cheers,
Benjamin

>
> # PDP Media Remote
> # 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
> # 0x09, 0x05,                    // Usage (Game Pad)                    2
> # 0xa1, 0x01,                    // Collection (Application)            4
> # 0x85, 0x01,                    //  Report ID (1)                      6
> # 0x09, 0x39,                    //  Usage (Hat switch)                 8
> # 0x15, 0x00,                    //  Logical Minimum (0)                10
> # 0x25, 0x07,                    //  Logical Maximum (7)                12
> # 0x35, 0x00,                    //  Physical Minimum (0)               14
> # 0x46, 0x3b, 0x01,              //  Physical Maximum (315)             16
> # 0x65, 0x14,                    //  Unit (EnglishRotation: deg)        19
> # 0x75, 0x04,                    //  Report Size (4)                    21
> # 0x95, 0x01,                    //  Report Count (1)                   23
> # 0x81, 0x42,                    //  Input (Data,Var,Abs,Null)          25
> # 0x65, 0x00,                    //  Unit (None)                        27
> # 0x05, 0x09,                    //  Usage Page (Button)                29
> # 0x19, 0x01,                    //  Usage Minimum (1)                  31
> # 0x29, 0x0e,                    //  Usage Maximum (14)                 33
> # 0x15, 0x00,                    //  Logical Minimum (0)                35
> # 0x25, 0x01,                    //  Logical Maximum (1)                37
> # 0x75, 0x01,                    //  Report Size (1)                    39
> # 0x95, 0x0e,                    //  Report Count (14)                  41
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               43
> # 0x06, 0x00, 0xff,              //  Usage Page (Vendor Defined Page 1) 45
> # 0x09, 0x20,                    //  Usage (Vendor Usage 0x20)          48
> # 0x75, 0x06,                    //  Report Size (6)                    50
> # 0x95, 0x01,                    //  Report Count (1)                   52
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               54
> # 0x06, 0x00, 0xff,              //  Usage Page (Vendor Defined Page 1) 56
> # 0x09, 0x21,                    //  Usage (Vendor Usage 0x21)          59
> # 0x75, 0x08,                    //  Report Size (8)                    61
> # 0x95, 0x06,                    //  Report Count (6)                   63
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               65
> # 0x85, 0x03,                    //  Report ID (3)                      67
> # 0x0a, 0x83, 0xa7,              //  Usage (Vendor Usage 0xa783)        69
> # 0x95, 0x09,                    //  Report Count (9)                   72
> # 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             74
> # 0xc0,                          // End Collection                      76
> # 0x06, 0xf0, 0xff,              // Usage Page (Vendor Usage Page 0xfff0) 77
> # 0x09, 0x40,                    // Usage (Vendor Usage 0x40)           80
> # 0xa1, 0x01,                    // Collection (Application)            82
> # 0x85, 0xf0,                    //  Report ID (240)                    84
> # 0x09, 0x47,                    //  Usage (Vendor Usage 0x47)          86
> # 0x95, 0x3f,                    //  Report Count (63)                  88
> # 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             90
> # 0x85, 0xf1,                    //  Report ID (241)                    92
> # 0x09, 0x48,                    //  Usage (Vendor Usage 0x48)          94
> # 0x95, 0x3f,                    //  Report Count (63)                  96
> # 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             98
> # 0x85, 0xf2,                    //  Report ID (242)                    100
> # 0x09, 0x49,                    //  Usage (Vendor Usage 0x49)          102
> # 0x95, 0x0f,                    //  Report Count (15)                  104
> # 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             106
> # 0x85, 0xf3,                    //  Report ID (243)                    108
> # 0x0a, 0x01, 0x47,              //  Usage (Vendor Usage 0x4701)        110
> # 0x95, 0x07,                    //  Report Count (7)                   113
> # 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             115
> # 0xc0,                          // End Collection                      117
> #
> R: 118 05 01 09 05 a1 01 85 01 09 39 15 00 25 07 35 00 46 3b 01 65 14
> 75 04 95 01 81 42 65 00 05 09 19 01 29 0e 15 00 25 01 75 01 95 0e 81
> 02 06 00 ff 09 20 75 06 95 01 81 02 06 00 ff 09 21 75 08 95 06 81 02
> 85 03 0a 83 a7 95 09 b1 02 c0 06 f0 ff 09 40 a1 01 85 f0 09 47 95 3f
> b1 02 85 f1 09 48 95 3f b1 02 85 f2 09 49 95 0f b1 02 85 f3 0a 01 47
> 95 07 b1 02 c0
> N: PDP Media Remote
> I: 5 0e6f 026f
>
> # SHARE button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  1  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,   87 ,   66
> ,   92 ,   31
> E: 000000.000000 10 01 08 10 00 08 00 57 42 5c 1f
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000000.109914 10 01 08 00 00 08 00 c8 15 45 4f
>
> # PS button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  1  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  255 ,  127
> ,  135 ,   78
> E: 000002.969989 10 01 08 00 01 08 00 ff 7f 87 4e
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000003.104971 10 01 08 00 00 08 00 c8 15 45 4f
>
> # OPTIONS button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  1
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  246 ,  186
> ,  119 ,  239
> E: 000007.166328 10 01 08 20 00 08 00 f6 ba 77 ef
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000007.249842 10 01 08 00 00 08 00 c8 15 45 4f
>
> # GREEN TRIANGLE button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  1  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,   90 ,  165
> ,  163 ,  254
> E: 000018.495012 10 01 88 00 00 08 00 5a a5 a3 fe
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000018.604996 10 01 08 00 00 08 00 c8 15 45 4f
>
> # PINK SQUARE button
> # ReportID: 1 / Hat switch:   8 | Button: 1  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,   74 ,  130
> ,  165 ,   47
> E: 000024.672577 10 01 18 00 00 08 00 4a 82 a5 2f
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000024.806348 10 01 08 00 00 08 00 c8 15 45 4f
>
> # ORANGE CIRCLE button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  1  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  129 ,   77
> ,  182 ,   23
> E: 000030.346442 10 01 48 00 00 08 00 81 4d b6 17
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000030.480160 10 01 08 00 00 08 00 c8 15 45 4f
>
> # BLUE X button
> # ReportID: 1 / Hat switch:   8 | Button: 0  1  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  204 ,   58
> ,  132 ,  142
> E: 000040.002823 10 01 28 00 00 08 00 cc 3a 84 8e
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000040.090307 10 01 08 00 00 08 00 c8 15 45 4f
>
> # L1 button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  1  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  173 ,  114
> ,  249 ,  247
> E: 000045.415425 10 01 08 01 00 08 00 ad 72 f9 f7
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000045.525646 10 01 08 00 00 08 00 c8 15 45 4f
>
> # R1 button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  1  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,   67 ,  221
> ,   76 ,  229
> E: 000050.470479 10 01 08 02 00 08 00 43 dd 4c e5
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000050.605489 10 01 08 00 00 08 00 c8 15 45 4f
>
> # L2 button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  1  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  159 ,  130
> ,   39 ,  192
> E: 000057.000593 10 01 08 04 00 08 00 9f 82 27 c0
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000057.083079 10 01 08 00 00 08 00 c8 15 45 4f
>
> # R2 button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  1  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,   39 ,   61
> ,  241 ,  138
> E: 000061.636954 10 01 08 08 00 08 00 27 3d f1 8a
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000061.770649 10 01 08 00 00 08 00 c8 15 45 4f
>
> # UP ARROW button
> # ReportID: 1 / Hat switch:   0 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,    9 ,   94
> ,   53 ,  127
> E: 000068.154519 10 01 00 00 00 08 00 09 5e 35 7f
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000068.363248 10 01 08 00 00 08 00 c8 15 45 4f
>
> # LEFT ARROW button
> # ReportID: 1 / Hat switch:   6 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  169 ,  171
> ,  117 ,  240
> E: 000074.187110 10 01 06 00 00 08 00 a9 ab 75 f0
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000074.348488 10 01 08 00 00 08 00 c8 15 45 4f
>
> # RIGHT ARROW button
> # ReportID: 1 / Hat switch:   2 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  105 ,   13
> ,  245 ,    5
> E: 000080.271228 10 01 02 00 00 08 00 69 0d f5 05
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000080.406201 10 01 08 00 00 08 00 c8 15 45 4f
>
> # DOWN ARROW button
> # ReportID: 1 / Hat switch:   4 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  201 ,  248
> ,  181 ,  138
> E: 000085.132491 10 01 04 00 00 08 00 c9 f8 b5 8a
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000085.291313 10 01 08 00 00 08 00 c8 15 45 4f
>
> # ENTER button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,   13 ,  117 ,  105
> ,  244 ,   49
> E: 000089.456381 10 01 08 00 00 08 0d 75 69 f4 31
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000089.591371 10 01 08 00 00 08 00 c8 15 45 4f
>
> # REWIND button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,   23 ,   15 ,  144
> ,  150 ,  204
> E: 000095.587712 10 01 08 00 00 08 17 0f 90 96 cc
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000095.746944 10 01 08 00 00 08 00 c8 15 45 4f
>
> # PLAY button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,   22 ,  153 ,  160
> ,  145 ,  187
> E: 000100.317804 10 01 08 00 00 08 16 99 a0 91 bb
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000100.451550 10 01 08 00 00 08 00 c8 15 45 4f
>
> # FASTFORWARD button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,   24 ,  158 ,  141
> ,   41 ,   92
> E: 000107.749017 10 01 08 00 00 08 18 9e 8d 29 5c
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000107.882698 10 01 08 00 00 08 00 c8 15 45 4f
>
> # PREVIOUS TRACK button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,   20 ,  181 ,  193
> ,  159 ,   85
> E: 000114.526718 10 01 08 00 00 08 14 b5 c1 9f 55
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000114.686734 10 01 08 00 00 08 00 c8 15 45 4f
>
> # PAUSE button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,   26 ,  178 ,  236
> ,   39 ,  178
> E: 000117.824287 10 01 08 00 00 08 1a b2 ec 27 b2
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000117.983005 10 01 08 00 00 08 00 c8 15 45 4f
>
> # NEXT TRACK button
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,   21 ,   35 ,  241
> ,  152 ,   34
> E: 000122.074342 10 01 08 00 00 08 15 23 f1 98 22
> # ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
>  0  0  0  0 | 0xff000020:   0 | 0xff000021:    8 ,    0 ,  200 ,   21
> ,   69 ,   79
> E: 000122.233063 10 01 08 00 00 08 00 c8 15 45 4f
>

