Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B19F2F0427
	for <lists+linux-input@lfdr.de>; Sat,  9 Jan 2021 23:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbhAIWpR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jan 2021 17:45:17 -0500
Received: from smtp.infotech.no ([82.134.31.41]:57317 "EHLO smtp.infotech.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbhAIWpR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Jan 2021 17:45:17 -0500
X-Greylist: delayed 446 seconds by postgrey-1.27 at vger.kernel.org; Sat, 09 Jan 2021 17:45:16 EST
Received: from localhost (localhost [127.0.0.1])
        by smtp.infotech.no (Postfix) with ESMTP id C062620425A;
        Sat,  9 Jan 2021 23:37:08 +0100 (CET)
X-Virus-Scanned: by amavisd-new-2.6.6 (20110518) (Debian) at infotech.no
Received: from smtp.infotech.no ([127.0.0.1])
        by localhost (smtp.infotech.no [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id w9BlicSeMm7Y; Sat,  9 Jan 2021 23:37:02 +0100 (CET)
Received: from xtwo70.bingwo.ca (host-104-157-204-209.dyn.295.ca [104.157.204.209])
        by smtp.infotech.no (Postfix) with ESMTPA id 5A36E204192;
        Sat,  9 Jan 2021 23:37:01 +0100 (CET)
From:   Douglas Gilbert <dgilbert@interlog.com>
To:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com
Subject: [PATCH] [input]: hid-cp2112: fix multiple gpiochips
Date:   Sat,  9 Jan 2021 17:36:58 -0500
Message-Id: <20210109223658.749743-1-dgilbert@interlog.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In lk 5.11.0-rc2 connecting a USB based Silicon Labs HID to I2C
bridge evaluation board (CP2112EK) causes this warning:
  gpio gpiochip0: (cp2112_gpio): detected irqchip that is shared
       with multiple gpiochips: please fix the driver

Simply copy what other gpio related drivers do to fix this
particular warning: replicate the struct irq_chip object in each
device instance rather than have a static object which makes that
object (incorrectly) shared by each device.

Signed-off-by: Douglas Gilbert <dgilbert@interlog.com>
---
 drivers/hid/hid-cp2112.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 21e15627a461..477baa30889c 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -161,6 +161,7 @@ struct cp2112_device {
 	atomic_t read_avail;
 	atomic_t xfer_avail;
 	struct gpio_chip gc;
+	struct irq_chip irq;
 	u8 *in_out_buffer;
 	struct mutex lock;
 
@@ -1175,16 +1176,6 @@ static int cp2112_gpio_irq_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static struct irq_chip cp2112_gpio_irqchip = {
-	.name = "cp2112-gpio",
-	.irq_startup = cp2112_gpio_irq_startup,
-	.irq_shutdown = cp2112_gpio_irq_shutdown,
-	.irq_ack = cp2112_gpio_irq_ack,
-	.irq_mask = cp2112_gpio_irq_mask,
-	.irq_unmask = cp2112_gpio_irq_unmask,
-	.irq_set_type = cp2112_gpio_irq_type,
-};
-
 static int __maybe_unused cp2112_allocate_irq(struct cp2112_device *dev,
 					      int pin)
 {
@@ -1339,8 +1330,17 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.can_sleep		= 1;
 	dev->gc.parent			= &hdev->dev;
 
+	dev->irq.name = "cp2112-gpio";
+	dev->irq.irq_startup = cp2112_gpio_irq_startup;
+	dev->irq.irq_shutdown = cp2112_gpio_irq_shutdown;
+	dev->irq.irq_ack = cp2112_gpio_irq_ack;
+	dev->irq.irq_mask = cp2112_gpio_irq_mask;
+	dev->irq.irq_unmask = cp2112_gpio_irq_unmask;
+	dev->irq.irq_set_type = cp2112_gpio_irq_type;
+	dev->irq.flags = IRQCHIP_MASK_ON_SUSPEND;
+
 	girq = &dev->gc.irq;
-	girq->chip = &cp2112_gpio_irqchip;
+	girq->chip = &dev->irq;
 	/* The event comes from the outside so no parent handler */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.25.1

