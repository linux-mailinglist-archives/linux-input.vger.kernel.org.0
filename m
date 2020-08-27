Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8882541A7
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgH0JNG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0JNG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:13:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A123C061264;
        Thu, 27 Aug 2020 02:13:06 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so2295152pjb.4;
        Thu, 27 Aug 2020 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0H+L9UPSd/5Nu2wIneYTHQhHhgEl54jJSjInRrKpcg=;
        b=ZwwRrgcx0BCZjQmIMWLsESg08YIGYglCC8a1OtDOVI2JFGl93NfDumD2LZfcXl/W6f
         In0XzWihsI2Q+7BNKeCBULtVamXhWfLRfWzM9G/f4LmwlwoTDBrXWyxGxRj036uP1wkv
         V7sD2rE9CmsrL8LjUAuN+RfLp18eqKDVuKT9khk4MIvjGLks3US8agjk5W/zoha+IExh
         eA7FMb7GFqKO4UGCyivZCQZCNZBQWjkPJTBV8wYF5pm7U1WsGli7IDN6jWqEGBu6yAG0
         CIUjnJv0hvIxwjZNoixU9c4Ii5K/MskOkBjshCoDRn7Hdx3HC6F/WncO2m7khkUBsQ6z
         kI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0H+L9UPSd/5Nu2wIneYTHQhHhgEl54jJSjInRrKpcg=;
        b=nTbtdIw9cHc8S0rDLS5AoWCDchEKgaXa4DsSuDUSIoWTAsC+/cOUwofxV5skWo9tc0
         9479BOT6hata4Qm0mmk6NVukqiRqsxpcVFV88Y3k8iGccyTpqMk69V/GV0XdQ3MrhybO
         6Iqrawee3w+rQ/h+/ciVjt9r0AY51YcGxuWdtjjY3SlSB85sRfHZAN82bHNMEAjJayVL
         4IHTD8ItJmIQCO4XLj81h6Nevg6j8itp6Px3U8nc0ppMkhRBagYg4R66auzvblvxv99N
         wHKBNUQhGE31Ksgaqo6WhgZtaJ6ZXoWSndMtHjfhGrDYnCqtbJwhS+GaDRAOgWksTprB
         kk7A==
X-Gm-Message-State: AOAM531edoBa/SHfNjNFYGtd2YHoNfBtuI5Ur1cON8k+bpOw07NfpFyL
        f7wjVF+T5BKU7lhneSiENGdGLf9MCMUQ4hIXLa4=
X-Google-Smtp-Source: ABdhPJwxcCaatopEQ9znxqP8R7e1+a0UiPdVoUvjwTFkdz/8fLS8TblEgK+YVFqejRWQEQ7wtfHtNSvrgch3VD6FbKA=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr9451816pjb.181.1598519585863;
 Thu, 27 Aug 2020 02:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-14-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-14-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:12:49 +0300
Message-ID: <CAHp75Vf2=qM4nvYMRQccJgHhZytXt9GU4KCBv8HwHnW+EcPvnw@mail.gmail.com>
Subject: Re: [PATCH 14/24] Input: ektf2127 - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/ektf2127.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
> index eadd389cf81f..cd41483cfae5 100644
> --- a/drivers/input/touchscreen/ektf2127.c
> +++ b/drivers/input/touchscreen/ektf2127.c
> @@ -237,12 +237,8 @@ static int ektf2127_probe(struct i2c_client *client,
>
>         /* This requests the gpio *and* turns on the touchscreen controller */
>         ts->power_gpios = devm_gpiod_get(dev, "power", GPIOD_OUT_HIGH);
> -       if (IS_ERR(ts->power_gpios)) {
> -               error = PTR_ERR(ts->power_gpios);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Error getting power gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->power_gpios))
> +               return dev_err_probe(dev, PTR_ERR(ts->power_gpios), "Error getting power gpio\n");
>
>         input = devm_input_allocate_device(dev);
>         if (!input)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
