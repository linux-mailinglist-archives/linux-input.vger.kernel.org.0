Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5435B312
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 05:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfGADYD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 23:24:03 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:34001 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfGADYD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 23:24:03 -0400
Received: by mail-pl1-f179.google.com with SMTP id i2so6554644plt.1;
        Sun, 30 Jun 2019 20:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JeuG3ShUwrwV8ADRiaZv54o/yxapB24Cj7U1nzWfJZg=;
        b=jSj9R4KA3dEi9jvjAAEVFC49Xl8GCmPcB0j0XLyF77eQ7Qk3CnjF7PZKwWDzgdSWHL
         pl65LZuINt5VfjptZvMHmlpwCeWpPJSPwuQq9/ybDWP2y4afaMDFplf5FOJ0ObVtvHZq
         QD+5p4tbR+TNzSGii+vF2vn6gK8miesuX84HuMRoPyPbSGNjOVf8GysduteB+rRJqgX0
         hySXookd/Ux4uoHUTRJMo/syBTy/ErYYzCENJZ47seZRDVin8vdWq8rzqHh3/x5gytvN
         tilWutmtVEMupmVYSmMEu2dLBcsTr2NvphrqGyT8utCVecK0Y/iKWl9Bv9lcjZjjfOt8
         KqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JeuG3ShUwrwV8ADRiaZv54o/yxapB24Cj7U1nzWfJZg=;
        b=QY4IlBPVCdo3Ep8I0NWMQFeuFlMYFoNGo27R5Im5ByK+W3pPnVmh0+7/o4qJrAD3x2
         OKlC26RRV+M/Ks7gyYJT/xrxRtClxtfC5tvlCiqtQsd0WeOUm+C0caA8jkS87gJsu9fF
         vdv3dxLCDNV4DuApKZTQ4Z23cToyCJy5Vkx8FD7aYk/T5zcltxp68W9yL8FqF72Jxoeu
         mmSPEqs2VFW5fX+rYO+OpTBIv+p/f0vTvHsjIy/EXbYeMNJlY+gr25zsU7MOvl5y07lm
         Ny193lVMy3U6Kw+hmyxlES4SC06npo+hkHOIdSJWo7gP0orXfb8VsBdBtdbG+KkVOc/k
         PXFA==
X-Gm-Message-State: APjAAAWYRj4tuBjLpa9rDzP0td1ApCDsDFKbU9Xzde1Gq98SBfYfLlUY
        9UlByHG3ZuB+IKAr+cOdeMI=
X-Google-Smtp-Source: APXvYqxcv1vX3DBuYcdz93KM5Y3y80HueN1d69yK3F6cTp5QmsFX0DorosBlCFXGOoHQtACXjSZLZA==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr26028388plo.224.1561951441508;
        Sun, 30 Jun 2019 20:24:01 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id u5sm8238315pgp.19.2019.06.30.20.23.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 20:24:01 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Olof Johansson <olof@lixom.net>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Arnd Bergmann <arnd@arndb.de>, Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Christian Hoff <christian_hoff@gmx.net>,
        Tony Lindgren <tony@atomide.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Gabriel Fernandez <gabriel.fernandez@st.com>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Brian Masney <masneyb@onstation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/4] input: keyboard/mouse/touchscreen/misc: Use dev_get_drvdata()
Date:   Mon,  1 Jul 2019 11:23:12 +0800
Message-Id: <20190701032342.25971-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Using dev_get_drvdata directly.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
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
 drivers/input/misc/gpio-vibra.c          |  6 ++----
 drivers/input/misc/max77693-haptic.c     |  6 ++----
 drivers/input/misc/max8925_onkey.c       | 10 ++++------
 drivers/input/misc/max8997_haptic.c      |  3 +--
 drivers/input/misc/msm-vibrator.c        |  6 ++----
 drivers/input/misc/palmas-pwrbutton.c    |  6 ++----
 drivers/input/misc/regulator-haptic.c    |  6 ++----
 drivers/input/misc/stpmic1_onkey.c       |  6 ++----
 drivers/input/misc/twl4030-vibra.c       |  3 +--
 drivers/input/misc/twl6040-vibra.c       |  3 +--
 drivers/input/mouse/navpoint.c           |  6 ++----
 drivers/input/touchscreen/imx6ul_tsc.c   |  6 ++----
 24 files changed, 62 insertions(+), 108 deletions(-)

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
index a23c23979a2e..83d66155ce74 100644
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
index ae9c51cc85f9..d820de0908db 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -528,8 +528,7 @@ static int imx_keypad_probe(struct platform_device *pdev)
 
 static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct imx_keypad *kbd = platform_get_drvdata(pdev);
+	struct imx_keypad *kbd = dev_get_drvdata(dev);
 	struct input_dev *input_dev = kbd->input_dev;
 	unsigned short reg_val = readw(kbd->mmio_base + KPSR);
 
@@ -541,7 +540,7 @@ static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 
 	mutex_unlock(&input_dev->mutex);
 
-	if (device_may_wakeup(&pdev->dev)) {
+	if (device_may_wakeup(dev)) {
 		if (reg_val & KBD_STAT_KPKD)
 			reg_val |= KBD_STAT_KRIE;
 		if (reg_val & KBD_STAT_KPKR)
@@ -556,12 +555,11 @@ static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 
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
diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index f79f75595dd7..ad30cb5b1523 100644
--- a/drivers/input/misc/gpio-vibra.c
+++ b/drivers/input/misc/gpio-vibra.c
@@ -159,8 +159,7 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 
 static int __maybe_unused gpio_vibrator_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct gpio_vibrator *vibrator = platform_get_drvdata(pdev);
+	struct gpio_vibrator *vibrator = dev_get_drvdata(dev);
 
 	cancel_work_sync(&vibrator->play_work);
 	if (vibrator->running)
@@ -171,8 +170,7 @@ static int __maybe_unused gpio_vibrator_suspend(struct device *dev)
 
 static int __maybe_unused gpio_vibrator_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct gpio_vibrator *vibrator = platform_get_drvdata(pdev);
+	struct gpio_vibrator *vibrator = dev_get_drvdata(dev);
 
 	if (vibrator->running)
 		gpio_vibrator_start(vibrator);
diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index 0d09ffeafeea..86e1c72efda1 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -377,8 +377,7 @@ static int max77693_haptic_probe(struct platform_device *pdev)
 
 static int __maybe_unused max77693_haptic_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct max77693_haptic *haptic = platform_get_drvdata(pdev);
+	struct max77693_haptic *haptic = dev_get_drvdata(dev);
 
 	if (haptic->enabled) {
 		max77693_haptic_disable(haptic);
@@ -390,8 +389,7 @@ static int __maybe_unused max77693_haptic_suspend(struct device *dev)
 
 static int __maybe_unused max77693_haptic_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct max77693_haptic *haptic = platform_get_drvdata(pdev);
+	struct max77693_haptic *haptic = dev_get_drvdata(dev);
 
 	if (haptic->suspend_state) {
 		max77693_haptic_enable(haptic);
diff --git a/drivers/input/misc/max8925_onkey.c b/drivers/input/misc/max8925_onkey.c
index 7c49b8d23894..af0ba592a0b3 100644
--- a/drivers/input/misc/max8925_onkey.c
+++ b/drivers/input/misc/max8925_onkey.c
@@ -135,9 +135,8 @@ static int max8925_onkey_probe(struct platform_device *pdev)
 
 static int __maybe_unused max8925_onkey_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct max8925_onkey_info *info = platform_get_drvdata(pdev);
-	struct max8925_chip *chip = dev_get_drvdata(pdev->dev.parent);
+	struct max8925_onkey_info *info = dev_get_drvdata(dev);
+	struct max8925_chip *chip = dev_get_drvdata(dev->parent);
 
 	if (device_may_wakeup(dev)) {
 		chip->wakeup_flag |= 1 << info->irq[0];
@@ -149,9 +148,8 @@ static int __maybe_unused max8925_onkey_suspend(struct device *dev)
 
 static int __maybe_unused max8925_onkey_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct max8925_onkey_info *info = platform_get_drvdata(pdev);
-	struct max8925_chip *chip = dev_get_drvdata(pdev->dev.parent);
+	struct max8925_onkey_info *info = dev_get_drvdata(dev);
+	struct max8925_chip *chip = dev_get_drvdata(dev->parent);
 
 	if (device_may_wakeup(dev)) {
 		chip->wakeup_flag &= ~(1 << info->irq[0]);
diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index 20ff087b8a44..e841b8e4b1d4 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -374,8 +374,7 @@ static int max8997_haptic_remove(struct platform_device *pdev)
 
 static int __maybe_unused max8997_haptic_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct max8997_haptic *chip = platform_get_drvdata(pdev);
+	struct max8997_haptic *chip = dev_get_drvdata(dev);
 
 	max8997_haptic_disable(chip);
 
diff --git a/drivers/input/misc/msm-vibrator.c b/drivers/input/misc/msm-vibrator.c
index b60f1aaee705..a28974bfb64e 100644
--- a/drivers/input/misc/msm-vibrator.c
+++ b/drivers/input/misc/msm-vibrator.c
@@ -234,8 +234,7 @@ static int msm_vibrator_probe(struct platform_device *pdev)
 
 static int __maybe_unused msm_vibrator_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_vibrator *vibrator = platform_get_drvdata(pdev);
+	struct msm_vibrator *vibrator = dev_get_drvdata(dev);
 
 	cancel_work_sync(&vibrator->worker);
 
@@ -247,8 +246,7 @@ static int __maybe_unused msm_vibrator_suspend(struct device *dev)
 
 static int __maybe_unused msm_vibrator_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_vibrator *vibrator = platform_get_drvdata(pdev);
+	struct msm_vibrator *vibrator = dev_get_drvdata(dev);
 
 	if (vibrator->enabled)
 		msm_vibrator_start(vibrator);
diff --git a/drivers/input/misc/palmas-pwrbutton.c b/drivers/input/misc/palmas-pwrbutton.c
index 1e1baed63929..27617868b292 100644
--- a/drivers/input/misc/palmas-pwrbutton.c
+++ b/drivers/input/misc/palmas-pwrbutton.c
@@ -270,8 +270,7 @@ static int palmas_pwron_remove(struct platform_device *pdev)
  */
 static int __maybe_unused palmas_pwron_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct palmas_pwron *pwron = platform_get_drvdata(pdev);
+	struct palmas_pwron *pwron = dev_get_drvdata(dev);
 
 	cancel_delayed_work_sync(&pwron->input_work);
 
@@ -291,8 +290,7 @@ static int __maybe_unused palmas_pwron_suspend(struct device *dev)
  */
 static int __maybe_unused palmas_pwron_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct palmas_pwron *pwron = platform_get_drvdata(pdev);
+	struct palmas_pwron *pwron = dev_get_drvdata(dev);
 
 	if (device_may_wakeup(dev))
 		disable_irq_wake(pwron->irq);
diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index a661e77545c5..9734374964f2 100644
--- a/drivers/input/misc/regulator-haptic.c
+++ b/drivers/input/misc/regulator-haptic.c
@@ -203,8 +203,7 @@ static int regulator_haptic_probe(struct platform_device *pdev)
 
 static int __maybe_unused regulator_haptic_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
+	struct regulator_haptic *haptic = dev_get_drvdata(dev);
 	int error;
 
 	error = mutex_lock_interruptible(&haptic->mutex);
@@ -222,8 +221,7 @@ static int __maybe_unused regulator_haptic_suspend(struct device *dev)
 
 static int __maybe_unused regulator_haptic_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
+	struct regulator_haptic *haptic = dev_get_drvdata(dev);
 	unsigned int magnitude;
 
 	mutex_lock(&haptic->mutex);
diff --git a/drivers/input/misc/stpmic1_onkey.c b/drivers/input/misc/stpmic1_onkey.c
index 7b49c9997df7..ff4761540539 100644
--- a/drivers/input/misc/stpmic1_onkey.c
+++ b/drivers/input/misc/stpmic1_onkey.c
@@ -150,8 +150,7 @@ static int stpmic1_onkey_probe(struct platform_device *pdev)
 
 static int __maybe_unused stpmic1_onkey_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct stpmic1_onkey *onkey = platform_get_drvdata(pdev);
+	struct stpmic1_onkey *onkey = dev_get_drvdata(dev);
 
 	if (device_may_wakeup(dev)) {
 		enable_irq_wake(onkey->irq_falling);
@@ -162,8 +161,7 @@ static int __maybe_unused stpmic1_onkey_suspend(struct device *dev)
 
 static int __maybe_unused stpmic1_onkey_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct stpmic1_onkey *onkey = platform_get_drvdata(pdev);
+	struct stpmic1_onkey *onkey = dev_get_drvdata(dev);
 
 	if (device_may_wakeup(dev)) {
 		disable_irq_wake(onkey->irq_falling);
diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
index e0ff616fb857..f7ef67997863 100644
--- a/drivers/input/misc/twl4030-vibra.c
+++ b/drivers/input/misc/twl4030-vibra.c
@@ -145,8 +145,7 @@ static void twl4030_vibra_close(struct input_dev *input)
 /*** Module ***/
 static int __maybe_unused twl4030_vibra_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct vibra_info *info = platform_get_drvdata(pdev);
+	struct vibra_info *info = dev_get_drvdata(dev);
 
 	if (info->enabled)
 		vibra_disable(info);
diff --git a/drivers/input/misc/twl6040-vibra.c b/drivers/input/misc/twl6040-vibra.c
index 93235a007d07..900be3420967 100644
--- a/drivers/input/misc/twl6040-vibra.c
+++ b/drivers/input/misc/twl6040-vibra.c
@@ -212,8 +212,7 @@ static void twl6040_vibra_close(struct input_dev *input)
 
 static int __maybe_unused twl6040_vibra_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct vibra_info *info = platform_get_drvdata(pdev);
+	struct vibra_info *info = dev_get_drvdata(dev);
 
 	cancel_work_sync(&info->play_work);
 
diff --git a/drivers/input/mouse/navpoint.c b/drivers/input/mouse/navpoint.c
index 0b75248c8380..f47d278c2657 100644
--- a/drivers/input/mouse/navpoint.c
+++ b/drivers/input/mouse/navpoint.c
@@ -317,8 +317,7 @@ static int navpoint_remove(struct platform_device *pdev)
 
 static int __maybe_unused navpoint_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct navpoint *navpoint = platform_get_drvdata(pdev);
+	struct navpoint *navpoint = dev_get_drvdata(dev);
 	struct input_dev *input = navpoint->input;
 
 	mutex_lock(&input->mutex);
@@ -331,8 +330,7 @@ static int __maybe_unused navpoint_suspend(struct device *dev)
 
 static int __maybe_unused navpoint_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct navpoint *navpoint = platform_get_drvdata(pdev);
+	struct navpoint *navpoint = dev_get_drvdata(dev);
 	struct input_dev *input = navpoint->input;
 
 	mutex_lock(&input->mutex);
diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index c10fc594f94d..493322ed0e34 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -511,8 +511,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 
 static int __maybe_unused imx6ul_tsc_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct imx6ul_tsc *tsc = platform_get_drvdata(pdev);
+	struct imx6ul_tsc *tsc = dev_get_drvdata(dev);
 	struct input_dev *input_dev = tsc->input;
 
 	mutex_lock(&input_dev->mutex);
@@ -531,8 +530,7 @@ static int __maybe_unused imx6ul_tsc_suspend(struct device *dev)
 
 static int __maybe_unused imx6ul_tsc_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct imx6ul_tsc *tsc = platform_get_drvdata(pdev);
+	struct imx6ul_tsc *tsc = dev_get_drvdata(dev);
 	struct input_dev *input_dev = tsc->input;
 	int retval = 0;
 
-- 
2.11.0

