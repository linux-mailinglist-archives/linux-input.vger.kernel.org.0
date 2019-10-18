Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF946DC931
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 17:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505184AbfJRPmm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 11:42:42 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:47635 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505168AbfJRPmk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 11:42:40 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mlf8e-1hdwQw37Za-00ihx9; Fri, 18 Oct 2019 17:42:28 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 26/46] ARM: pxa: zylonite: use gpio lookup instead mfp header
Date:   Fri, 18 Oct 2019 17:41:41 +0200
Message-Id: <20191018154201.1276638-26-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EPfdFNGMYkktAwTtVc77ZjC/u3+lzwkn9SfHHkjQqYryFRSRDgF
 ri+bw6JPu+6gMo4DnAnJHKHZxaOMUZE7fUrMhZLetVePjkAUj1l08PDhNNqpub0rXxy9ZIP
 kGrI7wefjbcBNTpWWnidB0pxWkI2vq9r/vFR6V1x6HZvcgFWnJOLgNRsvIoeDU+CMs6flyt
 bDifXaf0KF1O25W114BLg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zs4SFYr2g24=:7WTzUVql3CseAxe0/QSQDE
 gaNZ1GlSN/EhKzBBHWyD/qddqOLolS3uJr7QWAX67KsRrXMl137vRbHdxknp11Ve5GcqHqsI8
 xfmNMAwp7hayjyMXdLvpszJgqi3mXvzlcYInHR3sq5CanCrjSfvtMz/42XvbfI1hp89jDVrKu
 CgmIBsqEIR97kdemRZfhhCioetk79pDst+AnD4dyo9arPLh9srxokuiZ+2HVc241WHzxZJdrU
 mrxelO1vt/DQIFmlLMm66LIA5mBC8SGCag++URIvgc4ZpeVuEg0LQeX+0kUG6v7g09qz50NZX
 a1X/mIVEvue6HDGqVRfBadPbi73ht3oqA6ZMxrwhypCD2yv4P/9BioJREoXYn0FFh9GHdAqbh
 yx0j9eUGEr14ZauY537Cy1IWlMAJ0iI+VQntT6n1YjJnhngxQk2rRRV6H5vV7vL6CPHI1aEf9
 R3jCmKT/9iUOYXH3nrZVmzMUgsdz5NJR3cR6cNuj7cQVqlqNErmqgTSQbokeArTdZg+EdD0di
 fjIx1FA7ar5p/JZQpnGeUJDT21jd4zKAYb5qIBz/67ILp+QpXRfQP1yIWzS0ql3WeQT1UIvDE
 C8bjPDvsvWKElhEuyZxtrQMWzftgPhmDjhiGlL9ci2XmL2Fvd4lqYc1GJbEFpibMIY07vFr7u
 RH1Wiuex8tT/ldcucr4+KCV0rCrsWiOhv/QIg/RpiHLYjg2Qzzb7/xrm40sgXIRI3gU1nPeE2
 /nALa08zOEDAZTfvqvWbQ4dqJmTtKBFob2CSPURZdAGi6r5KobsmwfwHH320EgNBsGfbyfM03
 I+R5EeD2TCQIHA7ivxYVLr9mWpVdsJ0YZUQvORAs0fvC0yIpnqAVEE64zjB98NWtd8K32OemS
 sqRvKGMvPiv3DK5nRzsg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mach/mfp.h header is only used by this one driver
for hardcoded gpio numbers. Change that to use a lookup
table instead.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/zylonite.c                | 31 +++++++++++++++++++++
 drivers/input/touchscreen/zylonite-wm97xx.c | 20 +++++++------
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index e3ae45f444d5..d6c0e8866e18 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -32,6 +32,7 @@
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
+#include <mach/mfp.h>
 
 #include "devices.h"
 #include "generic.h"
@@ -426,6 +427,35 @@ static void __init zylonite_init_ohci(void)
 static inline void zylonite_init_ohci(void) {}
 #endif /* CONFIG_USB_OHCI_HCD || CONFIG_USB_OHCI_HCD_MODULE */
 
+static struct gpiod_lookup_table zylonite_wm97xx_touch_gpio15_table = {
+	.dev_id = "wm97xx-touch.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", mfp_to_gpio(MFP_PIN_GPIO15),
+			    "touch", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table zylonite_wm97xx_touch_gpio26_table = {
+	.dev_id = "wm97xx-touch.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", mfp_to_gpio(MFP_PIN_GPIO26),
+			    "touch", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static void __init zylonite_init_wm97xx_touch(void)
+{
+	if (!IS_ENABLED(CONFIG_TOUCHSCREEN_WM97XX_ZYLONITE))
+		return;
+
+	if (cpu_is_pxa320())
+		gpiod_add_lookup_table(&zylonite_wm97xx_touch_gpio15_table);
+	else
+		gpiod_add_lookup_table(&zylonite_wm97xx_touch_gpio26_table);
+}
+
 static void __init zylonite_init(void)
 {
 	pxa_set_ffuart_info(NULL);
@@ -451,6 +481,7 @@ static void __init zylonite_init(void)
 	zylonite_init_nand();
 	zylonite_init_leds();
 	zylonite_init_ohci();
+	zylonite_init_wm97xx_touch();
 }
 
 MACHINE_START(ZYLONITE, "PXA3xx Platform Development Kit (aka Zylonite)")
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index f57bdf083188..cabdd6e3c6f8 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -17,14 +17,13 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/mfp.h>
 #include <mach/regs-ac97.h>
 
 struct continuous {
@@ -181,14 +180,17 @@ static struct wm97xx_mach_ops zylonite_mach_ops = {
 static int zylonite_wm97xx_probe(struct platform_device *pdev)
 {
 	struct wm97xx *wm = platform_get_drvdata(pdev);
-	int gpio_touch_irq;
-
-	if (cpu_is_pxa320())
-		gpio_touch_irq = mfp_to_gpio(MFP_PIN_GPIO15);
-	else
-		gpio_touch_irq = mfp_to_gpio(MFP_PIN_GPIO26);
+	struct gpio_desc *gpio_touch_irq;
+	int err;
+
+	gpio_touch_irq = devm_gpiod_get(&pdev->dev, "touch", GPIOD_IN);
+	err = PTR_ERR_OR_ZERO(gpio_touch_irq);
+	if (err) {
+		dev_err(&pdev->dev, "Cannot get irq gpio: %d\n", err);
+		return err;
+	}
 
-	wm->pen_irq = gpio_to_irq(gpio_touch_irq);
+	wm->pen_irq = gpiod_to_irq(gpio_touch_irq);
 	irq_set_irq_type(wm->pen_irq, IRQ_TYPE_EDGE_BOTH);
 
 	wm97xx_config_gpio(wm, WM97XX_GPIO_13, WM97XX_GPIO_IN,
-- 
2.20.0

