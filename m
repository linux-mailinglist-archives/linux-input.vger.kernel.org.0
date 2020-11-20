Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92BD2BAB62
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 14:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgKTNfv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 08:35:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:8378 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgKTNfv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 08:35:51 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CcyGm5xWHz6xZT
        for <linux-input@vger.kernel.org>; Fri, 20 Nov 2020 21:35:28 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 20 Nov 2020
 21:35:43 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>
Subject: [PATCH v2] Input: omap-keypad: Fix error goto and handling in omap4_keypad_probe
Date:   Fri, 20 Nov 2020 21:39:18 +0800
Message-ID: <20201120133918.2559681-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In omap4_keypad_probe, the patch fix several bugs.

  1) pm_runtime_get_sync will increment pm usage counter even it
     failed. Forgetting to pm_runtime_put_noidle will result in
     reference leak.

  2) In err_unmap, forget to disable runtime of device,
     pm_runtime_enable will increase power disable depth. Thus a
     pairing decrement is needed on the error handling path to keep
     it balanced.

  3) In err_pm_disable, it will call pm_runtime_put_sync twice not
     one time.

And we add the pm_runtime_put_noidle when pm_runtime_get_sync failed
for 1). Move pm_runtime_disable to the err_unmap branch for 2). Move
the input_register_device ahead for 3).

Fixes: f77621cc640a7 ("Input: omap-keypad - dynamically handle register offsets")
Fixes: 5ad567ffbaf20 ("Input: Input: omap4-keypad - wire up runtime PM handling")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changelog:
v2
- Add limited area of where we have device's clocks enabled to only
  where we need it.
---
 drivers/input/keyboard/omap4-keypad.c | 90 ++++++++++++++++-----------
 1 file changed, 54 insertions(+), 36 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index d6c924032aaa..cde510cd3919 100644
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
@@ -200,7 +196,15 @@ static void omap4_keypad_close(struct input_dev *input)
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
+}
+
+static void omap4_keypad_close(struct input_dev *input)
+{
+	struct omap4_keypad *keypad_data;
 
+	keypad_data = input_get_drvdata(input);
+	disable_irq(keypad_data->irq);
+	omap4_keypad_stop(keypad_data);
 	enable_irq(keypad_data->irq);
 
 	pm_runtime_put_sync(input->dev.parent);
@@ -223,13 +227,38 @@ static int omap4_keypad_parse_dt(struct device *dev,
 	return 0;
 }
 
+static int
+omap4_keypad_check_revision(struct device *dev,
+			    struct omap4_keypad *keypad_data)
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
 
@@ -269,41 +298,32 @@ static int omap4_keypad_probe(struct platform_device *pdev)
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
+		pm_runtime_put_noidle(&pdev->dev);
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
+		goto err_pm_disable;
+	} else {
+		error = omap4_keypad_check_revision(&pdev->dev,
+						    keypad_data);
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
@@ -349,33 +369,31 @@ static int omap4_keypad_probe(struct platform_device *pdev)
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
 err_free_keypad:
 	kfree(keypad_data);
+
 	return error;
 }
 
-- 
2.25.4

