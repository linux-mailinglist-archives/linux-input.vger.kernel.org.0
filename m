Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1270E2541DE
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgH0JUU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0JUS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:20:18 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22D9C061264;
        Thu, 27 Aug 2020 02:20:16 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 17so3025297pfw.9;
        Thu, 27 Aug 2020 02:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NHovxXj8kNl+bO/iYwws9eniGeyDYn/VL5TU+ffgVe8=;
        b=gcovqugjmSAGtw1SadGUSYghzOegMGsxuFFYTfl1i1TQhmAUH6wYXgJf7oDOSnUiYo
         2yK4hr+IonNH5Z4kS3bkZcB88gD+xw0D6GNM6JUhyWRNmy6MI1i9wwYK4XaTB4Akm4r2
         J6MwACe7X9ZN1B3YkRf/ZoOc+gQ8RcuO5ykz5nxUqZEdYDq4LorwFP8/tJCrOBQI5hj2
         R5Xspmoa60AUW0Wiv4zZXY758AhK/RnvcF4AYPOgUHrjr82+/2ol7b/YWwMvLwKp5UNo
         CNkKggy9+VmOWdL7LdYqeEjDNe8GO21LhokpW8WeEIsQAst4GEgETw4DS+N39sBYcsI5
         dPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHovxXj8kNl+bO/iYwws9eniGeyDYn/VL5TU+ffgVe8=;
        b=PbBtLHgOx4DtoVBrAhx5UMoPzHIsiXSjwbFg72i4OVYggKN5QfbdhLjJjmHByvkA3w
         gjEVN5UWUXG1g5PKePxKihy+qX4MmQR/2BoyVaZxmOn2ZFFvJLqFI0ou0Yk6cCdyqHwb
         GRtYMzfB837yy94/8Zz1K+5Bp8QfGo9oM5+oWy5cJnyd6pm1mIxLEZplYqlziYNpoIsW
         z9CHvMLE5P/zBQ6GRzGl5c515mmfRQzzDACqndmKQAzD40xBy8rydsJ9NSL54WdMhKh3
         GkWjBwhxF82loJCGw1arbU+DnpsaHC26pGcqYmIJBveXpdngnV3Hk6ctzCMGDvJXByFI
         wDJQ==
X-Gm-Message-State: AOAM530UNccRgCioGGCjRa0vYyy9f2L7hhDtjXWqOk9AXdpzNF6RqBwX
        rZamouAe5+ymw8HqnvyBXdpQ2dQq9jVz64MC52M=
X-Google-Smtp-Source: ABdhPJwe0B4oPJaBrE/zcyPdEd/iXNQmz7ydwrDHQeDooT4rtlP2BEsxoIKXfXOd3ZfQIEmpnRfN8FY78P1J1rOzibo=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr13402591pgh.74.1598520016226;
 Thu, 27 Aug 2020 02:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-24-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-24-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:20:00 +0300
Message-ID: <CAHp75VdygxySau_Ma5YqARgR92BNM+AK3yn2rThYxFEmzdYSLg@mail.gmail.com>
Subject: Re: [PATCH 24/24] Input: sx8643 - Simplify with dev_err_probe()
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

Just in case if you want to save more LOCs, you may in some drivers
introduce temporary variable for device pointer, like

struct device *dev = &client->dev;

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/sx8654.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
> index de85e57b2486..d2ed9be64c3a 100644
> --- a/drivers/input/touchscreen/sx8654.c
> +++ b/drivers/input/touchscreen/sx8654.c
> @@ -323,13 +323,9 @@ static int sx8654_probe(struct i2c_client *client,
>
>         sx8654->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset",
>                                                      GPIOD_OUT_HIGH);
> -       if (IS_ERR(sx8654->gpio_reset)) {
> -               error = PTR_ERR(sx8654->gpio_reset);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "unable to get reset-gpio: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(sx8654->gpio_reset))
> +               return dev_err_probe(&client->dev, PTR_ERR(sx8654->gpio_reset),
> +                                    "unable to get reset-gpio\n");
>         dev_dbg(&client->dev, "got GPIO reset pin\n");
>
>         sx8654->data = device_get_match_data(&client->dev);
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
