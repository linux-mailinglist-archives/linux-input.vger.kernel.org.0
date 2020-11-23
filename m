Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABCA2C002C
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgKWGob (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKWGob (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:44:31 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB246C0613CF;
        Sun, 22 Nov 2020 22:44:30 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id c66so14004451pfa.4;
        Sun, 22 Nov 2020 22:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3KIewAUdh9Ndtstep3wO0VK03gmsNVgewJVUCrwe2kQ=;
        b=bc7YE3RcJQPkWdp43P0B7YMh7S75c93F6JeBVo3YdNPWwVnp96WkTEbJ/6BfO5xT/h
         WVUDD8Fd9h59axdWx5RfQeQ854SP7fV7UQxBYUJW0v1fNmHnHczGzyodZRDlSBdwkRCU
         qoM43iUCQdD9/IKvnLJHkEc12juE9gcBqZDbgofiLuS2QukvYZMxmHLUiTr4QXEZj/DJ
         A9NXa688aaYtzAIPc1miQIudte34wwx12tK7X2HSYXk6gsBfokpxgOpMnH2BSXYsGkSj
         5S0cz1kyuenbYGCxVyVPJZdAOalrvFvC/Rcp7pZBaScf7q8ObHnhPsIhdH1hr0asXPyY
         mYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3KIewAUdh9Ndtstep3wO0VK03gmsNVgewJVUCrwe2kQ=;
        b=FsRnaYHURma+7XFHO5DYRr+7tiw5YQbGrXx8Z4MBZNKlbeR+kVqTMaw7bH1bE1rlaQ
         /OvDY6SfICxx5E9T6L3YIlkiAEIsJ5AN60fNBc+bB0adW2BS/MGfv3BtJatdUml7y44A
         YKvnFK8DJmD58YojV/1+bBbqvRKgtG0xACKAEeSz1k028cxs1/rj4TVtlTdGNliquZQv
         E9+BTJXaYs7bkP3YxroXyr9I4iUJ6xcq1yR2kP4p68JJkpmi0yn1IykDMc/EbD3KWC9+
         fA9Xg2TMtcjvqd4qFQLfoui77bEYnVvsbvgEWwFAeAnhYUqon5J5h8yn7GYcNuXNbzKH
         3iaQ==
X-Gm-Message-State: AOAM530861zwHVwdT/R7J7muAeL8ZDKO5fNHIk90/a1GFi2lNC5+fTyw
        uZvRGZz3w+vn+Qab9T3rDCNVp+IOnmI=
X-Google-Smtp-Source: ABdhPJy43liNXeVsLRtfz6qNJawt8sPbz2ciCMVho4hGKi0Poy6h4XIgfSlN1ltPO/sHF7tv4kRWLw==
X-Received: by 2002:a17:90a:f2cf:: with SMTP id gt15mr410227pjb.7.1606113870059;
        Sun, 22 Nov 2020 22:44:30 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b10sm2120005pju.27.2020.11.22.22.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:44:29 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:44:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: omap4-keypad - set up interrupt as wakeup source
Message-ID: <20201123064427.GA1046078@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Marking main interrupt as wakeup interrupt in probe allows us to drop
custom suspend/resume methods whose only purpose was to configure interrupt
for waking up the system.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/omap4-keypad.c | 43 +++++----------------------
 1 file changed, 8 insertions(+), 35 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index dd16f7b3c7ef..b17ac2a295b9 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -18,6 +18,7 @@
 #include <linux/input/matrix_keypad.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 
 /* OMAP4 registers */
 #define OMAP4_KBD_REVISION		0x00
@@ -69,7 +70,6 @@ struct omap4_keypad {
 	struct input_dev *input;
 
 	void __iomem *base;
-	bool irq_wake_enabled;
 	unsigned int irq;
 
 	unsigned int rows;
@@ -376,6 +376,11 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	device_init_wakeup(&pdev->dev, true);
+	error = dev_pm_set_wake_irq(&pdev->dev, keypad_data->irq);
+	if (error)
+		dev_warn(&pdev->dev,
+			 "failed to set up wakeup irq: %d\n", error);
+
 	platform_set_drvdata(pdev, keypad_data);
 
 	return 0;
@@ -401,6 +406,8 @@ static int omap4_keypad_remove(struct platform_device *pdev)
 	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
 	struct resource *res;
 
+	dev_pm_clear_wake_irq(&pdev->dev);
+
 	free_irq(keypad_data->irq, keypad_data);
 
 	pm_runtime_disable(&pdev->dev);
@@ -424,45 +431,11 @@ static const struct of_device_id omap_keypad_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, omap_keypad_dt_match);
 
-#ifdef CONFIG_PM_SLEEP
-static int omap4_keypad_suspend(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
-	int error;
-
-	if (device_may_wakeup(&pdev->dev)) {
-		error = enable_irq_wake(keypad_data->irq);
-		if (!error)
-			keypad_data->irq_wake_enabled = true;
-	}
-
-	return 0;
-}
-
-static int omap4_keypad_resume(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
-
-	if (device_may_wakeup(&pdev->dev) && keypad_data->irq_wake_enabled) {
-		disable_irq_wake(keypad_data->irq);
-		keypad_data->irq_wake_enabled = false;
-	}
-
-	return 0;
-}
-#endif
-
-static SIMPLE_DEV_PM_OPS(omap4_keypad_pm_ops,
-			 omap4_keypad_suspend, omap4_keypad_resume);
-
 static struct platform_driver omap4_keypad_driver = {
 	.probe		= omap4_keypad_probe,
 	.remove		= omap4_keypad_remove,
 	.driver		= {
 		.name	= "omap4-keypad",
-		.pm	= &omap4_keypad_pm_ops,
 		.of_match_table = omap_keypad_dt_match,
 	},
 };
-- 
2.29.2.454.gaff20da3a2-goog


-- 
Dmitry
