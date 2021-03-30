Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB22534E5CC
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 12:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhC3Kvk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 06:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbhC3Kva (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 06:51:30 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C2FC061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:51:30 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id x17so15954400iog.2
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1IX1yi+xLPnjaEpjWPMrEMJIGANgZ+03OMh3631lGnM=;
        b=YtOFDLY4049XIyCQdCPthlg7jV1qhRzJZQXZf+XB+WZNiKVKpoq0RcoXnbL3od9nwf
         jWDnhbeJNr4iYtKWoR5UCxLIaIOT6OQZp1TQeXcbbiWcAcvVZHGc5rtWnNqBdS7jSEM9
         tLdAF4e00zz3sV4g5uiOgVmLFeaWq1xK0PXBp3cU4yRn72fdYPeYJTF8vNQkGI3zM92U
         pfR3wtqOmMdU1AE8a7ZKqppPi8lALVoChBChMi2skkA7kp1xz5WUtNCT7goq1uuC7hpS
         mkgv1QTvkqTmMFvHLPnIpChnVPRV0vyA6tWtySz4Rr6+eV1eYUhm8JDy6ylW9dZoOIW0
         +55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1IX1yi+xLPnjaEpjWPMrEMJIGANgZ+03OMh3631lGnM=;
        b=NU5t5ZvN7antf/Q4ND1pnB9eXfDazwtC0heqytLmJ1LVYnr1NDlEf55yEMwmZHbJSv
         zTshSmPeO09Hx2Fjj3MBhdt8wKBscLRWRa/ry+iOIArimhIoO5p3JU6lyKgPuaaJcojQ
         UTYsRWXjFeNtmx/P+DSGPxOQn0b8ID2q6v9rbQCNndqQdVyZxCRtx0TH1tEDyuSb76lU
         zBzUdJgQjJmZE++4g6/u5Oo/S4L6bohPlCxzgMtA9H1e5Sr2Pj/LC2xWRyYFk8qtjDTU
         n7Rq0PFrP7y59vGJEkYYfMVfpsFYG3Vxk+o8RRAxP4FkMp7Uh869hVhmS/NzAvo/RP3S
         sKAA==
X-Gm-Message-State: AOAM532xtYRuTKQ52NUwZKkDDjbUYPSsazjnMTV/icdlMyfRpJuHGrbq
        X2Hng2gyIQDNVDgbZgcEZFGMNY3Jc8HoTMc+tMn2Eg==
X-Google-Smtp-Source: ABdhPJxeO/FWbgo29U84BvC+AgLR9zvC+ttWWMQCZ2vdvlJvWXrJJUbi60qZmzimQBXe5QYx5W0SCjWmhm7hBhQhlEw=
X-Received: by 2002:a6b:e312:: with SMTP id u18mr24119959ioc.58.1617101490029;
 Tue, 30 Mar 2021 03:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085424.2244653-1-linus.walleij@linaro.org> <20210330085424.2244653-2-linus.walleij@linaro.org>
In-Reply-To: <20210330085424.2244653-2-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 30 Mar 2021 12:51:19 +0200
Message-ID: <CABxcv=kspnfCM+pQfFhEJJXhp2FqRsJ8uxt5v3voqmQoV-G=tg@mail.gmail.com>
Subject: Re: [PATCH 1/7] Input: cyttsp - Probe from compatibles
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Linus,

On Tue, Mar 30, 2021 at 10:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The driver (both SPI and I2C interface) should probe from
> the compatible strings, cypress,cy8ctma340 etc when using
> device tree, not as now, where it is probing implicitly from
> the I2C/SPI node name "cypress,cyttsp-i2c" etc.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/input/touchscreen/cyttsp_i2c.c | 7 +++++++
>  drivers/input/touchscreen/cyttsp_spi.c | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/input/touchscreen/cyttsp_i2c.c b/drivers/input/touchscreen/cyttsp_i2c.c
> index 061debf64a2b..0f097f34832a 100644
> --- a/drivers/input/touchscreen/cyttsp_i2c.c
> +++ b/drivers/input/touchscreen/cyttsp_i2c.c
> @@ -52,10 +52,17 @@ static const struct i2c_device_id cyttsp_i2c_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, cyttsp_i2c_id);
>
> +static const struct of_device_id cyttsp_of_i2c_match[] = {
> +       { .compatible = "cypress,cy8ctma340", },
> +       { .compatible = "cypress,cy8ctst341", },
> +       { /* sentinel */ }
> +};
> +

I think we want to export this as modalias with
MODULE_DEVICE_TABLE(of, cyttsp_of_i2c_match) so the driver could be
autoloaded if built as a module ?

>  static struct i2c_driver cyttsp_i2c_driver = {
>         .driver = {
>                 .name   = CY_I2C_NAME,
>                 .pm     = &cyttsp_pm_ops,
> +               .of_match_table = cyttsp_of_i2c_match,
>         },
>         .probe          = cyttsp_i2c_probe,
>         .id_table       = cyttsp_i2c_id,
> diff --git a/drivers/input/touchscreen/cyttsp_spi.c b/drivers/input/touchscreen/cyttsp_spi.c
> index 54e410921d53..ad8b3c6c4d3e 100644
> --- a/drivers/input/touchscreen/cyttsp_spi.c
> +++ b/drivers/input/touchscreen/cyttsp_spi.c
> @@ -160,10 +160,17 @@ static int cyttsp_spi_probe(struct spi_device *spi)
>         return 0;
>  }
>
> +static const struct of_device_id cyttsp_of_spi_match[] = {
> +       { .compatible = "cypress,cy8ctma340", },
> +       { .compatible = "cypress,cy8ctst341", },
> +       { /* sentinel */ }
> +};
> +

And same here.

Other than that, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
