Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA2D2B8BDA
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 07:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgKSG5t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 01:57:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7653 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgKSG5t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 01:57:49 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cc9V25DwBz15Mtq
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 14:57:30 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 14:57:42 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>
Subject: [PATCH] Input: omap-keypad: Fix error goto and handling in omap4_keypad_probe
Date:   Thu, 19 Nov 2020 15:01:19 +0800
Message-ID: <20201119070119.4174387-1-zhangqilong3@huawei.com>
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
---
 drivers/input/keyboard/omap4-keypad.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index d6c924032aaa..17abc8434af5 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -277,6 +277,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	error = pm_runtime_get_sync(&pdev->dev);
 	if (error) {
+		pm_runtime_put_noidle(&pdev->dev);
 		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
 		goto err_unmap;
 	}
@@ -349,20 +350,19 @@ static int omap4_keypad_probe(struct platform_device *pdev)
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
+	pm_runtime_put_sync(&pdev->dev);
+
 	platform_set_drvdata(pdev, keypad_data);
 	return 0;
 
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+err_free_irq:
 	free_irq(keypad_data->irq, keypad_data);
 err_free_keymap:
 	kfree(keypad_data->keymap);
@@ -371,6 +371,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 err_pm_put_sync:
 	pm_runtime_put_sync(&pdev->dev);
 err_unmap:
+	pm_runtime_disable(&pdev->dev);
 	iounmap(keypad_data->base);
 err_release_mem:
 	release_mem_region(res->start, resource_size(res));
-- 
2.25.4

