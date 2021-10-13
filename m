Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D0342B2B8
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 04:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbhJMCic (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 22:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhJMCib (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 22:38:31 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5358FC061570;
        Tue, 12 Oct 2021 19:36:29 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so3323878pjw.0;
        Tue, 12 Oct 2021 19:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x4i8IiEv4ic090SAkWfaIFDP0K+rfVSXcLn4K4WZP5U=;
        b=DznDTTM03wDhGg44FDqQQBBkryIq8ufFV/CoRhGU2z6WgGTbOJq/9mAYOXO8c1b9bb
         45QUoELNqGtoxPkn+7G+N2p+rdy2CELEYoWSjvQSjfRBaiN+rvOkd5zPYsDf/pmVvBY+
         wKn+ShI8d+uC+VjTJEqrmxzUKQOWnVRxhBiJ+hYkc0RFJkwKHq6beu5PonL/cFqav6By
         6J8woIoFa2UHH8xu+9U8eWjDnFKFJNcBWSSd49Fxp6IQZQDEesPCQ1DR1mFJF6hYH4Zc
         s5OiP0sTapEPjtr2H2FIWZqZMN10UVFGDxl8qXuuO5TUWaHK1z84vj+vs7tlfAxkQhGH
         l1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x4i8IiEv4ic090SAkWfaIFDP0K+rfVSXcLn4K4WZP5U=;
        b=jn2EhdzORBszGuVhmHNDy29bDnCxX3UJL0PCa15fqYfe1y7iyptT1zXcX2ZC6f9Yng
         O2PubYeDrSy7UJIAWtu95vQ39tjDeYpMW7ak7AjGCHKUlanlZ0MuEoQ9M5HubC6gZ7mf
         ywaMVQfPfqKZ4UIHRwutia6vfPopENaDT9u2vo1vNojxC1zFx5q4qJ/GOUS+Ick+e6hh
         xNydeEumztulbHdMUBrLI1cryJe6dSAdWd8UfeFz3V4m4SvQ2AtVGkhNDavj+3JvEkJ8
         aTrIKqnMipa8Bln7Mg2atQSAJU3MX62CvM2NFFl8PLnAdCB+w8JvfoxtSpWM9hSfzHFS
         s1gQ==
X-Gm-Message-State: AOAM530rUFd0JJaRdu9aiiDT3hC6Dc03xL2j1MtRVhOf47LI02adruyE
        mbVRWfO+Q+WuZwo4Bqo6gSjQtxnJO6g=
X-Google-Smtp-Source: ABdhPJwR4Hc7AOow5qEwEpORLLd4EwR2pOa74IgkPvgbxjoKQI32xX0u5blYDmBjEVv7qgSFzJc8hQ==
X-Received: by 2002:a17:90a:11:: with SMTP id 17mr10261536pja.238.1634092588250;
        Tue, 12 Oct 2021 19:36:28 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:618d:87ca:8f95:87c0])
        by smtp.gmail.com with ESMTPSA id p5sm12861831pfb.95.2021.10.12.19.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 19:36:27 -0700 (PDT)
Date:   Tue, 12 Oct 2021 19:36:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] Input: ep93xx_keypad - switch to using managed
 resources
Message-ID: <YWZGKWgdarGtvtYA@google.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
 <20211012013735.3523140-4-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012013735.3523140-4-dmitry.torokhov@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

By using managed resources (devm) we are able to streamline error handling
in probe and remove most of the custom remove method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 118 ++++++++-----------------
 1 file changed, 37 insertions(+), 81 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index a66cfeaf5b21..272a4f1c6e81 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -219,6 +219,13 @@ static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(ep93xx_keypad_pm_ops,
 			 ep93xx_keypad_suspend, ep93xx_keypad_resume);
 
+static void ep93xx_keypad_release_gpio_action(void *_pdev)
+{
+	struct platform_device *pdev = _pdev;
+
+	ep93xx_keypad_release_gpio(pdev);
+}
+
 static int ep93xx_keypad_probe(struct platform_device *pdev)
 {
 	struct ep93xx_keypad *keypad;
@@ -227,61 +234,46 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	struct resource *res;
 	int err;
 
-	keypad = kzalloc(sizeof(struct ep93xx_keypad), GFP_KERNEL);
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
 	if (!keypad)
 		return -ENOMEM;
 
 	keypad->pdata = dev_get_platdata(&pdev->dev);
-	if (!keypad->pdata) {
-		err = -EINVAL;
-		goto failed_free;
-	}
+	if (!keypad->pdata)
+		return -EINVAL;
 
 	keymap_data = keypad->pdata->keymap_data;
-	if (!keymap_data) {
-		err = -EINVAL;
-		goto failed_free;
-	}
+	if (!keymap_data)
+		return -EINVAL;
 
 	keypad->irq = platform_get_irq(pdev, 0);
-	if (keypad->irq < 0) {
-		err = keypad->irq;
-		goto failed_free;
-	}
+	if (keypad->irq < 0)
+		return keypad->irq;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		err = -ENXIO;
-		goto failed_free;
-	}
-
-	res = request_mem_region(res->start, resource_size(res), pdev->name);
-	if (!res) {
-		err = -EBUSY;
-		goto failed_free;
-	}
+	if (!res)
+		return -ENXIO;
 
-	keypad->mmio_base = ioremap(res->start, resource_size(res));
-	if (keypad->mmio_base == NULL) {
-		err = -ENXIO;
-		goto failed_free_mem;
-	}
+	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(keypad->mmio_base))
+		return PTR_ERR(keypad->mmio_base);
 
 	err = ep93xx_keypad_acquire_gpio(pdev);
 	if (err)
-		goto failed_free_io;
+		return err;
 
-	keypad->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(keypad->clk)) {
-		err = PTR_ERR(keypad->clk);
-		goto failed_free_gpio;
-	}
+	err = devm_add_action_or_reset(&pdev->dev,
+				       ep93xx_keypad_release_gpio_action, pdev);
+	if (err)
+		return err;
 
-	input_dev = input_allocate_device();
-	if (!input_dev) {
-		err = -ENOMEM;
-		goto failed_put_clk;
-	}
+	keypad->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(keypad->clk))
+		return PTR_ERR(keypad->clk);
+
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
 
 	keypad->input_dev = input_dev;
 
@@ -289,26 +281,26 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	input_dev->id.bustype = BUS_HOST;
 	input_dev->open = ep93xx_keypad_open;
 	input_dev->close = ep93xx_keypad_close;
-	input_dev->dev.parent = &pdev->dev;
 
 	err = matrix_keypad_build_keymap(keymap_data, NULL,
 					 EP93XX_MATRIX_ROWS, EP93XX_MATRIX_COLS,
 					 keypad->keycodes, input_dev);
 	if (err)
-		goto failed_free_dev;
+		return err;
 
 	if (keypad->pdata->flags & EP93XX_KEYPAD_AUTOREPEAT)
 		__set_bit(EV_REP, input_dev->evbit);
 	input_set_drvdata(input_dev, keypad);
 
-	err = request_irq(keypad->irq, ep93xx_keypad_irq_handler,
-			  0, pdev->name, keypad);
+	err = devm_request_irq(&pdev->dev, keypad->irq,
+			       ep93xx_keypad_irq_handler,
+			       0, pdev->name, keypad);
 	if (err)
-		goto failed_free_dev;
+		return err;
 
 	err = input_register_device(input_dev);
 	if (err)
-		goto failed_free_irq;
+		return err;
 
 	platform_set_drvdata(pdev, keypad);
 
@@ -318,48 +310,12 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "failed to set up wakeup irq: %d\n", err);
 
 	return 0;
-
-failed_free_irq:
-	free_irq(keypad->irq, keypad);
-failed_free_dev:
-	input_free_device(input_dev);
-failed_put_clk:
-	clk_put(keypad->clk);
-failed_free_gpio:
-	ep93xx_keypad_release_gpio(pdev);
-failed_free_io:
-	iounmap(keypad->mmio_base);
-failed_free_mem:
-	release_mem_region(res->start, resource_size(res));
-failed_free:
-	kfree(keypad);
-	return err;
 }
 
 static int ep93xx_keypad_remove(struct platform_device *pdev)
 {
-	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
-	struct resource *res;
-
 	dev_pm_clear_wake_irq(&pdev->dev);
 
-	free_irq(keypad->irq, keypad);
-
-	if (keypad->enabled)
-		clk_disable(keypad->clk);
-	clk_put(keypad->clk);
-
-	input_unregister_device(keypad->input_dev);
-
-	ep93xx_keypad_release_gpio(pdev);
-
-	iounmap(keypad->mmio_base);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, resource_size(res));
-
-	kfree(keypad);
-
 	return 0;
 }
 
-- 
2.33.0.882.g93a45727a2-goog

