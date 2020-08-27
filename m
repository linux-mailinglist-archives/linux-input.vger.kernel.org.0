Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2839C2541D5
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgH0JTD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgH0JTC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:19:02 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4093C061264;
        Thu, 27 Aug 2020 02:19:02 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y206so3014880pfb.10;
        Thu, 27 Aug 2020 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VgFZ3oc2fxtal1v8qY7ILD3Hbp8X8hErMNMpovFOacY=;
        b=CxWG48zpulIoeeq4DDcQ2DoH/7wm4cQm+Pj/r8BEZ6iyyW6Ib0Kc5jYbCyKqmWsynR
         D92g1UgE5FRMcGm9T1RA696WTtsk9alwjRfwS3P9R41UmTmNkVzLT6S+3iYVtmh6W7zf
         bH0UbQTeOH/bfOp+75Og0cffB8MayR3NU30CIWEgYBqDjYESVMPEzBOInc/A+GVS1H5M
         +HdLV5FObiPvtHL6X3W+dKYaJacFoPdDAQez42wmzladeuJqfB1vTCvRUMiAfbYAyeaH
         t0/ouM+Q3G6x0RyAHZPwRUbruCLmcfLFFCAi6SduqDpl/KiFG2u6W8QPFNQV4jcR0zNF
         9dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VgFZ3oc2fxtal1v8qY7ILD3Hbp8X8hErMNMpovFOacY=;
        b=YReUTxTFhEFhhneajqkno3kKB3n4e0Ba0+TBB7IEtkVkIUwHm+LkzQXIPK9wnyxNdG
         azx93/dqwz3TKia4d5BW73ncYgjzYZInqp2wOiE+NkKRMewNvNjMEbWL0W+WuC264/Zw
         IFZtDwDdDslyI/FdZjWttUj1GhaXJKToaQlEQQDNcdbIiKV483e5JvRbI21Wubk5I+1y
         sPAcvuDOHaZ3kdUp7kvbe5GQctZvuKss9bRMhJPkUj5mRpoALPiw8QNJ5tK6JqAf/SAE
         Pn1xnYmS/QCn5FHK44LP15JMPWIHntdS4yvefaOXYRX1GCMY9MZRaXVjNMAtjANajpIq
         JrJw==
X-Gm-Message-State: AOAM532CCakWHC7I3d0gZnvfv1rHkudxrYcNgT1cbtq8M02Z1spFRXCU
        O2XdR5gE3kB+aPSa6W1cglipKPCt/fuyCxnml38=
X-Google-Smtp-Source: ABdhPJy2sx0lGOZtzgnh0B94nDuzu7sanQKqJ7UK1Q4rptGZJnV9/hL7Za1e1VRKnFZKTXqmiZmX63dTU7SojC/8zTg=
X-Received: by 2002:a62:9215:: with SMTP id o21mr4726022pfd.268.1598519942162;
 Thu, 27 Aug 2020 02:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-23-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-23-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:18:46 +0300
Message-ID: <CAHp75VdKxibhohQEEbtF4Er=OYLVqFc-7-GoAZ+O2mL3Vi4s3w@mail.gmail.com>
Subject: Re: [PATCH 23/24] Input: surface3_spi - Simplify with dev_err_probe()
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

On Wed, Aug 26, 2020 at 9:22 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/surface3_spi.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
> index ce4828b1415a..25bb77ddf2ef 100644
> --- a/drivers/input/touchscreen/surface3_spi.c
> +++ b/drivers/input/touchscreen/surface3_spi.c
> @@ -223,7 +223,6 @@ static void surface3_spi_power(struct surface3_ts_data *data, bool on)
>   */
>  static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
>  {
> -       int error;
>         struct device *dev;
>         struct gpio_desc *gpiod;
>         int i;
> @@ -233,15 +232,9 @@ static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
>         /* Get the reset lines GPIO pin number */
>         for (i = 0; i < 2; i++) {
>                 gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOD_OUT_LOW);
> -               if (IS_ERR(gpiod)) {
> -                       error = PTR_ERR(gpiod);
> -                       if (error != -EPROBE_DEFER)
> -                               dev_err(dev,
> -                                       "Failed to get power GPIO %d: %d\n",
> -                                       i,
> -                                       error);
> -                       return error;
> -               }
> +               if (IS_ERR(gpiod))
> +                       return dev_err_probe(dev, PTR_ERR(gpiod),
> +                                            "Failed to get power GPIO %d\n", i);
>
>                 data->gpiod_rst[i] = gpiod;
>         }
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
