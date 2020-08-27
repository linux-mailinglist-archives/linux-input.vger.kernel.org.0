Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7588225419B
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgH0JMK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgH0JMJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:12:09 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B8DC061264;
        Thu, 27 Aug 2020 02:12:09 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g33so2913944pgb.4;
        Thu, 27 Aug 2020 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=15VQltvXzcU3c96FMvPFXAk5p+iP3sUmrV+0jxuOSgw=;
        b=DV0DF3U9sbStBKdimmEdltukG+JzCuNafqquKEKZf+DfOxN0ZXwaoznJhWM9ah0ljC
         vqPDxuruj+PrEcCQx/k3M1Kzi/GCegHCyjlRqk6ifUkKOvYGIiaurLf9w6NvAagai+3s
         l3Ppt8rkvzVkNu3WN1g84v4ocmWukrJUaKdRh1XfpeaN6rf7lQgGJXLiW57R5fZ66Cf5
         +XVwA0AM1b6brMEhx3YiO9IdjxHobc6RKp5l1o40D6WBv+Vhc7QS8MJorLzU7skjEULS
         IZ2PBV9WngsAt68ztfNYWU3+gQeb4J8dgERD0NDKP0wPtxk6ryCJ/v06CX2vo1qJGDDa
         4szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=15VQltvXzcU3c96FMvPFXAk5p+iP3sUmrV+0jxuOSgw=;
        b=aDjL5oiZfHMaMJG2DgrssnVGVgWecealTF+8qK+zIp2/kjovEuMEZBZ9OXowV5/a2e
         VZDVb5sUAMSxvAuomGHf1a31u10YIiiu9AvsRHME7tBE3H6SAUa1R31VaNtRG5Kb06op
         SqGxbmuPvAsxKad3CxhJf0E3WT1DOnP0i0VAl+FRFsJwhRDsyVHHEO2ghiQElVWMStGr
         GfaEf/Hgf8DXG+gt2tCwemXrOgEmtBT4uXlyaYSzabIyIJLhygEkkdBy6rvQbSHvu3Pi
         GuBp6S2HW0bHBBHbpItnOk832C9r4ZfVctdYF2+CsTwyj/RMWgPIpUeecNAPkOkyzsAw
         lO3Q==
X-Gm-Message-State: AOAM532PhuWzlVe8zIi0W76HGvYLKTK7udzPEVK7wNu6VUIMkIMLYevG
        1khhLhGKsZX/Y5li7RiJwRIiF+MIwqww3njmXXY5HbVlLD8Tl5vd
X-Google-Smtp-Source: ABdhPJyI1SrDxICKC6ryCuXLWo/Mrs/JyP5zfOshVRvkmZXscs0JHef+FLATA+t+OMYqRpW6FM7D0WJmXt1oPMKIkrU=
X-Received: by 2002:a17:902:8208:: with SMTP id x8mr4107603pln.65.1598519528910;
 Thu, 27 Aug 2020 02:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-12-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-12-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:11:52 +0300
Message-ID: <CAHp75VeRGTp+SW9jYM5_gVdc5EXzb8Y1Ba1czhMiS3WZ78idCg@mail.gmail.com>
Subject: Re: [PATCH 12/24] Input: cy8ctma140 - Simplify with dev_err_probe()
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
>  drivers/input/touchscreen/cy8ctma140.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
> index a9be29139cbf..23da5bb00ead 100644
> --- a/drivers/input/touchscreen/cy8ctma140.c
> +++ b/drivers/input/touchscreen/cy8ctma140.c
> @@ -259,12 +259,8 @@ static int cy8ctma140_probe(struct i2c_client *client,
>         ts->regulators[1].supply = "vdd";
>         error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
>                                       ts->regulators);
> -       if (error) {
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get regulators %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(dev, error, "Failed to get regulators\n");
>
>         error = cy8ctma140_power_up(ts);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
