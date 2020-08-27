Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691E8254192
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgH0JLT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgH0JLS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:11:18 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36E3C061264;
        Thu, 27 Aug 2020 02:11:18 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x143so3016324pfc.4;
        Thu, 27 Aug 2020 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+Z3voNRh5J+EaD0NmVx1ykTxkzr5l1t4wqB9D88Vxs=;
        b=pFnjIFXeYVJwKUSK5M7H0AqkzYvn1y/0yi9vV930iWzQVvBcIS4yaqOqnQqshbwhUP
         e97zSAHAfodJxRsChguhN7SEOEpcxWDJDc4v5wPX2lq++P3NfUnPt9ZaSBgTXj9Nq5XI
         l07EFcUUQGBTjUuZrOzIfgTZ9WuDNosvteVvyuXb/Rlzero9jz7blStcIXbx6OxKweCn
         zAnBmNm1Qyr7mNgND4y2JZlHrzYTHiOi8YB1ner3Qx9GzsO62IaeWh1urmWAGUJRiT/W
         p2Op7/gvCDRiv/4fPbt4U3y4el2U7a4aOYWA5kSbGc9D7LKoKdfGoiBTerECXpFo0ddr
         Ssxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+Z3voNRh5J+EaD0NmVx1ykTxkzr5l1t4wqB9D88Vxs=;
        b=qhV9u2JK7st9dxqSnGn+S3yZup6BgbznPp0uwxs7vDoeZxfHRRlomsIJWjhUjINanP
         Xon5BAHvDdqtdRmOMuRgVyrmECY8P5oEd9uF/81rDX1RKM8CzOR+oACOQMcNgj7/OwQw
         q8QaOmR3uTjya42bXcO9/KDIJVQPOd0hz6rc+64o4n++XyUu3IKNLqpASRNayoM/hpMO
         VHCtDN1XPMz55c/OGyM6HsEedgYZr2QL7/zwDbfTUi+5wi5dFGPnOhyvw0TES+ybmFYk
         GnOyvE15X8bcS+dcOZ7Xvrn/Q3mH+lBZ4sz05HsTqJryHnGu/Jzl/croZXA7hugjGxsv
         REIA==
X-Gm-Message-State: AOAM532q9i9lX9VPqBwSEG2bnwXTBLY/y2he0EIgFLnEeVpXoUOufslB
        A/G7AVh/45RG2Sl+K1xfpIS2CiKwC+5+KWdDgZcqyPB2drpNd92o
X-Google-Smtp-Source: ABdhPJxb9+0lkeOekZuTJq+51vmWY1kVES/QSXf79lQAQU4SXnjOw6oPzj114eNh+MuftNS2zAnT8GOAz9HTshXQHJY=
X-Received: by 2002:a17:902:b194:: with SMTP id s20mr15705930plr.321.1598519478093;
 Thu, 27 Aug 2020 02:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-10-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-10-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:11:01 +0300
Message-ID: <CAHp75Vfmec6oaAWCkO7M_8uJk7Y1-x3Pz5AJVx_D3XGkRmQVvg@mail.gmail.com>
Subject: Re: [PATCH 10/24] Input: bu21029_ts - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/bu21029_ts.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
> index 49a8d4bbca3a..96c178b606dc 100644
> --- a/drivers/input/touchscreen/bu21029_ts.c
> +++ b/drivers/input/touchscreen/bu21029_ts.c
> @@ -360,23 +360,15 @@ static int bu21029_probe(struct i2c_client *client,
>         }
>
>         bu21029->vdd = devm_regulator_get(&client->dev, "vdd");
> -       if (IS_ERR(bu21029->vdd)) {
> -               error = PTR_ERR(bu21029->vdd);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "failed to acquire 'vdd' supply: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(bu21029->vdd))
> +               return dev_err_probe(&client->dev, PTR_ERR(bu21029->vdd),
> +                                    "failed to acquire 'vdd' supply\n");
>
>         bu21029->reset_gpios = devm_gpiod_get_optional(&client->dev,
>                                                        "reset", GPIOD_OUT_HIGH);
> -       if (IS_ERR(bu21029->reset_gpios)) {
> -               error = PTR_ERR(bu21029->reset_gpios);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "failed to acquire 'reset' gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(bu21029->reset_gpios))
> +               return dev_err_probe(&client->dev, PTR_ERR(bu21029->reset_gpios),
> +                                    "failed to acquire 'reset' gpio\n");
>
>         in_dev = devm_input_allocate_device(&client->dev);
>         if (!in_dev) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
