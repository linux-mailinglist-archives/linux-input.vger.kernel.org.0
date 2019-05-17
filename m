Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 504B7218EF
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 15:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbfEQNNQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 09:13:16 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:33852 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728436AbfEQNNN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 09:13:13 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 02946A0798;
        Fri, 17 May 2019 15:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1558098790;
        bh=fazVZE/9JB0aEaL8Pjb9pVhh2/e5QmZcZhX8s6G11fk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QU4mT+5zWnOaXJobZMYfXHacdU5TlRBeubMstkHmzIM6lAbEaYGaocKIsYnVyrM6E
         Z9t2uuUMinXg+iKT4C++PqAGcO8YVZ5++a2roXeQ99GvrR1MOskw0ZlXHB4bvvdiyr
         RIWfn0sqXKrgSey9BS5z+BNjox+gLQB8h7SCCL/g=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [RFC PATCH v2 2/4] Input: mpr121-polled: Add polling variant of the MPR121 touchkey driver
Date:   Fri, 17 May 2019 15:12:51 +0200
Message-Id: <1558098773-47416-3-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver is based on the original driver with interrupts. Polling
driver may be used in cases where the MPR121 chip is connected using
only the I2C interface and the interrupt line is not available.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 drivers/input/keyboard/Kconfig                  |  13 +
 drivers/input/keyboard/Makefile                 |   1 +
 drivers/input/keyboard/mpr121_touchkey_polled.c | 417 ++++++++++++++++++++++++
 3 files changed, 431 insertions(+)
 create mode 100644 drivers/input/keyboard/mpr121_touchkey_polled.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 52d7f55fca32..b61cf6e4f1ba 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -418,6 +418,19 @@ config KEYBOARD_MPR121
 	  To compile this driver as a module, choose M here: the
 	  module will be called mpr121_touchkey.
 
+config KEYBOARD_MPR121_POLLED
+	tristate "Polled Freescale MPR121 Touchkey"
+	depends on I2C
+	help
+	  Say Y here if you have Freescale MPR121 touchkey controller
+	  chip in your system connected only using the I2C line without
+	  the interrupt line.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mpr121_touchkey_polled.
+
 config KEYBOARD_SNVS_PWRKEY
 	tristate "IMX SNVS Power Key Driver"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 182e92985dbf..903f50842844 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
 obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
 obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
 obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
+obj-$(CONFIG_KEYBOARD_MPR121_POLLED)	+= mpr121_touchkey_polled.o
 obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
 obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
 obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
diff --git a/drivers/input/keyboard/mpr121_touchkey_polled.c b/drivers/input/keyboard/mpr121_touchkey_polled.c
new file mode 100644
index 000000000000..e5e80530c9d8
--- /dev/null
+++ b/drivers/input/keyboard/mpr121_touchkey_polled.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Touchkey driver for Freescale MPR121 Controllor
+//
+// Copyright (C) 2011 Freescale Semiconductor, Inc.
+// Author: Zhang Jiejing <jiejing.zhang@freescale.com>
+//
+// Based on mcs_touchkey.c
+//
+// Copyright (C) 2019 Y Soft Corporation, a.s.
+// Author: Pavel Staněk <pavel.stanek@ysoft.com>
+// Author: Michal Vokáč <michal.vokac@ysoft.com>
+//
+// Reworked into polled driver based on mpr121_touchkey.c
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input-polldev.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+/* Register definitions */
+#define ELE_TOUCH_STATUS_0_ADDR	0x0
+#define ELE_TOUCH_STATUS_1_ADDR	0X1
+#define MHD_RISING_ADDR		0x2b
+#define NHD_RISING_ADDR		0x2c
+#define NCL_RISING_ADDR		0x2d
+#define FDL_RISING_ADDR		0x2e
+#define MHD_FALLING_ADDR	0x2f
+#define NHD_FALLING_ADDR	0x30
+#define NCL_FALLING_ADDR	0x31
+#define FDL_FALLING_ADDR	0x32
+#define ELE0_TOUCH_THRESHOLD_ADDR	0x41
+#define ELE0_RELEASE_THRESHOLD_ADDR	0x42
+#define AFE_CONF_ADDR			0x5c
+#define FILTER_CONF_ADDR		0x5d
+
+/*
+ * ELECTRODE_CONF_ADDR: This register configures the number of
+ * enabled capacitance sensing inputs and its run/suspend mode.
+ */
+#define ELECTRODE_CONF_ADDR		0x5e
+#define ELECTRODE_CONF_QUICK_CHARGE	0x80
+#define AUTO_CONFIG_CTRL_ADDR		0x7b
+#define AUTO_CONFIG_USL_ADDR		0x7d
+#define AUTO_CONFIG_LSL_ADDR		0x7e
+#define AUTO_CONFIG_TL_ADDR		0x7f
+
+/* Threshold of touch/release trigger */
+#define TOUCH_THRESHOLD			0x08
+#define RELEASE_THRESHOLD		0x05
+/* Masks for touch and release triggers */
+#define TOUCH_STATUS_MASK		0xfff
+/* MPR121 has 12 keys */
+#define MPR121_MAX_KEY_COUNT		12
+
+#define MPR121_POLL_INTERVAL		50
+#define MPR121_POLL_INTERVAL_MIN	10
+#define MPR121_POLL_INTERVAL_MAX	200
+#define MPR121_POLL_INTERVAL_REINIT	500
+#define MPR121_POLL_RETRY_MAX		4
+
+struct mpr121_polled {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	struct input_polled_dev	*poll_dev;
+	unsigned int statusbits;
+	unsigned int keycount;
+	u32 keycodes[MPR121_MAX_KEY_COUNT];
+	u8 read_errors;
+	int vdd_uv;
+};
+
+struct mpr121_polled_init_register {
+	int addr;
+	u8 val;
+};
+
+static const struct mpr121_polled_init_register init_reg_table[] = {
+	{ MHD_RISING_ADDR,	0x1 },
+	{ NHD_RISING_ADDR,	0x1 },
+	{ MHD_FALLING_ADDR,	0x1 },
+	{ NHD_FALLING_ADDR,	0x1 },
+	{ NCL_FALLING_ADDR,	0xff },
+	{ FDL_FALLING_ADDR,	0x02 },
+	{ FILTER_CONF_ADDR,	0x04 },
+	{ AFE_CONF_ADDR,	0x0b },
+	{ AUTO_CONFIG_CTRL_ADDR, 0x0b },
+};
+
+static void mpr121_polled_vdd_supply_disable(void *data)
+{
+	struct regulator *vdd_supply = data;
+
+	regulator_disable(vdd_supply);
+}
+
+static struct regulator *mpr121_polled_vdd_supply_init(struct device *dev)
+{
+	struct regulator *vdd_supply;
+	int err;
+
+	vdd_supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(vdd_supply)) {
+		dev_err(dev, "failed to get vdd regulator: %ld\n",
+			PTR_ERR(vdd_supply));
+		return vdd_supply;
+	}
+
+	err = regulator_enable(vdd_supply);
+	if (err) {
+		dev_err(dev, "failed to enable vdd regulator: %d\n", err);
+		return ERR_PTR(err);
+	}
+
+	err = devm_add_action(dev, mpr121_polled_vdd_supply_disable,
+			      vdd_supply);
+	if (err) {
+		regulator_disable(vdd_supply);
+		dev_err(dev, "failed to add disable regulator action: %d\n",
+			err);
+		return ERR_PTR(err);
+	}
+
+	return vdd_supply;
+}
+
+static int mpr121_polled_phys_init(struct mpr121_polled *mpr121,
+				   struct i2c_client *client)
+{
+	const struct mpr121_polled_init_register *reg;
+	unsigned char usl, lsl, tl, eleconf;
+	int i, t, vdd, ret;
+
+	/* Set stop mode prior to writing any register */
+	ret = i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR, 0x00);
+	if (ret < 0)
+		goto err_i2c_write;
+
+	/* Set up touch/release threshold for ele0-ele11 */
+	for (i = 0; i <= MPR121_MAX_KEY_COUNT; i++) {
+		t = ELE0_TOUCH_THRESHOLD_ADDR + (i * 2);
+		ret = i2c_smbus_write_byte_data(client, t, TOUCH_THRESHOLD);
+		if (ret < 0)
+			goto err_i2c_write;
+		ret = i2c_smbus_write_byte_data(client, t + 1,
+						RELEASE_THRESHOLD);
+		if (ret < 0)
+			goto err_i2c_write;
+	}
+
+	/* Set up init register */
+	for (i = 0; i < ARRAY_SIZE(init_reg_table); i++) {
+		reg = &init_reg_table[i];
+		ret = i2c_smbus_write_byte_data(client, reg->addr, reg->val);
+		if (ret < 0)
+			goto err_i2c_write;
+	}
+
+	/*
+	 * Capacitance on sensing input varies and needs to be compensated.
+	 * The internal MPR121-auto-configuration can do this if it's
+	 * registers are set properly (based on vdd_uv).
+	 */
+	vdd = mpr121->vdd_uv / 1000;
+	usl = ((vdd - 700) * 256) / vdd;
+	lsl = (usl * 65) / 100;
+	tl = (usl * 90) / 100;
+	ret = i2c_smbus_write_byte_data(client, AUTO_CONFIG_USL_ADDR, usl);
+	ret |= i2c_smbus_write_byte_data(client, AUTO_CONFIG_LSL_ADDR, lsl);
+	ret |= i2c_smbus_write_byte_data(client, AUTO_CONFIG_TL_ADDR, tl);
+
+	/*
+	 * Quick charge bit will let the capacitive charge to ready
+	 * state quickly, or the buttons may not function after system
+	 * boot.
+	 */
+	eleconf = mpr121->keycount | ELECTRODE_CONF_QUICK_CHARGE;
+	ret |= i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR,
+					 eleconf);
+	if (ret != 0)
+		goto err_i2c_write;
+
+	dev_dbg(&client->dev, "set up with %x keys.\n", mpr121->keycount);
+
+	return 0;
+
+err_i2c_write:
+	dev_err(&client->dev, "i2c write error: %d\n", ret);
+	return ret;
+}
+
+static void mpr121_polled_release_keys(struct mpr121_polled *mpr121)
+{
+	struct input_dev *input = mpr121->input_dev;
+	struct i2c_client *client = mpr121->client;
+	unsigned long statusbits;
+	unsigned int key_num;
+
+	if (!mpr121->statusbits)
+		return;
+
+	statusbits = mpr121->statusbits;
+	mpr121->statusbits = 0;
+	for_each_set_bit(key_num, &statusbits, mpr121->keycount) {
+		unsigned int key_val;
+
+		key_val = mpr121->keycodes[key_num];
+
+		input_event(input, EV_MSC, MSC_SCAN, key_num);
+		input_report_key(input, key_val, 0);
+
+		dev_dbg(&client->dev, "key %d %d %s\n", key_num, key_val,
+			"released");
+	}
+	input_sync(input);
+}
+
+static int mpr121_polled_process_keys(struct mpr121_polled *mpr121)
+{
+	struct input_dev *input = mpr121->input_dev;
+	struct i2c_client *client = mpr121->client;
+	unsigned long bit_changed;
+	unsigned int key_num;
+	int reg;
+
+	reg = i2c_smbus_read_word_data(client, ELE_TOUCH_STATUS_0_ADDR);
+	if (reg < 0) {
+		dev_err(&client->dev, "i2c read error: %d\n", reg);
+		return reg;
+	}
+
+	reg &= TOUCH_STATUS_MASK;
+	bit_changed = reg ^ mpr121->statusbits;
+	mpr121->statusbits = reg;
+	for_each_set_bit(key_num, &bit_changed, mpr121->keycount) {
+		unsigned int key_val, pressed;
+
+		pressed = reg & BIT(key_num);
+		key_val = mpr121->keycodes[key_num];
+
+		input_event(input, EV_MSC, MSC_SCAN, key_num);
+		input_report_key(input, key_val, pressed);
+
+		dev_dbg(&client->dev, "key %d %d %s\n", key_num, key_val,
+			pressed ? "pressed" : "released");
+	}
+	input_sync(input);
+
+	return 0;
+}
+static void mpr121_poll(struct input_polled_dev *dev)
+{
+	struct mpr121_polled *mpr121 = dev->private;
+	struct i2c_client *client = mpr121->client;
+	int ret;
+
+	if (mpr121->read_errors > MPR121_POLL_RETRY_MAX) {
+		dev_warn(&client->dev,
+			 "device does not respond, re-initializing\n");
+		mpr121_polled_release_keys(mpr121);
+		ret = mpr121_polled_phys_init(mpr121, client);
+		if (ret >= 0) {
+			mpr121->read_errors = 0;
+			dev->poll_interval = MPR121_POLL_INTERVAL;
+		} else {
+			dev->poll_interval = MPR121_POLL_INTERVAL_REINIT;
+		}
+	}
+
+	ret = mpr121_polled_process_keys(mpr121);
+	if (ret < 0) {
+		mpr121->read_errors++;
+		return;
+	}
+
+	mpr121->read_errors = 0;
+}
+
+static int mpr121_polled_probe(struct i2c_client *client,
+			       const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct regulator *vdd_supply;
+	struct mpr121_polled *mpr121;
+	struct input_dev *input_dev;
+	struct input_polled_dev *poll_dev;
+	int error;
+	int i;
+
+	vdd_supply = mpr121_polled_vdd_supply_init(dev);
+	if (IS_ERR(vdd_supply))
+		return PTR_ERR(vdd_supply);
+
+	mpr121 = devm_kzalloc(dev, sizeof(*mpr121), GFP_KERNEL);
+	if (!mpr121)
+		return -ENOMEM;
+
+	poll_dev = devm_input_allocate_polled_device(dev);
+	if (!poll_dev)
+		return -ENOMEM;
+
+	mpr121->vdd_uv = regulator_get_voltage(vdd_supply);
+	mpr121->client = client;
+	mpr121->input_dev = poll_dev->input;
+	mpr121->poll_dev = poll_dev;
+	mpr121->keycount = device_property_read_u32_array(dev, "linux,keycodes",
+							  NULL, 0);
+	if (mpr121->keycount > MPR121_MAX_KEY_COUNT) {
+		dev_err(dev, "too many keys defined (%d)\n", mpr121->keycount);
+		return -EINVAL;
+	}
+
+	error = device_property_read_u32_array(dev, "linux,keycodes",
+					       mpr121->keycodes,
+					       mpr121->keycount);
+	if (error) {
+		dev_err(dev,
+			"failed to read linux,keycode property: %d\n", error);
+		return error;
+	}
+
+	poll_dev->private = mpr121;
+	poll_dev->poll = mpr121_poll;
+	poll_dev->poll_interval = MPR121_POLL_INTERVAL;
+	poll_dev->poll_interval_max = MPR121_POLL_INTERVAL_MAX;
+	poll_dev->poll_interval_min = MPR121_POLL_INTERVAL_MIN;
+
+	input_dev = poll_dev->input;
+	input_dev->name = "Freescale MPR121 Polled Touchkey";
+	input_dev->id.bustype = BUS_I2C;
+	input_dev->dev.parent = dev;
+	if (device_property_read_bool(dev, "autorepeat"))
+		__set_bit(EV_REP, input_dev->evbit);
+	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
+
+	input_dev->keycode = mpr121->keycodes;
+	input_dev->keycodesize = sizeof(mpr121->keycodes[0]);
+	input_dev->keycodemax = mpr121->keycount;
+
+	for (i = 0; i < mpr121->keycount; i++)
+		input_set_capability(input_dev, EV_KEY, mpr121->keycodes[i]);
+
+	error = mpr121_polled_phys_init(mpr121, client);
+	if (error) {
+		dev_err(dev, "Failed to init register\n");
+		return error;
+	}
+
+	error = input_register_polled_device(poll_dev);
+	if (error)
+		return error;
+
+	i2c_set_clientdata(client, mpr121);
+
+	return 0;
+}
+
+static int __maybe_unused mpr121_polled_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR, 0x00);
+
+	return 0;
+}
+
+static int __maybe_unused mpr121_polled_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct mpr121_polled *mpr121 = i2c_get_clientdata(client);
+
+	i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR,
+				  mpr121->keycount);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(mpr121_polled_pm_ops, mpr121_polled_suspend,
+			 mpr121_polled_resume);
+
+static const struct i2c_device_id mpr121_polled_id[] = {
+	{ "mpr121_polled", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mpr121_polled_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id mpr121_polled_dt_match_table[] = {
+	{ .compatible = "fsl,mpr121-touchkey-polled" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mpr121_polled_dt_match_table);
+#endif
+
+static struct i2c_driver mpr121_polled_driver = {
+	.driver = {
+		.name	= "mpr121-polled",
+		.pm	= &mpr121_polled_pm_ops,
+		.of_match_table = of_match_ptr(mpr121_polled_dt_match_table),
+	},
+	.id_table	= mpr121_polled_id,
+	.probe		= mpr121_polled_probe,
+};
+
+module_i2c_driver(mpr121_polled_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michal Vokáč <michal.vokac@ysoft.com>");
+MODULE_DESCRIPTION("Polled driver for Freescale MPR121 chip");
-- 
2.1.4

