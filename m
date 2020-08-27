Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C856D254173
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgH0JFl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0JFl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:05:41 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D2AC061264;
        Thu, 27 Aug 2020 02:05:41 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id v15so2897766pgh.6;
        Thu, 27 Aug 2020 02:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0LgS/funI+yMH3Misf/qyEZTDkijoEmJUp2sJjP9Ags=;
        b=oQ4JwYQl4GlrPXDLPASnT9mLJTD9FwiUcF2T2Pxu1ytAQhJ9e4yziNQif+ofQMrBMF
         hRgz2tchSkMv7NggEs2do17415JgNslbCP+8upd7Rp8ocFvjMORZLcgzosaZU2CnziCs
         UyalgPvWNX2Bu/1f7Dnpbtcji3ytVC/8jC9wln3biPvqXm0lzpvqqbhZqxF2KsqManmH
         Ewz0yIfwfc9fVKVr8tRQela+oySiB+1YPv3EUMIwFIxFgIsS0syykKVL/FprjkBEsinB
         fVakVTSm6Ev3O5VH3tmBSZFYpFy6E29GbHEySfnMB8ryicrQh1SbVyInXRgGNuQsQfHh
         NG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0LgS/funI+yMH3Misf/qyEZTDkijoEmJUp2sJjP9Ags=;
        b=EKVpC1zrv274r/xQmLe3DbJlsUouBsFuuacG6N9kLSrPr1h6iiBhIB2axUVRHpprrq
         nO3dx4f4Xy4PsujIwztizwcQEbeL2sKMQQYO9ACsr4wPgwaeonctrrgsdfeeHhMV7cxz
         Sz/5uzDptDr1iQSqftA/InwA2Wj676vM9em4E9lwOW6kwu+Y1IttsczlKZko0/WBswQJ
         XxYE/o/bKVJcWRqkmoUTIkZsRVqjKokz+fHl9fuaOZ2DkPMWaadWbwmMabivivYe2tzK
         iI+l4LLfeLfUjq9yfnJLe8RtlGY9Qrix2dbBYyySODty4bkw7eoKbJZqsBhj0o2hBPjK
         WwqA==
X-Gm-Message-State: AOAM532ndcAI2YbdWxk/CzjHTsVExgScMJGxJi90U5d+q9AIcTmrBrUX
        0XhcVpgByda5zeTTIjBTr63buJNrE3yqwM/deOM=
X-Google-Smtp-Source: ABdhPJzxMe5xIFO/xzxVR2b2KBHEfiCygx9iaaGDGOcMk7dug7/eSxMXYmeXEtGbBmXV3CWIPxHnL6zH4003ZTvEiJM=
X-Received: by 2002:a17:902:b194:: with SMTP id s20mr15688764plr.321.1598519140722;
 Thu, 27 Aug 2020 02:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-3-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-3-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:05:24 +0300
Message-ID: <CAHp75Vc5XqsByQ35gx83NiuHor-doa5MZ_P+6may0q5MnAFgDg@mail.gmail.com>
Subject: Re: [PATCH 03/24] Input: gpio_keys_polled - Simplify with dev_err_probe()
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

On Wed, Aug 26, 2020 at 9:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/keyboard/gpio_keys_polled.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index c3937d2fc744..ba00ecfbd343 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -299,13 +299,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>                                                              NULL, GPIOD_IN,
>                                                              button->desc);
>                         if (IS_ERR(bdata->gpiod)) {
> -                               error = PTR_ERR(bdata->gpiod);
> -                               if (error != -EPROBE_DEFER)
> -                                       dev_err(dev,
> -                                               "failed to get gpio: %d\n",
> -                                               error);
>                                 fwnode_handle_put(child);
> -                               return error;
> +                               return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
> +                                                    "failed to get gpio\n");
>                         }
>                 } else if (gpio_is_valid(button->gpio)) {
>                         /*
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
