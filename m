Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F5E33D11A
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 10:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhCPJq7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Mar 2021 05:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235047AbhCPJqg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Mar 2021 05:46:36 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6175C06174A
        for <linux-input@vger.kernel.org>; Tue, 16 Mar 2021 02:46:35 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id t37so11426425pga.11
        for <linux-input@vger.kernel.org>; Tue, 16 Mar 2021 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vk0DU0jMkCG5eo+Lap30wAKD6nL57p9yYhVsjMBlkb8=;
        b=o+BA74k4t/BM17jl56QWIFXQEqvhkSx8gc356s1rrdmvqDs3Es7RnJjvIzsgRpwB0l
         XaYpR8LNAzyzdEF/p9IcL923+4bVBOO+HmwX9J+ck7Pq4KmA3SU6mXGqLoydP2ao5vB/
         Iubv6Bal7VZAoCBzUAwOPo4ZwN9FpdKyFHA70gcboOjRsOPfeCntAe8rEm33nYPwWhCY
         0qlIkOWFcKO3u+eqwB6/z4LPGSKa79+8/rajqS7AIs8jqbzbFn7cMcFoveXZTcOgrA5w
         7wYNg67CfbyE978QZ3JfF/OEnzh0modQUAwszvZw7HAwCPmoV/beal01eB2OPQaU9Dx4
         Kpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vk0DU0jMkCG5eo+Lap30wAKD6nL57p9yYhVsjMBlkb8=;
        b=ivjqTdlutsekf3vDgIV5uEQJ8CeBeZGbdPAacQ3qiUrQKNwqyQWSJ1tPxSmv8aTZbB
         CGIFngRSmmUwE0jPZXcJWwsd226MuMpwukxTIp2c0+Y8B0wxlkejPJ2bVav9cvIuHuMe
         5/id3Nt7m9ECCxInYs7Ipags/aaR3N+NKfFTZz1nc6sxBXubL6hs04+CuNf8VD0C7r6W
         c+m/g0O/kWZamcptZx13VIPtFNJv5VW9/HPcrVj7n7m1QZdCwdwUuwUbSjTT9oz6Tj1w
         syHCgOpHj/ffKuomGYV7MUYn9OnPfD4tqMZxRs/9ldsCVkXZgMZ7De23CMxoZGAD/6Bf
         LNnA==
X-Gm-Message-State: AOAM530tdwW4OIu6DMfHP6n60u7zoxfvPi7kFUKexDXZOohfbUGIT0TR
        rdMRhv133ccpGDaLaRjBGLh925yJ4fxcO67OEPtweo8bFHDASqUS
X-Google-Smtp-Source: ABdhPJw/p8yKN01fLpAvUhxELIsXeFeYj3p/GcvB0D7xKNBAMW27rg6DNjjSEQ8UHax0bYB8mKEN+ni2ry3eAno91N8=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr28968813pfc.40.1615887995218; Tue, 16
 Mar 2021 02:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210314210951.645783-1-andy.shevchenko@gmail.com> <YE/3lDI5UGK51twS@google.com>
In-Reply-To: <YE/3lDI5UGK51twS@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Mar 2021 11:46:18 +0200
Message-ID: <CAHp75Vfh5Vy8j+9O4yT4p5mw0bwd=ZFYfqsUxaii23W4G92k_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Input: tsc2007 - convert to GPIO descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 16, 2021 at 2:11 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Andy,
>
> On Sun, Mar 14, 2021 at 11:09:50PM +0200, Andy Shevchenko wrote:
> > This converts the driver to use GPIO descriptors.
> >
> > Note that it now uses logical polarity and thus nagation has been dropped.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > ---
> > v3: left ->get_pendown_state() assignment conditionally (Dmitry)
> >  drivers/input/touchscreen/tsc2007.h      |  4 +++-
> >  drivers/input/touchscreen/tsc2007_core.c | 12 ++++++++----
> >  2 files changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
> > index 91c60bf6dcaf..69b08dd6c8df 100644
> > --- a/drivers/input/touchscreen/tsc2007.h
> > +++ b/drivers/input/touchscreen/tsc2007.h
> > @@ -19,6 +19,8 @@
> >  #ifndef _TSC2007_H
> >  #define _TSC2007_H
> >
> > +struct gpio_desc;
> > +
> >  #define TSC2007_MEASURE_TEMP0                (0x0 << 4)
> >  #define TSC2007_MEASURE_AUX          (0x2 << 4)
> >  #define TSC2007_MEASURE_TEMP1                (0x4 << 4)
> > @@ -69,7 +71,7 @@ struct tsc2007 {
> >       int                     fuzzy;
> >       int                     fuzzz;
> >
> > -     unsigned int            gpio;
> > +     struct gpio_desc        *gpiod;
> >       int                     irq;
> >
> >       wait_queue_head_t       wait;
> > diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
> > index 3b80abfc1eca..e4ab5962ddd4 100644
> > --- a/drivers/input/touchscreen/tsc2007_core.c
> > +++ b/drivers/input/touchscreen/tsc2007_core.c
> > @@ -19,11 +19,11 @@
> >
> >  #include <linux/module.h>
> >  #include <linux/slab.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/input.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/i2c.h>
> >  #include <linux/of_device.h>
> > -#include <linux/of_gpio.h>
> >  #include <linux/platform_data/tsc2007.h>
> >  #include "tsc2007.h"
> >
> > @@ -226,11 +226,12 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
> >       struct i2c_client *client = to_i2c_client(dev);
> >       struct tsc2007 *ts = i2c_get_clientdata(client);
> >
> > -     return !gpio_get_value(ts->gpio);
> > +     return gpiod_get_value(ts->gpiod);
> >  }
> >
> >  static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
> >  {
> > +     struct device *dev = &client->dev;
> >       struct device_node *np = client->dev.of_node;
> >       u32 val32;
> >       u64 val64;
> > @@ -266,8 +267,11 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
> >               return -EINVAL;
> >       }
> >
> > -     ts->gpio = of_get_gpio(np, 0);
> > -     if (gpio_is_valid(ts->gpio))
> > +     ts->gpiod = devm_gpiod_get_optional(dev, NULL, GPIOD_IN);
> > +     if (IS_ERR(ts->gpiod))
> > +             return PTR_ERR(ts->gpiod);
> > +
> > +     if (ts->gpiod)
> >               ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
> >       else
> >               dev_warn(&client->dev,
>
> This does not really compile as the warning still refers to the legacy
> gpio number.

Oops, sorry, I was under the impression that I have compiled it, but I
realized that I have checked only ld-version.sh bugfix (I have
non-English locale and builds of v5.12-rcX were failing, out of
curiosity it's tracked here:
https://bugzilla.kernel.org/show_bug.cgi?id=212105).

> I fixed it up locally and applied, thank you.

Thanks!


-- 
With Best Regards,
Andy Shevchenko
