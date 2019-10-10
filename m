Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB7BD1EC1
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 05:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732448AbfJJDGD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 23:06:03 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:36170 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfJJDGD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 23:06:03 -0400
Received: by mail-yb1-f196.google.com with SMTP id r2so1465030ybg.3;
        Wed, 09 Oct 2019 20:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=du5XLT8pa/Vecc4kyIA7OYvXG3RWkw/01+yrJTx73RE=;
        b=BlD1y8wmAxqB9WtN1a5syp5fkDC0ZRDqF6McNTn8P2OIEvnU4srqpCZiNgwNIxX/Ht
         O7c0qukRUkx/VB9L5QOevY3flnaj3Zuc+TcAPurzCthvFhrqlLOEhdquOxcdPiZWZmD0
         dN9Ma+cfRBWAZPhaIO4NKtTlp/Zm8Tp6zNfYzedzq9DwxmXDs08ubmwIJ8V/OD00XflH
         gT3WsFr/ThbT8gKimUjIfpdCjAyYMJS2Fmc7ZGV/AP36iJKjmJI7RAOrCeGMFA+GQNhB
         voYk54H8dOgUhSKdLauOBTFSOhCTA6GXvVPZj4qC4f6Hr+MT/y/JkVSTv5k5crMMUgnH
         aCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=du5XLT8pa/Vecc4kyIA7OYvXG3RWkw/01+yrJTx73RE=;
        b=B6n0R9XmWAUrabjZ+3Z3pZOJ7vzBdgK+Kl9vpgHS+i0pjMBl/o7CpzWkNv2F9XXaJJ
         5pzmAW2p2ecCvGlDEPUdYmQ0nQKWBX9OpLrdiKB0kpQqiQfK6tUrea53LFpua+GN36Qr
         v8G9psPHPEm+rHOJWpfgUX7AY++1hdturnn6ZPxXWNPK6AuyMpID06D1YqsR7TE/OBMJ
         iKQED5r8wjIPOQnC4e7eCVCivv71S9jQe8UhV7hxE1JJJeQm9J3NqaiX2YRsW0mWpa2W
         1XnOboY6QiHFDE9e4gA5EZKNXP0eStbjPFVsQKN7wNhjCRU0pdKhCeuKVBqwfG6NJBRH
         0ahw==
X-Gm-Message-State: APjAAAXV9HHa1AxBsaftC/VpXb2Q7cC+D1/d5v7n+qiVmECMUudWl+I8
        EfIUXkIbEa2Bd+1VfNRWTs8LRO/yno11vyV6pfg=
X-Google-Smtp-Source: APXvYqwzMKyQgYxGmT4eIcZKC7Uuo+IJHgMjHNVS+48H3vC5H/tqh4JszQM6/H/9e/qTD1X1hyZzu0etCR+ND/9WhPA=
X-Received: by 2002:a25:cc56:: with SMTP id l83mr4757137ybf.69.1570676762398;
 Wed, 09 Oct 2019 20:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com> <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de>
In-Reply-To: <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de>
From:   Candle Sun <candlesea@gmail.com>
Date:   Thu, 10 Oct 2019 11:05:50 +0800
Message-ID: <CAPnx3XPDA_n_yjyiAqwX05ee0ez3tUrJz=2tQ95VeiA_dRA-xA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        orson.zhai@unisoc.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 10, 2019 at 1:01 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Wed, 2019-10-09 at 20:53 +0800, Candle Sun wrote:
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
>
> Functionally I think this is the right approach. Sadly I don't have access to
> any  Primax device anymore so I can't test it. But I suggest you update
> hid-tools' parser and add a new unit test to verify we aren't missing anything.
>
> You can base your code on this:
>
> https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/37/commits
>

Thanks Nicolas. I will check and try to do it.

Candle

> > Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> > Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> > ---
> > Changes in v2:
> > - Update patch title
> > - Add GET_COMPLETE_USAGE macro
> > - Change the logic of checking whether to concatenate usage page again
> >   in main parsing
> > ---
> >  drivers/hid/hid-core.c | 31 +++++++++++++++++++++++++------
> >  include/linux/hid.h    |  1 +
> >  2 files changed, 26 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 3eaee2c..3394222 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -35,6 +35,8 @@
> >
> >  #include "hid-ids.h"
> >
> > +#define GET_COMPLETE_USAGE(page, id) (((page) << 16) + ((id) & 0xffff))
>
> Not sure I like the macro. I'd rather have the explicit code. That said, lets
> see what Benjamin has to say.
>
> > +
> >  /*
> >   * Version Information
> >   */
> > @@ -221,7 +223,15 @@ static int hid_add_usage(struct hid_parser *parser,
> > unsigned usage, u8 size)
> >               hid_err(parser->device, "usage index exceeded\n");
> >               return -1;
> >       }
> > -     parser->local.usage[parser->local.usage_index] = usage;
> > +
> > +     if (size <= 2) {
> > +             parser->local.usage_page_last = false;
> > +             parser->local.usage[parser->local.usage_index] =
> > +                     GET_COMPLETE_USAGE(parser->global.usage_page, usage);
> > +     } else {
> > +             parser->local.usage[parser->local.usage_index] = usage;
> > +     }
> > +
> >       parser->local.usage_size[parser->local.usage_index] = size;
> >       parser->local.collection_index[parser->local.usage_index] =
> >               parser->collection_stack_ptr ?
> > @@ -366,6 +376,7 @@ static int hid_parser_global(struct hid_parser *parser,
> > struct hid_item *item)
> >
> >       case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
> >               parser->global.usage_page = item_udata(item);
> > +             parser->local.usage_page_last = true;
> >               return 0;
> >
> >       case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> > @@ -543,13 +554,21 @@ static int hid_parser_local(struct hid_parser *parser,
> > struct hid_item *item)
> >   * usage value."
> >   */
>
> I'd expand the comment above to further explain what we're doing here.
>

OK, some comment here is better, I will add it.

Candle

> >
> > -static void hid_concatenate_usage_page(struct hid_parser *parser)
> > +static void hid_concatenate_last_usage_page(struct hid_parser *parser)
> >  {
> >       int i;
> > +     unsigned int usage;
> > +     unsigned int usage_page = parser->global.usage_page;
> > +
> > +     if (!parser->local.usage_page_last)
> > +             return;
> >
> >       for (i = 0; i < parser->local.usage_index; i++)
>
> Technically correct but it's preferred if you use braces here.
>

Nicolas, do you mean this:

@@ -563,12 +563,13 @@ static void
hid_concatenate_last_usage_page(struct hid_parser *parser)
        if (!parser->local.usage_page_last)
                return;

-       for (i = 0; i < parser->local.usage_index; i++)
+       for (i = 0; i < parser->local.usage_index; i++) {
                if (parser->local.usage_size[i] <= 2) {
                        usage = parser->local.usage[i];
                        parser->local.usage[i] =
                                GET_COMPLETE_USAGE(usage_page, usage);
                }
+       }
 }

Candle

> > -             if (parser->local.usage_size[i] <= 2)
> > -                     parser->local.usage[i] += parser->global.usage_page <<
> > 16;
> > +             if (parser->local.usage_size[i] <= 2) {
> > +                     usage = parser->local.usage[i];
> > +                     parser->local.usage[i] =
> > +                             GET_COMPLETE_USAGE(usage_page, usage);
> > +             }
> >  }
> >
> >  /*
> > @@ -561,7 +580,7 @@ static int hid_parser_main(struct hid_parser *parser,
> > struct hid_item *item)
> >       __u32 data;
> >       int ret;
> >
> > -     hid_concatenate_usage_page(parser);
> > +     hid_concatenate_last_usage_page(parser);
> >
> >       data = item_udata(item);
> >
> > @@ -772,7 +791,7 @@ static int hid_scan_main(struct hid_parser *parser, struct
> > hid_item *item)
> >       __u32 data;
> >       int i;
> >
> > -     hid_concatenate_usage_page(parser);
> > +     hid_concatenate_last_usage_page(parser);
> >
> >       data = item_udata(item);
> >
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index cd41f20..2e0ea2f7 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -412,6 +412,7 @@ struct hid_local {
> >       unsigned usage_minimum;
> >       unsigned delimiter_depth;
> >       unsigned delimiter_branch;
> > +     bool usage_page_last;      /* whether usage page is after usage id */
> >  };
> >
> >  /*
>
> Regards,
> Nicolas
>
