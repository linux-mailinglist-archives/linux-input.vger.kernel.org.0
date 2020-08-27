Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6BB25419E
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgH0JM2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgH0JM2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:12:28 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7995CC061264;
        Thu, 27 Aug 2020 02:12:28 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w186so2906256pgb.8;
        Thu, 27 Aug 2020 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FOvW0s0rf2sc1CjYmxAy8EbaGjWvQgUNvKAKrMQ2+Rg=;
        b=k8ZihoWB7GMnwsFhPgbe+0IT4xEX/Kr+M7twXG/hPQPND2rkWQp7u/Ds1WbNPxfuDS
         YJyv5A0bcJxDUS5kydDjSjqBJ4Z50rtW3ox8WiViCrbU/lV1q5BJlEOtjQVEtCIRYR5D
         Kx34Z6a+6pts3wKnBH7uQdHZkODwi1VGmLB//rV+DrGUD73T76RFbvynTg1VDhBzU0EV
         PSw8ioRnIAPkbHEyj0I638ytUy5xyPM6JE9qOek5Oro6V9/wyQjaqLbo3mOZZyzBavtj
         oJr0Jr/J9EbJPU1/0OKggR9Qdx7Nbt0Zfo6Wp50gNWG+ewl8BMkqHbWQReBT8XDdkqSU
         FD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FOvW0s0rf2sc1CjYmxAy8EbaGjWvQgUNvKAKrMQ2+Rg=;
        b=EYV7tcZAVZSosSsXSe7IHOtOpQDbYFTaq11AWQ87XSjEEhaFEkuEKJ9ekveb5/LS68
         tXrRhz3epTdvZ/GkPBWJ+YJPzmWkiWTLLVJkoQO4yiMec0FIWrTGlZxdLzjfcmdUkGVf
         xPMgpm6wn/bQSCQS9lswgzWipWrN1y7b2hL9pHEOO9QyyIZXo2xK0GQidQLBZDwNCEgT
         Offjdo48MrvZASLUF6Qu03LbZxNy3hn2dmpFjDD1FLWvXJylQq2YxlzqqZHLeoS/4s9h
         xhWWNyd78wELul9onBVaVuAT6iZHCZ1a8/4rYG1WwFUhGbxqf3nlZQaCNlzYaygJZ/Ey
         a5Jw==
X-Gm-Message-State: AOAM533JdYNfwSul4j4ZyRFe9mP9o5tiV4l9TWLN2LFfGr8rGGs6ppDE
        ZX3NyHJmvKzAtef8N1SIizWm4x03cxIFwEaVsJA=
X-Google-Smtp-Source: ABdhPJwF1lf0xV2zyYxYs3w5o3UyWN4/7uy6A1F5Jw47MIqwQah5/SXyhk6TjH1PCwlmpB8ji14jDoak//wIDOA3FyY=
X-Received: by 2002:a17:902:407:: with SMTP id 7mr15465210ple.167.1598519548056;
 Thu, 27 Aug 2020 02:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-13-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-13-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:12:11 +0300
Message-ID: <CAHp75VeGCFGv358kaqWhC7NkxCh-NrHhdVx9TYazu7diGkp6oQ@mail.gmail.com>
Subject: Re: [PATCH 13/24] Input: edf-ft5x06 - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/edt-ft5x06.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 6ff81d48da86..d4827ac963b0 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1098,13 +1098,9 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>         tsdata->max_support_points = chip_data->max_support_points;
>
>         tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
> -       if (IS_ERR(tsdata->vcc)) {
> -               error = PTR_ERR(tsdata->vcc);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "failed to request regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->vcc))
> +               return dev_err_probe(&client->dev, PTR_ERR(tsdata->vcc),
> +                                    "failed to request regulator\n");
>
>         error = regulator_enable(tsdata->vcc);
>         if (error < 0) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
