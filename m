Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C8242B5D4
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 07:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236949AbhJMFoq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 01:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhJMFoq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 01:44:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4DAC061570;
        Tue, 12 Oct 2021 22:42:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e12so4237524wra.4;
        Tue, 12 Oct 2021 22:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=X8IUFVtHBDK0nkW4zHEltgsRA5yYarSXTrxjg+Pa+f4=;
        b=ZgMFXUDfjhXsyiCwxZRnAGEo4fNIex+N5C83pxu60X0p+vZ8kbYtORONlfOcd/NCi6
         8Z81mAHBBQ/U5LWHqdvC8gVgSbvN5gXE25pYFWJLAbcolCVqxAalU7GyVNm4r2aDIDFt
         TnTegBJaXatTGYAhGM62oFB+JHd6PaF+ZG/2BuH/HiTDkIczzGMYxMDJLEN9iVslkrWn
         V5/y4UU2uVwRNFOtZDE1Sd2CZl2gjY7Ls88RrwXxl5NEY3LwI8DaBPWR7vQnEmcntSgu
         XrgS4NVrLKpAfFAGuZ1XgNzvhfXZOzWT9szZJ03G+Y+AtT/00Lf3y2oFz9T4TZ34/kFu
         Jzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=X8IUFVtHBDK0nkW4zHEltgsRA5yYarSXTrxjg+Pa+f4=;
        b=1aF5nabTDoB9DLYpMHgjrXBk7LHlT2Km5rz7nCe2jWfXoRvN4zCNv8z0hRWUl24Cvt
         KLKfniO+xoR0fs0jsDcbGYWyv/WRihNLGyIbGPSA/pk4XhYpFdh1hGpL2Df6tNPIx9Ra
         Hjj87RY67VvTaZntRtFhiNNVVrT5bZJjozdGsym5RivcmSf8JxXujHQ88yO2qNeFhVln
         07xf3jfmOT/88+UzEVn36ibAI8BEPG+aw05gEUdHIA/n73lP55c9IYAoVJ21RoX6RyyM
         lBvv8DlZA8klwyCVB3P76cTDAMV6R45VWOLjE675b132chLnO7rl1O48ZjSe6rRQmaUY
         NuvQ==
X-Gm-Message-State: AOAM530/mzOGomaSx2wvsoXS2bQwyJbSlAF97WSuckYFMLmNA6ANn5zC
        YE6ymReeDN0USb/BTmZVM7BANzcf8J4=
X-Google-Smtp-Source: ABdhPJyEbxFSbkIEuvFEDDvTf5ZmNminR5OK6Ll8Iqb3zf61BKwmjk6JzrVq95QmuWrVJPbs14d1wA==
X-Received: by 2002:a05:600c:3b88:: with SMTP id n8mr10505035wms.93.1634103761893;
        Tue, 12 Oct 2021 22:42:41 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
        by smtp.gmail.com with ESMTPSA id f127sm4089356wmf.16.2021.10.12.22.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 22:42:41 -0700 (PDT)
Message-ID: <e471fd409f9b07f2813fabd2e585441c39140400.camel@gmail.com>
Subject: Re: [PATCH v2 4/4] Input: ep93xx_keypad - switch to using managed
 resources
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Wed, 13 Oct 2021 07:42:40 +0200
In-Reply-To: <YWZGKWgdarGtvtYA@google.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
         <20211012013735.3523140-4-dmitry.torokhov@gmail.com>
         <YWZGKWgdarGtvtYA@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2021-10-12 at 19:36 -0700, Dmitry Torokhov wrote:
> By using managed resources (devm) we are able to streamline error handling
> in probe and remove most of the custom remove method.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/input/keyboard/ep93xx_keypad.c | 118 ++++++++-----------------
>  1 file changed, 37 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
> index a66cfeaf5b21..272a4f1c6e81 100644
> --- a/drivers/input/keyboard/ep93xx_keypad.c
> +++ b/drivers/input/keyboard/ep93xx_keypad.c
> @@ -219,6 +219,13 @@ static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(ep93xx_keypad_pm_ops,
>                          ep93xx_keypad_suspend, ep93xx_keypad_resume);
>  
> +static void ep93xx_keypad_release_gpio_action(void *_pdev)
> +{
> +       struct platform_device *pdev = _pdev;
> +
> +       ep93xx_keypad_release_gpio(pdev);
> +}
> +
>  static int ep93xx_keypad_probe(struct platform_device *pdev)
>  {
>         struct ep93xx_keypad *keypad;
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
>  
> -       keypad->clk = clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(keypad->clk)) {
> -               err = PTR_ERR(keypad->clk);
> -               goto failed_free_gpio;
> -       }
> +       err = devm_add_action_or_reset(&pdev->dev,
> +                                      ep93xx_keypad_release_gpio_action, pdev);
> +       if (err)
> +               return err;
>  
> -       input_dev = input_allocate_device();
> -       if (!input_dev) {
> -               err = -ENOMEM;
> -               goto failed_put_clk;
> -       }
> +       keypad->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(keypad->clk))
> +               return PTR_ERR(keypad->clk);
> +
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
> @@ -318,48 +310,12 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
>                 dev_warn(&pdev->dev, "failed to set up wakeup irq: %d\n", err);
>  
>         return 0;
> -
> -failed_free_irq:
> -       free_irq(keypad->irq, keypad);
> -failed_free_dev:
> -       input_free_device(input_dev);
> -failed_put_clk:
> -       clk_put(keypad->clk);
> -failed_free_gpio:
> -       ep93xx_keypad_release_gpio(pdev);
> -failed_free_io:
> -       iounmap(keypad->mmio_base);
> -failed_free_mem:
> -       release_mem_region(res->start, resource_size(res));
> -failed_free:
> -       kfree(keypad);
> -       return err;
>  }
>  
>  static int ep93xx_keypad_remove(struct platform_device *pdev)
>  {
> -       struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
> -       struct resource *res;
> -
>         dev_pm_clear_wake_irq(&pdev->dev);
>  
> -       free_irq(keypad->irq, keypad);
> -
> -       if (keypad->enabled)
> -               clk_disable(keypad->clk);
> -       clk_put(keypad->clk);
> -
> -       input_unregister_device(keypad->input_dev);
> -
> -       ep93xx_keypad_release_gpio(pdev);
> -
> -       iounmap(keypad->mmio_base);
> -
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       release_mem_region(res->start, resource_size(res));
> -
> -       kfree(keypad);
> -
>         return 0;
>  }
>  

-- 
Alexander Sverdlin.


