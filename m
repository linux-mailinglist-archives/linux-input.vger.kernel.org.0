Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318252541BF
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgH0JQj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgH0JQj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:16:39 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC8DC061264;
        Thu, 27 Aug 2020 02:16:38 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w186so2913801pgb.8;
        Thu, 27 Aug 2020 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JwFCkkz5VX1KhqOgC/A46pRkPoJXqCrnvRq7RlXV44Y=;
        b=MZqck0sjY5yqBsyyGG7EL6lGiDj5SzDST8SkhvPk6A1/uGj63z5+m3kax8UWb6wtcZ
         /+wIvoK8uNNiBrHTehpEZk9B2aYVYUl6tHqSB0usNtbD87t8wGL8ucl23F63dFKwZALB
         ST78rU4PyEbOQZjWZSyDn3gib2fkrZUo9D4kJ5d8zN3jkAPe3y+hc/2mkaFM3W6ZFJ/M
         JqOqLahlrmpW9XkphCj3Ki04lEIchqBV8pt0WCxge9KSey6dHNej3fHlo6UWE9eXiZZ8
         PbEUpZmiIfcOA9y7rxhZXADI68yRpC67VkeiYSyx7nSzyY3xBskNWNAl4N4NyhJHxVxj
         s9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JwFCkkz5VX1KhqOgC/A46pRkPoJXqCrnvRq7RlXV44Y=;
        b=pXPptWXf4GMM591e3XhX2QJjq9tIB8LGlR5wSBQ/8zw/uOesLeYHKgZ7F4gujcnUhO
         pSJ56ugcS8rYY96eUTZ2ZBUulqgYFGpDKG5DFZBlkO4zHSZzIV461FSfFIe/2jfK7x1s
         7rELn7/eGhDnwiz2BpnCZkBZv9EmlEPPQtfZCaCSK4UulgfbSPrYihc7FHNilRIbog6K
         R46PhdW3lH9hJxAFKsB5sHRz2mWKbpEG5GOmNRqLgVUajLw727+hxPv5BFYGacQrZSGM
         BQ0I6OHSUgj1ODhP+mb+/ZhmPAy4eSnO5H/X0SWretGrDFh+b1AkH2LopOC+9B/gpCZ3
         akZA==
X-Gm-Message-State: AOAM533qtLosVA/ckE8OuFXvtjY7zGu7X1MnKOU1WNZWaqrYSi8n+D8a
        JFr656OTkqe+E2gSjhQJhx2/SqVWSDIo6heozlk=
X-Google-Smtp-Source: ABdhPJzmUAdRt6wwEF23BJ0BUUKEohQ229uHbHaYH/ixziT5WHv8yFE7nk7RmU1uwWmU5O6dqSJ+sP0+jStaqcQKeZE=
X-Received: by 2002:a17:902:8208:: with SMTP id x8mr4121547pln.65.1598519798257;
 Thu, 27 Aug 2020 02:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-19-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-19-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:16:22 +0300
Message-ID: <CAHp75VezmFsK0eiEk-4ZzcSfnHP4y6N4Qfds4paBJhkHYL85Bw@mail.gmail.com>
Subject: Re: [PATCH 19/24] Input: raydium_i2c_ts - Simplify with dev_err_probe()
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

On Wed, Aug 26, 2020 at 9:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/raydium_i2c_ts.c | 30 +++++++---------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index fe245439adee..4017775f6466 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -1015,32 +1015,20 @@ static int raydium_i2c_probe(struct i2c_client *client,
>         i2c_set_clientdata(client, ts);
>
>         ts->avdd = devm_regulator_get(&client->dev, "avdd");
> -       if (IS_ERR(ts->avdd)) {
> -               error = PTR_ERR(ts->avdd);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'avdd' regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->avdd))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->avdd),
> +                                    "Failed to get 'avdd' regulator\n");
>
>         ts->vccio = devm_regulator_get(&client->dev, "vccio");
> -       if (IS_ERR(ts->vccio)) {
> -               error = PTR_ERR(ts->vccio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'vccio' regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vccio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->vccio),
> +                                    "Failed to get 'vccio' regulator\n");
>
>         ts->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
>                                                  GPIOD_OUT_LOW);
> -       if (IS_ERR(ts->reset_gpio)) {
> -               error = PTR_ERR(ts->reset_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "failed to get reset gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->reset_gpio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->reset_gpio),
> +                                    "Failed to get reset gpio\n");
>
>         error = raydium_i2c_power_on(ts);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
