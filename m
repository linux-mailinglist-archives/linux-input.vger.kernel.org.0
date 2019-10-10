Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3EFD296E
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 14:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733072AbfJJMYw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 08:24:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46533 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727800AbfJJMYw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 08:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570710290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z1PiOTpfKA6S0H6nQpCOs61aSj3VGg1/5P4RB8zuLvo=;
        b=Buhty/DMhVQKEN9I6bGn59Icvyj7Gje1rLRQtKryrsfDYjheIKlT+5EFD7CPKdIXv56CqL
        2QXC6g/44lv6g8gnGEpIkYWR3CApNcEns33bmXh/6RQHjws9TIdvjQ929a0MyelMq4Fm1H
        xzY7XrmUOaCUuRFAnrxasYEfGcYSvIE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-Uu3de_F4Nb6CQgll-NdWhQ-1; Thu, 10 Oct 2019 08:24:47 -0400
Received: by mail-qk1-f199.google.com with SMTP id k67so5308540qkc.3
        for <linux-input@vger.kernel.org>; Thu, 10 Oct 2019 05:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1+C6ea0hNuFJ0RH805lPfk6alhjeCeIJ9+VYkTTd2Ww=;
        b=qlP6mT/TY6iqIqO6fweqmf7/gqGHwLNM4ymXUBjhqyomgeW+rEyxIXscQEjflckiIR
         vjktgUMKCht+te+cARb2N+lVVI0RF4j41jY9NZp9rmdCZHK9Sp+2lMNSYLi5AjJXMBTV
         iYw8du9RPP/fhzo02xlwSzKEQGlwndng5IpzaxBNqLbFZPSgUqTVsUTNLX2Waoz4L524
         /AOvAyNMor9MY6+rP/+40JdOCUAtP9R09auB12OmDTVMDJ16hhxVuFN48AsIXpzMfAql
         D0gzK0ekZQ4M/lxSw7mu9kw3yMCFYZNDtawO+AxSAtGJwCtSvc7X1l9xjqtXZg/GJeGW
         jT7w==
X-Gm-Message-State: APjAAAXDYPfBt/6QHaqf4k4TwcmEsc/qrjOGc9HLeid5GXHh70qA7m9y
        0E0Vuy1FXVTu/hAWEUhVL8a6OjSsilVBkElHMfDsa9efnKolJ0D3fkS7LOXQtpQQSStKdzEm3Q/
        EgQgeZKCEp94n834e5MxVB6ifG5DGuaRa5FsErUY=
X-Received: by 2002:a37:648d:: with SMTP id y135mr8958860qkb.459.1570710286698;
        Thu, 10 Oct 2019 05:24:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkMt3NS82xgyIf0scvKcdLuCY5ChVMQq28kCW69B6P3qMz7wQusBovzbRCTAhZgcV4StFli0LR8QN+ughoOuM=
X-Received: by 2002:a37:648d:: with SMTP id y135mr8958821qkb.459.1570710286350;
 Thu, 10 Oct 2019 05:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
In-Reply-To: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 10 Oct 2019 14:24:34 +0200
Message-ID: <CAO-hwJKjZedG6yySDHKQoAmG5DdQ7QPhuaoMN9g0_KmbktD9fA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
To:     Candle Sun <candlesea@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        orson.zhai@unisoc.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
X-MC-Unique: Uu3de_F4Nb6CQgll-NdWhQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 9, 2019 at 2:54 PM Candle Sun <candlesea@gmail.com> wrote:
>
> From: Candle Sun <candle.sun@unisoc.com>
>
> Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> to Main item") adds support for Usage Page item after Usage ID items
> (such as keyboards manufactured by Primax).
>
> Usage Page concatenation in Main item works well for following report
> descriptor patterns:
>
>     USAGE_PAGE (Keyboard)                   05 07
>     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
>     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
>     LOGICAL_MINIMUM (0)                     15 00
>     LOGICAL_MAXIMUM (1)                     25 01
>     REPORT_SIZE (1)                         75 01
>     REPORT_COUNT (8)                        95 08
>     INPUT (Data,Var,Abs)                    81 02
>
> -------------
>
>     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
>     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
>     LOGICAL_MINIMUM (0)                     15 00
>     LOGICAL_MAXIMUM (1)                     25 01
>     REPORT_SIZE (1)                         75 01
>     REPORT_COUNT (8)                        95 08
>     USAGE_PAGE (Keyboard)                   05 07
>     INPUT (Data,Var,Abs)                    81 02
>
> But it makes the parser act wrong for the following report
> descriptor pattern(such as some Gamepads):
>
>     USAGE_PAGE (Button)                     05 09
>     USAGE (Button 1)                        09 01
>     USAGE (Button 2)                        09 02
>     USAGE (Button 4)                        09 04
>     USAGE (Button 5)                        09 05
>     USAGE (Button 7)                        09 07
>     USAGE (Button 8)                        09 08
>     USAGE (Button 14)                       09 0E
>     USAGE (Button 15)                       09 0F
>     USAGE (Button 13)                       09 0D
>     USAGE_PAGE (Consumer Devices)           05 0C
>     USAGE (Back)                            0a 24 02
>     USAGE (HomePage)                        0a 23 02
>     LOGICAL_MINIMUM (0)                     15 00
>     LOGICAL_MAXIMUM (1)                     25 01
>     REPORT_SIZE (1)                         75 01
>     REPORT_COUNT (11)                       95 0B
>     INPUT (Data,Var,Abs)                    81 02
>
> With Usage Page concatenation in Main item, parser recognizes all the
> 11 Usages as consumer keys, it is not the HID device's real intention.
>
> This patch adds usage_page_last to flag whether Usage Page is after
> Usage ID items. usage_page_last is false default, it is set as true
> once Usage Page item is encountered and is reverted by next Usage ID
> item.
>
> Usage Page concatenation on the currently defined Usage Page will do
> firstly in Local parsing when Usage ID items encountered.
>
> When Main item is parsing, concatenation will do again with last
> defined Usage Page if usage_page_last flag is true.
>
> Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> ---
> Changes in v2:
> - Update patch title
> - Add GET_COMPLETE_USAGE macro
> - Change the logic of checking whether to concatenate usage page again
>   in main parsing
> ---
>  drivers/hid/hid-core.c | 31 +++++++++++++++++++++++++------
>  include/linux/hid.h    |  1 +
>  2 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 3eaee2c..3394222 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -35,6 +35,8 @@
>
>  #include "hid-ids.h"
>
> +#define GET_COMPLETE_USAGE(page, id) (((page) << 16) + ((id) & 0xffff))
> +
>  /*
>   * Version Information
>   */
> @@ -221,7 +223,15 @@ static int hid_add_usage(struct hid_parser *parser, =
unsigned usage, u8 size)
>                 hid_err(parser->device, "usage index exceeded\n");
>                 return -1;
>         }
> -       parser->local.usage[parser->local.usage_index] =3D usage;
> +
> +       if (size <=3D 2) {
> +               parser->local.usage_page_last =3D false;
> +               parser->local.usage[parser->local.usage_index] =3D
> +                       GET_COMPLETE_USAGE(parser->global.usage_page, usa=
ge);
> +       } else {
> +               parser->local.usage[parser->local.usage_index] =3D usage;
> +       }
> +
>         parser->local.usage_size[parser->local.usage_index] =3D size;
>         parser->local.collection_index[parser->local.usage_index] =3D
>                 parser->collection_stack_ptr ?
> @@ -366,6 +376,7 @@ static int hid_parser_global(struct hid_parser *parse=
r, struct hid_item *item)
>
>         case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
>                 parser->global.usage_page =3D item_udata(item);
> +               parser->local.usage_page_last =3D true;
>                 return 0;
>
>         case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> @@ -543,13 +554,21 @@ static int hid_parser_local(struct hid_parser *pars=
er, struct hid_item *item)
>   * usage value."
>   */
>
> -static void hid_concatenate_usage_page(struct hid_parser *parser)
> +static void hid_concatenate_last_usage_page(struct hid_parser *parser)
>  {
>         int i;
> +       unsigned int usage;
> +       unsigned int usage_page =3D parser->global.usage_page;
> +
> +       if (!parser->local.usage_page_last)
> +               return;
>
>         for (i =3D 0; i < parser->local.usage_index; i++)
> -               if (parser->local.usage_size[i] <=3D 2)
> -                       parser->local.usage[i] +=3D parser->global.usage_=
page << 16;
> +               if (parser->local.usage_size[i] <=3D 2) {
> +                       usage =3D parser->local.usage[i];
> +                       parser->local.usage[i] =3D
> +                               GET_COMPLETE_USAGE(usage_page, usage);
> +               }
>  }
>
>  /*
> @@ -561,7 +580,7 @@ static int hid_parser_main(struct hid_parser *parser,=
 struct hid_item *item)
>         __u32 data;
>         int ret;
>
> -       hid_concatenate_usage_page(parser);
> +       hid_concatenate_last_usage_page(parser);
>
>         data =3D item_udata(item);
>
> @@ -772,7 +791,7 @@ static int hid_scan_main(struct hid_parser *parser, s=
truct hid_item *item)
>         __u32 data;
>         int i;
>
> -       hid_concatenate_usage_page(parser);
> +       hid_concatenate_last_usage_page(parser);
>
>         data =3D item_udata(item);
>
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index cd41f20..2e0ea2f7 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -412,6 +412,7 @@ struct hid_local {
>         unsigned usage_minimum;
>         unsigned delimiter_depth;
>         unsigned delimiter_branch;
> +       bool usage_page_last;      /* whether usage page is after usage i=
d */

We don't need that extra flag:
if you just check on the last element, you can guess that information:

        if ((parser->local.usage[parser->local.usage_index - 1] &
HID_USAGE_PAGE) >> 16 =3D=3D usage_page)
              return 0;

Let's see the next version before requesting too many changes.

And yes, I agree I need the hid-tools patches or I will not merge this
patch (and I will advise Jiri to not take it either).

Cheers,
Benjamin

