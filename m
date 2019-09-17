Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5395DB522C
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 17:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfIQP6W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 11:58:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37397 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfIQP6W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 11:58:22 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFro-0005CK-Lh; Tue, 17 Sep 2019 17:58:12 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFrn-0007Mo-Kz; Tue, 17 Sep 2019 17:58:11 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 4/6] Input: edt-ft5x06 - add deep sleep mechanism
Date:   Tue, 17 Sep 2019 17:58:06 +0200
Message-Id: <20190917155808.27818-5-m.felsch@pengutronix.de>
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

It is possible to bring the device into a deep sleep state. To exit this
state the reset or wakeup pin must be toggeled as documented in [1].
Because of the poor documentation I used the several downstream kernels
[2] and other applications notes [3] to indentify the related registers.

[1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/ \
    FT5x26.pdf
[2] https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/ \
    input/touchscreen/ft5x_ts.c
    https://github.com/Pablito2020/focaltech-touch-driver/blob/master/ \
    ft5336_driver.c
[3] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/ \
    FT5x16_registers.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 42 ++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index aafb6f4e34d7..b95ce5a7482d 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -37,6 +37,9 @@
 #define WORK_REGISTER_NUM_X		0x33
 #define WORK_REGISTER_NUM_Y		0x34
 
+#define PMOD_REGISTER_ACTIVE		0x00
+#define PMOD_REGISTER_HIBERNATE		0x03
+
 #define M09_REGISTER_THRESHOLD		0x80
 #define M09_REGISTER_GAIN		0x92
 #define M09_REGISTER_OFFSET		0x93
@@ -52,6 +55,7 @@
 
 #define WORK_REGISTER_OPMODE		0x3c
 #define FACTORY_REGISTER_OPMODE		0x01
+#define PMOD_REGISTER_OPMODE		0xa5
 
 #define TOUCH_EVENT_DOWN		0x00
 #define TOUCH_EVENT_UP			0x01
@@ -1204,19 +1208,51 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
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
 
-	return 0;
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
+		dev_err(dev, "Failed to set hibernate mode\n");
+
+	return ret;
 }
 
 static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		disable_irq_wake(client->irq);
+		return 0;
+	}
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

