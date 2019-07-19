Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C4B6E48D
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2019 12:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfGSKvw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jul 2019 06:51:52 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:43521 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfGSKvw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jul 2019 06:51:52 -0400
Received: by mail-pl1-f176.google.com with SMTP id 4so8477766pld.10;
        Fri, 19 Jul 2019 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHeGQrvuIZqnbU3+Zfe63uICKBYe2MWyh893KkU1oMA=;
        b=hWGbkL1Bv3NjbOqu549YDT0TW0X1VsJ5TkbYgS2C5metxn2xQWncSbxPRBin+DSbXa
         l3IddVIcOK55X+Bgli194YfwpN+kHyBGlcvN5Oi/1DrAVa+y30rxxv52yHRgpZQEPRrf
         P3waNObvPA4BrcfPU7yeItavNG2JYgMHNm0CGdoOEzujPq7zxm0AbzcUIE/6yKQq1z8T
         kvvV1YSo5fkzzcPid0oZ1z7Vv0eBaGerlGJgXemzaTC3hMHw1rH3nI0wLX2BsqRuWkKn
         uVJC1NfpzXI62iOttQZ8ppGg81gzMkCSAjiIkOjticFB9lwIjsHGvxV62qjrOMcMm0b4
         r5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHeGQrvuIZqnbU3+Zfe63uICKBYe2MWyh893KkU1oMA=;
        b=IFcepT8mi+VGH28YynydVGkpE480elEor0GHEUW4gKyDxFUCobj5nmd3/yHu+LcGAc
         UfCvfKBHby/A+/58TZ6Nkrt1RifGZwdasOGSuoUM3qHRpXFrmFNJVdmnh8WWKaTyvwXA
         JSWntuxfIAtr6PcrYWjjiCw2V+9+NlIl9YE3vv+WEeUZsmeLiBrr0225hiONdrPopveB
         V0kI38jBiJ7+U/BYXmERm8C+/LwC4v54JN/UZb3MFZ/UqFoQqxurbWOUHlAqPSxINMKL
         qtotlHpYXR4HXvR4hpXEcp1DP7b4tmQcCbrc7tX8q4DbLKnq2ShvfMPDlokBXH72Ndig
         uuUA==
X-Gm-Message-State: APjAAAWjCLG3LCOAzkeKwWiY6FLoSUv0NgFctMz9SYG3dfP3NGIug3yr
        88dLUYfdzmoygGVFuzcFuTk=
X-Google-Smtp-Source: APXvYqzhu6/kmeGnoSN8lHhnqRdOgRPSNy+cn758HppKiSDnsBu91kvGj8SLdyKQRdwysDfluz6x6g==
X-Received: by 2002:a17:902:9a04:: with SMTP id v4mr54589574plp.95.1563533510910;
        Fri, 19 Jul 2019 03:51:50 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id v18sm17876588pgl.87.2019.07.19.03.51.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 03:51:50 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: keyboard: Use dev_get_drv_data
Date:   Fri, 19 Jul 2019 18:51:08 +0800
Message-Id: <20190719105107.20651-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

dev_get_drvdata is a simpler implementation comparing
to to_platform_device + platform_get_drvdata.
This makes the code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c   | 10 ++++------
 drivers/input/keyboard/gpio_keys.c       |  3 +--
 drivers/input/keyboard/imx_keypad.c      | 10 ++++------
 drivers/input/keyboard/lpc32xx-keys.c    |  6 ++----
 drivers/input/keyboard/matrix_keypad.c   | 10 ++++------
 drivers/input/keyboard/omap4-keypad.c    | 10 ++++------
 drivers/input/keyboard/pmic8xxx-keypad.c |  6 ++----
 drivers/input/keyboard/pxa27x_keypad.c   | 10 ++++------
 drivers/input/keyboard/samsung-keypad.c  | 12 ++++--------
 drivers/input/keyboard/spear-keyboard.c  | 10 ++++------
 drivers/input/keyboard/st-keyscan.c      |  6 ++----
 drivers/input/keyboard/tegra-kbc.c       | 10 ++++------
 12 files changed, 39 insertions(+), 64 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 7c70492d9d6b..bcc8a17f9a01 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -178,8 +178,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int ep93xx_keypad_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
+	struct ep93xx_keypad *keypad = dev_get_drvdata(dev);
 	struct input_dev *input_dev = keypad->input_dev;
 
 	mutex_lock(&input_dev->mutex);
@@ -191,7 +190,7 @@ static int ep93xx_keypad_suspend(struct device *dev)
 
 	mutex_unlock(&input_dev->mutex);
 
-	if (device_may_wakeup(&pdev->dev))
+	if (device_may_wakeup(dev))
 		enable_irq_wake(keypad->irq);
 
 	return 0;
@@ -199,11 +198,10 @@ static int ep93xx_keypad_suspend(struct device *dev)
 
 static int ep93xx_keypad_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
+	struct ep93xx_keypad *keypad = dev_get_drvdata(dev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	if (device_may_wakeup(&pdev->dev))
+	if (device_may_wakeup(dev))
 		disable_irq_wake(keypad->irq);
 
 	mutex_lock(&input_dev->mutex);
diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 03f4d152f6b7..a8db71ceb50c 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -290,8 +290,7 @@ static ssize_t gpio_keys_show_##name(struct device *dev,		\
 				     struct device_attribute *attr,	\
 				     char *buf)				\
 {									\
-	struct platform_device *pdev = to_platform_device(dev);		\
-	struct gpio_keys_drvdata *ddata = platform_get_drvdata(pdev);	\
+	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);	\
 									\
 	return gpio_keys_attr_show_helper(ddata, buf,			\
 					  type, only_disabled);		\
diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 97500a2de2d5..6d3d62c82de0 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -526,8 +526,7 @@ static int imx_keypad_probe(struct platform_device *pdev)
 
 static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct imx_keypad *kbd = platform_get_drvdata(pdev);
+	struct imx_keypad *kbd = dev_get_drvdata(dev);
 	struct input_dev *input_dev = kbd->input_dev;
 	unsigned short reg_val = readw(kbd->mmio_base + KPSR);
 
@@ -539,7 +538,7 @@ static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 
 	mutex_unlock(&input_dev->mutex);
 
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		if (reg_val & KBD_STAT_KPKD)
 			reg_val |= KBD_STAT_KRIE;
 		if (reg_val & KBD_STAT_KPKR)
@@ -554,12 +553,11 @@ static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 
 static int __maybe_unused imx_kbd_noirq_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct imx_keypad *kbd = platform_get_drvdata(pdev);
+	struct imx_keypad *kbd = dev_get_drvdata(dev);
 	struct input_dev *input_dev = kbd->input_dev;
 	int ret = 0;
 
-	if (device_may_wakeup(&pdev->dev))
+	if (device_may_wakeup(dev))
 		disable_irq_wake(kbd->irq);
 
 	mutex_lock(&input_dev->mutex);
diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
index a34e3271b0c9..cc15da57cfec 100644
--- a/drivers/input/keyboard/lpc32xx-keys.c
+++ b/drivers/input/keyboard/lpc32xx-keys.c
@@ -269,8 +269,7 @@ static int lpc32xx_kscan_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int lpc32xx_kscan_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct lpc32xx_kscan_drv *kscandat = platform_get_drvdata(pdev);
+	struct lpc32xx_kscan_drv *kscandat = dev_get_drvdata(dev);
 	struct input_dev *input = kscandat->input;
 
 	mutex_lock(&input->mutex);
@@ -287,8 +286,7 @@ static int lpc32xx_kscan_suspend(struct device *dev)
 
 static int lpc32xx_kscan_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct lpc32xx_kscan_drv *kscandat = platform_get_drvdata(pdev);
+	struct lpc32xx_kscan_drv *kscandat = dev_get_drvdata(dev);
 	struct input_dev *input = kscandat->input;
 	int retval = 0;
 
diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 30924b57058f..c5a294e1de95 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -272,12 +272,11 @@ static void matrix_keypad_disable_wakeup(struct matrix_keypad *keypad)
 
 static int matrix_keypad_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct matrix_keypad *keypad = platform_get_drvdata(pdev);
+	struct matrix_keypad *keypad = dev_get_drvdata(dev);
 
 	matrix_keypad_stop(keypad->input_dev);
 
-	if (device_may_wakeup(&pdev->dev))
+	if (device_may_wakeup(dev))
 		matrix_keypad_enable_wakeup(keypad);
 
 	return 0;
@@ -285,10 +284,9 @@ static int matrix_keypad_suspend(struct device *dev)
 
 static int matrix_keypad_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct matrix_keypad *keypad = platform_get_drvdata(pdev);
+	struct matrix_keypad *keypad = dev_get_drvdata(dev);
 
-	if (device_may_wakeup(&pdev->dev))
+	if (device_may_wakeup(dev))
 		matrix_keypad_disable_wakeup(keypad);
 
 	matrix_keypad_start(keypad->input_dev);
diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 94c94d7f5155..a6db5494c742 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -412,11 +412,10 @@ MODULE_DEVICE_TABLE(of, omap_keypad_dt_match);
 #ifdef CONFIG_PM_SLEEP
 static int omap4_keypad_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
+	struct omap4_keypad *keypad_data = dev_get_drvdata(dev);
 	int error;
 
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		error = enable_irq_wake(keypad_data->irq);
 		if (!error)
 			keypad_data->irq_wake_enabled = true;
@@ -427,10 +426,9 @@ static int omap4_keypad_suspend(struct device *dev)
 
 static int omap4_keypad_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
+	struct omap4_keypad *keypad_data = dev_get_drvdata(dev);
 
-	if (device_may_wakeup(&pdev->dev) && keypad_data->irq_wake_enabled) {
+	if (device_may_wakeup(dev) && keypad_data->irq_wake_enabled) {
 		disable_irq_wake(keypad_data->irq);
 		keypad_data->irq_wake_enabled = false;
 	}
diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
index d529768a1d06..1e22d276e3e9 100644
--- a/drivers/input/keyboard/pmic8xxx-keypad.c
+++ b/drivers/input/keyboard/pmic8xxx-keypad.c
@@ -628,8 +628,7 @@ static int pmic8xxx_kp_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int pmic8xxx_kp_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct pmic8xxx_kp *kp = platform_get_drvdata(pdev);
+	struct pmic8xxx_kp *kp = dev_get_drvdata(dev);
 	struct input_dev *input_dev = kp->input;
 
 	if (device_may_wakeup(dev)) {
@@ -648,8 +647,7 @@ static int pmic8xxx_kp_suspend(struct device *dev)
 
 static int pmic8xxx_kp_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct pmic8xxx_kp *kp = platform_get_drvdata(pdev);
+	struct pmic8xxx_kp *kp = dev_get_drvdata(dev);
 	struct input_dev *input_dev = kp->input;
 
 	if (device_may_wakeup(dev)) {
diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 39023664d2f2..654e178ff39e 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -663,14 +663,13 @@ static void pxa27x_keypad_close(struct input_dev *dev)
 #ifdef CONFIG_PM_SLEEP
 static int pxa27x_keypad_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct pxa27x_keypad *keypad = platform_get_drvdata(pdev);
+	struct pxa27x_keypad *keypad = dev_get_drvdata(dev);
 
 	/*
 	 * If the keypad is used a wake up source, clock can not be disabled.
 	 * Or it can not detect the key pressing.
 	 */
-	if (device_may_wakeup(&pdev->dev))
+	if (device_may_wakeup(dev))
 		enable_irq_wake(keypad->irq);
 	else
 		clk_disable_unprepare(keypad->clk);
@@ -680,8 +679,7 @@ static int pxa27x_keypad_suspend(struct device *dev)
 
 static int pxa27x_keypad_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct pxa27x_keypad *keypad = platform_get_drvdata(pdev);
+	struct pxa27x_keypad *keypad = dev_get_drvdata(dev);
 	struct input_dev *input_dev = keypad->input_dev;
 	int ret = 0;
 
@@ -689,7 +687,7 @@ static int pxa27x_keypad_resume(struct device *dev)
 	 * If the keypad is used as wake up source, the clock is not turned
 	 * off. So do not need configure it again.
 	 */
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		disable_irq_wake(keypad->irq);
 	} else {
 		mutex_lock(&input_dev->mutex);
diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 70c1d086bdd2..286432c4a28a 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -462,8 +462,7 @@ static int samsung_keypad_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int samsung_keypad_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
+	struct samsung_keypad *keypad = dev_get_drvdata(dev);
 	unsigned int val;
 	int error;
 
@@ -486,8 +485,7 @@ static int samsung_keypad_runtime_suspend(struct device *dev)
 
 static int samsung_keypad_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
+	struct samsung_keypad *keypad = dev_get_drvdata(dev);
 	unsigned int val;
 
 	if (keypad->stopped)
@@ -531,8 +529,7 @@ static void samsung_keypad_toggle_wakeup(struct samsung_keypad *keypad,
 
 static int samsung_keypad_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
+	struct samsung_keypad *keypad = dev_get_drvdata(dev);
 	struct input_dev *input_dev = keypad->input_dev;
 
 	mutex_lock(&input_dev->mutex);
@@ -549,8 +546,7 @@ static int samsung_keypad_suspend(struct device *dev)
 
 static int samsung_keypad_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
+	struct samsung_keypad *keypad = dev_get_drvdata(dev);
 	struct input_dev *input_dev = keypad->input_dev;
 
 	mutex_lock(&input_dev->mutex);
diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 7d25fa338ab4..a0276a3376d2 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -288,8 +288,7 @@ static int spear_kbd_remove(struct platform_device *pdev)
 
 static int __maybe_unused spear_kbd_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct spear_kbd *kbd = platform_get_drvdata(pdev);
+	struct spear_kbd *kbd = dev_get_drvdata(dev);
 	struct input_dev *input_dev = kbd->input;
 	unsigned int rate = 0, mode_ctl_reg, val;
 
@@ -300,7 +299,7 @@ static int __maybe_unused spear_kbd_suspend(struct device *dev)
 
 	mode_ctl_reg = readl_relaxed(kbd->io_base + MODE_CTL_REG);
 
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		if (!enable_irq_wake(kbd->irq))
 			kbd->irq_wake_enabled = true;
 
@@ -341,13 +340,12 @@ static int __maybe_unused spear_kbd_suspend(struct device *dev)
 
 static int __maybe_unused spear_kbd_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct spear_kbd *kbd = platform_get_drvdata(pdev);
+	struct spear_kbd *kbd = dev_get_drvdata(dev);
 	struct input_dev *input_dev = kbd->input;
 
 	mutex_lock(&input_dev->mutex);
 
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		if (kbd->irq_wake_enabled) {
 			kbd->irq_wake_enabled = false;
 			disable_irq_wake(kbd->irq);
diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index f097128b93fe..b00554a41321 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -215,8 +215,7 @@ static int keyscan_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int keyscan_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct st_keyscan *keypad = platform_get_drvdata(pdev);
+	struct st_keyscan *keypad = dev_get_drvdata(dev);
 	struct input_dev *input = keypad->input_dev;
 
 	mutex_lock(&input->mutex);
@@ -232,8 +231,7 @@ static int keyscan_suspend(struct device *dev)
 
 static int keyscan_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct st_keyscan *keypad = platform_get_drvdata(pdev);
+	struct st_keyscan *keypad = dev_get_drvdata(dev);
 	struct input_dev *input = keypad->input_dev;
 	int retval = 0;
 
diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index a37a7a9e9171..f33577944207 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -731,11 +731,10 @@ static void tegra_kbc_set_keypress_interrupt(struct tegra_kbc *kbc, bool enable)
 
 static int tegra_kbc_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct tegra_kbc *kbc = platform_get_drvdata(pdev);
+	struct tegra_kbc *kbc = dev_get_drvdata(dev);
 
 	mutex_lock(&kbc->idev->mutex);
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		disable_irq(kbc->irq);
 		del_timer_sync(&kbc->timer);
 		tegra_kbc_set_fifo_interrupt(kbc, false);
@@ -768,12 +767,11 @@ static int tegra_kbc_suspend(struct device *dev)
 
 static int tegra_kbc_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct tegra_kbc *kbc = platform_get_drvdata(pdev);
+	struct tegra_kbc *kbc = dev_get_drvdata(dev);
 	int err = 0;
 
 	mutex_lock(&kbc->idev->mutex);
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		disable_irq_wake(kbc->irq);
 		tegra_kbc_setup_wakekeys(kbc, false);
 		/* We will use fifo interrupts for key detection. */
-- 
2.20.1

