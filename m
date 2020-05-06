Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C1A1C706B
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 14:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgEFMer (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 08:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728083AbgEFMeq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 May 2020 08:34:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A68FC061A0F
        for <linux-input@vger.kernel.org>; Wed,  6 May 2020 05:34:46 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a21so2119896ljj.11
        for <linux-input@vger.kernel.org>; Wed, 06 May 2020 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hTHybCtdFeeu1wlmLq0diWEALM3SP9vR1UPzfw9OZXc=;
        b=suZyqqiC6WZO7oSXdYQoSihs87BVViYbpEWvr/cp5ut8TpseUBGqvJIAx1Hc41NzjB
         Mp8lkY8BGrVSh2UKQOYZe78kA7R98Mxbf3lnvcHGUPsFt+JDYBYfSfxMVzSBbvZecGu3
         t61DT7oobw7XoyxMGcTHVZjd2iBcD4HIaJ124uIHriZfttJAP6mAcf2VU33RcnVSZoIO
         JEfZ95qpoQ0BhKbsgZHlslKaVUTCdDR5t/4WGYFBo9GBCHLWglepMiiVshnPqTznucub
         7GC6LethQcwJGHwAY/m9eOXUZfP1yMj2cU/yVKfMY1Nj5z8ToChIVNq0vpE1G340Qfhl
         Mm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hTHybCtdFeeu1wlmLq0diWEALM3SP9vR1UPzfw9OZXc=;
        b=I5qvIKbcZAqtEiZ3Lf7x/k7bOFBnFh51Vox+VD3fk4VnZphK+P610DmlwcEBP259of
         H00ytK675ULghuWkeAdokh3eOZS089GuJdiekoksWq9TWEhQfP5mLvf/NCiSVj/GQCKB
         bqQMErx9T/6LVxpFr5kyAcEDZmw3UMPHIeOXLyRQW1aNKQEtDdC5riZ6e/mBoikiBmk7
         VMYy+ZUjx/RVJ9c1NpMD7ld6nezrh/SGM1vM+3IOXDaVbQfIuUeM30KlMn2j5Ujn4M4D
         AhClDPxXn1TuDyGo/jprD/6Xs/Zfcfudt5RjjPXZmB3CHqjADQVURbj/nwVu7zhY+Eyu
         ctMQ==
X-Gm-Message-State: AGi0PubkRu2GEgo9PjzGGVPeS5C4vdvHQ38rubpaMeBEsK7sRbedl2dv
        QruO2Iv9s2BG6SEUJSFwUwUNvA==
X-Google-Smtp-Source: APiQypKZKv+OwjkrJ8KoBjMf2Nyu1F9FXpzA4EhFK7MsLbaSFIjFIRwflTV34lpHvkRuIIsxXhVzBw==
X-Received: by 2002:a05:651c:c8:: with SMTP id 8mr4524820ljr.182.1588768484718;
        Wed, 06 May 2020 05:34:44 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id q30sm1522551lfd.32.2020.05.06.05.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:34:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: [PATCH 2/2 v6] Input: cy8ctma140 - add driver
Date:   Wed,  6 May 2020 14:34:35 +0200
Message-Id: <20200506123435.187432-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506123435.187432-1-linus.walleij@linaro.org>
References: <20200506123435.187432-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds a new driver for the Cypress CY8CTMA140 touchscreen.

This driver is inspired by out-of-tree code for the Samsung
GT-S7710 mobile phone.

I have tried to compare the structure and behaviour of this
touchscreen to the existing CYTTSP and CYTTSP4 generics and
it seems pretty different. It is also different in character
from the cy8ctmg110_ts.c. It appears to rather be vaguely
related to the Melfas MMS114 driver, yet distinctly
different.

Dmitry Torokhov rewrote the key scanning code during the
submission process so the driver is a joint work.

Cc: Henrik Rydberg <rydberg@bitmath.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v5->v6:
- Fold in Dmitry's key check loop for up to 4 fingers.
- Use normal locked i2c_transfer() (Dmitry)
- Drop dependency in GPIOLIB from the Kconfig
- Move the Kconfig entry to be alphabetically on top
  of TMG110.
ChangeLog v4->v5:
- Resend with the fixed up bindings.
ChangeLog v3->v4:
- Rebase on v5.7-rc1
- Resend with the bindings.
ChangeLog v2->v3:
- Consistently use the finger IDs reported by the firmware
  as slot numbers. They are ID 0 and 1. It appears that
  if you press one finger, press a second, release the
  first and then the second, the finger ID stays as
  01 for the second finger until it is released (firmware
  is tracking the fingers).
- We need to save the last finger IDs for finger 1 and 2
  so that when we all of a sudden get 2->1 or 1->0 fingers,
  we have some idea of what went missing.
- Change ABS_MT_PRESSURE to ABS_MT_TOUCH_MAJOR: after
  some elaborate testing (no datasheet) I have concluded
  that this is the finger diameter, not the pressure.
- Add some input_set_capability() for ABS_MT_POSITION_X,
  ABS_MT_POSITION_Y and ABS_MT_TOUCH_MAJOR so that udev
  is happy and working.
- Tested with the GTK3 demos.
ChangeLog v1->v2:
- Do not specify the array size for the I2C command
  sequence, have it dynamically assigned.
- Consequently use ARRAY_SIZE() to determine its length.
- Use touchscreen_set_mt_pos() with the props parsed from
  the device tree to massage [x,y] coordinates for each
  finger, then use the resulting transformed pos when
  reporting absolute coordinates.
- Drop the nonsensical input->phys setting.
- Get and enable the regulators in bulk.
- Do not set the voltage on the regulators.
- Do not enforce falling edge on the IRQ (will be done
  by the device tree flags).
- Use get_unaligned_be16() to decode bytes to 16 bit BE.
- Do not hardcode device wakeup, power down the device
  if it is not used for wakeup in suspend() and power
  it back up on the same condition in resume().
- Drop references to unused GPIO.

Since there are no comments so far on the device tree
binding I'm just resending this patch 2/2 as v2.
---
 MAINTAINERS                            |   6 +
 drivers/input/touchscreen/Kconfig      |  12 +
 drivers/input/touchscreen/Makefile     |   1 +
 drivers/input/touchscreen/cy8ctma140.c | 354 +++++++++++++++++++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 drivers/input/touchscreen/cy8ctma140.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..1912de113237 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4655,6 +4655,12 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/anttip/media_tree.git
 F:	drivers/media/common/cypress_firmware*
 
+CYPRESS CY8CTMA140 TOUCHSCREEN DRIVER
+M:	Linus Walleij <linus.walleij@linaro.org>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/input/touchscreen/cy8ctma140.c
+
 CYTTSP TOUCHSCREEN DRIVER
 M:	Ferruh Yigit <fery@cypress.com>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index c071f7c407b6..35c867b2d9a7 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -201,6 +201,18 @@ config TOUCHSCREEN_CHIPONE_ICN8505
 	  To compile this driver as a module, choose M here: the
 	  module will be called chipone_icn8505.
 
+config TOUCHSCREEN_CY8CTMA140
+	tristate "cy8ctma140 touchscreen"
+	depends on I2C
+	help
+	  Say Y here if you have a Cypress CY8CTMA140 capacitive
+	  touchscreen also just known as "TMA140"
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called cy8ctma140.
+
 config TOUCHSCREEN_CY8CTMG110
 	tristate "cy8ctmg110 touchscreen"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 94c6162409b3..30d1e1b42492 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_TOUCHSCREEN_BU21013)	+= bu21013_ts.o
 obj-$(CONFIG_TOUCHSCREEN_BU21029)	+= bu21029_ts.o
 obj-$(CONFIG_TOUCHSCREEN_CHIPONE_ICN8318)	+= chipone_icn8318.o
 obj-$(CONFIG_TOUCHSCREEN_CHIPONE_ICN8505)	+= chipone_icn8505.o
+obj-$(CONFIG_TOUCHSCREEN_CY8CTMA140)	+= cy8ctma140.o
 obj-$(CONFIG_TOUCHSCREEN_CY8CTMG110)	+= cy8ctmg110_ts.o
 obj-$(CONFIG_TOUCHSCREEN_CYTTSP_CORE)	+= cyttsp_core.o
 obj-$(CONFIG_TOUCHSCREEN_CYTTSP_I2C)	+= cyttsp_i2c.o cyttsp_i2c_common.o
diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
new file mode 100644
index 000000000000..71870789645b
--- /dev/null
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for Cypress CY8CTMA140 (TMA140) touchscreen
+ * (C) 2020 Linus Walleij <linus.walleij@linaro.org>
+ * (C) 2007 Cypress
+ * (C) 2007 Google, Inc.
+ *
+ * Inspired by the tma140_skomer.c driver in the Samsung GT-S7710 code
+ * drop. The GT-S7710 is codenamed "Skomer", the code also indicates
+ * that the same touchscreen was used in a product called "Lucas".
+ *
+ * The code drop for GT-S7710 also contains a firmware downloader and
+ * 15 (!) versions of the firmware drop from Cypress. But here we assume
+ * the firmware got downloaded to the touchscreen flash successfully and
+ * just use it to read the fingers. The shipped vendor driver does the
+ * same.
+ */
+
+#include <asm/unaligned.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/input.h>
+#include <linux/input/touchscreen.h>
+#include <linux/input/mt.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/i2c.h>
+#include <linux/regulator/consumer.h>
+#include <linux/delay.h>
+
+#define CY8CTMA140_NAME			"cy8ctma140"
+
+#define CY8CTMA140_MAX_FINGERS		4
+
+#define CY8CTMA140_GET_FINGERS		0x00
+#define CY8CTMA140_GET_FW_INFO		0x19
+
+/* This message also fits some bytes for touchkeys, if used */
+#define CY8CTMA140_PACKET_SIZE		31
+
+#define CY8CTMA140_INVALID_BUFFER_BIT	5
+
+struct cy8ctma140 {
+	struct input_dev *input;
+	struct touchscreen_properties props;
+	struct device *dev;
+	struct i2c_client *client;
+	struct regulator_bulk_data regulators[2];
+	u8 prev_fingers;
+	u8 prev_f1id;
+	u8 prev_f2id;
+};
+
+static void cy8ctma140_report(struct cy8ctma140 *ts, u8 *data, int n_fingers)
+{
+	static const u8 contact_offsets[] = { 0x03, 0x09, 0x10, 0x16 };
+	u8 *buf;
+	u16 x, y;
+	u8 w;
+	u8 id;
+	int slot;
+	int i;
+
+	for (i = 0; i < n_fingers; i++) {
+		buf = &data[contact_offsets[i]];
+
+		/*
+		 * Odd contacts have contact ID in the lower nibble of
+		 * the preceding byte, whereas even contacts have it in
+		 * the upper nibble of the following byte.
+		 */
+		id = i % 2 ? buf[-1] & 0x0f : buf[5] >> 4;
+		slot = input_mt_get_slot_by_key(ts->input, id);
+		if (slot < 0)
+			continue;
+
+		x = get_unaligned_be16(buf);
+		y = get_unaligned_be16(buf + 2);
+		w = buf[4];
+
+		dev_dbg(ts->dev, "finger %d: ID %02x (%d, %d) w: %d\n",
+			slot, id, x, y, w);
+
+		input_mt_slot(ts->input, slot);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
+		touchscreen_report_pos(ts->input, &ts->props, x, y, true);
+		input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR, w);
+	}
+
+	input_mt_sync_frame(ts->input);
+	input_sync(ts->input);
+}
+
+static irqreturn_t cy8ctma140_irq_thread(int irq, void *d)
+{
+	struct cy8ctma140 *ts = d;
+	u8 cmdbuf[] = { CY8CTMA140_GET_FINGERS };
+	u8 buf[CY8CTMA140_PACKET_SIZE];
+	struct i2c_msg msg[] = {
+		{
+			.addr = ts->client->addr,
+			.flags = 0,
+			.len = sizeof(cmdbuf),
+			.buf = cmdbuf,
+		}, {
+			.addr = ts->client->addr,
+			.flags = I2C_M_RD,
+			.len = sizeof(buf),
+			.buf = buf,
+		},
+	};
+	u8 n_fingers;
+	int ret;
+
+	ret = i2c_transfer(ts->client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret != ARRAY_SIZE(msg)) {
+		if (ret < 0)
+			dev_err(ts->dev, "error reading message: %d\n", ret);
+		else
+			dev_err(ts->dev, "wrong number of messages\n");
+		goto out;
+	}
+
+	if (buf[1] & BIT(CY8CTMA140_INVALID_BUFFER_BIT)) {
+		dev_dbg(ts->dev, "invalid event\n");
+		goto out;
+	}
+
+	n_fingers = buf[2] & 0x0f;
+	if (n_fingers > CY8CTMA140_MAX_FINGERS) {
+		dev_err(ts->dev, "unexpected number of fingers: %d\n",
+			n_fingers);
+		goto out;
+	}
+
+	cy8ctma140_report(ts, buf, n_fingers);
+
+out:
+	return IRQ_HANDLED;
+}
+
+static int cy8ctma140_init(struct cy8ctma140 *ts)
+{
+	u8 addr[1];
+	u8 buf[5];
+	int ret;
+
+	addr[0] = CY8CTMA140_GET_FW_INFO;
+	ret = i2c_master_send(ts->client, addr, 1);
+	if (ret < 0) {
+		dev_err(ts->dev, "error sending FW info message\n");
+		return ret;
+	}
+	ret = i2c_master_recv(ts->client, buf, 5);
+	if (ret < 0) {
+		dev_err(ts->dev, "error receiving FW info message\n");
+		return ret;
+	}
+	if (ret != 5) {
+		dev_err(ts->dev, "got only %d bytes\n", ret);
+		return -EIO;
+	}
+
+	dev_dbg(ts->dev, "vendor %c%c, HW ID %.2d, FW ver %.4d\n",
+		buf[0], buf[1], buf[3], buf[4]);
+
+	return 0;
+}
+
+static int cy8ctma140_power_up(struct cy8ctma140 *ts)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
+				      ts->regulators);
+	if (error) {
+		dev_err(ts->dev, "failed to enable regulators\n");
+		return error;
+	}
+
+	msleep(250);
+
+	return 0;
+}
+
+static void cy8ctma140_power_down(struct cy8ctma140 *ts)
+{
+	regulator_bulk_disable(ARRAY_SIZE(ts->regulators),
+			       ts->regulators);
+}
+
+/* Called from the registered devm action */
+static void cy8ctma140_power_off_action(void *d)
+{
+	struct cy8ctma140 *ts = d;
+
+	cy8ctma140_power_down(ts);
+}
+
+static int cy8ctma140_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct cy8ctma140 *ts;
+	struct input_dev *input;
+	struct device *dev = &client->dev;
+	int error;
+
+	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+
+	ts->dev = dev;
+	ts->client = client;
+	ts->input = input;
+
+	input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
+	/* One byte for width 0..255 so this is the limit */
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+	/*
+	 * This sets up event max/min capabilities and fuzz.
+	 * Some DT properties are compulsory so we do not need
+	 * to provide defaults for X/Y max or pressure max.
+	 *
+	 * We just initialize a very simple MT touchscreen here,
+	 * some devices use the capability of this touchscreen to
+	 * provide touchkeys, and in that case this needs to be
+	 * extended to handle touchkey input.
+	 *
+	 * The firmware takes care of finger tracking and dropping
+	 * invalid ranges.
+	 */
+	touchscreen_parse_properties(input, true, &ts->props);
+	input_abs_set_fuzz(input, ABS_MT_POSITION_X, 0);
+	input_abs_set_fuzz(input, ABS_MT_POSITION_Y, 0);
+
+	error = input_mt_init_slots(input, CY8CTMA140_MAX_FINGERS,
+				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error)
+		return error;
+
+	input->name = CY8CTMA140_NAME;
+	input->id.bustype = BUS_I2C;
+	input_set_drvdata(input, ts);
+
+	/*
+	 * VCPIN is the analog voltage supply
+	 * VDD is the digital voltage supply
+	 * since the voltage range of VDD overlaps that of VCPIN,
+	 * many designs to just supply both with a single voltage
+	 * source of ~3.3 V.
+	 */
+	ts->regulators[0].supply = "vcpin";
+	ts->regulators[1].supply = "vdd";
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
+				      ts->regulators);
+	if (error) {
+		if (error != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get regulators %d\n",
+				error);
+		return error;
+	}
+
+	error = cy8ctma140_power_up(ts);
+	if (error)
+		return error;
+
+	error = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
+	if (error) {
+		dev_err(dev, "failed to install power off handler\n");
+		return error;
+	}
+
+	error = devm_request_threaded_irq(dev, client->irq,
+					  NULL, cy8ctma140_irq_thread,
+					  IRQF_ONESHOT, CY8CTMA140_NAME, ts);
+	if (error) {
+		dev_err(dev, "irq %d busy? error %d\n", client->irq, error);
+		return error;
+	}
+
+	error = cy8ctma140_init(ts);
+	if (error)
+		return error;
+
+	error = input_register_device(input);
+	if (error)
+		return error;
+
+	i2c_set_clientdata(client, ts);
+
+	return 0;
+}
+
+static int __maybe_unused cy8ctma140_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cy8ctma140 *ts = i2c_get_clientdata(client);
+
+	if (!device_may_wakeup(&client->dev))
+		cy8ctma140_power_down(ts);
+
+	return 0;
+}
+
+static int __maybe_unused cy8ctma140_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cy8ctma140 *ts = i2c_get_clientdata(client);
+	int error;
+
+	if (!device_may_wakeup(&client->dev)) {
+		error = cy8ctma140_power_up(ts);
+		if (error)
+			return error;
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(cy8ctma140_pm, cy8ctma140_suspend, cy8ctma140_resume);
+
+static const struct i2c_device_id cy8ctma140_idtable[] = {
+	{ CY8CTMA140_NAME, 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, cy8ctma140_idtable);
+
+static const struct of_device_id cy8ctma140_of_match[] = {
+	{
+		.compatible = "cypress,cy8ctma140",
+	},
+};
+MODULE_DEVICE_TABLE(of, cy8ctma140_of_match);
+
+static struct i2c_driver cy8ctma140_driver = {
+	.driver		= {
+		.name	= CY8CTMA140_NAME,
+		.pm	= &cy8ctma140_pm,
+		.of_match_table = cy8ctma140_of_match,
+	},
+	.id_table	= cy8ctma140_idtable,
+	.probe		= cy8ctma140_probe,
+};
+module_i2c_driver(cy8ctma140_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("CY8CTMA140 TouchScreen Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

