Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80747254197
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgH0JLm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgH0JLl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:11:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A18C061264;
        Thu, 27 Aug 2020 02:11:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m8so3018327pfh.3;
        Thu, 27 Aug 2020 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BuiVfTq3IfThnZibxEf8JBC6q+Vpo5jgMTkU2+Pr85M=;
        b=V9BJVT07xp6Gmu5+mqHb4O/RM/gxTW3BydgKJ+r2tZYTZrCOB0i2nzjinT7vl5aEZb
         1J8JYqVZP3HmennvqbJjWTCjl0CS/mgumazEUVF3BLkjnDf1rr0dBsWhlFCVIidJepzv
         q6Zfwk+bSPWPSCOdir5N9Lo4q1mHCmJ/R6dCJ0ty/WERf2d5d+tkWex4Nke4yT6wqJ2f
         jLTx5rPmTMghqGuftL7YIdS7xR2qUFOdYBcbRgJ4Y7uMU3CAtQNEuIJH1/CJ5sPYkj/8
         4QBoeHHFViryu75eEh3g0+jN/cvRIXgr5rGM7SFCCTm4YZj6YnxQ8gNHOqGx1FHJm9yu
         77Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BuiVfTq3IfThnZibxEf8JBC6q+Vpo5jgMTkU2+Pr85M=;
        b=oX/bA0NTOpmP44ru9zA4Z1hHGM4inWvWYPeyd8InsNFSjYMrBSB2DjXF8eH1Eb9RoD
         jJA7NeE9idY55tKFjPDFSlAcCqAjG7LvgiGKYRjiUudUZ2UUd4si+JVIr3aBAgluxopE
         vLYq7SSoFca55ZnxnT4BYGSAS+xxyTvKO4Np+z7si9uxuzQO28LIcC2BXwL9omjoKxz5
         Ucbjttae+O/+y++HpLU2R9PQcAkhkCMtr0jomHP5GAE8TPzY7cJlmE4ug6Av52UOn6XI
         YYaGS/LxquZiqtp6c7+jVAORLgbx7DnDJdofnDoPjVlRT2I4+iG3SoF+wd4Y9wkPF1LD
         Cd9w==
X-Gm-Message-State: AOAM530lYqaewMlNKFhVz7x3C01M8KughlpBWHKdq+th2290taRXv5JB
        y3oL3djCQqblWg6QEAi5KHU8m0BJT/38+lUwQq0=
X-Google-Smtp-Source: ABdhPJy/+Aijofaf3nU+44vgNBy+yMm6FeOnIycBKjl82KQ2ebb/ReECHqjpQxWYcyvyiqoTHO+ukGGM8JUShdwYdNw=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr13747502pgk.4.1598519500755;
 Thu, 27 Aug 2020 02:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-11-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-11-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:11:24 +0300
Message-ID: <CAHp75VdUf84UwreCeZzUwgv88-rtNH88WTGTsK3ixV-1Fnckvg@mail.gmail.com>
Subject: Re: [PATCH 11/24] Input: chipone_icn8318 - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 9:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/chipone_icn8318.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
> index d91d2fd78649..5bee007184c4 100644
> --- a/drivers/input/touchscreen/chipone_icn8318.c
> +++ b/drivers/input/touchscreen/chipone_icn8318.c
> @@ -194,12 +194,8 @@ static int icn8318_probe(struct i2c_client *client,
>                 return -ENOMEM;
>
>         data->wake_gpio = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
> -       if (IS_ERR(data->wake_gpio)) {
> -               error = PTR_ERR(data->wake_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Error getting wake gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(data->wake_gpio))
> +               return dev_err_probe(dev, PTR_ERR(data->wake_gpio), "Error getting wake gpio\n");
>
>         input = devm_input_allocate_device(dev);
>         if (!input)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
