Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442C0E0119
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 11:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbfJVJsp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 05:48:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30194 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731333AbfJVJsp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 05:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571737722;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PRAOR12JaNY9es9Bx8VnFx8au7NL5fQbM+PyXwndRGQ=;
        b=MIw3OCAW78vuZhHQ7TvF+bQrvNxohPM5ATAbajhBKs+BCo+aIbubJF95qVjUnmLOHHTnGs
        nJfpLXSIBJTqqgm3gnixCwcfJRZALCjiv/21s9lmy7mDC44+YMYKDotL+/Tw740cuDAUHQ
        J2Lfuok3Q68YdXMR1GVTQWoOj7V7+Rs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-LwZ0SCleNaOy8uKXUnTJXA-1; Tue, 22 Oct 2019 05:48:41 -0400
Received: by mail-qt1-f200.google.com with SMTP id k53so17075357qtk.0
        for <linux-input@vger.kernel.org>; Tue, 22 Oct 2019 02:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pP78e8PS7VCP+PGqOJvtb2re0XLv7PavFO0GY0t0YU=;
        b=Lmb1mGFJTVVCAYMTdTqFwrF8Ru7e8oXmFp6GppSw4GqigxP5M2jDdnRCbuEmw2nJqe
         9Jdeyb/tqprEotq8C+o7Ss3xYfcFeHBQrI4LnN9w5Xt0bVSiQRc6T0UhND4ksv4PK+A9
         BD3Tw+1sNkjWMJvrgR7H6Hfb7JzHQI/cR7NlqPKVYih0nBUHaM2mGC535HzXHuyWGdMs
         lb6ZauHlHoaXbJbOTZvseJzeduaNRqQD/oj0eel4H/cBVgNuxscWMCC1zY0u28OfN1hd
         hWpNHUr0p+898icU4dWZMEevukfROizOqrrELBPzt8GZiEv8ydQL1zeFT3MPuzHiL0jp
         e/oQ==
X-Gm-Message-State: APjAAAWQ4IzVY/tTrexbX80plzx7aya/UxS75PoTQ15wFzSRd4k/RvP+
        M5jkyoPL33uZmKokn73YfCKOexddeneQ10afEZ+L8QH/bEXvA1298N3kHGu/r3sL74NRGM5V03+
        rMbLBQwHYNwRsH92b6uFriUNLoeFTgnjOKhjeluI=
X-Received: by 2002:ac8:75ca:: with SMTP id z10mr806336qtq.260.1571737720793;
        Tue, 22 Oct 2019 02:48:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgKioRJF0ivUW1HRKd99+gzOt+WW91+HkZO766Vx5SNrosMazF7uNAc8t3J0HkIJgikuVs7aKdhL5dqYHdOH0=
X-Received: by 2002:ac8:75ca:: with SMTP id z10mr806310qtq.260.1571737720392;
 Tue, 22 Oct 2019 02:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191021073819.18181-1-candlesea@gmail.com> <CAPnx3XP2MrEZT+BAzW3-Ve9ekzvPzcj6wvzeC8VRHhCyo59XpQ@mail.gmail.com>
In-Reply-To: <CAPnx3XP2MrEZT+BAzW3-Ve9ekzvPzcj6wvzeC8VRHhCyo59XpQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Oct 2019 11:48:28 +0200
Message-ID: <CAO-hwJ+ObCH_NPJd=Uy5uuVCpGzO7+iCSWnwPkoVt9H+8NHahA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: core: check whether usage page item is after
 usage id item
To:     Candle Sun <candlesea@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?B?57+f5LqsIChPcnNvbiBaaGFpKQ==?= <orson.zhai@unisoc.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
X-MC-Unique: LwZ0SCleNaOy8uKXUnTJXA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Candle,

On Mon, Oct 21, 2019 at 9:54 AM Candle Sun <candlesea@gmail.com> wrote:
>
> Hi,
>
>
> On Mon, Oct 21, 2019 at 3:38 PM Candle Sun <candlesea@gmail.com> wrote:
> >
> > From: Candle Sun <candle.sun@unisoc.com>
> >
> > Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> > to Main item") adds support for Usage Page item after Usage ID items
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
> > This patch adds usage_page_last to flag whether Usage Page is after
> > Usage ID items. usage_page_last is false default, it is set as true
> > once Usage Page item is encountered and is reverted by next Usage ID
> > item.
> >
> > Usage Page concatenation on the currently defined Usage Page will do
> > firstly in Local parsing when Usage ID items encountered.
> >
> > When Main item is parsing, concatenation will do again with last
> > defined Usage Page if usage_page_last flag is true.
> >
> > Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> > Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> > ---
> > Changes in v3:
> > - Rework the GET_COMPLETE_USAGE macro as static complete_usage()
> >   function
> > - Add some code comments for usage_page_last
> >
> > Changes in v2:
> > - Update patch title
> > - Add GET_COMPLETE_USAGE macro
> > - Change the logic of checking whether to concatenate usage page again
> >   in main parsing
> > ---
> >  drivers/hid/hid-core.c | 42 +++++++++++++++++++++++++++++++++++++-----
> >  include/linux/hid.h    |  1 +
> >  2 files changed, 38 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 3eaee2c37931..779b7798dae8 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -211,6 +211,18 @@ static unsigned hid_lookup_collection(struct hid_p=
arser *parser, unsigned type)
> >         return 0; /* we know nothing about this usage type */
> >  }
> >
> > +/*
> > + * Concatenate usage which defines 16 bits or less with the
> > + * currently defined usage page to form a 32 bit usage
> > + */
> > +
> > +static void complete_usage(struct hid_parser *parser, unsigned int ind=
ex)
> > +{
> > +       parser->local.usage[index] &=3D 0xFFFF;
> > +       parser->local.usage[index] |=3D
> > +               (parser->global.usage_page & 0xFFFF) << 16;
> > +}
> > +
> >  /*
> >   * Add a usage to the temporary parser table.
> >   */
> > @@ -221,7 +233,18 @@ static int hid_add_usage(struct hid_parser *parser=
, unsigned usage, u8 size)
> >                 hid_err(parser->device, "usage index exceeded\n");
> >                 return -1;
> >         }
> > -       parser->local.usage[parser->local.usage_index] =3D usage;

This broke my CI, and it turns out that installing the patch on an
actual laptop, the touchpad, touchscreen were not present, nor any HID
devices plugged in.

Basically, complete_usage() doesn't append the usage, and now we are
never assigning a usage to any field.

> > +
> > +       /*
> > +        * If Usage item only includes usage id, concatenate it with
> > +        * currently defined usage page and clear usage_page_last flag
> > +        */
> > +       if (size <=3D 2) {
> > +               parser->local.usage_page_last =3D false;
> > +               complete_usage(parser, parser->local.usage_index);
> > +       } else {
> > +               parser->local.usage[parser->local.usage_index] =3D usag=
e;
> > +       }
> > +
> >         parser->local.usage_size[parser->local.usage_index] =3D size;
> >         parser->local.collection_index[parser->local.usage_index] =3D
> >                 parser->collection_stack_ptr ?
> > @@ -366,6 +389,8 @@ static int hid_parser_global(struct hid_parser *par=
ser, struct hid_item *item)
> >
> >         case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
> >                 parser->global.usage_page =3D item_udata(item);
> > +               /* Regard Usage Page is after Usage ID items */
> > +               parser->local.usage_page_last =3D true;
> >                 return 0;
> >
> >         case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> > @@ -543,13 +568,20 @@ static int hid_parser_local(struct hid_parser *pa=
rser, struct hid_item *item)
> >   * usage value."
> >   */
> >
> > -static void hid_concatenate_usage_page(struct hid_parser *parser)
> > +static void hid_concatenate_last_usage_page(struct hid_parser *parser)
> >  {
> >         int i;
> >
> > +       /*
> > +        * Concatenate usage page again only on detecting some Usage Pa=
ge
> > +        * is really after Usage ID items
> > +        */
> > +       if (!parser->local.usage_page_last)
> > +               return;
> > +
> >         for (i =3D 0; i < parser->local.usage_index; i++)
> >                 if (parser->local.usage_size[i] <=3D 2)
> > -                       parser->local.usage[i] +=3D parser->global.usag=
e_page << 16;
> > +                       complete_usage(parser, i);
> >  }
> >
> >  /*
> > @@ -561,7 +593,7 @@ static int hid_parser_main(struct hid_parser *parse=
r, struct hid_item *item)
> >         __u32 data;
> >         int ret;
> >
> > -       hid_concatenate_usage_page(parser);
> > +       hid_concatenate_last_usage_page(parser);
> >
> >         data =3D item_udata(item);
> >
> > @@ -772,7 +804,7 @@ static int hid_scan_main(struct hid_parser *parser,=
 struct hid_item *item)
> >         __u32 data;
> >         int i;
> >
> > -       hid_concatenate_usage_page(parser);
> > +       hid_concatenate_last_usage_page(parser);
> >
> >         data =3D item_udata(item);
> >
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index cd41f209043f..2e0ea2f7ec5c 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -412,6 +412,7 @@ struct hid_local {
> >         unsigned usage_minimum;
> >         unsigned delimiter_depth;
> >         unsigned delimiter_branch;
> > +       bool usage_page_last;      /* whether usage page is after usage=
 id */
> >  };
> >
>
> Hi Benjamin,
> Here I still use the usage_page_last flag, not using following method
> you provided in v2:
>
> if ((parser->local.usage[parser->local.usage_index - 1] &
> HID_USAGE_PAGE) >> 16 =3D=3D usage_page)
>               return 0;
>
> Because last usage maybe one Extended Usage, some logic for checking
> it should be added.
> It will make the code obscure. Using one more member in struct
> hid_local is straightforward
> and maybe better.


Still not convinced by this. Please see below for a less intrusive
patch, which is also shorter.

---
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 63fdbf09b044..00ea04fb1be3 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -211,6 +211,18 @@ static unsigned hid_lookup_collection(struct
hid_parser *parser, unsigned type)
     return 0; /* we know nothing about this usage type */
 }

+/*
+ * Concatenate usage which defines 16 bits or less with the
+ * currently defined usage page to form a 32 bit usage
+ */
+
+static void complete_usage(struct hid_parser *parser, unsigned int index)
+{
+    parser->local.usage[index] &=3D 0xFFFF;
+    parser->local.usage[index] |=3D
+        (parser->global.usage_page & 0xFFFF) << 16;
+}
+
 /*
  * Add a usage to the temporary parser table.
  */
@@ -222,6 +234,14 @@ static int hid_add_usage(struct hid_parser
*parser, unsigned usage, u8 size)
         return -1;
     }
     parser->local.usage[parser->local.usage_index] =3D usage;
+
+    /*
+     * If Usage item only includes usage id, concatenate it with
+     * currently defined usage page
+     */
+    if (size <=3D 2)
+        complete_usage(parser, parser->local.usage_index);
+
     parser->local.usage_size[parser->local.usage_index] =3D size;
     parser->local.collection_index[parser->local.usage_index] =3D
         parser->collection_stack_ptr ?
@@ -546,10 +566,28 @@ static int hid_parser_local(struct hid_parser
*parser, struct hid_item *item)
 static void hid_concatenate_usage_page(struct hid_parser *parser)
 {
     int i;
+    uint16_t usage_page, current_page;

-    for (i =3D 0; i < parser->local.usage_index; i++)
-        if (parser->local.usage_size[i] <=3D 2)
-            parser->local.usage[i] +=3D parser->global.usage_page << 16;
+    if (!parser->local.usage_index)
+        return;
+
+    usage_page =3D parser->global.usage_page;
+
+    /*
+     * Concatenate usage page again only if the last declared Usage Page
+     * has not been already used in the previous Usages
+     */
+    for (i =3D parser->local.usage_index - 1; i >=3D 0; i--) {
+        if (parser->local.usage_size[i] > 2)
+            /* ignore extended usages */
+            continue;
+
+        current_page =3D parser->local.usage[i] >> 16;
+        if (current_page =3D=3D usage_page)
+            break;
+
+        complete_usage(parser, i);
+    }
 }

 /*
---

Isn't that better?

I tested this against
https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/58,
which you kindly submitted and it seems to do the job.

Cheers,
Benjamin

