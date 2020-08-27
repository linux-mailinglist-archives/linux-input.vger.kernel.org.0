Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6224D2541CA
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgH0JRy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0JRx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:17:53 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E238C061264;
        Thu, 27 Aug 2020 02:17:53 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m34so2902119pgl.11;
        Thu, 27 Aug 2020 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJkhkOIEeY/SGjLl27FBAgRCSmgPryQxHnNoPoI6Fs8=;
        b=pH3PYyJ1RaFJg2VHLhtxS1Mu0I6hJZsCgOdbodCcnQDkuk24k2BojHZlM/dhBe79A+
         rmPQp//yE5sBFWK4F+DzoAykoMlFeCzs0ioTkoEzhIQvbzc8l/11jtJezf1e9pfCdc2Y
         WNgJmSlYnnNnLJ7Nuyrbo+FqexnKhyiMMzqcNZjxrYNXVefMhnTDVn1ftKHcSX4DLN3z
         ManfAtfwXHB9gmv77e2fD8FNOHxDa6m3RAtAdAY67JksW8uuvJYm5882qL3Gy9lMTIQz
         Z4pcC1xnm7TmCWacwNdzHg+wTrMiKH5COOqspEUEvqCx/CAvyxXYKqfToEsctehjbf5b
         ZeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJkhkOIEeY/SGjLl27FBAgRCSmgPryQxHnNoPoI6Fs8=;
        b=GAXyQuZSPctL3i1DVlp9s9nc+IQCKrJFUEQ0PJZ+sqnOnNRTl6+4PXdRA8nBWoJoaE
         RtvV0yx42bi+X6u0GDydG+nLIRjT3D20rAOnSxIsNVw6MG5XxfXsdAuDZvk0gxXjRX7S
         oSi7Qf6UzFAr/ksAz3BCrtmImlvC1zV0/DLw1W4jDo/LupH1UhIZf1bJYyGP/QY6rH4y
         pVvd2soMFzAIVocfBMDn7mXNsuY+RSHBDEePIupwB9rBbQH2murS4N2LR2/TEANi220y
         MRFI48l+UO1JS1zZUN5i9YzOdB2xeAy+cmK1jpl6fa+J21M78rcklYDT6Vp12hBrLSHr
         RTwQ==
X-Gm-Message-State: AOAM530wXT28X1obk8xhnbILdC7F6prRoMp1LOB5sR6LPuPSpWTUL7Po
        1+AXX8edHg0PWao+tfeMqM6+lcqwX681r6YbY7Za1oyRfnVa+Bc5
X-Google-Smtp-Source: ABdhPJxXt1uK2zXAifpgmamDY1/BmrO9rivOroFZP3vKAar+AHe+BcR9RLUXIwVNP7+38+jeGrbNaucmjDkPnnxZfNQ=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr13765118pgk.4.1598519872720;
 Thu, 27 Aug 2020 02:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-21-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-21-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:17:36 +0300
Message-ID: <CAHp75VcqLNm=_BPfrOE2o46WOQXo9BTYEi4O6eNh+Xu_j7hwDg@mail.gmail.com>
Subject: Re: [PATCH 21/24] Input: silead - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/silead.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 8fa2f3b7cfd8..754debb4b2c4 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -512,11 +512,9 @@ static int silead_ts_probe(struct i2c_client *client,
>
>         /* Power GPIO pin */
>         data->gpio_power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
> -       if (IS_ERR(data->gpio_power)) {
> -               if (PTR_ERR(data->gpio_power) != -EPROBE_DEFER)
> -                       dev_err(dev, "Shutdown GPIO request failed\n");
> -               return PTR_ERR(data->gpio_power);
> -       }
> +       if (IS_ERR(data->gpio_power))
> +               return dev_err_probe(dev, PTR_ERR(data->gpio_power),
> +                                    "Shutdown GPIO request failed\n");
>
>         error = silead_ts_setup(client);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
