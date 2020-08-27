Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51C92541CE
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgH0JSZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgH0JSZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:18:25 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB98C061264;
        Thu, 27 Aug 2020 02:18:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id z18so2310270pjr.2;
        Thu, 27 Aug 2020 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h7+8HLI9zKQR9DySug9QefBQRiFvqULBiV9jhwrlBeg=;
        b=KenVDEFvugPYVDiW0qfljf3gFBe4kQ2kxAnyruOIRojcZpLhDMo/C2BG9iD5iUWbpC
         /+8ZZEgP5bywxngLHe58nD9tJiAWlCLwV/+VM5e4MhJjrQ0U+IvERA2H3MY1mvaj9ijQ
         Y/UmjbajiJV2hX+9IryhGcQwHSsYNNtM6op2onr0fktryw+4Pe/u31tO0cSbYf+UBfZx
         dy3alMk2qAm57/oVVWMNSB35tiF939XU5l0zNPovVjnmnmpR72kJ0GBVwKX8yKeRsNre
         VyVMfOjbcAx8a3iMLIllKrnuHgoGqDFRaY+RyX2zM+39LCcEI1bfLNvAXOvqJ1p50zQJ
         iT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h7+8HLI9zKQR9DySug9QefBQRiFvqULBiV9jhwrlBeg=;
        b=UQ45T0eVHUHI5xc1a3POWSX5NnkMGrdmsiEyI5i0YjYeTkaDyV4SMgQZgsr4zLW+3g
         jTIReN+Go6d6xNmY3eC8IOQLjoq7JvwY33YNhxcS1wZP1PfyvIhyW/oQNZlgWaGP/3nw
         rN5fMaimzXzaBVgPa6wPQ8TfsSP3lZkLRjLmGsbFnZRtjWIcSnpBIZTCieTUks/tvEen
         MnKsBgXVT43kHkOBB9oAR5Y98Mn4BxdcqvrwZTJh/BRcPFc7GH3HWgu1gL3cU+R8CAsB
         K8UFeR7VcEIT8tf2+wWyAd6NOoZc7KqbHBde5fK/uf//WNTr4wBqAVLyMlFAswGBSQFD
         fy3A==
X-Gm-Message-State: AOAM530Qdq8pep1viAROY949TQnofzZ7iN8gAxy5txPh9ipaupioGfcc
        6i2kcBnbxdK2uSznX0myoyj4cP306RPuWBJF0Zk=
X-Google-Smtp-Source: ABdhPJw4ckKkt/hDHVTDDwSkKKrQodyA6470M4C7i0Y+T+CQF0FSSC88NaLbGEGsn5fVLR3+vQEciaK5QvtyPcp4QLU=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr10179422pjz.228.1598519902569;
 Thu, 27 Aug 2020 02:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-22-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-22-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:18:06 +0300
Message-ID: <CAHp75Vex+1nx5ue+mYSwRTzjMOJPeghqLfg2csk3XfvhUr4avA@mail.gmail.com>
Subject: Re: [PATCH 22/24] Input: sis_i2c - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/sis_i2c.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/touchscreen/sis_i2c.c b/drivers/input/touchscreen/sis_i2c.c
> index 6274555f1673..348a2ba9b7c9 100644
> --- a/drivers/input/touchscreen/sis_i2c.c
> +++ b/drivers/input/touchscreen/sis_i2c.c
> @@ -311,23 +311,15 @@ static int sis_ts_probe(struct i2c_client *client,
>
>         ts->attn_gpio = devm_gpiod_get_optional(&client->dev,
>                                                 "attn", GPIOD_IN);
> -       if (IS_ERR(ts->attn_gpio)) {
> -               error = PTR_ERR(ts->attn_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get attention GPIO: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->attn_gpio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->attn_gpio),
> +                                    "Failed to get attention GPIO\n");
>
>         ts->reset_gpio = devm_gpiod_get_optional(&client->dev,
>                                                  "reset", GPIOD_OUT_LOW);
> -       if (IS_ERR(ts->reset_gpio)) {
> -               error = PTR_ERR(ts->reset_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get reset GPIO: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->reset_gpio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->reset_gpio),
> +                                    "Failed to get reset GPIO\n");
>
>         sis_ts_reset(ts);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
