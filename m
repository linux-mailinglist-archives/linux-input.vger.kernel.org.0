Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBE0DC973
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 17:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405876AbfJRPoi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 11:44:38 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48831 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408932AbfJRPml (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 11:42:41 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mzhf5-1i7n6L1nbV-00viX6; Fri, 18 Oct 2019 17:42:28 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 25/46] ARM: pxa: mainstone-wm97xx: use gpio lookup table
Date:   Fri, 18 Oct 2019 17:41:40 +0200
Message-Id: <20191018154201.1276638-25-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4UTpLqdmoi+9bI3qii2R2ctZQ++VgR2O0K161Za+pjkATAsTZCs
 gOrRZ3yh3c9sW+RbanY8C5jRPAuYUH3o346Y3goFrFXpmoNndwcpQxTO1CK6iIYueMaXVWD
 gjWm7tvq0Y7Zx56vf42VcXxebb4CekslIaMcvNrU/G7dC5DBSndsyLp6Zwafuo2FUFEN9Lr
 6Cdz8yw+p+Q0h0sxtRzAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BI2SzsG3+9M=:XDrkSOA4eoyBd594Sa4aUi
 yuX3kM9UEr62UVIZdO84xZ8NJpyMJaWdz5mPbIgV2lXDJ9l1si6HNrado1XlRi5DqzRRZfHm9
 7C1fCjfZxQV5T0vHrCEjucD6jIsNo8e+voo8ASgtLuoGokf00aDXaWyq/1k6pOiE15BiSvWiu
 t4E3NUntJ2jqkyUrXGrD0foixCK+czA9c6VLmT8EaIEOGFtkpKW8IpCU3aIP2bIWLZzCH5ETX
 fxZ36atwyXkpchYLPyNJksPOoRAlWp0KbotmNdme7qB48+KLUi6E+jYRDZ0Em4q6BI6E1QMIS
 oEtwLClRCx3bSOabilnBSPyXALOgMOTFulpCjvBgdNmDHzAkyaPLLc4zSne406MuF61uhd3dF
 9kGPBzGzNv1GPSLpHXxD72pBP5uYPrp1BM4pdkNHjXhAZ8JFSPLunyadQQ+Uw9LUZAi/yaAut
 ke910jugqcB2YQnSi75w29kOTB4/3ei2snlztwmvnMGB2MWG7Jm6FGLeP3nPMu9T81/sUgFGP
 KbZ5EPHmVxQR/k3JwTvgQIjnpQ5uY+uBhzhzOE5R3b9TJChhPe076IYKWnM7kAQJsqfsOw6O8
 sq6rHid/VWZMrqUlwYHSa6nj97L8mr6YqBgqdAq10CZZoT9tgSWcFotLmSJqsy/tRTkk23jBI
 rLVd2/WPb/7jOQOgG3+Fxrsd1j5ZWiYe+iRj9EAkiZjC25yd+echwyi4ocxWiRO5c0rgZuKlV
 KnNPZMEmspCu0O1fZ2VKaX+GFjYJLNG1APWPSqGsdJEKSZVDM2MwhosLOgj01Xf/rB0MiF46K
 OBf2DEtm1RtJUaTZTNVolNU67J9kzjH6PaHcG4CcSZ4LzJh/LlhcLFTNdnLHUelSgxFf0IESV
 21xGiK94kZJN58ci3i5g==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver hardcodes gpio numbers without a header file.
Use lookup tables instead.

Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c                |  9 +++++
 arch/arm/mach-pxa/palmld.c                   |  9 +++++
 arch/arm/mach-pxa/palmt5.c                   |  9 +++++
 arch/arm/mach-pxa/palmtx.c                   |  9 +++++
 drivers/input/touchscreen/mainstone-wm97xx.c | 35 ++++++++------------
 5 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index 5f7bc5a9215e..48b89bca7b46 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -545,6 +545,14 @@ static struct gpiod_lookup_table mainstone_pcmcia_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table mainstone_wm97xx_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 4, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init mainstone_init(void)
 {
 	int SW7 = 0;  /* FIXME: get from SCR (Mst doc section 3.2.1.1) */
@@ -559,6 +567,7 @@ static void __init mainstone_init(void)
 		      "mst-pcmcia1", MST_PCMCIA_INPUTS, 0, NULL,
 		      NULL, mst_pcmcia1_irqs);
 	gpiod_add_lookup_table(&mainstone_pcmcia_gpio_table);
+	gpiod_add_lookup_table(&mainstone_wm97xx_gpio_table);
 
 	pxa_set_ffuart_info(NULL);
 	pxa_set_btuart_info(NULL);
diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
index d821606ce0b5..32308c63884e 100644
--- a/arch/arm/mach-pxa/palmld.c
+++ b/arch/arm/mach-pxa/palmld.c
@@ -347,6 +347,14 @@ static struct gpiod_lookup_table palmld_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmld_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmld_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmld_pin_config));
@@ -355,6 +363,7 @@ static void __init palmld_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmld_mci_gpio_table);
+	gpiod_add_lookup_table(&palmld_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMLD_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_irda_init(GPIO_NR_PALMLD_IR_DISABLE);
diff --git a/arch/arm/mach-pxa/palmt5.c b/arch/arm/mach-pxa/palmt5.c
index 4e2cff87deba..f21cb23c51ac 100644
--- a/arch/arm/mach-pxa/palmt5.c
+++ b/arch/arm/mach-pxa/palmt5.c
@@ -191,6 +191,14 @@ static struct gpiod_lookup_table palmt5_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmt5_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmt5_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmt5_pin_config));
@@ -199,6 +207,7 @@ static void __init palmt5_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmt5_mci_gpio_table);
+	gpiod_add_lookup_table(&palmt5_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMT5_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMT5_USB_DETECT_N,
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index d6819413a8d6..e0d9f7882285 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -346,6 +346,14 @@ static struct gpiod_lookup_table palmtx_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmtx_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmtx_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmtx_pin_config));
@@ -354,6 +362,7 @@ static void __init palmtx_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmtx_mci_gpio_table);
+	gpiod_add_lookup_table(&palmtx_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMTX_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMTX_USB_DETECT_N,
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index f8564b398eb3..87655105ef3a 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -21,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/wm97xx.h>
@@ -58,7 +59,7 @@ static const struct continuous cinfo[] = {
 /* continuous speed index */
 static int sp_idx;
 static u16 last, tries;
-static int irq;
+static struct gpio_desc *gpiod_irq;
 
 /*
  * Pen sampling frequency (Hz) in continuous mode.
@@ -194,28 +195,21 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 	/* IRQ driven touchscreen is used on Palm hardware */
 	if (machine_is_palmt5() || machine_is_palmtx() || machine_is_palmld()) {
 		pen_int = 1;
-		irq = 27;
 		/* There is some obscure mutant of WM9712 interbred with WM9713
 		 * used on Palm HW */
 		wm->variant = WM97xx_WM1613;
-	} else if (machine_is_mainstone() && pen_int)
-		irq = 4;
-
-	if (irq) {
-		ret = gpio_request(irq, "Touchscreen IRQ");
-		if (ret)
-			goto out;
-
-		ret = gpio_direction_input(irq);
-		if (ret) {
-			gpio_free(irq);
-			goto out;
-		}
+	}
+
+	if (pen_int) {
+		gpiod_irq = gpiod_get(wm->dev, "touch", GPIOD_IN);
+		if (IS_ERR(gpiod_irq))
+			pen_int = 0;
+	}
 
-		wm->pen_irq = gpio_to_irq(irq);
+	if (pen_int) {
+		wm->pen_irq = gpiod_to_irq(gpiod_irq);
 		irq_set_irq_type(wm->pen_irq, IRQ_TYPE_EDGE_BOTH);
-	} else /* pen irq not supported */
-		pen_int = 0;
+	}
 
 	/* codec specific irq config */
 	if (pen_int) {
@@ -242,7 +236,6 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 		}
 	}
 
-out:
 	return ret;
 }
 
@@ -250,8 +243,8 @@ static void wm97xx_acc_shutdown(struct wm97xx *wm)
 {
 	/* codec specific deconfig */
 	if (pen_int) {
-		if (irq)
-			gpio_free(irq);
+		if (gpiod_irq)
+			gpiod_put(gpiod_irq);
 		wm->pen_irq = 0;
 	}
 }
-- 
2.20.0

