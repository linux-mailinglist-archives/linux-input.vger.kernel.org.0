Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022C7D378F
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 04:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfJKCiN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 22:38:13 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:42796 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfJKCiN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 22:38:13 -0400
Received: by mail-yb1-f195.google.com with SMTP id 4so2625912ybq.9;
        Thu, 10 Oct 2019 19:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y1tEHg+6HV2z5eWgxuYKpYvLfaLMY0X5948/BysY1RU=;
        b=RpoaVGVH6PqJ7HAhwjoYx++HDU0x8PWelNX+ZckxPV3qtuGMp9RJgbPYaUHXe/IvFi
         qTHXEmti0I1TnYHK1oDXTnwFvOQWX73wEWdYkGAzuun2x7fczySKYhldWHHc90zNH0ds
         Qn5pusvOCZgl/8h+xxoKWYuXHxOjAKLirovmDv+zT2bxGjqKQeo9maw7+wjBnF5sQ74L
         wf2JQMEiNNYOVYWviL+mkOAmhQabZT3w4IHuV+l0zuWtIp7Sp//U/FL5GIaC+RDHd3tu
         YYVV1s5Q8BuSgsxQ/R+k7EAbhcO6Sy8zdm2khymHpHrnB2MRPwLwvK/XF3LoM3wWq5da
         +qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y1tEHg+6HV2z5eWgxuYKpYvLfaLMY0X5948/BysY1RU=;
        b=ZCsBi+LpB5szOAE1FFV2eZz4zwfZUSHesD2zAINLfP6gQN+f2X93ZWtDeVGPGb9Rpy
         8coNvWHSSTh/My08cEZq9an4SsU52wzjvW2KqHR55wyXzrMdme1piqYAPVTg88iVNKCX
         RdTxviK5U7np+Lx2cWqBKb/2MG32NupQxiQxracsYlEk8uI1eHUHh3zxMwMYwDo1XnvJ
         +pjU3hyRn6aHnYRUJBQ7JUlbdjcDk4ysBq9tJYSsbxdJ9EfmGoYV/3Q/PGOrtE9NHLO7
         T9284Y0su/u2bTEIHXP0JcG+X9efut9tttQ6HbQQpoLhT7F7/TbMYF+cGH3ObRu6gYK7
         JABA==
X-Gm-Message-State: APjAAAXFnJn9o5L4ZHyXolR85JYSBsFknG3nJXSzagtyMrVvsDNt69NB
        xlFJy4JD1IjPdp3irKv870HpO4hROCOfm4Qx7RQ=
X-Google-Smtp-Source: APXvYqxYdQ0cr9jkJleuePximkqmQgPv5Ltox7xPGUWuJFED0SP41Oc5C50L6DjUQALq2vo5EoiRiQk2Fsy/wFmB93A=
X-Received: by 2002:a25:4e84:: with SMTP id c126mr8289590ybb.407.1570761491904;
 Thu, 10 Oct 2019 19:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com> <CAO-hwJKjZedG6yySDHKQoAmG5DdQ7QPhuaoMN9g0_KmbktD9fA@mail.gmail.com>
In-Reply-To: <CAO-hwJKjZedG6yySDHKQoAmG5DdQ7QPhuaoMN9g0_KmbktD9fA@mail.gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Fri, 11 Oct 2019 10:38:00 +0800
Message-ID: <CAPnx3XP2XfcAQ_YsXU3Vi1zJORp7LQaH5KEvMJ+7EsBfOzgNfw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?B?57+f5LqsIChPcnNvbiBaaGFpKQ==?= <orson.zhai@unisoc.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 10, 2019 at 8:24 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Oct 9, 2019 at 2:54 PM Candle Sun <candlesea@gmail.com> wrote:
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
> > +
> >  /*
> >   * Version Information
> >   */
> > @@ -221,7 +223,15 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
> >                 hid_err(parser->device, "usage index exceeded\n");
> >                 return -1;
> >         }
> > -       parser->local.usage[parser->local.usage_index] = usage;
> > +
> > +       if (size <= 2) {
> > +               parser->local.usage_page_last = false;
> > +               parser->local.usage[parser->local.usage_index] =
> > +                       GET_COMPLETE_USAGE(parser->global.usage_page, usage);
> > +       } else {
> > +               parser->local.usage[parser->local.usage_index] = usage;
> > +       }
> > +
> >         parser->local.usage_size[parser->local.usage_index] = size;
> >         parser->local.collection_index[parser->local.usage_index] =
> >                 parser->collection_stack_ptr ?
> > @@ -366,6 +376,7 @@ static int hid_parser_global(struct hid_parser *parser, struct hid_item *item)
> >
> >         case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
> >                 parser->global.usage_page = item_udata(item);
> > +               parser->local.usage_page_last = true;
> >                 return 0;
> >
> >         case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> > @@ -543,13 +554,21 @@ static int hid_parser_local(struct hid_parser *parser, struct hid_item *item)
> >   * usage value."
> >   */
> >
> > -static void hid_concatenate_usage_page(struct hid_parser *parser)
> > +static void hid_concatenate_last_usage_page(struct hid_parser *parser)
> >  {
> >         int i;
> > +       unsigned int usage;
> > +       unsigned int usage_page = parser->global.usage_page;
> > +
> > +       if (!parser->local.usage_page_last)
> > +               return;
> >
> >         for (i = 0; i < parser->local.usage_index; i++)
> > -               if (parser->local.usage_size[i] <= 2)
> > -                       parser->local.usage[i] += parser->global.usage_page << 16;
> > +               if (parser->local.usage_size[i] <= 2) {
> > +                       usage = parser->local.usage[i];
> > +                       parser->local.usage[i] =
> > +                               GET_COMPLETE_USAGE(usage_page, usage);
> > +               }
> >  }
> >
> >  /*
> > @@ -561,7 +580,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
> >         __u32 data;
> >         int ret;
> >
> > -       hid_concatenate_usage_page(parser);
> > +       hid_concatenate_last_usage_page(parser);
> >
> >         data = item_udata(item);
> >
> > @@ -772,7 +791,7 @@ static int hid_scan_main(struct hid_parser *parser, struct hid_item *item)
> >         __u32 data;
> >         int i;
> >
> > -       hid_concatenate_usage_page(parser);
> > +       hid_concatenate_last_usage_page(parser);
> >
> >         data = item_udata(item);
> >
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index cd41f20..2e0ea2f7 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -412,6 +412,7 @@ struct hid_local {
> >         unsigned usage_minimum;
> >         unsigned delimiter_depth;
> >         unsigned delimiter_branch;
> > +       bool usage_page_last;      /* whether usage page is after usage id */
>
> We don't need that extra flag:
> if you just check on the last element, you can guess that information:
>
>         if ((parser->local.usage[parser->local.usage_index - 1] &
> HID_USAGE_PAGE) >> 16 == usage_page)
>               return 0;
>
> Let's see the next version before requesting too many changes.
>
> And yes, I agree I need the hid-tools patches or I will not merge this
> patch (and I will advise Jiri to not take it either).
>
> Cheers,
> Benjamin
>

Thanks Benjamin.
I will rework the patch and add changes on hid-tools to test it more.

Candle
