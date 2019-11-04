Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 766FCEEB11
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 22:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfKDV2U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 16:28:20 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:34692 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfKDV2U (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 16:28:20 -0500
Received: by mail-il1-f193.google.com with SMTP id p6so3525217ilp.1;
        Mon, 04 Nov 2019 13:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TxeQ1vsFAcSyarb6ISmxJP52S96I9PR9sQsErWuntHg=;
        b=V6Cth1nIhMWWjExi9FXYNM21C/LEg6mfc1oHE6pdfBmr7lEg8cJWKSh/S8qVIx166B
         251YnbGMm8OUcZlA0sKJPzWmryqetFcJ8QNk8si/Kofuv/lQO/B8EVotknngrSVCxq+q
         ZLOsA4Mlyv45uMC/B3BPVqr1TwRIE9uNYA6TZiU8GZdSrGXk5X6WcC15XakDbQo2xTMc
         tKzQUNRGDeOm4kYzmFQQnrqVwd9vipegkkcqtuC5wQ2Ou5TxnI4DFMu8hiWUWnGamhgE
         tPYAibBxyY7kNvha2nbrYd3KTAjmXOCUc6Ltt9i5WUOYzd47aggfuZ+uw6jxaqbhC6IO
         bErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TxeQ1vsFAcSyarb6ISmxJP52S96I9PR9sQsErWuntHg=;
        b=mKPEqh6QGhsxUS3z+tOMBSTBG0hkMF7ZRjTda9NbFB3HwQyl2dcR9uvQslBBg16aap
         aQfWJGFz7zYOqsFz6UVIWaluo0KKZ7HWyQh5+87M0P9xdaQPzhIazkK4DJHjauo8xOso
         a9Xl6nRVtekYP521bBTbHEdmCyJaZAilgOrdlyP30JLYt1yaTwbK9TUH/z2bZ5fTUdoT
         b1yKuAr2w7Ca47HeASOkuz+m1gEdTusjTmhu50Pnt/CdGkLTb8sShas9T8fVwJBfeJP7
         ybgKF36mpUCGAziCiH58lDdFjPkUKSZv0zx0OjSv85qSxB6R4YPvDGpRsJ4xjD2WNFbC
         vqFw==
X-Gm-Message-State: APjAAAUqrcpINMF2QwCab3SA+/nHCXSJrRJKLl7lXR50+PTUP8xNKShg
        65GZo/SaLNawkvVcfGt27WbI9qMQMxyKskpD9+U=
X-Google-Smtp-Source: APXvYqx0LBa9HKGA3I4v9sMP2fQBtUFY3Ly8WahWqexcVeZoeeh3ZZKjoJ47fRqaBJAV6z899mRH7vRcUBQ6JTrdT24=
X-Received: by 2002:a05:6e02:c2c:: with SMTP id q12mr31257556ilg.205.1572902898606;
 Mon, 04 Nov 2019 13:28:18 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
In-Reply-To: <20191104183702.8894-1-TheSven73@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 4 Nov 2019 15:28:07 -0600
Message-ID: <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 12:37 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> Ok, so here are my test results on an ili211x :
>
> Using Marek's patch:
> https://patchwork.kernel.org/patch/10836651/#22811657
> It works fine.

I am using IRQ_TYPE_EDGE_RISING for the 2117A.  Is that correct?  For
my touchscreen, the IRQ line is low until a touch is detected, so I
assume we want to capure on the rising edge.

I noticed the example uses IRQ_TYPE_EDGE_FALLING.  If rising is
correct, we should probably update the binding to show an example for
the 2117.

>
> Using Dmitry's patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=ili2xxx-touchscreen
> Does not work at all - the driver even enters an infinite loop.
>

Regarding Dmitry's patch,
Is it a good idea to use msleep in an IRQ?  It seems like using the
schedule_delayed_work() call seems like it will get in and get out of
the ISR faster.

If we use msleep and scan again, isn't it possible to starve other processes?



> I tracked this down to two separate issues:
> 1. the ili211x does not have a touchdata register; but the driver tries to
>         read from one.
> 2. the ili211x should never poll - otherwise it will read all zeros, which
>         passes the crc check (!), then results in ten finger touches all
>         at (x=0, y=0).
>
> The patch at the end of this e-mail addresses these two issues. When it is
> applied, the ili211x works fine.
>
> Of course, this does not address the issue Marek saw with Dmitry's patch
>         on the ili251x.
>

Sven's patches appear to work for me when manually applied on top of
Dmity' and Marek's patches.


> Sven
>
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 7a9c46b8a079..f51a3a19075f 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -36,7 +36,7 @@ struct ili2xxx_chip {
>         int (*get_touch_data)(struct i2c_client *client, u8 *data);
>         bool (*parse_touch_data)(const u8 *data, unsigned int finger,
>                                  unsigned int *x, unsigned int *y);
> -       bool (*continue_polling)(const u8 *data);
> +       bool (*continue_polling)(const u8 *data, bool has_touch);
>         unsigned int max_touches;
>  };
>
> @@ -96,7 +96,7 @@ static bool ili210x_touchdata_to_coords(const u8 *touchdata,
>         return true;
>  }
>
> -static bool ili210x_check_continue_polling(const u8 *data)
> +static bool ili210x_check_continue_polling(const u8 *data, bool has_touch)
>  {
>         return data[0] & 0xf3;
>  }
> @@ -111,14 +111,19 @@ static const struct ili2xxx_chip ili210x_chip = {
>
>  static int ili211x_read_touch_data(struct i2c_client *client, u8 *data)
>  {
> +       struct i2c_msg msg = {
> +               .addr   = client->addr,
> +               .flags  = I2C_M_RD,
> +               .len    = ILI211X_DATA_SIZE,
> +               .buf    = data,
> +       };
>         s16 sum = 0;
>         int i;
> -       int error;
>
> -       error = ili210x_read_reg(client, REG_TOUCHDATA,
> -                                data, ILI211X_DATA_SIZE);
> -       if (error)
> -               return error;
> +       if (i2c_transfer(client->adapter, &msg, 1) != 1) {
> +               dev_err(&client->dev, "i2c transfer failed\n");
> +               return -EIO;
> +       }
>
>         /* This chip uses custom checksum at the end of data */
>         for (i = 0; i <= ILI211X_DATA_SIZE - 2; i++)
> @@ -152,7 +157,7 @@ static bool ili211x_touchdata_to_coords(const u8 *touchdata,
>         return true;
>  }
>
> -static bool ili2xxx_decline_polling(const u8 *data)
> +static bool ili2xxx_decline_polling(const u8 *data, bool has_touch)
>  {
>         return false;
>  }
> @@ -216,11 +221,16 @@ static bool ili251x_touchdata_to_coords(const u8 *touchdata,
>         return true;
>  }
>
> +static bool ili251x_check_continue_polling(const u8 *data, bool has_touch)
> +{
> +       return has_touch;
> +}
> +
>  static const struct ili2xxx_chip ili251x_chip = {
>         .read_reg               = ili251x_read_reg,
>         .get_touch_data         = ili251x_read_touch_data,
>         .parse_touch_data       = ili251x_touchdata_to_coords,
> -       .continue_polling       = ili2xxx_decline_polling,
> +       .continue_polling       = ili251x_check_continue_polling,
>         .max_touches            = 10,
>  };
>
> @@ -268,7 +278,7 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>                 }
>
>                 touch = ili210x_report_events(priv, touchdata);
> -               keep_polling = touch || chip->continue_polling(touchdata);
> +               keep_polling = chip->continue_polling(touchdata, touch);
>                 if (keep_polling)

Why not just check the value of touch instead of invoking the function
pointer which takes the value of touch in as a parameter?

>                         msleep(ILI2XXX_POLL_PERIOD);
>         } while (!priv->stop && keep_polling);
> --
> 2.17.1

adam
