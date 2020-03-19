Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C49418B9FA
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgCSPBP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:01:15 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:15962 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbgCSPBP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:01:15 -0400
IronPort-SDR: HAqqYjj4bii24FoB/u31+K9R7FH1NIXOhQHxtgh0jiJmo+f+9pqrgQWOMcM+NXJDTCmPcs/MJ3
 tt6KBd4fTIpzYW1o+zwMQpD0S5tP/+cEpo/4Yu//aqvJ8osk71jmqZ/c5w7W5tj2DRQzegW7S/
 GifWmkdwQo5LjuNo9xLU7nAQSlgE+CqOnzfvS1nc5U1opgFROkSD3Fgorihoo/JtbFxTrtNj9/
 +GEKILtEFiBwW9kds4zof6aJhIVJZlnd+u5HLyAUkCb5sR+NnyOTYGVC5OAzR/wVmTK7TA8oaR
 3KU=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850186"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:13 -0800
IronPort-SDR: AZeIdfsJ4S8gaSQnOJi6c00MRAQ0vvIKNclIlyovIjSoBzSih4MXYMmHjN192U/AxDMN69lmq1
 BGqcs7/patg5FjxlsFku09JNa15tYcyaX93YCAzsL97UjPtERNi1VaHndxjuljYqpG+AykRIDh
 AQM8o5mu3LYHjJkYxWcTAoEI2kjAbg97DkBIg/1x97LzvZVurGTq6ElyGhccSXwbJbA20Kp2qd
 9kKiZS5XaZK1oc7jWkLWL0xESH6p+WO34XRiqV1Tjb7f7Gtwosq/o+oUpCwxqhiG+5UGFq+1mq
 CLg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 13/52] Input: atmel_mxt_ts - add regulator control support
Date:   Thu, 19 Mar 2020 07:59:37 -0700
Message-ID: <20200319150016.61398-14-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
[jiada: Replace white-spaces with tab for MXT_CHG_DELAY
	separate Documentation/ and include/dt-bindings/ portion change to another commit]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 130 +++++++++++++++++++++--
 1 file changed, 121 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 9aafed92db9c..ef8baf64659e 100644
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
+#define MXT_CHG_DELAY		100	/* msec */
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
@@ -2073,6 +2075,94 @@ static int mxt_read_info_block(struct mxt_data *data)
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
@@ -3139,7 +3229,12 @@ static int mxt_load_fw(struct device *dev, const char *fn)
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
 
@@ -3345,6 +3440,11 @@ static void mxt_start(struct mxt_data *data)
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
@@ -3377,6 +3477,12 @@ static void mxt_stop(struct mxt_data *data)
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
@@ -3469,6 +3575,8 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 		data->t15_num_keys = n_keys;
 	}
 
+	device_property_read_u32(dev, "atmel,suspend-mode",
+				 &data->suspend_mode);
 	return 0;
 }
 
@@ -3555,14 +3663,18 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
 	error = mxt_initialize(data);
 	if (error)
 		return error;
-- 
2.17.1

