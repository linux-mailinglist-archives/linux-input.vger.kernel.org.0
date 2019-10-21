Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E54DE590
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 09:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfJUHym (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 03:54:42 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:40289 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfJUHym (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 03:54:42 -0400
Received: by mail-yw1-f68.google.com with SMTP id a67so897969ywg.7;
        Mon, 21 Oct 2019 00:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JBVuE8K9W/3pxAwfls/F5yOqBVEqnXszhPJ6M1UNYG0=;
        b=Uqet+7F24Q1tOm9DIKQjjvLXpJBP9QLA0kh3AMgf6wIdgGsPAUGUUkM50I6RCmPePV
         1X7xzxKxqm+s4xccoTN6VoBwGx7c5CYfF1HNaXh9S1MFO3nhkekRv823J9mHkmdJ39Aj
         DZxwlDDu+6cMWvLUiw0PAkBk8ULtpZ70aNGMkEA+U1ecrCAC1dgEPlj3fZA4wb7doldo
         Ze6LqeGY8Dcd2ofP+NOqA8ebljsctoGa0pSqnn6oiLz3f9Wem8J/vRCq1COzHZgmJ/kG
         1f5Jw4/i/CWCY1jBYigObq2/TKbWsN1O8jpkTigcFBdwkYxGQAF93UO1DYHDEhX4V29N
         MZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBVuE8K9W/3pxAwfls/F5yOqBVEqnXszhPJ6M1UNYG0=;
        b=Gfl2kwnmbnekXkNwUEQ2l9ZxOLrvwYsSXPQcR4WOwHdWfxlfNu0GzVbg6OJvJDVD1L
         MJkO2fpbzeqdCceMRLdUPxE1bYWfsGFX/TB8zzFvjYFXkjERmUz5bNOW9EYtvBcbLbPG
         aoe881p7OFeAuRKaB172gflCbegX+6Dcldi2p4SoYX74eDY/LupmDDBvNcGbNNgtONDk
         363iuiZCAjbesKsnc8kHAhTd6QIHTNrt7cRljmXAt0m36AlQqwD3d8ZCnmbRSgzMGi2r
         lpmZ0j7rJCZj5rKpqSs2Zx8zaHeajb0NiAM5rkn48jJbYOvmhq4Z+Jn666g+QmvSwnfH
         FHkQ==
X-Gm-Message-State: APjAAAX+67mP1Cm2FC1LANzePx2pYdTtpPPYxGGFYXtQrbMRvKpV3F4w
        im7a+Vn+U/QhKgS0coIoliO7ZD9nHTEenIjd6zY=
X-Google-Smtp-Source: APXvYqw2rrZymNE7C0Sfak2nEH+hw3LBLB0hXG+7oGr94LfmguTGJYUMGFKQrC/KyXkfpCHTVTUqS9PhGFcdzmFO7FY=
X-Received: by 2002:a81:4320:: with SMTP id q32mr15689502ywa.464.1571644479753;
 Mon, 21 Oct 2019 00:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191021073819.18181-1-candlesea@gmail.com>
In-Reply-To: <20191021073819.18181-1-candlesea@gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Mon, 21 Oct 2019 15:54:28 +0800
Message-ID: <CAPnx3XP2MrEZT+BAzW3-Ve9ekzvPzcj6wvzeC8VRHhCyo59XpQ@mail.gmail.com>
Subject: Re: [PATCH v3] HID: core: check whether usage page item is after
 usage id item
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     =?UTF-8?B?57+f5LqsIChPcnNvbiBaaGFpKQ==?= <orson.zhai@unisoc.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,


On Mon, Oct 21, 2019 at 3:38 PM Candle Sun <candlesea@gmail.com> wrote:
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
> Changes in v3:
> - Rework the GET_COMPLETE_USAGE macro as static complete_usage()
>   function
> - Add some code comments for usage_page_last
>
> Changes in v2:
> - Update patch title
> - Add GET_COMPLETE_USAGE macro
> - Change the logic of checking whether to concatenate usage page again
>   in main parsing
> ---
>  drivers/hid/hid-core.c | 42 +++++++++++++++++++++++++++++++++++++-----
>  include/linux/hid.h    |  1 +
>  2 files changed, 38 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 3eaee2c37931..779b7798dae8 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -211,6 +211,18 @@ static unsigned hid_lookup_collection(struct hid_parser *parser, unsigned type)
>         return 0; /* we know nothing about this usage type */
>  }
>
> +/*
> + * Concatenate usage which defines 16 bits or less with the
> + * currently defined usage page to form a 32 bit usage
> + */
> +
> +static void complete_usage(struct hid_parser *parser, unsigned int index)
> +{
> +       parser->local.usage[index] &= 0xFFFF;
> +       parser->local.usage[index] |=
> +               (parser->global.usage_page & 0xFFFF) << 16;
> +}
> +
>  /*
>   * Add a usage to the temporary parser table.
>   */
> @@ -221,7 +233,18 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
>                 hid_err(parser->device, "usage index exceeded\n");
>                 return -1;
>         }
> -       parser->local.usage[parser->local.usage_index] = usage;
> +
> +       /*
> +        * If Usage item only includes usage id, concatenate it with
> +        * currently defined usage page and clear usage_page_last flag
> +        */
> +       if (size <= 2) {
> +               parser->local.usage_page_last = false;
> +               complete_usage(parser, parser->local.usage_index);
> +       } else {
> +               parser->local.usage[parser->local.usage_index] = usage;
> +       }
> +
>         parser->local.usage_size[parser->local.usage_index] = size;
>         parser->local.collection_index[parser->local.usage_index] =
>                 parser->collection_stack_ptr ?
> @@ -366,6 +389,8 @@ static int hid_parser_global(struct hid_parser *parser, struct hid_item *item)
>
>         case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
>                 parser->global.usage_page = item_udata(item);
> +               /* Regard Usage Page is after Usage ID items */
> +               parser->local.usage_page_last = true;
>                 return 0;
>
>         case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> @@ -543,13 +568,20 @@ static int hid_parser_local(struct hid_parser *parser, struct hid_item *item)
>   * usage value."
>   */
>
> -static void hid_concatenate_usage_page(struct hid_parser *parser)
> +static void hid_concatenate_last_usage_page(struct hid_parser *parser)
>  {
>         int i;
>
> +       /*
> +        * Concatenate usage page again only on detecting some Usage Page
> +        * is really after Usage ID items
> +        */
> +       if (!parser->local.usage_page_last)
> +               return;
> +
>         for (i = 0; i < parser->local.usage_index; i++)
>                 if (parser->local.usage_size[i] <= 2)
> -                       parser->local.usage[i] += parser->global.usage_page << 16;
> +                       complete_usage(parser, i);
>  }
>
>  /*
> @@ -561,7 +593,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
>         __u32 data;
>         int ret;
>
> -       hid_concatenate_usage_page(parser);
> +       hid_concatenate_last_usage_page(parser);
>
>         data = item_udata(item);
>
> @@ -772,7 +804,7 @@ static int hid_scan_main(struct hid_parser *parser, struct hid_item *item)
>         __u32 data;
>         int i;
>
> -       hid_concatenate_usage_page(parser);
> +       hid_concatenate_last_usage_page(parser);
>
>         data = item_udata(item);
>
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index cd41f209043f..2e0ea2f7ec5c 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -412,6 +412,7 @@ struct hid_local {
>         unsigned usage_minimum;
>         unsigned delimiter_depth;
>         unsigned delimiter_branch;
> +       bool usage_page_last;      /* whether usage page is after usage id */
>  };
>

Hi Benjamin,
Here I still use the usage_page_last flag, not using following method
you provided in v2:

if ((parser->local.usage[parser->local.usage_index - 1] &
HID_USAGE_PAGE) >> 16 == usage_page)
              return 0;

Because last usage maybe one Extended Usage, some logic for checking
it should be added.
It will make the code obscure. Using one more member in struct
hid_local is straightforward
and maybe better.

Candle

>  /*
> --
> 2.17.1
>
