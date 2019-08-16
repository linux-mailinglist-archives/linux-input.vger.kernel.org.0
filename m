Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A648FE44
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbfHPIj0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:26 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1996 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbfHPIj0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:26 -0400
IronPort-SDR: 0SKymXUETSbIrCgi4oB44jbgHRkdGtNenKwOawnrduuMgIOcGJK6buSrs2Lvmil6mCB7+mZ91e
 TpWpPNTORz/fM8YiKs2Nl9RcrOonQop+apm78+uiNIrSXPO4PwqRiCIUm+u2M+iRI0hZ6LTmRZ
 vtvqukWg7AgN9SCAvgjOyupS42yFkv02eOe/gJ7/OeMdGTYsO0MN6M4eB16X0DLp/2kNiJdnbK
 /ms6I/R9dYDEwuOoK+C3njosTKu33sYGYXWWid6oYUhK6flocHvprgnGjSkA2e8vXfFzs0GOj+
 wYQ=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484225"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:32:19 -0800
IronPort-SDR: khxXwrA5TRP+Dy5Idujrz0thVjYInAm4ZUAIl8XNvjJxD6ABwdH5m4stJkDwydqMAsv+WhPQeh
 pe4Lp4NEG5nq45WEWYyudp8v10UaQ/1y48TYfM6fkvfhkPEj9/huC6Y7Pw4EkdBYcF6ulYvsOJ
 W4y15BmA+JO22b02jVOymuUQ9brx00TPQKfnoGRUUoUShmEelu4Ck17DuL++In0W5aWJyvAhuT
 7xZ6jT8WHKtxBCAFqBhWn6kERYkjEpRHFSPN22bshGZbzMzJAUNeagnbv13pVDVvbEbYyCnNVm
 RrU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 13/63] Input: atmel_mxt_ts - add regulator control support
Date:   Fri, 16 Aug 2019 17:31:28 +0900
Message-ID: <20190816083218.18402-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083218.18402-1-jiada_wang@mentor.com>
References: <20190816083218.18402-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Allow the driver to optionally manage enabling/disable power to the touch
controller itself. If the regulators are not present then use the deep
sleep power mode instead.

For a correct power on sequence, it is required that we have control over
the RESET line.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 14052b61bb66c2f2283c00e733e131be7a9b8bfc)
[gdavis: Resolve forward port conflicts due to v4.14-rc1 commmit
	 f657b00df22e ("Input: atmel_mxt_ts - add support for reset
	 line") and applying upstream commit 96a938aa214e ("Input:
	 atmel_mxt_ts - remove platform data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[gdavis: Squash fixes from Dirk Behme:
	 - Input: atmel_mxt_ts - in failure case disable the regulator
	 - Input: atmel_mxt_ts - disable only enabled regulators
	 - Input: atmel_mxt_ts - use devm_regulator_get()]
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Notes:
- Squash fixes by Dirk Behme:
  + Input: atmel_mxt_ts - in failure case disable the regulator

    If the second regulator_enable(), disable the previously enabled
    regulator, again.
  + Input: atmel_mxt_ts - disable only enabled regulators

    As enabling the regulators in mxt_regulator_enable() might fail,
    check if the regulators are really enabled and disable them only
    in this case.
  + Input: atmel_mxt_ts - use devm_regulator_get()

    Switch to devm_regulator_get() enabling us to drop the regulator_put()
    in the remove function.

[jiada: Resolve forward port conflicts due to commit
	5cecc2bccc03f ("Input: atmel_mxt_ts - fix
	-Wunused-const-variable")]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../bindings/input/atmel,maxtouch.txt         |   6 +
 MAINTAINERS                                   |   1 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 130 ++++++++++++++++--
 include/dt-bindings/input/atmel_mxt_ts.h      |  22 +++
 4 files changed, 150 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index c88919480d37..e28139ce3cae 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -31,6 +31,12 @@ Optional properties for main touchpad device:
 
 - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
 
+- atmel,suspend-mode: Select method used to suspend:
+    MXT_SUSPEND_DEEP_SLEEP - use T7 to suspend the device into deep sleep
+    MXT_SUSPEND_T9_CTRL - use T9.CTRL to turn off touch processing
+    MXT_SUSPEND_REGULATOR - use regulators to power down device during suspend
+    Definitions are in <dt-bindings/input/atmel_mxt_ts.h>.
+
 Example:
 
 	touch@4b {
diff --git a/MAINTAINERS b/MAINTAINERS
index 47800d32cfbc..1509bb9072fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2777,6 +2777,7 @@ T:	git git://github.com/ndyer/linux.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/atmel,maxtouch.txt
 F:	drivers/input/touchscreen/atmel_mxt_ts.c
+F:	include/dt-bindings/input/atmel_mxt_ts.h
 
 ATMEL WIRELESS DRIVER
 M:	Simon Kelley <simon@thekelleys.org.uk>
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 515882df5509..907eebeff465 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -26,10 +26,12 @@
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
 #include <asm/unaligned.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-vmalloc.h>
+#include <dt-bindings/input/atmel_mxt_ts.h>
 
 /* Firmware files */
 #define MXT_FW_NAME		"maxtouch.fw"
@@ -215,6 +217,9 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_REGULATOR_DELAY	150	/* msec */
+#define MXT_CHG_DELAY	        100	/* msec */
+#define MXT_POWERON_DELAY	150	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -275,11 +280,6 @@ enum v4l_dbg_inputs {
 	MXT_V4L_INPUT_MAX,
 };
 
-enum mxt_suspend_mode {
-	MXT_SUSPEND_DEEP_SLEEP	= 0,
-	MXT_SUSPEND_T9_CTRL	= 1,
-};
-
 /* Config update context */
 struct mxt_cfg {
 	u8 *raw;
@@ -333,6 +333,8 @@ struct mxt_data {
 	u8 stylus_aux_pressure;
 	u8 stylus_aux_peak;
 	bool use_retrigen_workaround;
+	struct regulator *reg_vdd;
+	struct regulator *reg_avdd;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2070,6 +2072,94 @@ static int mxt_read_info_block(struct mxt_data *data)
 	return error;
 }
 
+static void mxt_regulator_enable(struct mxt_data *data)
+{
+	int error;
+
+	if (!data->reg_vdd || !data->reg_avdd)
+		return;
+
+	gpiod_set_value(data->reset_gpio, 0);
+
+	error = regulator_enable(data->reg_vdd);
+	if (error)
+		return;
+
+	error = regulator_enable(data->reg_avdd);
+	if (error) {
+		regulator_disable(data->reg_vdd);
+		return;
+	}
+
+	/*
+	 * According to maXTouch power sequencing specification, RESET line
+	 * must be kept low until some time after regulators come up to
+	 * voltage
+	 */
+	msleep(MXT_REGULATOR_DELAY);
+	gpiod_set_value(data->reset_gpio, 1);
+	msleep(MXT_CHG_DELAY);
+
+retry_wait:
+	reinit_completion(&data->bl_completion);
+	data->in_bootloader = true;
+	error = mxt_wait_for_completion(data, &data->bl_completion,
+					MXT_POWERON_DELAY);
+	if (error == -EINTR)
+		goto retry_wait;
+
+	data->in_bootloader = false;
+}
+
+static void mxt_regulator_disable(struct mxt_data *data)
+{
+	if (!data->reg_vdd || !data->reg_avdd)
+		return;
+
+	if (regulator_is_enabled(data->reg_vdd))
+		regulator_disable(data->reg_vdd);
+	if (regulator_is_enabled(data->reg_avdd))
+		regulator_disable(data->reg_avdd);
+}
+
+static int mxt_probe_regulators(struct mxt_data *data)
+{
+	struct device *dev = &data->client->dev;
+	int error;
+
+	/* Must have reset GPIO to use regulator support */
+	if (!data->reset_gpio) {
+		error = -EINVAL;
+		goto fail;
+	}
+
+	data->reg_vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(data->reg_vdd)) {
+		error = PTR_ERR(data->reg_vdd);
+		dev_err(dev, "Error %d getting vdd regulator\n", error);
+		goto fail;
+	}
+
+	data->reg_avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(data->reg_avdd)) {
+		error = PTR_ERR(data->reg_avdd);
+		dev_err(dev, "Error %d getting avdd regulator\n", error);
+		goto fail_release;
+	}
+
+	mxt_regulator_enable(data);
+
+	dev_dbg(dev, "Initialised regulators\n");
+	return 0;
+
+fail_release:
+	regulator_put(data->reg_vdd);
+fail:
+	data->reg_vdd = NULL;
+	data->reg_avdd = NULL;
+	return error;
+}
+
 static int mxt_read_t9_resolution(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
@@ -3135,7 +3225,12 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 		goto release_firmware;
 
 	if (data->suspended) {
-		enable_irq(data->irq);
+		if (data->suspend_mode == MXT_SUSPEND_REGULATOR)
+			mxt_regulator_enable(data);
+
+		if (data->suspend_mode == MXT_SUSPEND_DEEP_SLEEP)
+			enable_irq(data->irq);
+
 		data->suspended = false;
 	}
 
@@ -3341,6 +3436,11 @@ static void mxt_start(struct mxt_data *data)
 				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
 		break;
 
+	case MXT_SUSPEND_REGULATOR:
+		enable_irq(data->irq);
+		mxt_regulator_enable(data);
+		break;
+
 	case MXT_SUSPEND_DEEP_SLEEP:
 	default:
 		/*
@@ -3373,6 +3473,12 @@ static void mxt_stop(struct mxt_data *data)
 				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0);
 		break;
 
+	case MXT_SUSPEND_REGULATOR:
+		disable_irq(data->irq);
+		mxt_regulator_disable(data);
+		mxt_reset_slots(data);
+		break;
+
 	case MXT_SUSPEND_DEEP_SLEEP:
 	default:
 		disable_irq(data->irq);
@@ -3437,6 +3543,8 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 		data->t19_num_keys = n_keys;
 	}
 
+	device_property_read_u32(dev, "atmel,suspend-mode", &data->suspend_mode);
+
 	return 0;
 }
 
@@ -3523,14 +3631,18 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
-	disable_irq(client->irq);
-
-	if (data->reset_gpio) {
+	if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
+		error = mxt_probe_regulators(data);
+		if (error)
+			return error;
+	} else if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
+	disable_irq(data->irq);
+
 	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
 	if (error) {
 		dev_err(&client->dev, "Failure %d creating fw sysfs group\n",
diff --git a/include/dt-bindings/input/atmel_mxt_ts.h b/include/dt-bindings/input/atmel_mxt_ts.h
new file mode 100644
index 000000000000..e4c4c0f6fa37
--- /dev/null
+++ b/include/dt-bindings/input/atmel_mxt_ts.h
@@ -0,0 +1,22 @@
+/*
+ * Atmel maXTouch Touchscreen driver
+ *
+ * Copyright (C) 2015 Atmel Corporation
+ * Author: Nick Dyer <nick.dyer@itdev.co.uk>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __DT_BINDINGS_ATMEL_MXT_TS_H
+#define __DT_BINDINGS_ATMEL_MXT_TS_H
+
+enum mxt_suspend_mode {
+	MXT_SUSPEND_DEEP_SLEEP = 0,
+	MXT_SUSPEND_T9_CTRL = 1,
+	MXT_SUSPEND_REGULATOR = 2,
+};
+
+#endif /* __DT_BINDINGS_ATMEL_MXT_TS_H */
-- 
2.19.2

