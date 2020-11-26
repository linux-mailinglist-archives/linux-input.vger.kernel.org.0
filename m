Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA7A2C5339
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 12:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733086AbgKZLrg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 06:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732649AbgKZLrg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 06:47:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FEBC0613D4
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 03:47:35 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiFkH-0006J0-W7; Thu, 26 Nov 2020 12:47:30 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiFkG-0006wX-Pq; Thu, 26 Nov 2020 12:47:28 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] ARM: sa11111: make sa1111 bus's remove callback return void
Date:   Thu, 26 Nov 2020 12:47:24 +0100
Message-Id: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
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

The driver core ignores the return value of struct device_driver::remove
because there is only little that can be done. To simplify the quest to
make this function return void, let struct sa1111_driver::remove return
void, too. All users already unconditionally return 0, this commit makes
it obvious that returning an error code is a bad idea and ensures future
users behave accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/common/sa1111.c               | 6 +++---
 arch/arm/include/asm/hardware/sa1111.h | 2 +-
 drivers/input/serio/sa1111ps2.c        | 4 +---
 drivers/pcmcia/sa1111_generic.c        | 3 +--
 drivers/usb/host/ohci-sa1111.c         | 4 +---
 5 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index f89c1ea327a2..ff5e0d04cb89 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -1368,11 +1368,11 @@ static int sa1111_bus_remove(struct device *dev)
 {
 	struct sa1111_dev *sadev = to_sa1111_device(dev);
 	struct sa1111_driver *drv = SA1111_DRV(dev->driver);
-	int ret = 0;
 
 	if (drv->remove)
-		ret = drv->remove(sadev);
-	return ret;
+		drv->remove(sadev);
+
+	return 0;
 }
 
 struct bus_type sa1111_bus_type = {
diff --git a/arch/arm/include/asm/hardware/sa1111.h b/arch/arm/include/asm/hardware/sa1111.h
index d134b9a5ff94..2e70db6f22ea 100644
--- a/arch/arm/include/asm/hardware/sa1111.h
+++ b/arch/arm/include/asm/hardware/sa1111.h
@@ -403,7 +403,7 @@ struct sa1111_driver {
 	struct device_driver	drv;
 	unsigned int		devid;
 	int (*probe)(struct sa1111_dev *);
-	int (*remove)(struct sa1111_dev *);
+	void (*remove)(struct sa1111_dev *);
 };
 
 #define SA1111_DRV(_d)	container_of((_d), struct sa1111_driver, drv)
diff --git a/drivers/input/serio/sa1111ps2.c b/drivers/input/serio/sa1111ps2.c
index 7b8ceb702a74..68fac4801e2e 100644
--- a/drivers/input/serio/sa1111ps2.c
+++ b/drivers/input/serio/sa1111ps2.c
@@ -344,7 +344,7 @@ static int ps2_probe(struct sa1111_dev *dev)
 /*
  * Remove one device from this driver.
  */
-static int ps2_remove(struct sa1111_dev *dev)
+static void ps2_remove(struct sa1111_dev *dev)
 {
 	struct ps2if *ps2if = sa1111_get_drvdata(dev);
 
@@ -353,8 +353,6 @@ static int ps2_remove(struct sa1111_dev *dev)
 	sa1111_set_drvdata(dev, NULL);
 
 	kfree(ps2if);
-
-	return 0;
 }
 
 /*
diff --git a/drivers/pcmcia/sa1111_generic.c b/drivers/pcmcia/sa1111_generic.c
index 11783410223b..29fdd174bc23 100644
--- a/drivers/pcmcia/sa1111_generic.c
+++ b/drivers/pcmcia/sa1111_generic.c
@@ -238,7 +238,7 @@ static int pcmcia_probe(struct sa1111_dev *dev)
 	return ret;
 }
 
-static int pcmcia_remove(struct sa1111_dev *dev)
+static void pcmcia_remove(struct sa1111_dev *dev)
 {
 	struct sa1111_pcmcia_socket *next, *s = dev_get_drvdata(&dev->dev);
 
@@ -252,7 +252,6 @@ static int pcmcia_remove(struct sa1111_dev *dev)
 
 	release_mem_region(dev->res.start, 512);
 	sa1111_disable_device(dev);
-	return 0;
 }
 
 static struct sa1111_driver pcmcia_driver = {
diff --git a/drivers/usb/host/ohci-sa1111.c b/drivers/usb/host/ohci-sa1111.c
index 8e19a5eb5b62..feca826d3f6a 100644
--- a/drivers/usb/host/ohci-sa1111.c
+++ b/drivers/usb/host/ohci-sa1111.c
@@ -236,7 +236,7 @@ static int ohci_hcd_sa1111_probe(struct sa1111_dev *dev)
  * Reverses the effect of ohci_hcd_sa1111_probe(), first invoking
  * the HCD's stop() method.
  */
-static int ohci_hcd_sa1111_remove(struct sa1111_dev *dev)
+static void ohci_hcd_sa1111_remove(struct sa1111_dev *dev)
 {
 	struct usb_hcd *hcd = sa1111_get_drvdata(dev);
 
@@ -244,8 +244,6 @@ static int ohci_hcd_sa1111_remove(struct sa1111_dev *dev)
 	sa1111_stop_hc(dev);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static void ohci_hcd_sa1111_shutdown(struct device *_dev)
-- 
2.29.2

