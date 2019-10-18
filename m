Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7FCFDC928
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 17:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408982AbfJRPn6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 11:43:58 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40943 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505179AbfJRPmn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 11:42:43 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mysa4-1i8cRr1njm-00vzeJ; Fri, 18 Oct 2019 17:42:29 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 28/46] input: touchscreen: mainstone: sync with zylonite driver
Date:   Fri, 18 Oct 2019 17:41:43 +0200
Message-Id: <20191018154201.1276638-28-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:saH5kjlynqqUDVkNub5Ma1XPk99l3/V8Shfn2TYRSAgJ+P8L2B6
 BW8X/SikVvaOq1ChVLPL+Of+XJoeTLZrZY6UpRMW6ZDaHWB1H67j0yTBW4Nn+QKik7OfK0s
 BRLFMQTIUi8MD4xWkYicAIqu9TTHjaw4cO810QTUsevOMSakQjKerNMLBoqT+m4COuEiotF
 xKold953kpPZEF6py6DGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VFZafkCMpQc=:TSB0QPeWSMmMsc+ju761Lc
 Aor1M1UlkuWqzyCepVKJRWMw6mjhUcLJ2ch5cAT+HfnrQ/zaGA7ES5Vtn5PKgc0+DRabL2tin
 tfO/ctOrIlsDUU0yqo5657VddgJy+LR/yXRHlILuJCdtdAl2P+Vbp8rL9+fJDRgyLaFh2+WDr
 o0eE1bzfjJ623IfYpCSXIWN2WE9n/pLpb5DyCyMEXNpMixLRmoZvP9zzSGN4co2mFb8+qnZVP
 R5Nc9M+GsZZ2UZJmqiyZXjggRwrGFGWSSL65TlviYwrPh3eCL+XG5DdhwRovgpTKaMjXQuI4o
 E0okqEkx2EQncIF5Ah3i9+aAPiwLivXaa8RvIr9XYrDLqWoqhvvYdf2lvUnCf5ZwheHKtq8HY
 mJJAnncRKYt/YdyhxqNdlknDNgF4cKjzQIipD5FDYo6USfkma9BcCsSGOmn1Xka9auBrZ42N9
 i1XEjPsXdOLDyLlpstrB7ehWCL0fop5tCKMZ6Pz8tbplQuhOhFaqD4V8nBatCUwxqdFZIsclM
 FB215AW8DvS4J7rMi5UFJzKV9qT6uvWX9g5DBuMo9Ppdr4oZA8WvQMH44goj8QqTGAysuU8aS
 7dn4p/d6ldtNR9hYXFQ6SUbXyk1zox88b4Leg4swSNkYzaEIDdUF3vNN6PDCrJA7XfR+BVJkk
 rLJuUXTLn/bCaVYDKfSPUSoCHLCxyjfH5xiwKpvMYkcLqsS/Yj+EXgkGaN7pd4lTJJTwyysMK
 O265YIQ46ZkZpv8v97d5kYuNd8rjVPcmwKh8MMjrQl8Hdg0xG8I0oCpQtDvQ2genFLTEhtaye
 emngIGpWB17R2Lvv7SzpHy2ghJVH4vhbzk4xjaB+NMm+rvziRDl5mOpUHgxHWNSQuwu+67tR4
 fBf7nvAQTI1eTA35d6Yw==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The two drivers are almost identical and can work on a variety
of hardware in principle. The mainstone driver supports additional
hardware, and the zylonite driver has a few cleanup patches.

Sync the two by adding the zylonite changes into the mainstone
one, and checking for the zylonite board to order to keep the
default behavior (interrupt enabled) there.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/mainstone-wm97xx.c | 59 ++++++++++----------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 618c80847d9f..940d3c92b1f8 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -24,9 +24,9 @@
 #include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/wm97xx.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/soc/pxa/cpu.h>
+#include <linux/wm97xx.h>
 
 #include <mach/regs-ac97.h>
 
@@ -42,23 +42,22 @@ struct continuous {
 #define WM_READS(sp) ((sp / HZ) + 1)
 
 static const struct continuous cinfo[] = {
-	{WM9705_ID2, 0, WM_READS(94), 94},
-	{WM9705_ID2, 1, WM_READS(188), 188},
-	{WM9705_ID2, 2, WM_READS(375), 375},
-	{WM9705_ID2, 3, WM_READS(750), 750},
-	{WM9712_ID2, 0, WM_READS(94), 94},
-	{WM9712_ID2, 1, WM_READS(188), 188},
-	{WM9712_ID2, 2, WM_READS(375), 375},
-	{WM9712_ID2, 3, WM_READS(750), 750},
-	{WM9713_ID2, 0, WM_READS(94), 94},
-	{WM9713_ID2, 1, WM_READS(120), 120},
-	{WM9713_ID2, 2, WM_READS(154), 154},
-	{WM9713_ID2, 3, WM_READS(188), 188},
+	{ WM9705_ID2, 0, WM_READS(94),  94  },
+	{ WM9705_ID2, 1, WM_READS(188), 188 },
+	{ WM9705_ID2, 2, WM_READS(375), 375 },
+	{ WM9705_ID2, 3, WM_READS(750), 750 },
+	{ WM9712_ID2, 0, WM_READS(94),  94  },
+	{ WM9712_ID2, 1, WM_READS(188), 188 },
+	{ WM9712_ID2, 2, WM_READS(375), 375 },
+	{ WM9712_ID2, 3, WM_READS(750), 750 },
+	{ WM9713_ID2, 0, WM_READS(94),  94  },
+	{ WM9713_ID2, 1, WM_READS(120), 120 },
+	{ WM9713_ID2, 2, WM_READS(154), 154 },
+	{ WM9713_ID2, 3, WM_READS(188), 188 },
 };
 
 /* continuous speed index */
 static int sp_idx;
-static u16 last, tries;
 static struct gpio_desc *gpiod_irq;
 
 /*
@@ -102,7 +101,7 @@ static void wm97xx_acc_pen_up(struct wm97xx *wm)
 {
 	unsigned int count;
 
-	schedule_timeout_uninterruptible(1);
+	msleep(1);
 
 	if (cpu_is_pxa27x()) {
 		while (MISR & (1 << 2))
@@ -117,13 +116,14 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 {
 	u16 x, y, p = 0x100 | WM97XX_ADCSEL_PRES;
 	int reads = 0;
+	static u16 last, tries;
 
 	/* When the AC97 queue has been drained we need to allow time
 	 * to buffer up samples otherwise we end up spinning polling
 	 * for samples.  The controller can't have a suitably low
 	 * threshold set to use the notifications it gives.
 	 */
-	schedule_timeout_uninterruptible(1);
+	msleep(1);
 
 	if (tries > 5) {
 		tries = 0;
@@ -193,6 +193,8 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 		/* There is some obscure mutant of WM9712 interbred with WM9713
 		 * used on Palm HW */
 		wm->variant = WM97xx_WM1613;
+	} else if (machine_is_zylonite()) {
+		pen_int = 1;
 	}
 
 	if (pen_int) {
@@ -253,13 +255,13 @@ static void wm97xx_irq_enable(struct wm97xx *wm, int enable)
 }
 
 static struct wm97xx_mach_ops mainstone_mach_ops = {
-	.acc_enabled = 1,
-	.acc_pen_up = wm97xx_acc_pen_up,
-	.acc_pen_down = wm97xx_acc_pen_down,
-	.acc_startup = wm97xx_acc_startup,
-	.acc_shutdown = wm97xx_acc_shutdown,
-	.irq_enable = wm97xx_irq_enable,
-	.irq_gpio = WM97XX_GPIO_2,
+	.acc_enabled	= 1,
+	.acc_pen_up	= wm97xx_acc_pen_up,
+	.acc_pen_down	= wm97xx_acc_pen_down,
+	.acc_startup	= wm97xx_acc_startup,
+	.acc_shutdown	= wm97xx_acc_shutdown,
+	.irq_enable	= wm97xx_irq_enable,
+	.irq_gpio	= WM97XX_GPIO_2,
 };
 
 static int mainstone_wm97xx_probe(struct platform_device *pdev)
@@ -274,14 +276,15 @@ static int mainstone_wm97xx_remove(struct platform_device *pdev)
 	struct wm97xx *wm = platform_get_drvdata(pdev);
 
 	wm97xx_unregister_mach_ops(wm);
+
 	return 0;
 }
 
 static struct platform_driver mainstone_wm97xx_driver = {
-	.probe = mainstone_wm97xx_probe,
-	.remove = mainstone_wm97xx_remove,
-	.driver = {
-		.name = "wm97xx-touch",
+	.probe	= mainstone_wm97xx_probe,
+	.remove	= mainstone_wm97xx_remove,
+	.driver	= {
+		.name	= "wm97xx-touch",
 	},
 };
 module_platform_driver(mainstone_wm97xx_driver);
-- 
2.20.0

