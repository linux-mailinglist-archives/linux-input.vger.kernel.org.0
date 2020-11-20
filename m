Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1142BA324
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 08:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgKTHZn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 02:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgKTHZn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 02:25:43 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8625C0613CF
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 23:25:42 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id b63so7000405pfg.12
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 23:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1NIHxbi5eN0Dg9dFeuUeDv/w7VQXUKrWk3uXK00RFA4=;
        b=a7/79FPqpFZj+9TtJK8jbUeEfM+pto4H81MJHKFFM5CBqysOPaqym8rizD8SeTiSWz
         dVWzFjOj9i4DArThzgtkK84zParFYLOHIif9ngsz0+ruogWVD9m4T3EMMM/Ldo5Cd+RX
         2Ymx8gBNu64vFfSTUotTKQ7IYLHM2K9NAZTYNvBCa4rcgcj6FKyrtGbdXF6kOUTXLaV0
         M7g9y8sohUbQ+b2ZeAg7cxobW336Kve2Jb2u+N1fp0JZ+rOu7cTdOf16KPE49urqZyo2
         k28aCkBLezgYaz3y+c6lWV4+BhporRHSzC57KV2CAeFYlokYMfyP3qZbI+RBJP5+gc2w
         o7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1NIHxbi5eN0Dg9dFeuUeDv/w7VQXUKrWk3uXK00RFA4=;
        b=NbWaBtbGFyFfkARaVR67HOUaPRikRmSDGHTaH9JemAHnK2aqAGgKL6iMA0vNcV1nmD
         vRxljS6q5FQzjygqF6kBPimjvN2BghVfWM1eS7FPwR+kwn0ImrdxfpF8Xfe8qoW4MK8U
         M5hjZYCS8P/MJXxzNU9CQB5SywvD/hJM1pkuCW0cDY+h96OojvsbeHfP+Y9vk0R5PGi3
         y9pLcWmFayrH5UZ4Ke5bu0YEjJdFZ3cBKR28AK5EculWeP+8l2C10dMNxdPzd7LX7Xes
         hFkNBb423C2Ud35oNVvuMX8bYTRMwf2pcWGSUlnCSm2RqzxaMXnKS73u/xMCPEWZQ8wp
         XkvQ==
X-Gm-Message-State: AOAM533Py2CclVEYUwBzOyxljNePYzawLnHzJCM2ovllsS2i6MuQ8QQW
        AMfP9TcP927fAcMyz9hrkL4=
X-Google-Smtp-Source: ABdhPJzC4yRMg8wNNn4qurl4wr+ifWZ5n0KslQnYtmGSiYkmr6ckyvbe38T44o6980C7jOldbxhijQ==
X-Received: by 2002:a17:90b:8c:: with SMTP id bb12mr8192056pjb.133.1605857142388;
        Thu, 19 Nov 2020 23:25:42 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e6sm2388535pfn.190.2020.11.19.23.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 23:25:41 -0800 (PST)
Date:   Thu, 19 Nov 2020 23:25:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: omap-keypad: Fix error goto and handling in
 omap4_keypad_probe
Message-ID: <20201120072539.GV2034289@dtor-ws>
References: <20201119070119.4174387-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119070119.4174387-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Zhang,

On Thu, Nov 19, 2020 at 03:01:19PM +0800, Zhang Qilong wrote:
> In omap4_keypad_probe, the patch fix several bugs.
> 
>   1) pm_runtime_get_sync will increment pm usage counter even it
>      failed. Forgetting to pm_runtime_put_noidle will result in
>      reference leak.
> 
>   2) In err_unmap, forget to disable runtime of device,
>      pm_runtime_enable will increase power disable depth. Thus a
>      pairing decrement is needed on the error handling path to keep
>      it balanced.
> 
>   3) In err_pm_disable, it will call pm_runtime_put_sync twice not
>      one time.
> 
> And we add the pm_runtime_put_noidle when pm_runtime_get_sync failed
> for 1). Move pm_runtime_disable to the err_unmap branch for 2). Move
> the input_register_device ahead for 3).
> 
> Fixes: f77621cc640a7 ("Input: omap-keypad - dynamically handle register offsets")
> Fixes: 5ad567ffbaf20 ("Input: Input: omap4-keypad - wire up runtime PM handling")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> index d6c924032aaa..17abc8434af5 100644
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -277,6 +277,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  	error = pm_runtime_get_sync(&pdev->dev);
>  	if (error) {
> +		pm_runtime_put_noidle(&pdev->dev);
>  		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
>  		goto err_unmap;
>  	}
> @@ -349,20 +350,19 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  		goto err_free_keymap;
>  	}
>  
> -	device_init_wakeup(&pdev->dev, true);
> -	pm_runtime_put_sync(&pdev->dev);
> -
>  	error = input_register_device(keypad_data->input);
>  	if (error < 0) {
>  		dev_err(&pdev->dev, "failed to register input device\n");
> -		goto err_pm_disable;
> +		goto err_free_irq;
>  	}
>  
> +	device_init_wakeup(&pdev->dev, true);
> +	pm_runtime_put_sync(&pdev->dev);
> +

I think your patch is technically correct, but I wonder if we should
limit area of where we have device's clocks enabled to only where we
need it. I.e. something like this:

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index d6c924032aaa..4ca754e95978 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -186,12 +186,8 @@ static int omap4_keypad_open(struct input_dev *input)
 	return 0;
 }
 
-static void omap4_keypad_close(struct input_dev *input)
+static void omap4_keypad_stop(struct omap4_keypad *keypad_data)
 {
-	struct omap4_keypad *keypad_data = input_get_drvdata(input);
-
-	disable_irq(keypad_data->irq);
-
 	/* Disable interrupts and wake-up events */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQENABLE,
 			 OMAP4_VAL_IRQDISABLE);
@@ -200,7 +196,14 @@ static void omap4_keypad_close(struct input_dev *input)
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
+}
 
+static void omap4_keypad_close(struct input_dev *input)
+{
+	struct omap4_keypad *keypad_data = input_get_drvdata(input);
+
+	disable_irq(keypad_data->irq);
+	omap4_keypad_stop(keypad_data);
 	enable_irq(keypad_data->irq);
 
 	pm_runtime_put_sync(input->dev.parent);
@@ -223,13 +226,37 @@ static int omap4_keypad_parse_dt(struct device *dev,
 	return 0;
 }
 
+static int omap4_keypad_check_revision(struct device *dev,
+				       struct omap4_keypad *keypad_data)
+{
+	unsigned int rev;
+
+	rev = __raw_readl(keypad_data->base + OMAP4_KBD_REVISION);
+	rev &= 0x03 << 30;
+	rev >>= 30;
+	switch (rev) {
+	case KBD_REVISION_OMAP4:
+		keypad_data->reg_offset = 0x00;
+		keypad_data->irqreg_offset = 0x00;
+		break;
+	case KBD_REVISION_OMAP5:
+		keypad_data->reg_offset = 0x10;
+		keypad_data->irqreg_offset = 0x0c;
+		break;
+	default:
+		dev_err(dev, "Keypad reports unsupported revision %d", rev);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int omap4_keypad_probe(struct platform_device *pdev)
 {
 	struct omap4_keypad *keypad_data;
 	struct input_dev *input_dev;
 	struct resource *res;
 	unsigned int max_keys;
-	int rev;
 	int irq;
 	int error;
 
@@ -269,41 +296,30 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 		goto err_release_mem;
 	}
 
+	pm_runtime_enable(&pdev->dev);
 
 	/*
 	 * Enable clocks for the keypad module so that we can read
 	 * revision register.
 	 */
-	pm_runtime_enable(&pdev->dev);
 	error = pm_runtime_get_sync(&pdev->dev);
 	if (error) {
 		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
-		goto err_unmap;
-	}
-	rev = __raw_readl(keypad_data->base + OMAP4_KBD_REVISION);
-	rev &= 0x03 << 30;
-	rev >>= 30;
-	switch (rev) {
-	case KBD_REVISION_OMAP4:
-		keypad_data->reg_offset = 0x00;
-		keypad_data->irqreg_offset = 0x00;
-		break;
-	case KBD_REVISION_OMAP5:
-		keypad_data->reg_offset = 0x10;
-		keypad_data->irqreg_offset = 0x0c;
-		break;
-	default:
-		dev_err(&pdev->dev,
-			"Keypad reports unsupported revision %d", rev);
-		error = -EINVAL;
-		goto err_pm_put_sync;
+		pm_runtime_put_noidle(&pdev->dev);
+	} else {
+		error = omap4_keypad_check_revision(&pdev->dev, keypad_data);
+		if (!error) {
+			/* Ensure device does not raise interrupts */
+			omap4_keypad_stop(keypad_data);
+		}
+		pm_runtime_put_sync(&pdev->dev);
 	}
 
 	/* input device allocation */
 	keypad_data->input = input_dev = input_allocate_device();
 	if (!input_dev) {
 		error = -ENOMEM;
-		goto err_pm_put_sync;
+		goto err_pm_disable;
 	}
 
 	input_dev->name = pdev->name;
@@ -349,28 +365,25 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 		goto err_free_keymap;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	pm_runtime_put_sync(&pdev->dev);
-
 	error = input_register_device(keypad_data->input);
 	if (error < 0) {
 		dev_err(&pdev->dev, "failed to register input device\n");
-		goto err_pm_disable;
+		goto err_free_irq;
 	}
 
+	device_init_wakeup(&pdev->dev, true);
 	platform_set_drvdata(pdev, keypad_data);
+
 	return 0;
 
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+err_free_irq:
 	free_irq(keypad_data->irq, keypad_data);
 err_free_keymap:
 	kfree(keypad_data->keymap);
 err_free_input:
 	input_free_device(input_dev);
-err_pm_put_sync:
-	pm_runtime_put_sync(&pdev->dev);
-err_unmap:
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
 	iounmap(keypad_data->base);
 err_release_mem:
 	release_mem_region(res->start, resource_size(res));

>  	platform_set_drvdata(pdev, keypad_data);
>  	return 0;
>  
> -err_pm_disable:
> -	pm_runtime_disable(&pdev->dev);
> +err_free_irq:
>  	free_irq(keypad_data->irq, keypad_data);
>  err_free_keymap:
>  	kfree(keypad_data->keymap);
> @@ -371,6 +371,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  err_pm_put_sync:
>  	pm_runtime_put_sync(&pdev->dev);
>  err_unmap:
> +	pm_runtime_disable(&pdev->dev);
>  	iounmap(keypad_data->base);
>  err_release_mem:
>  	release_mem_region(res->start, resource_size(res));
> -- 
> 2.25.4
> 

Thanks.

-- 
Dmitry
