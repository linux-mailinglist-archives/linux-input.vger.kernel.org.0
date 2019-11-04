Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA9EED9F3
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 08:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfKDHgy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 02:36:54 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:39678 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfKDHgy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 02:36:54 -0500
Received: by mail-yw1-f66.google.com with SMTP id k127so6620606ywc.6;
        Sun, 03 Nov 2019 23:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DfV1jo+LHhzV2sC51YMfKLStsqNhaAi/Vjjj7jKfxIs=;
        b=E03g0Hxm3gCrZXwIs3mMjFzYb9zlVjqa59ImnTktx9CYh6arM0Tse//dKfZejUPDAC
         lgA4GaKYU4lI/r8kh/NYnoYLX3WIpdkSFvMHhIEIBspeiisGD0CkWWFPJapR7c4g/xE5
         vqYzLbapNPNSL+QVKgKpmWd9suMwFr9mxhipg2UUlnmqtqabZjJ40uBEGAiR0Lncu9iJ
         PFUUy3uTHy+GlmzLwbL3Qk8l86LpuHI4tlL2OVhyrgR+NcKTrm3PBLczl0GW63cq1Nby
         ax+VuYkhRa6lrrCtfrvpfBgqXCp60wBsYWMaxaASTq/6GV7V/5Ctc8tWIjVgLLaYC5MW
         hjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DfV1jo+LHhzV2sC51YMfKLStsqNhaAi/Vjjj7jKfxIs=;
        b=dM1Y/3JQV+kGPDf/VUdKE0GvkPlQ7uuNT1Bk0cClRMB1ncN0WhOHZtHNGrZf+1e9T4
         m5bQWwG5myTNtmhkoXFAv8gvJ479GY3Wh5vkxJ7ZqLX4cXTeqkv7SkwBB0Eo3tz9heps
         CNyCK31QigbxgTyyatAvJZKGfdO4Z9Xc5WtlsTBWkqPegRoMZqxX+dHtsD5cKoH9jrDH
         JdUo61bRrzjvClHj98sp14vGSj27m9m3bd7TmEfvD2JAEZIANROPnKx/DnZ/4Y0gqxsF
         6DtAokIkn3OCC8bjPZCjk7P6Kamm61xiEEjWYZIXJ0fM/jVeqe/pMiUT1dYfe/3YzTHp
         /6gg==
X-Gm-Message-State: APjAAAVJi5GZkkmHecmUVGedwiiI8jEX07F9IxVkOoYEC9whhNLZehdo
        Er3cf/aH5pu/fj8vhY1m6E2zLDtAlNyXh9af1Tk=
X-Google-Smtp-Source: APXvYqz+qLLcm5hJL0MOvvtGvKKbU88AT6QRLwwCrv3QRAD0PkJIiVlRrcOuhk6AxrFJKESPG2IwQIlkopNQyE02sas=
X-Received: by 2002:a81:6045:: with SMTP id u66mr18839281ywb.237.1572853013127;
 Sun, 03 Nov 2019 23:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20191022142139.16789-1-candlesea@gmail.com>
In-Reply-To: <20191022142139.16789-1-candlesea@gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Mon, 4 Nov 2019 15:36:41 +0800
Message-ID: <CAPnx3XPpB8imJ5dm40AV4XbSgnRsH=WG=LPUBqyuAzsF=+B58w@mail.gmail.com>
Subject: Re: [PATCH v4] HID: core: check whether Usage Page item is after
 Usage ID items
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

Jiri & Benjamin,
Do you have some futher advice on this patch?
Can the patch be merged?

Regards,
Candle

On Tue, Oct 22, 2019 at 10:22 PM Candle Sun <candlesea@gmail.com> wrote:
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
> This patch checks whether Usage Page is really defined after Usage ID
> items by comparing usage page using status.
>
> Usage Page concatenation on currently defined Usage Page will always
> do in local parsing when Usage ID items encountered.
>
> When Main item is parsing, concatenation will do again with last
> defined Usage Page if this page has not been used in the previous
> usages concatenation.
>
> Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> ---
> Changes in v4:
> - Fix v3 introduced BUG in hid_add_usage()
> - Add checking logic to replace usage_page_last member
> - Update patch description
>
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
>  drivers/hid/hid-core.c | 51 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 3eaee2c37931..c18ed7180b07 100644
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
> @@ -222,6 +234,14 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
>                 return -1;
>         }
>         parser->local.usage[parser->local.usage_index] = usage;
> +
> +       /*
> +        * If Usage item only includes usage id, concatenate it with
> +        * currently defined usage page
> +        */
> +       if (size <= 2)
> +               complete_usage(parser, parser->local.usage_index);
> +
>         parser->local.usage_size[parser->local.usage_index] = size;
>         parser->local.collection_index[parser->local.usage_index] =
>                 parser->collection_stack_ptr ?
> @@ -543,13 +563,32 @@ static int hid_parser_local(struct hid_parser *parser, struct hid_item *item)
>   * usage value."
>   */
>
> -static void hid_concatenate_usage_page(struct hid_parser *parser)
> +static void hid_concatenate_last_usage_page(struct hid_parser *parser)
>  {
>         int i;
> +       unsigned int usage_page;
> +       unsigned int current_page;
>
> -       for (i = 0; i < parser->local.usage_index; i++)
> -               if (parser->local.usage_size[i] <= 2)
> -                       parser->local.usage[i] += parser->global.usage_page << 16;
> +       if (!parser->local.usage_index)
> +               return;
> +
> +       usage_page = parser->global.usage_page;
> +
> +       /*
> +        * Concatenate usage page again only if last declared Usage Page
> +        * has not been already used in previous usages concatenation
> +        */
> +       for (i = parser->local.usage_index - 1; i >= 0; i--) {
> +               if (parser->local.usage_size[i] > 2)
> +                       /* Ignore extended usages */
> +                       continue;
> +
> +               current_page = parser->local.usage[i] >> 16;
> +               if (current_page == usage_page)
> +                       break;
> +
> +               complete_usage(parser, i);
> +       }
>  }
>
>  /*
> @@ -561,7 +600,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
>         __u32 data;
>         int ret;
>
> -       hid_concatenate_usage_page(parser);
> +       hid_concatenate_last_usage_page(parser);
>
>         data = item_udata(item);
>
> @@ -772,7 +811,7 @@ static int hid_scan_main(struct hid_parser *parser, struct hid_item *item)
>         __u32 data;
>         int i;
>
> -       hid_concatenate_usage_page(parser);
> +       hid_concatenate_last_usage_page(parser);
>
>         data = item_udata(item);
>
> --
> 2.17.1
>
