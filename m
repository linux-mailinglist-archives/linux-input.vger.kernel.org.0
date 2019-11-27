Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F50C10AF5A
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 13:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfK0MKN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 07:10:13 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45591 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfK0MKN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 07:10:13 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8k-0002KE-Ve; Wed, 27 Nov 2019 13:09:50 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8j-0006Ip-Kj; Wed, 27 Nov 2019 13:09:49 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, mripard@kernel.org,
        alexandre.belloni@bootlin.com, shawnguo@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 5/5] Input: edt-ft5x06 - improve power management operations
Date:   Wed, 27 Nov 2019 13:09:48 +0100
Message-Id: <20191127120948.22251-6-m.felsch@pengutronix.de>
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

It is possible to bring the device into a deep sleep state. To exit this
state the reset or wakeup pin must be toggeled as documented in [1].
Because of the poor documentation I used the several downstream kernels
[2] and other applications notes [3] to indentify the related registers.

Furthermore I added the support to disable the device completely. This is
the most effective power-saving mechanism. Disabling the device don't
change the suspend logic because the hibernate mode needs a hardware
reset anyway.

[1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
[2] https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/input/touchscreen/ft5x_ts.c
    https://github.com/Pablito2020/focaltech-touch-driver/blob/master/ft5336_driver.c
[3] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x16_registers.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- adapt commit message
- don't return errors during suspend/resume
- replace dev_err() by dev_warn()
- add support to disable the regulator too

 drivers/input/touchscreen/edt-ft5x06.c | 49 ++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 8d2ec7947f0e..0bdd3440f684 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -39,6 +39,9 @@
 #define WORK_REGISTER_NUM_X		0x33
 #define WORK_REGISTER_NUM_Y		0x34
 
+#define PMOD_REGISTER_ACTIVE		0x00
+#define PMOD_REGISTER_HIBERNATE		0x03
+
 #define M09_REGISTER_THRESHOLD		0x80
 #define M09_REGISTER_GAIN		0x92
 #define M09_REGISTER_OFFSET		0x93
@@ -54,6 +57,7 @@
 
 #define WORK_REGISTER_OPMODE		0x3c
 #define FACTORY_REGISTER_OPMODE		0x01
+#define PMOD_REGISTER_OPMODE		0xa5
 
 #define TOUCH_EVENT_DOWN		0x00
 #define TOUCH_EVENT_UP			0x01
@@ -1235,9 +1239,29 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
 static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+	int ret;
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		enable_irq_wake(client->irq);
+		return 0;
+	}
+
+	/*
+	 * Hibernate mode requires reset or wake signal to recover to active
+	 * state.
+	 */
+	if (!tsdata->wake_gpio && !tsdata->reset_gpio)
+		return 0;
+
+	ret = edt_ft5x06_register_write(tsdata, PMOD_REGISTER_OPMODE,
+					PMOD_REGISTER_HIBERNATE);
+	if (ret)
+		dev_warn(dev, "Failed to set hibernate mode\n");
+
+	ret = regulator_disable(tsdata->vcc);
+	if (ret)
+		dev_warn(dev, "Failed to disable vcc\n");
 
 	return 0;
 }
@@ -1245,9 +1269,30 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
 static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+	int ret;
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		disable_irq_wake(client->irq);
+		return 0;
+	}
+
+	ret = regulator_enable(tsdata->vcc);
+	if (ret)
+		dev_warn(dev, "Failed to enable vcc\n");
+
+	/* Recover from hibernate mode if hardware supports it */
+	if (tsdata->wake_gpio) {
+		gpiod_set_value_cansleep(tsdata->wake_gpio, 0);
+		usleep_range(5000, 6000);
+		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
+		msleep(300);
+	} else if (tsdata->reset_gpio) {
+		gpiod_set_value_cansleep(tsdata->reset_gpio, 1);
+		usleep_range(5000, 6000);
+		gpiod_set_value_cansleep(tsdata->reset_gpio, 0);
+		msleep(300);
+	}
 
 	return 0;
 }
-- 
2.20.1

