Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108652541B9
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgH0JPi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgH0JPh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:15:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16ECDC061264;
        Thu, 27 Aug 2020 02:15:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so3006392pfc.12;
        Thu, 27 Aug 2020 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+iYIc5/zQZBPP8dobzLM6QGug75pE9JGQJ4xhn3Y5Y=;
        b=omiRhYCpnbclXn6z6CGZ04V/DYGCGeG/A73Z9YqlW3TmssLvfiUWrE5qkHCp2NKGBE
         2UDqzgVawH9/sykNxfJRe7Sqdn/lvGpn4JAJcIEE5Y8shd8D9sSelmUgbH19MmXQn1bH
         cw+6l6lmhNmVfJ/yYzXv4jTdeM5U+MrN6KjwGBAM2NK+80gT9Sxh4LBKhtQy0Ho8Q0mx
         1CtbWcKMT6KBEnDrqaUy1eUAgbsmLeEPHKH617ePHZ4bChkDPsFbu+jR0KS3OsFSMmgl
         AFHUkcwYBY1tEP2hD15jjVsl8CPZsCXAclxvFUESvZ9vCn2hzDlCnOLQD7cVTc9EDIOg
         CHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+iYIc5/zQZBPP8dobzLM6QGug75pE9JGQJ4xhn3Y5Y=;
        b=HnVvPqVUjI8Xner3yfD43cumHtPxtjHl8iPQs7yEMF5/wH3dnjPVI8IRPHOi0Xqxqv
         XMJ6eiESGuNb4LFiHPrcC0kRpQcGzfsyrUOCAkiP/NwdS8rk4TrhTGX12QQG5zDRo/PD
         08rtBPjUZJpGukpMd/M/T7MdyroBwQeE9otL0djfjBE1zLH7GnAGhMjKtfyvDN39c4u2
         di6z43AYCJyuFsjp5h2S0LnXwHusnATQhCJN99FJhjf6kYqepSuQop6YwXaO6r8RdVjA
         m8zsJO99zUsoMb63fj8BiZrvq+3Ba+BTJd6W3zN+E2/LivSQrOxmiTXiogN0XDgtEtrc
         sR8w==
X-Gm-Message-State: AOAM5334msX8lhGkW4KN5cHRah9jBUQvhlb5NB80siqoX3Vj/4QBCEz3
        TIJ28WoYpeuj2kDpEcrBTh1Hd5G7G7q+Mx18A+N434DBi/zlY++a
X-Google-Smtp-Source: ABdhPJzladeM7wfq+6Tlw8dF0BoeJp2S9AVgBlK6D8SyppoSNf+VyMJG60Z8ZmsDdRyDJb6yja3qvEw/J9p+R5ot2D8=
X-Received: by 2002:a17:902:8208:: with SMTP id x8mr4118284pln.65.1598519736638;
 Thu, 27 Aug 2020 02:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-18-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-18-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:15:20 +0300
Message-ID: <CAHp75Ve84KQ3Rysq9oHzuCKSaX-Xu4LbAvwih=10qEBXBk7bbw@mail.gmail.com>
Subject: Re: [PATCH 18/24] Input: pixcir_i2c_ts - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/pixcir_i2c_ts.c | 38 +++++++----------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
> index 9aa098577350..fb37567e2d7e 100644
> --- a/drivers/input/touchscreen/pixcir_i2c_ts.c
> +++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
> @@ -515,41 +515,27 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
>         input_set_drvdata(input, tsdata);
>
>         tsdata->gpio_attb = devm_gpiod_get(dev, "attb", GPIOD_IN);
> -       if (IS_ERR(tsdata->gpio_attb)) {
> -               error = PTR_ERR(tsdata->gpio_attb);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to request ATTB gpio: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_attb))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_attb),
> +                                    "Failed to request ATTB gpio\n");
>
>         tsdata->gpio_reset = devm_gpiod_get_optional(dev, "reset",
>                                                      GPIOD_OUT_LOW);
> -       if (IS_ERR(tsdata->gpio_reset)) {
> -               error = PTR_ERR(tsdata->gpio_reset);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to request RESET gpio: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_reset))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_reset),
> +                                    "Failed to request RESET gpio\n");
>
>         tsdata->gpio_wake = devm_gpiod_get_optional(dev, "wake",
>                                                     GPIOD_OUT_HIGH);
> -       if (IS_ERR(tsdata->gpio_wake)) {
> -               error = PTR_ERR(tsdata->gpio_wake);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get wake gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_wake))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_wake),
> +                                    "Failed to get wake gpio\n");
>
>         tsdata->gpio_enable = devm_gpiod_get_optional(dev, "enable",
>                                                       GPIOD_OUT_HIGH);
> -       if (IS_ERR(tsdata->gpio_enable)) {
> -               error = PTR_ERR(tsdata->gpio_enable);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get enable gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_enable))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_enable),
> +                                    "Failed to get enable gpio\n");
>
>         if (tsdata->gpio_enable)
>                 msleep(100);
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
