Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83351715EF
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 12:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgB0L22 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 06:28:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48533 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbgB0L22 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 06:28:28 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL4-0000p7-Gt; Thu, 27 Feb 2020 12:28:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL3-0001kL-A1; Thu, 27 Feb 2020 12:28:21 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, LW@KARO-electronics.de
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/4] Input: edt-ft5x06 - improve power management operations
Date:   Thu, 27 Feb 2020 12:28:18 +0100
Message-Id: <20200227112819.16754-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227112819.16754-1-m.felsch@pengutronix.de>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
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

Furthermore I added the support to disable the device completely which
is obviously the most effective power-saving mechanism. This mechanism
needs the reset pin to ensure the power-up/down sequence.

We can't apply any of these power-saving mechanism if both pins are
missing (not connected) or if it is a wakeup device.

[1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
    https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x06.pdf
[2] https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/input/touchscreen/ft5x_ts.c
    https://github.com/Pablito2020/focaltech-touch-driver/blob/master/ft5336_driver.c
[3] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x16_registers.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v4:
- improve suspend modi handling
- restore configuration if poweroff suspend mode was selected
- check return values during resume
- add comments about the delays
- adapt commit message

v3:
- drop enable/disable_irq_wake()

v2:
- adapt commit message
- don't return errors during suspend/resume
- replace dev_err() by dev_warn()
- add support to disable the regulator too

 drivers/input/touchscreen/edt-ft5x06.c | 123 +++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bb9107093796..0babe6a25fe3 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -38,6 +38,9 @@
 #define WORK_REGISTER_NUM_X		0x33
 #define WORK_REGISTER_NUM_Y		0x34
 
+#define PMOD_REGISTER_ACTIVE		0x00
+#define PMOD_REGISTER_HIBERNATE		0x03
+
 #define M09_REGISTER_THRESHOLD		0x80
 #define M09_REGISTER_GAIN		0x92
 #define M09_REGISTER_OFFSET		0x93
@@ -53,6 +56,7 @@
 
 #define WORK_REGISTER_OPMODE		0x3c
 #define FACTORY_REGISTER_OPMODE		0x01
+#define PMOD_REGISTER_OPMODE		0xa5
 
 #define TOUCH_EVENT_DOWN		0x00
 #define TOUCH_EVENT_UP			0x01
@@ -65,6 +69,12 @@
 #define EDT_RAW_DATA_RETRIES		100
 #define EDT_RAW_DATA_DELAY		1000 /* usec */
 
+enum edt_pmode {
+	EDT_PMODE_NOT_SUPPORTED,
+	EDT_PMODE_HIBERNATE,
+	EDT_PMODE_POWEROFF,
+};
+
 enum edt_ver {
 	EDT_M06,
 	EDT_M09,
@@ -103,6 +113,7 @@ struct edt_ft5x06_ts_data {
 
 	struct mutex mutex;
 	bool factory_mode;
+	enum edt_pmode suspend_mode;
 	int threshold;
 	int gain;
 	int offset;
@@ -1125,6 +1136,19 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	/*
+	 * Check which sleep modes we can support. Power-off requieres the
+	 * reset-pin to ensure correct power-down/power-up behaviour. Start with
+	 * the EDT_PMODE_POWEROFF test since this is the deepest possible sleep
+	 * mode.
+	 */
+	if (tsdata->reset_gpio)
+		tsdata->suspend_mode = EDT_PMODE_POWEROFF;
+	else if (tsdata->wake_gpio)
+		tsdata->suspend_mode = EDT_PMODE_HIBERNATE;
+	else
+		tsdata->suspend_mode = EDT_PMODE_NOT_SUPPORTED;
+
 	if (tsdata->wake_gpio) {
 		usleep_range(5000, 6000);
 		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
@@ -1238,6 +1262,104 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
 	return 0;
 }
 
+static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+	struct gpio_desc *reset_gpio = tsdata->reset_gpio;
+	int ret;
+
+	if (device_may_wakeup(dev))
+		return 0;
+
+	if (tsdata->suspend_mode == EDT_PMODE_NOT_SUPPORTED)
+		return 0;
+
+	/* Enter hibernate mode. */
+	ret = edt_ft5x06_register_write(tsdata, PMOD_REGISTER_OPMODE,
+					PMOD_REGISTER_HIBERNATE);
+	if (ret)
+		dev_warn(dev, "Failed to set hibernate mode\n");
+
+	if (tsdata->suspend_mode == EDT_PMODE_HIBERNATE)
+		return 0;
+
+	/*
+	 * Power-off according the datasheet. Cut the power may leaf the irq
+	 * line in an undefined state depending on the host pull resistor
+	 * settings. Disable the irq to avoid adjusting each host till the
+	 * device is back in a full functional state.
+	 */
+	disable_irq(tsdata->client->irq);
+
+	gpiod_set_value_cansleep(reset_gpio, 1);
+	usleep_range(1000, 2000);
+
+	ret = regulator_disable(tsdata->vcc);
+	if (ret)
+		dev_warn(dev, "Failed to disable vcc\n");
+
+	return 0;
+}
+
+static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+	int ret = 0;
+
+	if (device_may_wakeup(dev))
+		return 0;
+
+	if (tsdata->suspend_mode == EDT_PMODE_NOT_SUPPORTED)
+		return 0;
+
+	if (tsdata->suspend_mode == EDT_PMODE_POWEROFF) {
+		struct gpio_desc *reset_gpio = tsdata->reset_gpio;
+
+		/*
+		 * We can't check if the regulator is a dummy or a real
+		 * regulator. So we need to specify the 5ms reset time (T_rst)
+		 * here instead of the 100us T_rtp time. We also need to wait
+		 * 300ms in case it was a real supply and the power was cutted
+		 * of. Toggle the reset pin is also a way to exit the hibernate
+		 * mode.
+		 */
+		gpiod_set_value_cansleep(reset_gpio, 1);
+		usleep_range(5000, 6000);
+
+		ret = regulator_enable(tsdata->vcc);
+		if (ret) {
+			dev_err(dev, "Failed to enable vcc\n");
+			return ret;
+		}
+
+		usleep_range(1000, 2000);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		msleep(300);
+
+		edt_ft5x06_restore_reg_parameters(tsdata);
+		enable_irq(tsdata->client->irq);
+
+#ifdef CONFIG_DEBUG_FS
+		if (tsdata->factory_mode)
+			ret = edt_ft5x06_factory_mode(tsdata);
+#endif
+	} else {
+		struct gpio_desc *wake_gpio = tsdata->wake_gpio;
+
+		gpiod_set_value_cansleep(wake_gpio, 0);
+		usleep_range(5000, 6000);
+		gpiod_set_value_cansleep(wake_gpio, 1);
+	}
+
+
+	return ret;
+}
+
+static SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
+			 edt_ft5x06_ts_suspend, edt_ft5x06_ts_resume);
+
 static const struct edt_i2c_chip_data edt_ft5x06_data = {
 	.max_support_points = 5,
 };
@@ -1276,6 +1398,7 @@ static struct i2c_driver edt_ft5x06_ts_driver = {
 	.driver = {
 		.name = "edt_ft5x06",
 		.of_match_table = edt_ft5x06_of_match,
+		.pm = &edt_ft5x06_ts_pm_ops,
 	},
 	.id_table = edt_ft5x06_ts_id,
 	.probe    = edt_ft5x06_ts_probe,
-- 
2.20.1

