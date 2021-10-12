Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDAF429F0E
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 09:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhJLH4m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 03:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbhJLH4g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 03:56:36 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF0AC061570;
        Tue, 12 Oct 2021 00:54:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id g25so17591076wrb.2;
        Tue, 12 Oct 2021 00:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HKuT/D8qVViUw2gxA0/HmU1GWW5VjW93NEn5MXSMe80=;
        b=IIN+UgZ24O9euQBLuKkzj0fFJXOkGUF0XYCpGp3Rftca7gzT3RBykalVbd1sfmodmO
         dOjKAst4cKDSXK+NuhyEejTYNalTgCe1QvbSe3mADzHdWkQ76Iuv+1aOUQIvJWL64rFn
         bfjkh2oR0qvydRbhz3WBOTvE6bDyejw+GfSI6zMmsiYmkBS9otBVeOOcVHkSj6BWA4sO
         JSOvojIH2I5De9RMOBX1uxKoHqY86aSuHmekgzFjG5ieWDF53GknLH83eB3k+brVt4Qc
         pjp/Fk4LJ/o9sFw3tp/ryNL2yGuRrDJ/XmPGcoaAQ2JHs3kDRzzooaUR100F7vXoftSh
         46wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HKuT/D8qVViUw2gxA0/HmU1GWW5VjW93NEn5MXSMe80=;
        b=G0ev+bk8i/tDW+rs0PYut9SYplO8wEOH7p5ArgqgWQ4awK9/YqckNS2Okdtv2Dr26C
         ZnxMDBX9NM/pz8vhYAiaNdjrAjAweSthU/utYFSxoGm1SwUZxkz8w6B8U/e2IilwCoIw
         f1MLLTyLVyzUQfQnAHYsmx3zPALedOnlxrwWA1ayXxR5WOCrAGHPE/JhqfCZjIXtTzeD
         kAsQdq9Bqi4fvmroaFtE0tGTKZP6P2o4mMP8buiKZS/ScBjTyumIN4no70jPe5szDYBw
         WfAFtQN4kMC+tLWb4J6CejFFE2H2wam6VSaqhZbst3RiaXAOIRyMIt+Rze/L9DLyWvEY
         J1kQ==
X-Gm-Message-State: AOAM530W4M64CsDIxfFLR8CoAlOJC1YCuFfwt7Qx0TiXtSVNwPqKgh8k
        fhETmOhuyS7ID0+/CS7dXuBrieVTqXo=
X-Google-Smtp-Source: ABdhPJxzPOMi2x3spe0XSSBA7R4p8Dr4AOJoRQeEDt1EPNNUT9xnxlauMeqA4DJtb8XVZOUtqnrcpg==
X-Received: by 2002:adf:9bce:: with SMTP id e14mr29771039wrc.353.1634025273521;
        Tue, 12 Oct 2021 00:54:33 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
        by smtp.gmail.com with ESMTPSA id z12sm1647336wmk.38.2021.10.12.00.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 00:54:33 -0700 (PDT)
Message-ID: <d1d1a1028c5db26d0b0eed2a5a9626124451fcf9.camel@gmail.com>
Subject: Re: [PATCH 4/4] Input: ep93xx_keypad - switch to using managed
 resources
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 09:54:32 +0200
In-Reply-To: <20211012013735.3523140-4-dmitry.torokhov@gmail.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
         <20211012013735.3523140-4-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

just one question below:

On Mon, 2021-10-11 at 18:37 -0700, Dmitry Torokhov wrote:
> By using managed resources (devm) we are able to streamline error handling
> in probe and remove most of the custom remove method.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/ep93xx_keypad.c | 116 ++++++++-----------------
>  1 file changed, 36 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
> index a66cfeaf5b21..90157707dc05 100644
> --- a/drivers/input/keyboard/ep93xx_keypad.c
> +++ b/drivers/input/keyboard/ep93xx_keypad.c

...

> @@ -227,61 +234,46 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
>         struct resource *res;
>         int err;
>  
> -       keypad = kzalloc(sizeof(struct ep93xx_keypad), GFP_KERNEL);
> +       keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
>         if (!keypad)
>                 return -ENOMEM;
>  
>         keypad->pdata = dev_get_platdata(&pdev->dev);
> -       if (!keypad->pdata) {
> -               err = -EINVAL;
> -               goto failed_free;
> -       }
> +       if (!keypad->pdata)
> +               return -EINVAL;
>  
>         keymap_data = keypad->pdata->keymap_data;
> -       if (!keymap_data) {
> -               err = -EINVAL;
> -               goto failed_free;
> -       }
> +       if (!keymap_data)
> +               return -EINVAL;
>  
>         keypad->irq = platform_get_irq(pdev, 0);
> -       if (keypad->irq < 0) {
> -               err = keypad->irq;
> -               goto failed_free;
> -       }
> +       if (keypad->irq < 0)
> +               return keypad->irq;
>  
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               err = -ENXIO;
> -               goto failed_free;
> -       }
> -
> -       res = request_mem_region(res->start, resource_size(res), pdev->name);
> -       if (!res) {
> -               err = -EBUSY;
> -               goto failed_free;
> -       }
> +       if (!res)
> +               return -ENXIO;
>  
> -       keypad->mmio_base = ioremap(res->start, resource_size(res));
> -       if (keypad->mmio_base == NULL) {
> -               err = -ENXIO;
> -               goto failed_free_mem;
> -       }
> +       keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(keypad->mmio_base))
> +               return PTR_ERR(keypad->mmio_base);
>  
>         err = ep93xx_keypad_acquire_gpio(pdev);
>         if (err)
> -               goto failed_free_io;
> +               return err;
> +
> +       err = devm_add_action_or_reset(&pdev->dev,
> +                                      ep93xx_keypad_release_gpio_action, pdev);
> +       if (err)
> +               return err;
>  
>         keypad->clk = clk_get(&pdev->dev, NULL);

Isn't the conversion to devm_clk_get() missing here?

> -       if (IS_ERR(keypad->clk)) {
> -               err = PTR_ERR(keypad->clk);
> -               goto failed_free_gpio;
> -       }
> +       if (IS_ERR(keypad->clk))
> +               return PTR_ERR(keypad->clk);
>  
> -       input_dev = input_allocate_device();
> -       if (!input_dev) {
> -               err = -ENOMEM;
> -               goto failed_put_clk;
> -       }
> +       input_dev = devm_input_allocate_device(&pdev->dev);
> +       if (!input_dev)
> +               return -ENOMEM;
>  
>         keypad->input_dev = input_dev;
>  
> @@ -289,26 +281,26 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
>         input_dev->id.bustype = BUS_HOST;
>         input_dev->open = ep93xx_keypad_open;
>         input_dev->close = ep93xx_keypad_close;
> -       input_dev->dev.parent = &pdev->dev;
>  
>         err = matrix_keypad_build_keymap(keymap_data, NULL,
>                                          EP93XX_MATRIX_ROWS, EP93XX_MATRIX_COLS,
>                                          keypad->keycodes, input_dev);
>         if (err)
> -               goto failed_free_dev;
> +               return err;
>  
>         if (keypad->pdata->flags & EP93XX_KEYPAD_AUTOREPEAT)
>                 __set_bit(EV_REP, input_dev->evbit);
>         input_set_drvdata(input_dev, keypad);
>  
> -       err = request_irq(keypad->irq, ep93xx_keypad_irq_handler,
> -                         0, pdev->name, keypad);
> +       err = devm_request_irq(&pdev->dev, keypad->irq,
> +                              ep93xx_keypad_irq_handler,
> +                              0, pdev->name, keypad);
>         if (err)
> -               goto failed_free_dev;
> +               return err;
>  
>         err = input_register_device(input_dev);
>         if (err)
> -               goto failed_free_irq;
> +               return err;
>  
>         platform_set_drvdata(pdev, keypad);
>  

-- 
Alexander Sverdlin.


