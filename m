Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403E342C0F0
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 15:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbhJMNHe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 09:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234611AbhJMNH2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 09:07:28 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CCCC061766;
        Wed, 13 Oct 2021 06:05:24 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id 188so2049233iou.12;
        Wed, 13 Oct 2021 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OdDP23xTIm+L6AbgxUQAfMNtcdnt3NDc3uwJWZ3/brU=;
        b=cWKeh76le0fsu0suTyiUTkglKAesPU8k4qutXM3URlYslBBH13tmuFsnH+g4GBaL4W
         wF2sN3+LP0VCgnKDbMtVvC1W9oDEz81lD0BdDKvI7iT7i3EcPnPLkeYjaPjQX04AzgKk
         gTzduFMR5Yt+2xsp/uyXjUsBZHG+1UUjANunL/9epo5iFqPKCM09x/nByUTYyrN25sCP
         FcOTCOcoKDL8sXt/CMnpixe1Tynuj7UdSRvpmzvftkJ8X+ukEQ4/F8/3ngY1Su17Qoah
         4ssodbwf9cZTk68BW92fPJBxLZLO5bZGqoXWwSJEW02O5TM96c03vOJfCkORSoHt4lQK
         6utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OdDP23xTIm+L6AbgxUQAfMNtcdnt3NDc3uwJWZ3/brU=;
        b=I0S+oEh/WQW+4MRI4okwKgru4vtXF73ovV7zv8f8R0OxwyuZBbwGEZr5RbyBVl2eAk
         SV9EbwuIyeuHiZFyjVALqEB8TZw6ccDr3KQnghN0A0w4fq3R0akFF5vOWIejZGL8zXT1
         jwJtPxwHLUkHuGX+/JpJZEW/7olZtUB1t7ppezzgZk/4NlFMD6uIB56w7HXdPAK9tmDH
         uC8Khx/ntSUV9yIQQr4D/NtaGOYA4x2hzNwRIT9RARHrlAFmQfytDdM7kwadxIO6rpaT
         /HX9ZTnd8m9U03rgjbkjzx2hkXw30UZqq+C/UdclxSO1fd+tLuSWWiyxKO4zU5avUwAW
         sxZQ==
X-Gm-Message-State: AOAM531/EJqtiHlMI8vgM7rbmjHpUM345T3xDis4pzafw9F5Pv8riQ73
        Y/+KQghmQ+NPIAPTzWggeYfpCbOlqCRoEbj4Ryo=
X-Google-Smtp-Source: ABdhPJys07u3tQk0DlgmcycPhDS0B5sydtpFJz8LFYIwptJZQNGyH2ty65H+xX3LsytPKF8v8yjY/uq4YJixre3JZPA=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr28020221ioq.57.1634130323207;
 Wed, 13 Oct 2021 06:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211009113707.17568-1-alistair@alistair23.me>
 <20211009113707.17568-2-alistair@alistair23.me> <YWZYy8OsqJx1J8VA@google.com>
In-Reply-To: <YWZYy8OsqJx1J8VA@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 13 Oct 2021 23:04:57 +1000
Message-ID: <CAKmqyKM=wHN=NhfSBFT243oTkozcpFrqt1xM8xRP6Yf4ONGG1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: wacom_i2c - Use macros for the bit masks
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 13, 2021 at 1:56 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Alistair,
>
> On Sat, Oct 09, 2021 at 09:37:07PM +1000, Alistair Francis wrote:
> > To make the code easier to read use macros for the bit masks.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  drivers/input/touchscreen/wacom_i2c.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> > index 8d7267ccc661..6865342db659 100644
> > --- a/drivers/input/touchscreen/wacom_i2c.c
> > +++ b/drivers/input/touchscreen/wacom_i2c.c
> > @@ -14,6 +14,12 @@
> >  #include <linux/interrupt.h>
> >  #include <asm/unaligned.h>
> >
> > +// Bitmasks (for data[3])
> > +#define WACOM_TIP_SWITCH_bm         (1 << 0)
> > +#define WACOM_BARREL_SWITCH_bm      (1 << 1)
> > +#define WACOM_ERASER_bm             (1 << 2)
> > +#define WACOM_BARREL_SWITCH_2_bm    (1 << 4)
>
> We have BIT() for that.
>
> By the way, do you know what is the good name for bit 3? I see it is
> being used in:

I have this for bit 3:

#define WACOM_INVERT_bm             (1 << 3)


>
>         if (!wac_i2c->prox)
>                 wac_i2c->tool = (data[3] & 0x0c) ?
>                         BTN_TOOL_RUBBER : BTN_TOOL_PEN;
>
>         wac_i2c->prox = data[3] & WACOM_IN_PROXIMITY;
>
> 0x0c is (WACOM_ERASER | <something else>).
>
> Also, I am a bit confused by this code, now that I look at it closer.
> Are we saying that the tool type (eraser or something else) is set only
> in first packet for contact/touch?

I'm not sure, you would have to check with the wacom people.

>
> > +
> >  // Registers
> >  #define WACOM_COMMAND_LSB   0x04
> >  #define WACOM_COMMAND_MSB   0x00
> > @@ -110,10 +116,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
> >       if (error < 0)
> >               goto out;
> >
> > -     tsw = data[3] & 0x01;
> > -     ers = data[3] & 0x04;
> > -     f1 = data[3] & 0x02;
> > -     f2 = data[3] & 0x10;
> > +     tsw = data[3] & WACOM_TIP_SWITCH_bm;
> > +     ers = data[3] & WACOM_ERASER_bm;
> > +     f1 = data[3] & WACOM_BARREL_SWITCH_bm;
> > +     f2 = data[3] & WACOM_BARREL_SWITCH_2_bm;
> >       x = le16_to_cpup((__le16 *)&data[4]);
> >       y = le16_to_cpup((__le16 *)&data[6]);
> >       pressure = le16_to_cpup((__le16 *)&data[8]);
> > --
> > 2.31.1
> >
>
> How about the version of the patch below?

Looks good to me!

Alistair

>
> --
> Dmitry
>
> Input: wacom_i2c - use macros for the bit masks
>
> From: Alistair Francis <alistair@alistair23.me>
>
> To make the code easier to read use macros for the bit masks.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Link: https://lore.kernel.org/r/20211009113707.17568-2-alistair@alistair23.me
> Patchwork-Id: 12547519
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/wacom_i2c.c |   19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 22826c387da5..d3ea9aa8a98c 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -6,6 +6,7 @@
>   * <tobita.tatsunosuke@wacom.co.jp>
>   */
>
> +#include <linux/bits.h>
>  #include <linux/module.h>
>  #include <linux/input.h>
>  #include <linux/i2c.h>
> @@ -14,6 +15,14 @@
>  #include <linux/interrupt.h>
>  #include <asm/unaligned.h>
>
> +// Bitmasks (for data[3])
> +#define WACOM_TIP_SWITCH       BIT(0)
> +#define WACOM_BARREL_SWITCH    BIT(1)
> +#define WACOM_ERASER           BIT(2)
> +#define WACOM_BARREL_SWITCH_2  BIT(4)
> +#define WACOM_IN_PROXIMITY     BIT(5)
> +
> +// Registers
>  #define WACOM_CMD_QUERY0       0x04
>  #define WACOM_CMD_QUERY1       0x00
>  #define WACOM_CMD_QUERY2       0x33
> @@ -99,10 +108,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>         if (error < 0)
>                 goto out;
>
> -       tsw = data[3] & 0x01;
> -       ers = data[3] & 0x04;
> -       f1 = data[3] & 0x02;
> -       f2 = data[3] & 0x10;
> +       tsw = data[3] & WACOM_TIP_SWITCH;
> +       ers = data[3] & WACOM_ERASER;
> +       f1 = data[3] & WACOM_BARREL_SWITCH;
> +       f2 = data[3] & WACOM_BARREL_SWITCH_2;
>         x = le16_to_cpup((__le16 *)&data[4]);
>         y = le16_to_cpup((__le16 *)&data[6]);
>         pressure = le16_to_cpup((__le16 *)&data[8]);
> @@ -111,7 +120,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>                 wac_i2c->tool = (data[3] & 0x0c) ?
>                         BTN_TOOL_RUBBER : BTN_TOOL_PEN;
>
> -       wac_i2c->prox = data[3] & 0x20;
> +       wac_i2c->prox = data[3] & WACOM_IN_PROXIMITY;
>
>         input_report_key(input, BTN_TOUCH, tsw || ers);
>         input_report_key(input, wac_i2c->tool, wac_i2c->prox);
