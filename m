Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0BB2541AF
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgH0JOA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgH0JN7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:13:59 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2440C061264;
        Thu, 27 Aug 2020 02:13:59 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 17so3013532pfw.9;
        Thu, 27 Aug 2020 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqKH/hqk1VcGtnGR/i4o0jaa9kdADCCCVfvx9T6hVMg=;
        b=U2vGT4rCsVztqU8UkLEYVP3+kd41Ec7vR08lRtD+u37AfooBrpRKYEtvACxLJtX7VS
         uN5jYx08iyn1X+obpUFLXx4flG8doGZnrcE7Gl6qOrTSIJaMmdL1Y2EUtFVE1GSqsUoQ
         yN6sdNg2LcgFPc00us2hOvZXamUlUA1eLOV991f46/cEj7Lc9jaV/7DvSeMyNUGof0Cg
         iAZekHibU6t6m1BjHwfHI9bDLSg1vtim9rRl7uHfiFob3XiuB9xdJZ6BRWE965KD/hjZ
         egMwvGgecp7id91Obr9i0EoPXGtaidORtVXsMHsK3xb6/H/zN3jxomKpJSMHB/5pPfwv
         qYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqKH/hqk1VcGtnGR/i4o0jaa9kdADCCCVfvx9T6hVMg=;
        b=LdEek5nNqfBwMcf9owQUHhHeqcHE8tB8S2CrHseP88F06WbXZXWbR1L5NedopAy6Lp
         vlaa1e2AdnJ22knzDJn5PAgciZMl2BmxzWC+lFY/swQGmSqaTzgyb4kH7oK29dG/xqWM
         PucE8txTNP1fXTxG9/NKocjhvbxevSRmsJ1p03W6YKa8NJNf3osbauQ/G37ojW7w1R1n
         c7LXTVZb7Ymk/Ofkw9EGyATqq+HiFYy3GsyGa+3VLZEs4blGrIuxIb3i/KsvoEefj2W0
         83cp4xNo/lqVmXrOObmU814p+3x+iYblJ8LylnrNzIZm75qrGU1PB5JNli8ZMUlIgyZr
         slpA==
X-Gm-Message-State: AOAM532vFekxNH9mLqQqQLP62LybZfjxBTfyl48E7Woyc4Bqroiv8CrX
        hjBhwgOOgPNJddMK54zQ+CR4aCS5MeDrEGaXiJU=
X-Google-Smtp-Source: ABdhPJyDIU5Fbg34NeT0ewwRJnUBCoBAdEHTLGNO43zN+te6IdAoEeZ4sOSnJLrHnNF1NsAec/Cee2x4az0l/2+foeo=
X-Received: by 2002:a17:902:b194:: with SMTP id s20mr15713699plr.321.1598519639442;
 Thu, 27 Aug 2020 02:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-16-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-16-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:13:43 +0300
Message-ID: <CAHp75VcijLOjjjhX+um8dnLoq3=g0BwHK7zMoKuV6DO26qVDXg@mail.gmail.com>
Subject: Re: [PATCH 16/24] Input: goodix - Simplify with dev_err_probe()
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

On Wed, Aug 26, 2020 at 9:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/goodix.c | 40 ++++++++----------------------
>  1 file changed, 11 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 02c75ea385e0..48c4c3d297fe 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -864,7 +864,6 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
>   */
>  static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  {
> -       int error;
>         struct device *dev;
>         struct gpio_desc *gpiod;
>         bool added_acpi_mappings = false;
> @@ -874,33 +873,20 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>         dev = &ts->client->dev;
>
>         ts->avdd28 = devm_regulator_get(dev, "AVDD28");
> -       if (IS_ERR(ts->avdd28)) {
> -               error = PTR_ERR(ts->avdd28);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev,
> -                               "Failed to get AVDD28 regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->avdd28))
> +               return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
>
>         ts->vddio = devm_regulator_get(dev, "VDDIO");
> -       if (IS_ERR(ts->vddio)) {
> -               error = PTR_ERR(ts->vddio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev,
> -                               "Failed to get VDDIO regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vddio))
> +               return dev_err_probe(dev, PTR_ERR(ts->vddio), "Failed to get VDDIO regulator\n");
>
>  retry_get_irq_gpio:
>         /* Get the interrupt GPIO pin number */
>         gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
> -       if (IS_ERR(gpiod)) {
> -               error = PTR_ERR(gpiod);
> -               if (error != -EPROBE_DEFER)
> -                       dev_dbg(dev, "Failed to get %s GPIO: %d\n",
> -                               GOODIX_GPIO_INT_NAME, error);
> -               return error;
> -       }
> +       if (IS_ERR(gpiod))
> +               return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
> +                                    GOODIX_GPIO_INT_NAME);
> +
>         if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings) {
>                 added_acpi_mappings = true;
>                 if (goodix_add_acpi_gpio_mappings(ts) == 0)
> @@ -911,13 +897,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>
>         /* Get the reset line GPIO pin number */
>         gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, GPIOD_IN);
> -       if (IS_ERR(gpiod)) {
> -               error = PTR_ERR(gpiod);
> -               if (error != -EPROBE_DEFER)
> -                       dev_dbg(dev, "Failed to get %s GPIO: %d\n",
> -                               GOODIX_GPIO_RST_NAME, error);
> -               return error;
> -       }
> +       if (IS_ERR(gpiod))
> +               return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
> +                                    GOODIX_GPIO_RST_NAME);
>
>         ts->gpiod_rst = gpiod;
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
