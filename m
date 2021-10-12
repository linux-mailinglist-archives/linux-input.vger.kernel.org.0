Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2AA429EA8
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 09:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhJLHc4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 03:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbhJLHcz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 03:32:55 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20568C061570;
        Tue, 12 Oct 2021 00:30:54 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i12so51204201wrb.7;
        Tue, 12 Oct 2021 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JnveVyUJxymNAFHeYFircy9L/buzTM+7agfcS4bgS2o=;
        b=TU62GjX2/BZDoFark1y4nnk0jlgAgrIF/JtLmiZnhk/Z4Y6xlod4+x/C0K66hsDJRJ
         MmGkW96ZAesQxpXtVHQpXaHhwadUf5VYF26bFRl/y0XzfweSwN/CQDuc+yKj3kCgcVyy
         M+z9wSHZEQDTIJ5CKMOGUe5ZXp8BRZmXmIetYOLZuuf7/woTXd70h9qc9+kE/gB9orSk
         scpIKU823W33z5tLxDCZEXVMLVY5tdwnFRNSTNvYtWX04016eJ2cTU9lfqO2lvlBj5OT
         J8EYsqdvvZyuSzAC2vSxRUYH3lVbI4CSLNEOSzeuSA1Eg5d5baLZO+5GIulBe8LgQdt4
         Jxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JnveVyUJxymNAFHeYFircy9L/buzTM+7agfcS4bgS2o=;
        b=Mj22CQIKr0rG7R04kz3RbkPdI3vvNcM0xnx9hHxRcGnMZpbzeZzcFxmZTMq4vcXhwB
         zahLSISreifc4ONq7o1XSARU68h/Xd/gGBFAfZGZhb3J2WUXb7EvMW5bZdExUCQM1RfO
         3fZnRX7PEgMN7z2dzlWHQGrtEjfIT81oG1DkRnxnq9qGZMtuGcZzkuPA9EadefH+yj0Y
         INyFhVwsmTy7azd1EPEBhugklUUPW2BHlpzrTaxpg/bMmyVj3vHsLbkWmcS/UuxFoWGP
         EjsnJuH6c85D/lTXLAyaN+bvkhEv9Ly/F8O4NOnhFCh78EgQNHyfRlRl6i+/3URKnwyz
         jJjg==
X-Gm-Message-State: AOAM530/TPaEDWq6r4lKnP66YLgCNAaUG6XQOrVcn83KYxaGKEqPtEIG
        mvitWM9SKyCJq2f5gxR5XqM=
X-Google-Smtp-Source: ABdhPJwuahxXDHHhV8wkQVubDOGdt2+/V5al4MPm2RApziKBwUSF7QkB06Gegto/1uXFcxE4I9fj0Q==
X-Received: by 2002:a05:600c:3595:: with SMTP id p21mr3803779wmq.71.1634023852780;
        Tue, 12 Oct 2021 00:30:52 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
        by smtp.gmail.com with ESMTPSA id j14sm4237565wrw.12.2021.10.12.00.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 00:30:52 -0700 (PDT)
Message-ID: <f7ea1bc2e2c50aa4cc75af3bba2d09803a485b93.camel@gmail.com>
Subject: Re: [PATCH 3/4] Input: ep93xx_keypad - use dev_pm_set_wake_irq()
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 09:30:46 +0200
In-Reply-To: <20211012013735.3523140-3-dmitry.torokhov@gmail.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
         <20211012013735.3523140-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

On Mon, 2021-10-11 at 18:37 -0700, Dmitry Torokhov wrote:
> Instead of manually toggling interrupt as wakeup source in suspend/resume
> methods, let's declare keypad interrupt and wakeup interrupt and leave the
> rest to the PM core.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/input/keyboard/ep93xx_keypad.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
> index 6be5474ba2f2..a66cfeaf5b21 100644
> --- a/drivers/input/keyboard/ep93xx_keypad.c
> +++ b/drivers/input/keyboard/ep93xx_keypad.c
> @@ -27,6 +27,7 @@
>  #include <linux/slab.h>
>  #include <linux/soc/cirrus/ep93xx.h>
>  #include <linux/platform_data/keypad-ep93xx.h>
> +#include <linux/pm_wakeirq.h>
>  
>  /*
>   * Keypad Interface Register offsets
> @@ -191,9 +192,6 @@ static int __maybe_unused ep93xx_keypad_suspend(struct device *dev)
>  
>         mutex_unlock(&input_dev->mutex);
>  
> -       if (device_may_wakeup(&pdev->dev))
> -               enable_irq_wake(keypad->irq);
> -
>         return 0;
>  }
>  
> @@ -203,9 +201,6 @@ static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
>         struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
>         struct input_dev *input_dev = keypad->input_dev;
>  
> -       if (device_may_wakeup(&pdev->dev))
> -               disable_irq_wake(keypad->irq);
> -
>         mutex_lock(&input_dev->mutex);
>  
>         if (input_device_enabled(input_dev)) {
> @@ -316,7 +311,11 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
>                 goto failed_free_irq;
>  
>         platform_set_drvdata(pdev, keypad);
> +
>         device_init_wakeup(&pdev->dev, 1);
> +       err = dev_pm_set_wake_irq(&pdev->dev, keypad->irq);
> +       if (err)
> +               dev_warn(&pdev->dev, "failed to set up wakeup irq: %d\n", err);
>  
>         return 0;
>  
> @@ -342,6 +341,8 @@ static int ep93xx_keypad_remove(struct platform_device *pdev)
>         struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
>         struct resource *res;
>  
> +       dev_pm_clear_wake_irq(&pdev->dev);
> +
>         free_irq(keypad->irq, keypad);
>  
>         if (keypad->enabled)

-- 
Alexander Sverdlin.


