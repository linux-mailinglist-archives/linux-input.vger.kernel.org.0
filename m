Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CFE47B39D
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 20:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240113AbhLTTWp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 14:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbhLTTWp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 14:22:45 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1245C061574;
        Mon, 20 Dec 2021 11:22:44 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id j6so21836353edw.12;
        Mon, 20 Dec 2021 11:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gnj35gy6Me/st68CGW/7Rpexn2HS0SgZOXVA97OxwCA=;
        b=GqNIvt54j4l9xwqm2MuhVpLZS/22FnWrqnRYr1pngj1jodLdcFsGi2wt2avGvQBd8Z
         KO8+Wt7qV0U8A4DaM4U8UXajXcTmU35dSCzXBXW+WSan1TyQqa07KYSo7P5YhUSYUAwf
         sN5BshcBDW5Zubhh0s1AItcgJXcffwBE2FPLwPiikTk5e9kNIz5b7ObR6SYd99JHIzuy
         wAFwf3uoIR09UqYWSmiQbo6LmOg72R+364iUFQSN7tBn3qDS59Q7+FL0J2v7pRWk7UUf
         vJvGGnSESDNJzjAWCsA08QsF1nt1jTKas7DDqFRninvyWE/kEzhphqgdtkypKmnkxsQb
         oo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gnj35gy6Me/st68CGW/7Rpexn2HS0SgZOXVA97OxwCA=;
        b=Ahnw8HC1SBba0dZy4APacNDtG3oBw0Ko9mHuoNKPW5UBl+J5dfyttiURiF7aTKONOQ
         ZcW/xiBjIwvYscLsI0xt1NbQokJA3mtnAr4owqeJsqQTsvOwZkXqBlPNwyQMNId96G+F
         M0K2ayBWehTRUOeJZJpEHlwTjBdoNNeFqnhmPb3OcYlJCJ5oe0sG6YfujGexDtP9g4X4
         Owpiy+TknozuHB8KcfxT4/FNodMlIvy5SrmU+HutTo1Rc8vHBSJUq801K0KC4OccRNJl
         uZRM9s/70pnty3RtWW9EIgq6B9pcqsYtsYJGTy1d4jkYJaamjhR0TguOfkshVt6wm2Ra
         w4Bg==
X-Gm-Message-State: AOAM532WzppUFiNwn6ku9vhbLs1HlME1unsiyMqJEuMmtCjlG0r7sGNa
        dqrR9w2prPhGoYUiOhoTrAXV5BmRlG0/6WbF98OW/7nY/NwPqw==
X-Google-Smtp-Source: ABdhPJxxR7rIPkSROODP9fQrmGcSv7fJ0Qg2yALjB5LlURQMTquwWBQkt/zwNr4/NWWa7UjrOHhnmQG2caPMD3cK1sY=
X-Received: by 2002:a17:906:5603:: with SMTP id f3mr9179405ejq.272.1640028163347;
 Mon, 20 Dec 2021 11:22:43 -0800 (PST)
MIME-Version: 1.0
References: <CAHtsx2rK9SE5fn=1hnEZ_GZV6EPVvFLM-O+0HPAk+h+LvsxL2w@mail.gmail.com>
 <7d5f55c6-d3e3-9cb9-2d33-de410efce88d@redhat.com> <CAHtsx2piKbTRsnnDBqQM8A-wc6Dej-6170dSM9o=JZ9VwDE59g@mail.gmail.com>
 <CAO-hwJJXjn2mtUe30yvPz4ieZWTrBg1aK85UFbAniaT_schF+Q@mail.gmail.com>
In-Reply-To: <CAO-hwJJXjn2mtUe30yvPz4ieZWTrBg1aK85UFbAniaT_schF+Q@mail.gmail.com>
From:   Jeremy Slemp <slempjeremy68@gmail.com>
Date:   Mon, 20 Dec 2021 11:22:32 -0800
Message-ID: <CAHtsx2pWnH18vbPcEOnqDSekAsu9WUZEbgM=WsmEYC5gHa5ajg@mail.gmail.com>
Subject: Re: Trouble parsing HID reports from PDP PS4 remote
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

 On Mon, Dec 20, 2021 at 11:02 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
> > The remote looks like this:
> > https://www.pdp.com/universal-media-remote-for-playstationr4
> >
> > hid-recorder output:
>
> Thanks for the logs (though your email client mangled the long lines,
> but not an issue TBH).

Also I forgot to reply-to-list.  For anyone who missed it, the
hid-recorder output is here: https://pastebin.com/8nKdtMT8

> So this device is not known to the HID stack nor hid-sony or hid-playstation.
> We will need to add a special case in one of those 2 drivers because
> as you realized, the way these keys are used is not standard.
>
> But I'd like to compare these logs to the PS5 remote that I have here.
> Maybe the proprietary fields 0xff000021 is something common in the
> PS4/PS5 world.
>
> Also, what happens if you press 2 "special" keys at the same time
> (pause and enter for example)?

For this trace I held down pause, pressed enter, then released both at
the same time:

# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    6 ,   26 ,   60 ,  193
,  164 ,   44
E: 000014.302803 10 01 08 00 00 06 1a 3c c1 a4 2c
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    6 ,   13 ,  251 ,   68
,  119 ,  175
E: 000015.312809 10 01 08 00 00 06 0d fb 44 77 af
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    6 ,   13 ,  251 ,   68
,  119 ,  175
E: 000016.475376 10 01 08 00 00 06 0d fb 44 77 af
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    6 ,    0 ,   70 ,   56
,  198 ,  209
E: 000016.510310 10 01 08 00 00 06 00 46 38 c6 d1

For this trace I held down pause, held down enter, released enter,
released pause:

# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,   26 ,  125 ,  240
,  191 ,   53
E: 000455.969112 10 01 08 00 00 07 1a 7d f0 bf 35
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,   13 ,  186 ,  117
,  108 ,  182
E: 000456.328187 10 01 08 00 00 07 0d ba 75 6c b6
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,   26 ,  125 ,  240
,  191 ,   53
E: 000457.236997 10 01 08 00 00 07 1a 7d f0 bf 35
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,    7 ,    9
,  221 ,  200
E: 000457.629132 10 01 08 00 00 07 00 07 09 dd c8

For this trace I held down pause, held down enter, released pause,
released enter:

# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,   26 ,  125 ,  240
,  191 ,   53
E: 000440.319208 10 01 08 00 00 07 1a 7d f0 bf 35
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,   13 ,  186 ,  117
,  108 ,  182
E: 000440.879087 10 01 08 00 00 07 0d ba 75 6c b6
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,   13 ,  186 ,  117
,  108 ,  182
E: 000441.541612 10 01 08 00 00 07 0d ba 75 6c b6
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,    7 ,    9
,  221 ,  200
E: 000442.027658 10 01 08 00 00 07 00 07 09 dd c8

For this trace I held down left arrow, pressed and released up arrow,
pressed and released down arrow, released left arrow:

# ReportID: 1 / Hat switch:   6 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,  102 ,  183
,  237 ,  119
E: 000584.269500 10 01 06 00 00 07 00 66 b7 ed 77
# ReportID: 1 / Hat switch:   7 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,  214 ,  158
,  141 ,   74
E: 000585.108210 10 01 07 00 00 07 00 d6 9e 8d 4a
# ReportID: 1 / Hat switch:   6 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,  102 ,  183
,  237 ,  119
E: 000588.489824 10 01 06 00 00 07 00 66 b7 ed 77
# ReportID: 1 / Hat switch:   5 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,  182 ,  205
,   77 ,   48
E: 000590.293643 10 01 05 00 00 07 00 b6 cd 4d 30
# ReportID: 1 / Hat switch:   6 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,  102 ,  183
,  237 ,  119
E: 000590.931154 10 01 06 00 00 07 00 66 b7 ed 77
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,    7 ,    9
,  221 ,  200
E: 000591.540598 10 01 08 00 00 07 00 07 09 dd c8

For this trace I held down left arrow and right arrow at the same
time, then released both.  I think this combination is unsupported:

# ReportID: 1 / Hat switch:   6 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,  102 ,  183
,  237 ,  119
E: 000900.413945 10 01 06 00 00 07 00 66 b7 ed 77
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,    7 ,    9
,  221 ,  200
E: 000900.897679 10 01 08 00 00 07 00 07 09 dd c8
# ReportID: 1 / Hat switch:   6 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,  102 ,  183
,  237 ,  119
E: 000902.959066 10 01 06 00 00 07 00 66 b7 ed 77
# ReportID: 1 / Hat switch:   8 | Button: 0  0  0  0  0  0  0  0  0  0
 0  0  0  0 | 0xff000020:   0 | 0xff000021:    7 ,    0 ,    7 ,    9
,  221 ,  200
E: 000903.017773 10 01 08 00 00 07 00 07 09 dd c8

So for the arrow keys ("hat switch") I get:

No buttons: 8
Up only: 0
Left only: 6
Right only: 2
Down only: 4
Left+up: 7
Right+up: 1
Right+down: 3
Left+down: 5
