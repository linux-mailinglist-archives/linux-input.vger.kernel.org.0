Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C4B755F07
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 11:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjGQJNb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 17 Jul 2023 05:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjGQJNa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 05:13:30 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9461A10DC;
        Mon, 17 Jul 2023 02:13:29 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a44cccbd96so892964b6e.3;
        Mon, 17 Jul 2023 02:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689585209; x=1692177209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdrN/ZJ0pC+C/CLOxTgcuvVVnl/hzHk0xaoKGe34MfY=;
        b=YmuuiZnNyeE4iEm7VIi+wmwVW0dOUhJDD2kH8hWDx+E7IELUd+L4a/GvbVzjZYN4dI
         e1c+E1i7K1OJLJcM+aSau1FoLnyfpJupOLjqQ9Y5cILbz9OFtHL3F/u2Mt9TNb+kTelV
         QfgUzx1REK3/uf4xNWgvPjt2bUZhJZSZNxQ5IGo8MVjGdTz6MVxg/TpOftIa+WNIbdV6
         HyacrkevFAE73gVCw3jKQ0H3P+xRZpLuAHtSKiiDp48yfLBKqt8o+HCCixqpWM+0h+MS
         2xev/qWSeKYzIEFfbpvKqGpyz7puTFqwbmXVo+Oa8EooxOhE/6WpHu45+KEL4kAFCLzI
         Kq/A==
X-Gm-Message-State: ABy/qLaE7wf5yriI7FssHqWl2E7Q6EiYxrf5u9+khM9vDoblw7NYMSCW
        m45dhqfNLCMB9wtAzSLoMaWDPIECk7Y/GQ==
X-Google-Smtp-Source: APBJJlGBqS8Km2Ka0fM4r9XIHn21dUt6mvAhBVwoRsTu2i4maxm4gX93iemdMmGz5NRwb2qUqKYSOg==
X-Received: by 2002:a05:6358:9211:b0:134:c584:5585 with SMTP id d17-20020a056358921100b00134c5845585mr6286134rwb.3.1689585208571;
        Mon, 17 Jul 2023 02:13:28 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id r186-20020a8181c3000000b00577357201e2sm3753414ywf.14.2023.07.17.02.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 02:13:28 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-c15a5ed884dso4342065276.2;
        Mon, 17 Jul 2023 02:13:28 -0700 (PDT)
X-Received: by 2002:a25:8290:0:b0:c16:ba32:1b1c with SMTP id
 r16-20020a258290000000b00c16ba321b1cmr10758324ybk.58.1689585208148; Mon, 17
 Jul 2023 02:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230716182455.216335-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230716182455.216335-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jul 2023 11:13:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSxVxuiwtbHR8OP35Hjsq34=FPfjBccVVoYQUzO6FK9Q@mail.gmail.com>
Message-ID: <CAMuHMdUSxVxuiwtbHR8OP35Hjsq34=FPfjBccVVoYQUzO6FK9Q@mail.gmail.com>
Subject: Re: [PATCH] Input: exc3000 - Simplify probe()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        linux-input@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Biju,

On Sun, Jul 16, 2023 at 8:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The exc3000_id.driver_data could store a pointer to the info,
> like for ACPI/DT-based matching, making I2C, ACPI and DT-based
> matching more similar.
>
> After that, we can simplify the probe() by replacing of_device_get_
> match_data() and i2c_match_id() by i2c_get_match_data() as we have
> similar I2C, ACPI and DT-based matching table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

A suggestion for improvement (which can be a separate patch, as it would
touch exc3000_of_match[]) below.

> ---
>  drivers/input/touchscreen/exc3000.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index 4c0d99aae9e0..8b65b4e2aa50 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -445,9 +441,9 @@ static int exc3000_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id exc3000_id[] = {
> -       { "exc3000", EETI_EXC3000 },
> -       { "exc80h60", EETI_EXC80H60 },
> -       { "exc80h84", EETI_EXC80H84 },
> +       { "exc3000", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC3000] },
> +       { "exc80h60", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H60] },
> +       { "exc80h84", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H84] },

As after this the eeti_dev_id values are used only for hardcoded
indexing inside the exc3000_info array, you can get rid of them by
splitting the array in individual variables, shortening the lines above
(and in exc3000_of_match[] below) in the process.

>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, exc3000_id);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
