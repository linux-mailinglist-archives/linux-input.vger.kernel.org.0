Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99631232BDE
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 08:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgG3GTo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 02:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgG3GTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 02:19:43 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDF2C061794;
        Wed, 29 Jul 2020 23:19:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e4so113518pjd.0;
        Wed, 29 Jul 2020 23:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7sLH0f+gva54AANCFXOi4hfUciaEwWDTPWFMS6fyuNQ=;
        b=gxENsRRjmRt4hYykIkMYfhy7oEjiNxJMHjQJ2hpjtanoK/gTdGAYgVMW9/pfAGsXIm
         7ywfiC4aIQA9HS6p+4y1zst7Gcp6rC7bufK0aNja47Gbk2yO9iSxn0WdaumvbDJYeeKW
         m764Hmz3bwEdrXUXk7ZmbWH2CcoF4zlCeAWvt+mk0DEnz67AXBHAFkEojdvOriBnXzZH
         oB93FEKJ2dzP+9WTPHnl6H/mrvH2KgSjLWAvFFaJaKAzk1e/y1BEsgeDiOb7UkbV1OBD
         U1YRCKP1byhPkOruzCTBSo7EK75Mfa0atDXjOiJ5LAt652wOGgGZAUp+lg0ux2DCCNMH
         Rz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7sLH0f+gva54AANCFXOi4hfUciaEwWDTPWFMS6fyuNQ=;
        b=K7OGbFhCGppkcKhHD5rM7f6a++lQvn0JcXYE/ytJt4OSXMYpNrTYTlV87DLFgP2xcF
         S3a6GVvqDhYvDUct1y2/8R4mxo4QmNg7r9ATFC6VIs6OIY+hoDRDnqxBHkwwIJSJ3rn2
         9sg6Wogciqc370499ojnBHdE4x70czUi3FIxd0ATO77ue866WbqRdhdr1pPjQdoq/JNJ
         tmA925sMGZqFdF79tvFD/tLOUa8qf1I77wk61Rz/TUvyCIjsuBH9d96kHReqMN8f/z4B
         guBgdTjkETvE7qgbqXgLVEsIJ58WP106vpUERyf9XLWZHTJrdBeCwcKEqEbaxizqqf9X
         AgqQ==
X-Gm-Message-State: AOAM530FoJ1nFJ3D/8OmlMjq11JT4fZjFqL2vv7JWH67yXIwHXph/6r5
        /wztuDcsIPUvMF6TcShafws=
X-Google-Smtp-Source: ABdhPJwGcoK2hmjgbxI7ge21+8vA+2hytsqnAprehXpM2qsg8Hsp+TRZ7lIZ9ggp8fv0ddu5Fv2XWg==
X-Received: by 2002:a17:90a:bc45:: with SMTP id t5mr4706364pjv.139.1596089983001;
        Wed, 29 Jul 2020 23:19:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q6sm4540275pfg.76.2020.07.29.23.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 23:19:42 -0700 (PDT)
Date:   Wed, 29 Jul 2020 23:19:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] input: gpio-vibra: Allow to use vcc-supply alone
 to control the vibrator
Message-ID: <20200730061939.GF1665100@dtor-ws>
References: <20200714102303.3007896-1-megous@megous.com>
 <20200714102303.3007896-3-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714102303.3007896-3-megous@megous.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ondrej,

On Tue, Jul 14, 2020 at 12:23:01PM +0200, Ondrej Jirman wrote:
> Make enable-gpio optional to allow using this driver with boards that
> have vibrator connected to a power supply without intermediate gpio
> based enable circuitry.
> 
> Also avoid a case where neither regulator nor enable gpio is specified,
> and bail out in probe in such a case.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/input/misc/gpio-vibra.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
> index f79f75595dd7..b3bb7e61ed1d 100644
> --- a/drivers/input/misc/gpio-vibra.c
> +++ b/drivers/input/misc/gpio-vibra.c
> @@ -39,7 +39,7 @@ static int gpio_vibrator_start(struct gpio_vibrator *vibrator)
>  	struct device *pdev = vibrator->input->dev.parent;
>  	int err;
>  
> -	if (!vibrator->vcc_on) {
> +	if (vibrator->vcc && !vibrator->vcc_on) {
>  		err = regulator_enable(vibrator->vcc);
>  		if (err) {
>  			dev_err(pdev, "failed to enable regulator: %d\n", err);
> @@ -57,7 +57,7 @@ static void gpio_vibrator_stop(struct gpio_vibrator *vibrator)
>  {
>  	gpiod_set_value_cansleep(vibrator->gpio, 0);
>  
> -	if (vibrator->vcc_on) {
> +	if (vibrator->vcc && vibrator->vcc_on) {
>  		regulator_disable(vibrator->vcc);
>  		vibrator->vcc_on = false;
>  	}
> @@ -112,7 +112,7 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
>  	if (!vibrator->input)
>  		return -ENOMEM;
>  
> -	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> +	vibrator->vcc = devm_regulator_get_optional(&pdev->dev, "vcc");

I know it is very surprising, but regulator_get_optional does not return
NULL when regulator is not present, but rather ERR_PTR(-ENODEV). You
need to replace it with NULL in the branch below, or change conditions
to !IS_ERR(virbrator->vcc) (and still handle -ENODEV in the branch
below).

>  	err = PTR_ERR_OR_ZERO(vibrator->vcc);
>  	if (err) {
>  		if (err != -EPROBE_DEFER)
> @@ -121,7 +121,8 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
> +	vibrator->gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> +						 GPIOD_OUT_LOW);
>  	err = PTR_ERR_OR_ZERO(vibrator->gpio);
>  	if (err) {
>  		if (err != -EPROBE_DEFER)
> @@ -130,6 +131,11 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	if (!vibrator->vcc && !vibrator->gpio) {
> +		dev_err(&pdev->dev, "Neither gpio nor regulator provided\n");
> +		return -EINVAL;
> +	}
> +
>  	INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
>  
>  	vibrator->input->name = "gpio-vibrator";
> -- 
> 2.27.0
> 

Thanks.

-- 
Dmitry
