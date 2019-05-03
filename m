Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2873212D0A
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 13:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfECL7g convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 3 May 2019 07:59:36 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45593 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfECL7g (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 May 2019 07:59:36 -0400
Received: by mail-qt1-f194.google.com with SMTP id t1so5587892qtc.12
        for <linux-input@vger.kernel.org>; Fri, 03 May 2019 04:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BJ2Nma0ayITV/7zFNbju1tIRbVYaJofZ4T1/8somf/U=;
        b=dLb9OHyOOdXa+PiH28YbYDVCDwY6/G/6jRDRX2BDKIGGHUtqFBEskNBEUvoW52PXJR
         d3tawLTGoHZrDZCDm+d3YPLE0ceLcBQQinuLfYEPsBdrAwP7wzC3CKin953kInZiOjCN
         0IkeNxzViBTplqTZs7eekoTSHY6zLO1FQFQ1tuwQaKwVF8TOwf6F8gIl5SZTgVv+yc7O
         WIoH25RjLsdg9xlFU+4jowkJ8/0YokpH+XIOSOqIYmjJwiplHVlskEU1KyNDtN0CZDd/
         MNrwcs7VqMVkOVeBzH2Xn8Ov/hOKRhTQubnh/D4TprxSg9L+hFZmXKP4mbh3xHBFEIP2
         Je5g==
X-Gm-Message-State: APjAAAWNSLScN4u/bBVUW0AfEYgWDjCuoKU7QQORTsSwgHXUngJBS64F
        /uE7wyxJf1a9FJnR/rKw5YiKit9pwrJO8QbczkNDHA==
X-Google-Smtp-Source: APXvYqxMh+0PiGcGvjALmLEw6X/Eme68D81GXkdbFsI9kVxmRFSGj/l3mJakOVxQlxeKICSMOuSVBY8X92Rs3S06Nv4=
X-Received: by 2002:a0c:be18:: with SMTP id k24mr5319347qvg.192.1556884774964;
 Fri, 03 May 2019 04:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190502213639.7632-1-spaz16@wp.pl> <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
 <1a40ea07-368a-93f6-8335-dec7ae50bbf4@gmail.com>
In-Reply-To: <1a40ea07-368a-93f6-8335-dec7ae50bbf4@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 3 May 2019 13:59:23 +0200
Message-ID: <CAO-hwJKNH7WoJV-X+egK5cJNNtxamh0L0e1er5dkiTt6KvrmSQ@mail.gmail.com>
Subject: Re: [PATCH] HID: fix A4Tech horizontal scrolling
To:     Igor Kushnir <igorkuo@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     =?UTF-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, May 3, 2019 at 11:43 AM Igor Kushnir <igorkuo@gmail.com> wrote:
>
> Hi Benjamin,
>
> On 5/3/19 10:36 AM, Benjamin Tissoires wrote:
> > Hi,
> >
> > On Thu, May 2, 2019 at 11:37 PM Błażej Szczygieł <spaz16@wp.pl> wrote:
> >>
> >> Since recent high resolution scrolling changes the A4Tech driver must
> >> check for the "REL_WHEEL_HI_RES" usage code.
> >>
> >> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e (HID: input: use the
> >> Resolution Multiplier for high-resolution scrolling)
> >>
> >> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
> >
> > Thanks for the patch. I do not doubt this fixes the issues, but I
> > still wonder if we should not export REL_HWHEEL_HI_RES instead of
> > REL_HWHEEL events.
>
>
> If you mean exporting REL_HWHEEL_HI_RES instead of REL_HWHEEL from
> hid-a4tech.c, then it makes sense to me, though I do not know the code
> well enough to be certain.

Yep, that's what I meant. I am worried that userspace doesn't know
well how to deal with a device that mixes the new and old REL_WHEEL
events.

>
> Błażej and I have discussed the bug and the patch here:
> https://bugzilla.kernel.org/show_bug.cgi?id=203369

Oh cool.
Then we should add: "Link:
https://bugzilla.kernel.org/show_bug.cgi?id=203369" in the commit
description.

Also, given that the patch will likely see a v2, te format of the
"Fixes" tag is not correct: see
https://www.kernel.org/doc/html/v4.20/process/submitting-patches.html#describe-your-changes
(I have been notified that I tend to not follow the rules here, so I
am trying to do better here :-P )

>
> In summary: the patch fixes the bug for both our mice;
> the documentation in input/event-codes.rst states that
> REL_WHEEL, REL_HWHEEL "are legacy codes and REL_WHEEL_HI_RES and
> REL_HWHEEL_HI_RES should be preferred where available."
>
> > Also, I can not figure out how the events are processed by the kernel.
> > Could you attach a hid-recorder dump of the mouse wheels with
> > hid-recorder from https://gitlab.freedesktop.org/libevdev/hid-tools ?
> >
> > This should give me a better view of the mouse, and I could also add
> > it to the regression tests I am running for each commit.
> >
> > Cheers,
> > Benjamin
>
> After launching hid-recorder for my A4Tech WOP-49Z mouse under kernel
> 5.0.10 patched with Błażej's patch I:
> * scrolled the vertical wheel down ("Wheel: -1");
> * scrolled the vertical wheel up ("Wheel: 1");
> * scrolled the horizontal wheel "left" ("Wheel: -1");
> * scrolled the horizontal wheel "right" ("Wheel: 1").
> Note that the horizontal wheel is physically scrolled just like the
> vertical one in this mouse (forward/back), so "left" and "right" are the
> effects these scrollings make in applications when the kernel supports
> the mouse properly.
>
> $ sudo ./hid-recorder /dev/hidraw1
> # A4Tech PS/2+USB Mouse
> # 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
> # 0x09, 0x02,                    // Usage (Mouse)                       2
> # 0xa1, 0x01,                    // Collection (Application)            4
> # 0x09, 0x01,                    //  Usage (Pointer)                    6
> # 0xa1, 0x00,                    //  Collection (Physical)              8
> # 0x05, 0x09,                    //   Usage Page (Button)               10
> # 0x19, 0x01,                    //   Usage Minimum (1)                 12
> # 0x29, 0x07,                    //   Usage Maximum (7)                 14
> # 0x15, 0x00,                    //   Logical Minimum (0)               16
> # 0x25, 0x01,                    //   Logical Maximum (1)               18
> # 0x75, 0x01,                    //   Report Size (1)                   20
> # 0x95, 0x07,                    //   Report Count (7)                  22
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              24
> # 0x75, 0x01,                    //   Report Size (1)                   26
> # 0x95, 0x01,                    //   Report Count (1)                  28
> # 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)              30
> # 0x05, 0x01,                    //   Usage Page (Generic Desktop)      32
> # 0x09, 0x30,                    //   Usage (X)                         34
> # 0x09, 0x31,                    //   Usage (Y)                         36
> # 0x09, 0x38,                    //   Usage (Wheel)                     38
> # 0x15, 0x81,                    //   Logical Minimum (-127)            40
> # 0x25, 0x7f,                    //   Logical Maximum (127)             42
> # 0x75, 0x08,                    //   Report Size (8)                   44
> # 0x95, 0x03,                    //   Report Count (3)                  46
> # 0x81, 0x06,                    //   Input (Data,Var,Rel)              48
> # 0xc0,                          //  End Collection                     50
> # 0xc0,                          // End Collection                      51
> #
> R: 52 05 01 09 02 a1 01 09 01 a1 00 05 09 19 01 29 07 15 00 25 01 75 01
> 95 07 81 02 75 01 95 01 81 01 05 01 09 30 09 31 09 38 15 81 25 7f 75 08
> 95 03 81 06 c0 c0
> N: A4Tech PS/2+USB Mouse
> I: 3 09da 0006
> #  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000000.000000 4 00 00 00 ff
> #  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000000.071952 4 00 00 00 ff
> #  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000000.159957 4 00 00 00 ff
> #  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000002.912232 4 00 00 00 01
> #  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000002.952190 4 00 00 00 01
> #  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000004.512359 4 00 00 00 01
> #  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000004.584332 4 00 00 00 01
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000007.528626 4 40 00 00 ff
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000007.568577 4 40 00 00 ff
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000008.256395 4 40 00 00 ff
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000008.336669 4 40 00 00 ff
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
> E: 000008.400649 4 40 00 00 ff
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000010.936908 4 40 00 00 01
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000010.984864 4 40 00 00 01
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000011.056897 4 40 00 00 01
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000011.528936 4 40 00 00 01
> #  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
> E: 000011.616923 4 40 00 00 01
>

OK, thanks both of you for your logs, this is helpful.
So just in case I need to come back later, the horizontal wheel is
"just" the normal wheel plus a modifier in the report.

Anyway, ideally, can we have a v2 of the patch with the 2 changes
requested above in the commit message and the introduction of
REL_HWHEEL_HI_RES events in addition to REL_HWHEEL?
REL_HWHEEL_HI_RES should report `120*value` and we should also keep
the reporting of REL_WHEEL as it is currently.

Peter, I grepped in the hid code, and it seems hid-cypress.c is having
the exact same issue. Sigh.

Cheers,
Benjamin
