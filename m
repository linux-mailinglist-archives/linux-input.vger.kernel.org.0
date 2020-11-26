Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639912C5289
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 12:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgKZLCC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 06:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgKZLCC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 06:02:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F08C0613D4
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 03:02:02 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiF25-0000P7-N2; Thu, 26 Nov 2020 12:01:49 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiF23-00052Z-Ke; Thu, 26 Nov 2020 12:01:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] ARM: locomo: make locomo bus's remove callback return void
Date:   Thu, 26 Nov 2020 12:01:40 +0100
Message-Id: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver core ignores the return value of struct bus_type::remove
because there is only little that can be done. To simplify the quest to
make this function return void, let struct locomo_driver::remove return
void, too. All users already unconditionally return 0, this commit makes
it obvious that returning an error code is a bad idea and ensures future
users behave accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

if desired the change to arch/arm/mach-sa1100/collie.c can be split out
of this patch. The change of prototype then doesn't affect this driver
any more. There is one locomo-driver that is already now unaffected:
drivers/leds/leds-locomo.c. This driver doesn't have a remove callback.

Best regards
Uwe

 arch/arm/common/locomo.c               | 5 ++---
 arch/arm/include/asm/hardware/locomo.h | 2 +-
 arch/arm/mach-sa1100/collie.c          | 6 ------
 drivers/input/keyboard/locomokbd.c     | 4 +---
 drivers/video/backlight/locomolcd.c    | 3 +--
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 62f241b09fe3..e45f4e4e06b6 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -838,11 +838,10 @@ static int locomo_bus_remove(struct device *dev)
 {
 	struct locomo_dev *ldev = LOCOMO_DEV(dev);
 	struct locomo_driver *drv = LOCOMO_DRV(dev->driver);
-	int ret = 0;
 
 	if (drv->remove)
-		ret = drv->remove(ldev);
-	return ret;
+		drv->remove(ldev);
+	return 0;
 }
 
 struct bus_type locomo_bus_type = {
diff --git a/arch/arm/include/asm/hardware/locomo.h b/arch/arm/include/asm/hardware/locomo.h
index f8712e3c29cf..246a3de25931 100644
--- a/arch/arm/include/asm/hardware/locomo.h
+++ b/arch/arm/include/asm/hardware/locomo.h
@@ -188,7 +188,7 @@ struct locomo_driver {
 	struct device_driver	drv;
 	unsigned int		devid;
 	int (*probe)(struct locomo_dev *);
-	int (*remove)(struct locomo_dev *);
+	void (*remove)(struct locomo_dev *);
 };
 
 #define LOCOMO_DRV(_d)	container_of((_d), struct locomo_driver, drv)
diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
index bd3a52fd09ce..f43beb7b25c7 100644
--- a/arch/arm/mach-sa1100/collie.c
+++ b/arch/arm/mach-sa1100/collie.c
@@ -204,18 +204,12 @@ static int collie_uart_probe(struct locomo_dev *dev)
 	return 0;
 }
 
-static int collie_uart_remove(struct locomo_dev *dev)
-{
-	return 0;
-}
-
 static struct locomo_driver collie_uart_driver = {
 	.drv = {
 		.name = "collie_uart",
 	},
 	.devid	= LOCOMO_DEVID_UART,
 	.probe	= collie_uart_probe,
-	.remove	= collie_uart_remove,
 };
 
 static int __init collie_uart_init(void)
diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
index daf6a753ca61..dae053596572 100644
--- a/drivers/input/keyboard/locomokbd.c
+++ b/drivers/input/keyboard/locomokbd.c
@@ -304,7 +304,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
 	return err;
 }
 
-static int locomokbd_remove(struct locomo_dev *dev)
+static void locomokbd_remove(struct locomo_dev *dev)
 {
 	struct locomokbd *locomokbd = locomo_get_drvdata(dev);
 
@@ -318,8 +318,6 @@ static int locomokbd_remove(struct locomo_dev *dev)
 	release_mem_region((unsigned long) dev->mapbase, dev->length);
 
 	kfree(locomokbd);
-
-	return 0;
 }
 
 static struct locomo_driver keyboard_driver = {
diff --git a/drivers/video/backlight/locomolcd.c b/drivers/video/backlight/locomolcd.c
index 297ee2e1ab0b..0468ea82159f 100644
--- a/drivers/video/backlight/locomolcd.c
+++ b/drivers/video/backlight/locomolcd.c
@@ -208,7 +208,7 @@ static int locomolcd_probe(struct locomo_dev *ldev)
 	return 0;
 }
 
-static int locomolcd_remove(struct locomo_dev *dev)
+static void locomolcd_remove(struct locomo_dev *dev)
 {
 	unsigned long flags;
 
@@ -220,7 +220,6 @@ static int locomolcd_remove(struct locomo_dev *dev)
 	local_irq_save(flags);
 	locomolcd_dev = NULL;
 	local_irq_restore(flags);
-	return 0;
 }
 
 static struct locomo_driver poodle_lcd_driver = {
-- 
2.29.2

