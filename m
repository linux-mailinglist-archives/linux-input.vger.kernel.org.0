Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6EF10AF57
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 13:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfK0MKH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 07:10:07 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33669 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbfK0MKH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 07:10:07 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8k-0002KD-VY; Wed, 27 Nov 2019 13:09:50 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8j-0006Im-KM; Wed, 27 Nov 2019 13:09:49 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, mripard@kernel.org,
        alexandre.belloni@bootlin.com, shawnguo@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 4/5] Input: edt-ft5x06 - make wakeup-source switchable
Date:   Wed, 27 Nov 2019 13:09:47 +0100
Message-Id: <20191127120948.22251-5-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127120948.22251-1-m.felsch@pengutronix.de>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since day one the touch controller acts as wakeup-source. This seems to
be wrong since the device supports deep-sleep mechanism [1] which
requires a reset to leave it. Also some designs won't use the
touchscreen as wakeup-source.

According discussion [2] we decided to break backward compatibility and
go the common way by using the 'wakeup-source' device-property.

[1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
[2] https://patchwork.kernel.org/patch/11149037/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- make use of common wakeup-source property
- adapt commit message

 drivers/input/touchscreen/edt-ft5x06.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index e1b31fd525e2..8d2ec7947f0e 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -24,6 +24,7 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/ratelimit.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -1056,6 +1057,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	unsigned long irq_flags;
 	int error;
 	char fw_version[EDT_NAME_LEN];
+	bool en_wakeup;
 
 	dev_dbg(&client->dev, "probing for EDT FT5x06 I2C\n");
 
@@ -1114,6 +1116,8 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	en_wakeup = device_property_present(&client->dev, "wakeup-source");
+
 	if (tsdata->wake_gpio) {
 		usleep_range(5000, 6000);
 		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
@@ -1208,7 +1212,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 
 	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
-	device_init_wakeup(&client->dev, 1);
+	device_init_wakeup(&client->dev, en_wakeup);
 
 	dev_dbg(&client->dev,
 		"EDT FT5x06 initialized: IRQ %d, WAKE pin %d, Reset pin %d.\n",
-- 
2.20.1

