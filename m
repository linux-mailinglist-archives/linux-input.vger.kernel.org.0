Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570D12541B3
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgH0JPJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0JPI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:15:08 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF166C061264;
        Thu, 27 Aug 2020 02:15:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 67so2898431pgd.12;
        Thu, 27 Aug 2020 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inRn7TsMSZLaGoJIDoT2uEw3/+mS8OiKciDZtjYNbbY=;
        b=siIg64OkHw2UMW1Tzliwz6N3LPM9NvlrmBJaq1C/3wiNo5wFh8hcFmLGc2/Z/IUEUX
         +uaneft/hQ+sAbP6ffldPUQu8RdrO3WLR3uTvZHfs7fkrOBqdQGvk7pTLaNswyrQdR6j
         zdGYDfSdTfBlsiBS7u0wTm0CkJD0znK20zX52AIDx+bNkXBC7cwU+/0M89PWzjWFCnR8
         tL8HtpIzzGmkVMsRPQ31B6HC18qOye5ZjujiZrFD19gG0f4OhGhS1bxzGe2YCha87r+S
         AYb03mYjNjfdTF0AeflnwiuOzt2EkoAoqhFN1g6WBttejKTY6ryR1D6MScxi6c97iwm0
         tPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inRn7TsMSZLaGoJIDoT2uEw3/+mS8OiKciDZtjYNbbY=;
        b=myAETOeSkAuMGHtok2nKB6wAiy541s86XMpd7qhAQ584tF2RGI7PkNXCcGdA49NmQL
         xGSAnsfwMFXAbmiUmE0qImQAQEvUyIDSbey7FuWLGvNzIYHY35nlH7U4Yf8SdesdbVrO
         UD4wSH4tHsUEi6skPIVrzrBLekqadsVdjl6Iswuhgio8fiX5H3+mbifqpBRL+2h44sgq
         DryuXGfELtUNRH45udC/+N2WZHqHEW6JM5R2XA+qsgjFoS/HByx6P8Kcam2JWaSsjpKU
         xDtOsGaOjTTFF43H1G/oGQ0dxivIaFefwrdw0ZoZ4EH+9eQOpuLGGA+pPBh8Qo2XguhD
         Dw8w==
X-Gm-Message-State: AOAM532HFTIdp3Md1JYtt2028OuM0jjsqJ+95uQFfEeoCwCSB0zU9MfL
        oZnY6HMSLzsHn4JiKuqyFtSyWGLj54bKDbVijAY=
X-Google-Smtp-Source: ABdhPJzDtPAAyZARPfZvcMeZ5QDpxY4xupopk7dNZfJyjwAXsBpZrCH68e2+H/445+IXKhPUCsrNTzm7J8YjBiDc0Mw=
X-Received: by 2002:a63:c543:: with SMTP id g3mr6440182pgd.203.1598519708234;
 Thu, 27 Aug 2020 02:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-17-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-17-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:14:52 +0300
Message-ID: <CAHp75VfHtwytOQNiCFdrS-BCw-Gjmpj3NVn_-YGT_QD958h3Fw@mail.gmail.com>
Subject: Re: [PATCH 17/24] Input: melfas_mip4 - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/melfas_mip4.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> index f67efdd040b2..d43a8643adcd 100644
> --- a/drivers/input/touchscreen/melfas_mip4.c
> +++ b/drivers/input/touchscreen/melfas_mip4.c
> @@ -1451,13 +1451,8 @@ static int mip4_probe(struct i2c_client *client, const struct i2c_device_id *id)
>
>         ts->gpio_ce = devm_gpiod_get_optional(&client->dev,
>                                               "ce", GPIOD_OUT_LOW);
> -       if (IS_ERR(ts->gpio_ce)) {
> -               error = PTR_ERR(ts->gpio_ce);
> -               if (error != EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->gpio_ce))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->gpio_ce), "Failed to get gpio\n");
>
>         error = mip4_power_on(ts);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
