Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6BDC2422
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 17:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731471AbfI3PUl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 11:20:41 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:39962 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfI3PUl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 11:20:41 -0400
Received: by mail-yw1-f67.google.com with SMTP id e205so3632714ywc.7;
        Mon, 30 Sep 2019 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgDS8CCRfY3KdSfz13H/84KsId5liuKpc7DN8dctxj8=;
        b=og4okkp3Z6jL+ygHCe7aVUXW5VU9YFngf41uOoHg7QFdW7UKvImMK363BQgPgVoRss
         N3nxWErtuivOTYhCVJBI26QGdosbtMTOr9DCEnTuCKPNBHHN+ltF3Pm0v0z8AJkTG27F
         NTOxoGo24OeZR/8jM0PDYE4hxl6wYJ4DkltNTAnq92q4paPNnexJyBvj/dW1yC8FGy7Y
         J1CLhSRFWsWJVc2ha75P5q7GEQBTcO5WcFj8bDgOCeDKXbfTw+m7klw3RzoNG5hPgrm7
         f8maHbqb8cZs/sCmLb01LSJFWtFlPOF6ZkT+MgZigCaWYD2zuHdhQpmXBPZkuobyg6vb
         7aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgDS8CCRfY3KdSfz13H/84KsId5liuKpc7DN8dctxj8=;
        b=EtMSRp45cfkS0JcKTYl6MdHPZ9U8YW0wqEZ9EBaT8/Fs7Bo7uIqv5RFye4AkRTsSU7
         y+PlDmz1DjiTkv8RdNCgApgz8/hAj4N4WApRFFQQho5QKjYvav1CNvr9nJEIfroaRI/X
         FKW8IOfx3jxnBDIcaAEpqUUlLNDAappsjUArlfwbSGSIaRGVvV18SsC2tbRgw4iCw+FI
         RIY71FLDqFP9RWHx4xMAxIdr6y6wbdbXnHmuGrRimM+jYQw3RhGVHsWL5LYYXkpN+bP6
         46kRZgkFgCibGaJ6Wr229tYwmM6k7BFvK/PsfFQRcJVogAy3QUU5W5FpSAHmQ0MWHmF+
         Lofg==
X-Gm-Message-State: APjAAAW2+t7g8KjuJG8pnecKWLGwEPGQjllbhhbX58wtWgrI0iekrNH/
        FZIbjDXy5v5YamMhYHGH5xLwfe7SyzKwOXSBYeg=
X-Google-Smtp-Source: APXvYqzUoH5F5F1RRYtaiTEvs7lPlPZaOzy0OsyVXF+idI3HEsaBzVQDVWkQ64hOobo7ehW8A2KhjWeui2QERFpnZOM=
X-Received: by 2002:a81:1701:: with SMTP id 1mr13678363ywx.482.1569856838839;
 Mon, 30 Sep 2019 08:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <1569830949-10771-1-git-send-email-candlesea@gmail.com> <CAO-hwJLrQTp7qeMpQvF7429a0qisAe-=zLFRtY79ajhLtusdRg@mail.gmail.com>
In-Reply-To: <CAO-hwJLrQTp7qeMpQvF7429a0qisAe-=zLFRtY79ajhLtusdRg@mail.gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Mon, 30 Sep 2019 23:20:27 +0800
Message-ID: <CAPnx3XO4ktenr8f_AJmDK5qT9RFA5GvD+tF8Le5K=5LsJ1F74A@mail.gmail.com>
Subject: Re: [PATCH] HID: core: add usage_page_preceding flag for hid_concatenate_usage_page()
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, chunyan.zhang@unisoc.com,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,
Thank you very much for the detailed review.

On Mon, Sep 30, 2019 at 5:36 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi,
>
> [also addingg Nicolas, the author of 58e75155009c]
>
> On Mon, Sep 30, 2019 at 10:10 AM Candle Sun <candlesea@gmail.com> wrote:
> >
> > From: Candle Sun <candle.sun@unisoc.com>
> >
> > Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> > to Main item") adds support for Usage Page item following Usage items
> > (such as keyboards manufactured by Primax).
> >
> > Usage Page concatenation in Main item works well for following report
> > descriptor patterns:
> >
> >     USAGE_PAGE (Keyboard)                   05 07
> >     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
> >     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
> >     LOGICAL_MINIMUM (0)                     15 00
> >     LOGICAL_MAXIMUM (1)                     25 01
> >     REPORT_SIZE (1)                         75 01
> >     REPORT_COUNT (8)                        95 08
> >     INPUT (Data,Var,Abs)                    81 02
> >
> > -------------
> >
> >     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
> >     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
> >     LOGICAL_MINIMUM (0)                     15 00
> >     LOGICAL_MAXIMUM (1)                     25 01
> >     REPORT_SIZE (1)                         75 01
> >     REPORT_COUNT (8)                        95 08
> >     USAGE_PAGE (Keyboard)                   05 07
> >     INPUT (Data,Var,Abs)                    81 02
> >
> > But it makes the parser act wrong for the following report
> > descriptor pattern(such as some Gamepads):
> >
> >     USAGE_PAGE (Button)                     05 09
> >     USAGE (Button 1)                        09 01
> >     USAGE (Button 2)                        09 02
> >     USAGE (Button 4)                        09 04
> >     USAGE (Button 5)                        09 05
> >     USAGE (Button 7)                        09 07
> >     USAGE (Button 8)                        09 08
> >     USAGE (Button 14)                       09 0E
> >     USAGE (Button 15)                       09 0F
> >     USAGE (Button 13)                       09 0D
> >     USAGE_PAGE (Consumer Devices)           05 0C
> >     USAGE (Back)                            0a 24 02
> >     USAGE (HomePage)                        0a 23 02
> >     LOGICAL_MINIMUM (0)                     15 00
> >     LOGICAL_MAXIMUM (1)                     25 01
> >     REPORT_SIZE (1)                         75 01
> >     REPORT_COUNT (11)                       95 0B
> >     INPUT (Data,Var,Abs)                    81 02
> >
> > With Usage Page concatenation in Main item, parser recognizes all the
> > 11 Usages as consumer keys, it is not the HID device's real intention.
> >
> > This patch adds usage_page_preceding flag to detect the third pattern.
> > Usage Page concatenation is done in both Local and Main parsing.
> > If usage_page_preceding equals 3(the third pattern encountered),
> > hid_concatenate_usage_page() is jumped.
>
> For anything core related (and especially the parsing), I am trying to
> enforce having regression tests.
> See https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/37
> for the one related to 58e75155009c.
>
> So I would like to have a similar-ish MR adding the matching tests so
> I know we won't break this in the future.
>
> Few other comments in the code:
>

Thanks.


Candle

> >
> > Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> > Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> > ---
> >  drivers/hid/hid-core.c | 21 +++++++++++++++++++--
> >  include/linux/hid.h    |  1 +
> >  2 files changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 3eaee2c..043a232 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -221,7 +221,15 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
> >                 hid_err(parser->device, "usage index exceeded\n");
> >                 return -1;
> >         }
> > -       parser->local.usage[parser->local.usage_index] = usage;
> > +       if (!parser->local.usage_index && parser->global.usage_page)
>
> parser->global.usage_page is never reset, so unless I am misreading,
> it will always be set to a value except for the very first elements.
> I am just raising this in case you rely on global.usage_page being
> null in your algorithm.
>

The patch doesn't rely on the global.usage_page being null.

Checking whether the global.usage_page is zero here aims for ignoring the case
when the first Usage Page of the whole report descriptor is after some defined
Usage items:

USAGE (Button 1)                                 09 01
USAGE_PAGE (Button)                        05 09
REPORT_SIZE (1)                               75 01
REPORT_COUNT (1)                           95 01
LOGICAL_MINIMUM (0)                      15 00
LOGICAL_MAXIMUM (1)                     25 01
INPUT (Data,Var,Abs)                          81 02

Of course, it maybe never occur, but it is allowed by the Spec.

Regards,
Candle

> > +               parser->local.usage_page_preceding = 1;
> > +       if (parser->local.usage_page_preceding == 2)
> > +               parser->local.usage_page_preceding = 3;
>
> Can't we use an enum at least for those 1, 2, 3 values?
> Unless you are counting the previous items, in which we should rename
> the field .usage_page_preceding with something more explicit IMO.
>
>

Yes, using enum type for the values is much better, will add it in next version.

Candle

> > +       if (size <= 2 && parser->global.usage_page)
> > +               parser->local.usage[parser->local.usage_index] =
> > +                       (usage & 0xffff) + (parser->global.usage_page << 16);
>
> we could use a function as this assignment is also reused in
> hid_concatenate_usage_page()
>

Yes, using one function is better, will amend it in next version.

Candle

> > +       else
> > +               parser->local.usage[parser->local.usage_index] = usage;
> >         parser->local.usage_size[parser->local.usage_index] = size;
> >         parser->local.collection_index[parser->local.usage_index] =
> >                 parser->collection_stack_ptr ?
> > @@ -366,6 +374,8 @@ static int hid_parser_global(struct hid_parser *parser, struct hid_item *item)
> >
> >         case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
> >                 parser->global.usage_page = item_udata(item);
> > +               if (parser->local.usage_page_preceding == 1)
> > +                       parser->local.usage_page_preceding = 2;
> >                 return 0;
> >
> >         case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> > @@ -547,9 +557,16 @@ static void hid_concatenate_usage_page(struct hid_parser *parser)
> >  {
> >         int i;
> >
> > +       if (parser->local.usage_page_preceding == 3) {
> > +               dbg_hid("Using preceding usage page for final usage\n");
> > +               return;
> > +       }
> > +
> >         for (i = 0; i < parser->local.usage_index; i++)
> >                 if (parser->local.usage_size[i] <= 2)
> > -                       parser->local.usage[i] += parser->global.usage_page << 16;
> > +                       parser->local.usage[i] =
> > +                               (parser->global.usage_page << 16)
> > +                               + (parser->local.usage[i] & 0xffff);
>
> I find the whole logic really hard to follow. I'm not saying you are
> wrong, but if it's hard to get the concepts behind the various states
> and this will make it really prone to future errors.
>

By reading "Device Class Definition for Human Interface Devices (HID)
Version 1.11"
Spec more times, I think Spec regards both of the following cases legal, they
are not contradictory:

- Usages after some already defined Usage Page
"If the bSize field = 1 or 2 then the Usage is interpreted as an unsigned value
that selects a Usage ID on the *currently defined Usage Page*."

- No Usage Page defined before Usages (Usage Page is *LAST")
"When the parser encounters a main item it concatenates the *last
declared Usage Page*
with a Usage to form a complete usage value."
(Here I think *last* means no Usage Page is already defined before the
Usages.)

HID device designer can choose either pattern for the device. So the descriptor
parser must have the ability to recognize the real complete Usage value.

In my opinion, the following descriptor which exsits in practice
doesn't strictly
conform the HID Spec:

------------------------
05 01      Usage Page (Desktop),               ; Generic desktop controls (01h)
09 06      Usage (Keyboard),                   ; Keyboard (06h,
application collection)
a1 01      Collection (Application),
05 07          Usage Page (Keyboard),          ; Keyboard/keypad (07h)
19 e0          Usage Minimum (KB Leftcontrol), ; Keyboard left control
(E0h, dynamic value)
29 e7          Usage Maximum (KB Right GUI),   ; Keyboard right GUI
(E7h, dynamic value)
15 00          Logical Minimum (0),
25 01          Logical Maximum (1),
75 01          Report Size (1),
95 08          Report Count (8),
81 02          Input (Variable),

75 08          Report Size (8),
95 01          Report Count (1),
81 01          Input (Constant),

05 08          Usage Page (LED),               ; LEDs (08h)
19 01          Usage Minimum (01h),
29 03          Usage Maximum (03h),
75 01          Report Size (1),
95 03          Report Count (3),
91 02          Output (Variable),
95 01          Report Count (1),
75 05          Report Size (5),
91 01          Output (Constant),

15 00          Logical Minimum (0),
26 ff 00       Logical Maximum (255),
19 00          Usage Minimum (00h),
2a ff 00       Usage Maximum (FFh),
05 07          Usage Page (Keyboard),          ; Keyboard/keypad (07h)
75 08          Report Size (8),
95 06          Report Count (6),
81 00          Input,

05 01          Usage Page (Desktop),           ; Generic desktop controls (01h)
0a 68 01       Usage (0168h),
15 80          Logical Minimum (-128),
25 7f          Logical Maximum (127),
95 01          Report Count (1),
75 08          Report Size (8),
81 02          Input (Variable),
c0         End Collection
------------------------------------

Nicolas' patch(58e75155009c) can make parser to recognize above
device's intention.

But it also produces side effects on the compound Usage/Usage Page
sequences, such
as the following case which conforms the Spec:

------------------------------------
Usage Page (X)
Usage (X.1)
Usage Page (Y)
Usage (Y.1)
Input/Output/Feature
------------------------------------

Usage Page concatenation in Main item will always use the last Usage
Page for all
preceding usages.

This patch is using the usage_page_preceding flag to find above
compound sequence and
jump hid_concatenate_usage_page() while keeping Nicolas' patch(58e75155009c) for
some keyboards.

Candle

> I wonder if we should not:
> - store the current usage page in the current local item as they come in
> - then in hid_concatenate_usage_page() iterate over the usages in
> reverse order. We should be able to detect if the last usage page was
> given for the whole previous range (i.e. not assigned to any local
> usage) or if it has already been given to a local usage, meaning we
> should just keep things as it is.
>
> Cheers,
> Benjamin
>

Sorry, I don't know how to do it now.

Candle

> >  }
> >
> >  /*
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index cd41f20..7fb6cf3 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -412,6 +412,7 @@ struct hid_local {
> >         unsigned usage_minimum;
> >         unsigned delimiter_depth;
> >         unsigned delimiter_branch;
> > +       unsigned int usage_page_preceding;
> >  };
> >
> >  /*
> > --
> > 2.7.4
> >
>
