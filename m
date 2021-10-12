Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A0E429B14
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 03:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbhJLBjr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Oct 2021 21:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235009AbhJLBjq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Oct 2021 21:39:46 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B864C061570;
        Mon, 11 Oct 2021 18:37:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so1306209pjb.3;
        Mon, 11 Oct 2021 18:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WYGli3uMb1mpii0PyOfilUSGkqTbEUQmSwfBucAPCF4=;
        b=LCHt/IXJG8H2QjxbDXybs8LbBCyuRucYxlrqx1CiZBaVX2S0UHY4+SIPaTc8OcsfCW
         2wIZYuhWaTqEEfDstJuGgvn/G+JbtGa/bKbHS24ogWgVXf1rtKSUp1LmijeG7YxkYf6I
         H4xylhUQMlozuRoD/RY3McTiZirJ6/52EK68IN6qDQ5lwNr1+IFNnkiubkiNhWdytGDN
         fzMUr/jCqGt7IQyJUL8pKUzWXWJhhNMnu2qur1H1o8pIMWRVsUK4rwvtYqzNbRGfT0Ia
         SHg1VFcfvkAeZf245wFVckVgYH0cFn3my2/SKCJuiSNFgI4vTKncY2x5wTo1UfJPxJ7u
         VJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WYGli3uMb1mpii0PyOfilUSGkqTbEUQmSwfBucAPCF4=;
        b=0Mq3utk8iEbcf+WMTPed2Z3veiIezj12eOq8Z2Ca8+rYUuBc8Y/lWBUFzvRq2j+QnY
         RiTrn9/SNwJt8rtiOfXhd51H6+l3cRkKIsesbcRqtDcY0Z2LP9bNNqEbGrEQUUddXv/X
         TPR9EuYJbQG7ItDbEQrBxrVxIkIm1s6Lf+a0GiYcUhyogUPCZxFiwB4uk1v5tNiJP82p
         0UqC/kxSuFegZa6WZTofWThFXVE4qxOiIR49kmFj1QL1qTQnu5RZCEXpmNDEghEWviW1
         QZjYGadIVYIvkPl98KYaLsBRjyllIvjncc+jYGrLRf4gvGhrxWwjdBwXySVUrOPQgUF5
         H5MQ==
X-Gm-Message-State: AOAM531yoEJERRGTJgbcaa7qsK55zpkobqecn+hRZCg7qyQ9e1nwM5l7
        FluNEsjHqApAkuEvNGAwQIpYAntbDIA=
X-Google-Smtp-Source: ABdhPJxaCgYNI/B+dPGuiYaBDjFd9IS5SvGtenK9vHuQdyFjqMF+VfUU17SlJ1E7Yd0y0Y9WxN66kw==
X-Received: by 2002:a17:902:d50d:b0:13e:a44e:2d2a with SMTP id b13-20020a170902d50d00b0013ea44e2d2amr27057062plg.89.1634002664608;
        Mon, 11 Oct 2021 18:37:44 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:10fb:4b55:2926:7ada])
        by smtp.gmail.com with ESMTPSA id nr14sm654719pjb.24.2021.10.11.18.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:37:43 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Input: ep93xx_keypad - switch to using managed resources
Date:   Mon, 11 Oct 2021 18:37:35 -0700
Message-Id: <20211012013735.3523140-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

By using managed resources (devm) we are able to streamline error handling
in probe and remove most of the custom remove method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 116 ++++++++-----------------
 1 file changed, 36 insertions(+), 80 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index a66cfeaf5b21..90157707dc05 100644
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
+
+	err = devm_add_action_or_reset(&pdev->dev,
+				       ep93xx_keypad_release_gpio_action, pdev);
+	if (err)
+		return err;
 
 	keypad->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(keypad->clk)) {
-		err = PTR_ERR(keypad->clk);
-		goto failed_free_gpio;
-	}
+	if (IS_ERR(keypad->clk))
+		return PTR_ERR(keypad->clk);
 
-	input_dev = input_allocate_device();
-	if (!input_dev) {
-		err = -ENOMEM;
-		goto failed_put_clk;
-	}
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

