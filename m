Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76AF1B5229
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 17:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfIQP6W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 11:58:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49363 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfIQP6W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 11:58:22 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFro-0005CJ-Lj; Tue, 17 Sep 2019 17:58:12 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFrn-0007Ml-Ka; Tue, 17 Sep 2019 17:58:11 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 3/6] Input: edt-ft5x06 - add support to disable the wakeup-source
Date:   Tue, 17 Sep 2019 17:58:05 +0200
Message-Id: <20190917155808.27818-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917155808.27818-1-m.felsch@pengutronix.de>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
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

Add a firmware property to address this. The common 'wakeup-source'
property can't be used for that because the driver must be backward
compatible with old firmwares which may assume the default on
wakeup-source behaviour. So we need to go the other way by explicit
disable the wakeup-source capability.

[1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/ \
    FT5x26.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 9e328a82b765..aafb6f4e34d7 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -25,6 +25,7 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/ratelimit.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -1047,6 +1048,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	unsigned long irq_flags;
 	int error;
 	char fw_version[EDT_NAME_LEN];
+	bool en_wakeup;
 
 	dev_dbg(&client->dev, "probing for EDT FT5x06 I2C\n");
 
@@ -1084,6 +1086,13 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	/*
+	 * We need to go this way to keep backward compatibility with old DT's
+	 * which may assume the default-on mechanism.
+	 */
+	en_wakeup = !device_property_present(&client->dev,
+					     "edt,disable-wakeup-source");
+
 	if (tsdata->wake_gpio) {
 		usleep_range(5000, 6000);
 		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
@@ -1172,7 +1181,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 
 	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
-	device_init_wakeup(&client->dev, 1);
+	device_init_wakeup(&client->dev, en_wakeup);
 
 	dev_dbg(&client->dev,
 		"EDT FT5x06 initialized: IRQ %d, WAKE pin %d, Reset pin %d.\n",
-- 
2.20.1

