Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F962541C7
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgH0JR2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0JR2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:17:28 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E0AC061264;
        Thu, 27 Aug 2020 02:17:27 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k15so3009964pfc.12;
        Thu, 27 Aug 2020 02:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LhS9tD7SvsG3f30qBsS7AzNDrX3/gQHRk3YrLNvlZOA=;
        b=DwfwxD6EugJWTcUqCG1123+gjK6WKsUjmHOC4I+QKwyKFWthlTCKriJ4sPL1Wxu48e
         u2Av6K+jbl76B89VNKBA+ZQVrr1vjZ7jayzV/10saxuY9Dxvy7ZPe9SY2iiHt7QMX8Q0
         4meUwX0OKdjssMluZq2ZnD4vG3MeoMpmx6E7hbBd0OxbUWuJkJ0/gOAnwGOajJ8JglWW
         AChiACHQ0bKB9AHCasVdZvMsJXmXJyx9SJmSLgsWc9Ya49QyS7qDkzcPOMd8+p9Xa8CK
         f8yJF/+JDOX7xA/4Nq5BAzUEz1ZrIUx6CQRvDZ2Gy/t0IZKxoG3lTX41Q6G1lQIl3rjl
         LoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LhS9tD7SvsG3f30qBsS7AzNDrX3/gQHRk3YrLNvlZOA=;
        b=h0QELOfJz1HqC0pMQLY4VKf/+Cbnb7iifOi9ALFtNxWpFBT3vPQJJD2ewcCfDYf3dm
         TeHfu1+5SiXW1RpJiu2w95rtoXM9YhW43093dx04BI1yGDkSs2jlpzPEFMte6d4UGL1Y
         PP1OGUQPORiOmAV5V6VBy0S0iaBYbyAtwCjGSrd5uc+QFvFb90u0xXcFyTSBp6UXk867
         Ub8hWDqymtWWL2wHI4PxOWETAyIH2NT/NG5GNz2/znn6rO0fdyKYKmClKz7u3eB9coNE
         XrAGUJNjISgx13FLIQSiyQ5gBqE0dl9078SHwMGhh7osEzZISyPZwcKJMNoWLhP+vto4
         uuPQ==
X-Gm-Message-State: AOAM530iHbn6ZILpwbQVFIJisHcPquz9mTR2n1PcwEM7fCxEHPwlkaQu
        q4GOtKXXCJWA2QaF7YDlIUd3Mt6lZUHvm57+1mQ=
X-Google-Smtp-Source: ABdhPJx790xAH1rBOESsyw6YMCOPQAeo4g+Z4lZL05LND9tv5WIYhOnO1Y0bAo5lSHAAxsKY81MMaMLnZ4X3BK74/2I=
X-Received: by 2002:a17:902:407:: with SMTP id 7mr15480051ple.167.1598519847448;
 Thu, 27 Aug 2020 02:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-20-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-20-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:17:10 +0300
Message-ID: <CAHp75VdMqB2-TrNPvqp+gMbyY39ytJ9O8ZM5cY1r2kVdi4DbzA@mail.gmail.com>
Subject: Re: [PATCH 20/24] Input: resistive-adc-touch - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/resistive-adc-touch.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
> index cfc8bb4553f7..46b5a6caef84 100644
> --- a/drivers/input/touchscreen/resistive-adc-touch.c
> +++ b/drivers/input/touchscreen/resistive-adc-touch.c
> @@ -108,12 +108,8 @@ static int grts_probe(struct platform_device *pdev)
>
>         /* get the channels from IIO device */
>         st->iio_chans = devm_iio_channel_get_all(dev);
> -       if (IS_ERR(st->iio_chans)) {
> -               error = PTR_ERR(st->iio_chans);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "can't get iio channels.\n");
> -               return error;
> -       }
> +       if (IS_ERR(st->iio_chans))
> +               return dev_err_probe(dev, PTR_ERR(st->iio_chans), "can't get iio channels\n");
>
>         chan = &st->iio_chans[0];
>         st->pressure = false;
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
