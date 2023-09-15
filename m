Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF7D7A1853
	for <lists+linux-input@lfdr.de>; Fri, 15 Sep 2023 10:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbjIOIN3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Sep 2023 04:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbjIOIMz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Sep 2023 04:12:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13F22738;
        Fri, 15 Sep 2023 01:12:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFFF2C116D2;
        Fri, 15 Sep 2023 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694765529;
        bh=XbJesZYrHebaNGNu/T1+Gv/QLb0fb+GrhVMSYIMYiO0=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
        b=cQGw3fsjUe5oHENEjVsPANAqorx1kXtLw230Rp9edvXN4XvbGfyRFxzQLkY9AiRRO
         GhAFiq68UY4zn4t9KsjOujY+KO43XSCzBSQ/32ZLnWbeamd3wFR9scvtRS6ulxaR9f
         Tw6NPOFzGgOFMczDWNyp3VSNh/skeIwiUTWp7TPgJWUFXRHy6WxB6ezvg15vGMm3lo
         fFIlXDYfnDCyiPJvCUqr96OW2agIWhcoV+DaqLnb6zDuiEthA2xImdwFFjOERsSy/3
         FhQzq44UD9+tSQtUBCS5yC+xM+eNQnMa2afiI2hustnYh3rGEfgqZHrUqI/jJtZaU+
         ixWRxjUbvTVbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.lore.kernel.org (Postfix) with ESMTP id CC8BDEE643D;
        Fri, 15 Sep 2023 08:12:09 +0000 (UTC)
From:   Nikita Shubin via B4 Relay 
        <devnull+nikita.shubin.maquefel.me@kernel.org>
Date:   Fri, 15 Sep 2023 11:11:12 +0300
Subject: [PATCH v4 30/42] input: keypad: ep93xx: add DT support for Cirrus
 EP93xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230915-ep93xx-v4-30-a1d779dcec10@maquefel.me>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
In-Reply-To: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
To:     Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Damien Le Moal <dlemoal@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694765525; l=9140;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=ogiXfM99H7y+63ithPwmW+rumJu2u4KwKTQ67tCbJVs=; =?utf-8?q?b=3D6oRHR35WELqB?=
 =?utf-8?q?BJrm2SYK6KF+3FjVPhdrRyBnKTV+SYAH9oZCG6H3lZHr7u5FYrO+bMbE9eLUKeBD?=
 dNftaerxBF6UP8ISPoEHaTg4m4+apQw40ZXn2UduYXg4F3SV1ImF
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: <nikita.shubin@maquefel.me>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nikita Shubin <nikita.shubin@maquefel.me>

- drop flags, they were not used anyway
- add OF ID match table
- process "autorepeat", "debounce-delay-ms", prescale from device tree
- drop platform data usage and it's header
- keymap goes from device tree now on

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 arch/arm/mach-ep93xx/core.c            | 46 ---------------------
 drivers/input/keyboard/ep93xx_keypad.c | 74 ++++++++++------------------------
 include/linux/soc/cirrus/ep93xx.h      |  4 --
 3 files changed, 22 insertions(+), 102 deletions(-)

diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index c81a2e84821b..c60a9d3632dd 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -696,52 +696,6 @@ void __init ep93xx_register_keypad(struct ep93xx_keypad_platform_data *data)
 	platform_device_register(&ep93xx_keypad_device);
 }
 
-int ep93xx_keypad_acquire_gpio(struct platform_device *pdev)
-{
-	int err;
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		err = gpio_request(EP93XX_GPIO_LINE_C(i), dev_name(&pdev->dev));
-		if (err)
-			goto fail_gpio_c;
-		err = gpio_request(EP93XX_GPIO_LINE_D(i), dev_name(&pdev->dev));
-		if (err)
-			goto fail_gpio_d;
-	}
-
-	/* Enable the keypad controller; GPIO ports C and D used for keypad */
-	ep93xx_devcfg_clear_bits(EP93XX_SYSCON_DEVCFG_KEYS |
-				 EP93XX_SYSCON_DEVCFG_GONK);
-
-	return 0;
-
-fail_gpio_d:
-	gpio_free(EP93XX_GPIO_LINE_C(i));
-fail_gpio_c:
-	for (--i; i >= 0; --i) {
-		gpio_free(EP93XX_GPIO_LINE_C(i));
-		gpio_free(EP93XX_GPIO_LINE_D(i));
-	}
-	return err;
-}
-EXPORT_SYMBOL(ep93xx_keypad_acquire_gpio);
-
-void ep93xx_keypad_release_gpio(struct platform_device *pdev)
-{
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		gpio_free(EP93XX_GPIO_LINE_C(i));
-		gpio_free(EP93XX_GPIO_LINE_D(i));
-	}
-
-	/* Disable the keypad controller; GPIO ports C and D used for GPIO */
-	ep93xx_devcfg_set_bits(EP93XX_SYSCON_DEVCFG_KEYS |
-			       EP93XX_SYSCON_DEVCFG_GONK);
-}
-EXPORT_SYMBOL(ep93xx_keypad_release_gpio);
-
 /*************************************************************************
  * EP93xx I2S audio peripheral handling
  *************************************************************************/
diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 55075addcac2..bc302f0fd0b3 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -6,20 +6,13 @@
  *
  * Based on the pxa27x matrix keypad controller by Rodolfo Giometti.
  *
- * NOTE:
- *
- * The 3-key reset is triggered by pressing the 3 keys in
- * Row 0, Columns 2, 4, and 7 at the same time.  This action can
- * be disabled by setting the EP93XX_KEYPAD_DISABLE_3_KEY flag.
- *
- * Normal operation for the matrix does not autorepeat the key press.
- * This action can be enabled by setting the EP93XX_KEYPAD_AUTOREPEAT
- * flag.
  */
 
 #include <linux/bits.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/interrupt.h>
 #include <linux/clk.h>
 #include <linux/io.h>
@@ -27,7 +20,6 @@
 #include <linux/input/matrix_keypad.h>
 #include <linux/slab.h>
 #include <linux/soc/cirrus/ep93xx.h>
-#include <linux/platform_data/keypad-ep93xx.h>
 #include <linux/pm_wakeirq.h>
 
 /*
@@ -61,12 +53,16 @@
 #define KEY_REG_KEY1_MASK	GENMASK(5, 0)
 #define KEY_REG_KEY1_SHIFT	0
 
+#define EP93XX_MATRIX_ROWS		(8)
+#define EP93XX_MATRIX_COLS		(8)
+
 #define EP93XX_MATRIX_SIZE	(EP93XX_MATRIX_ROWS * EP93XX_MATRIX_COLS)
 
 struct ep93xx_keypad {
-	struct ep93xx_keypad_platform_data *pdata;
 	struct input_dev *input_dev;
 	struct clk *clk;
+	unsigned int	debounce;
+	uint16_t	prescale;
 
 	void __iomem *mmio_base;
 
@@ -133,23 +129,11 @@ static irqreturn_t ep93xx_keypad_irq_handler(int irq, void *dev_id)
 
 static void ep93xx_keypad_config(struct ep93xx_keypad *keypad)
 {
-	struct ep93xx_keypad_platform_data *pdata = keypad->pdata;
 	unsigned int val = 0;
 
-	clk_set_rate(keypad->clk, pdata->clk_rate);
-
-	if (pdata->flags & EP93XX_KEYPAD_DISABLE_3_KEY)
-		val |= KEY_INIT_DIS3KY;
-	if (pdata->flags & EP93XX_KEYPAD_DIAG_MODE)
-		val |= KEY_INIT_DIAG;
-	if (pdata->flags & EP93XX_KEYPAD_BACK_DRIVE)
-		val |= KEY_INIT_BACK;
-	if (pdata->flags & EP93XX_KEYPAD_TEST_MODE)
-		val |= KEY_INIT_T2;
-
-	val |= ((pdata->debounce << KEY_INIT_DBNC_SHIFT) & KEY_INIT_DBNC_MASK);
+	val |= ((keypad->debounce << KEY_INIT_DBNC_SHIFT) & KEY_INIT_DBNC_MASK);
 
-	val |= ((pdata->prescale << KEY_INIT_PRSCL_SHIFT) & KEY_INIT_PRSCL_MASK);
+	val |= ((keypad->prescale << KEY_INIT_PRSCL_SHIFT) & KEY_INIT_PRSCL_MASK);
 
 	__raw_writel(val, keypad->mmio_base + KEY_INIT);
 }
@@ -220,17 +204,10 @@ static int ep93xx_keypad_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(ep93xx_keypad_pm_ops,
 				ep93xx_keypad_suspend, ep93xx_keypad_resume);
 
-static void ep93xx_keypad_release_gpio_action(void *_pdev)
-{
-	struct platform_device *pdev = _pdev;
-
-	ep93xx_keypad_release_gpio(pdev);
-}
-
 static int ep93xx_keypad_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct ep93xx_keypad *keypad;
-	const struct matrix_keymap_data *keymap_data;
 	struct input_dev *input_dev;
 	int err;
 
@@ -238,14 +215,6 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	if (!keypad)
 		return -ENOMEM;
 
-	keypad->pdata = dev_get_platdata(&pdev->dev);
-	if (!keypad->pdata)
-		return -EINVAL;
-
-	keymap_data = keypad->pdata->keymap_data;
-	if (!keymap_data)
-		return -EINVAL;
-
 	keypad->irq = platform_get_irq(pdev, 0);
 	if (keypad->irq < 0)
 		return keypad->irq;
@@ -254,19 +223,13 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	if (IS_ERR(keypad->mmio_base))
 		return PTR_ERR(keypad->mmio_base);
 
-	err = ep93xx_keypad_acquire_gpio(pdev);
-	if (err)
-		return err;
-
-	err = devm_add_action_or_reset(&pdev->dev,
-				       ep93xx_keypad_release_gpio_action, pdev);
-	if (err)
-		return err;
-
 	keypad->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(keypad->clk))
 		return PTR_ERR(keypad->clk);
 
+	device_property_read_u32(dev, "debounce-delay-ms", &keypad->debounce);
+	device_property_read_u16(dev, "cirrus,prescale", &keypad->prescale);
+
 	input_dev = devm_input_allocate_device(&pdev->dev);
 	if (!input_dev)
 		return -ENOMEM;
@@ -278,13 +241,13 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	input_dev->open = ep93xx_keypad_open;
 	input_dev->close = ep93xx_keypad_close;
 
-	err = matrix_keypad_build_keymap(keymap_data, NULL,
+	err = matrix_keypad_build_keymap(NULL, NULL,
 					 EP93XX_MATRIX_ROWS, EP93XX_MATRIX_COLS,
 					 keypad->keycodes, input_dev);
 	if (err)
 		return err;
 
-	if (keypad->pdata->flags & EP93XX_KEYPAD_AUTOREPEAT)
+	if (device_property_read_bool(&pdev->dev, "autorepeat"))
 		__set_bit(EV_REP, input_dev->evbit);
 	input_set_drvdata(input_dev, keypad);
 
@@ -315,10 +278,17 @@ static int ep93xx_keypad_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ep93xx_keypad_of_ids[] = {
+	{ .compatible = "cirrus,ep9307-keypad" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ep93xx_keypad_of_ids);
+
 static struct platform_driver ep93xx_keypad_driver = {
 	.driver		= {
 		.name	= "ep93xx-keypad",
 		.pm	= pm_sleep_ptr(&ep93xx_keypad_pm_ops),
+		.of_match_table = ep93xx_keypad_of_ids,
 	},
 	.probe		= ep93xx_keypad_probe,
 	.remove		= ep93xx_keypad_remove,
diff --git a/include/linux/soc/cirrus/ep93xx.h b/include/linux/soc/cirrus/ep93xx.h
index 267529ee2b3d..4327f66b7cf5 100644
--- a/include/linux/soc/cirrus/ep93xx.h
+++ b/include/linux/soc/cirrus/ep93xx.h
@@ -16,8 +16,6 @@ int ep93xx_pwm_acquire_gpio(struct platform_device *pdev);
 void ep93xx_pwm_release_gpio(struct platform_device *pdev);
 int ep93xx_ide_acquire_gpio(struct platform_device *pdev);
 void ep93xx_ide_release_gpio(struct platform_device *pdev);
-int ep93xx_keypad_acquire_gpio(struct platform_device *pdev);
-void ep93xx_keypad_release_gpio(struct platform_device *pdev);
 int ep93xx_i2s_acquire(void);
 void ep93xx_i2s_release(void);
 unsigned int ep93xx_chip_revision(void);
@@ -27,8 +25,6 @@ static inline int ep93xx_pwm_acquire_gpio(struct platform_device *pdev) { return
 static inline void ep93xx_pwm_release_gpio(struct platform_device *pdev) {}
 static inline int ep93xx_ide_acquire_gpio(struct platform_device *pdev) { return 0; }
 static inline void ep93xx_ide_release_gpio(struct platform_device *pdev) {}
-static inline int ep93xx_keypad_acquire_gpio(struct platform_device *pdev) { return 0; }
-static inline void ep93xx_keypad_release_gpio(struct platform_device *pdev) {}
 static inline int ep93xx_i2s_acquire(void) { return 0; }
 static inline void ep93xx_i2s_release(void) {}
 static inline unsigned int ep93xx_chip_revision(void) { return 0; }

-- 
2.39.2

