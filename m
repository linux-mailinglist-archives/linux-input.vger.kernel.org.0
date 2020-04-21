Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1871B2115
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 10:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgDUIHA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 04:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbgDUIG6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 04:06:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646D7C061A0F
        for <linux-input@vger.kernel.org>; Tue, 21 Apr 2020 01:06:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so12942330ljg.8
        for <linux-input@vger.kernel.org>; Tue, 21 Apr 2020 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxOS14BGgXJuwdgNA45mwkHS/vrzUPQJrklRIZ8JKTc=;
        b=okiWNa215NHmC6xYipIFXHFI3bWfwP1J9gT9EetoKxA1rMhLpif61qCDd4WO+xMd1k
         TFVQS0hfu9qTrPCFTTZBQoUNUu1+aIjQvQNOX0nyIMVhAxaioGLRfaMugSNUZ6MPOTZw
         Haa0uy10Cmdyq1v98JELUJXSuRbZSJz3gx+JczVc++Qmn4jqSb8DV6L84pwlyHohhW57
         pcov+B5UW2L/4gzyt2TbiEQISquaQtsPakSJOS1X7BVSpKqi4nlXmokvhiVAiDrcOYA1
         qhsVSp7k8CT77YHvNY/29s0z37F6QI25HBAVOC1EqtHDp2PfKV7GRXeIekbP9inPWQ0a
         Ma0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxOS14BGgXJuwdgNA45mwkHS/vrzUPQJrklRIZ8JKTc=;
        b=bbLyhWK16tvW2N2GhUqzUwPbL/8FT8lMuYQVo3YU6D9OGuBElEG3weYE7kOpzdL169
         okKqA7Mg5hffJ37HGbsUsnFp2/5X5SQXI67JrGKhwyCHre3NuuDIKsG4BVszxS9svdP/
         s6h8aBqFROj2juZol238JOOgYwQ7PKFYtcUXaK27giyM29X0o1635QQOc7p+CCw7vgYM
         mfXDCkXdHZywYpdtlj6xsjxoQKP+kbRAPEtTqqVOfWnbDTI+sGAV4PJqJ7ZS8DIith4w
         KwcufGR4mrPcEDwzKnqhiJCBD4VRUj/cFCQ9eQEhSss8ONN+kAdD8CrQaIcO8Un8r7Pm
         xU3Q==
X-Gm-Message-State: AGi0Puaj1GZc8EQNig8p3XNboSRH+pnWETBnV+8a/C9fx9i2QcYqFoPp
        Y7q6c4zJAu755s6aiw9uvA+T0A==
X-Google-Smtp-Source: APiQypLmQoggcIVBIoLlyboFZbsepQkvm+j3eVnqpxhkWX5NZr5uDkC44UKN3lw/cDJ8sciMSYuZuQ==
X-Received: by 2002:a2e:8087:: with SMTP id i7mr9995821ljg.99.1587456416571;
        Tue, 21 Apr 2020 01:06:56 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id v15sm1318091ljd.33.2020.04.21.01.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 01:06:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: [PATCH 2/2 v5] Input: cy8ctma140 - add driver
Date:   Tue, 21 Apr 2020 10:06:50 +0200
Message-Id: <20200421080650.25514-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421080650.25514-1-linus.walleij@linaro.org>
References: <20200421080650.25514-1-linus.walleij@linaro.org>
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

Cc: Henrik Rydberg <rydberg@bitmath.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 drivers/input/touchscreen/Kconfig      |  13 +
 drivers/input/touchscreen/Makefile     |   1 +
 drivers/input/touchscreen/cy8ctma140.c | 406 +++++++++++++++++++++++++
 4 files changed, 426 insertions(+)
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
index c071f7c407b6..279b96d1761a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -214,6 +214,19 @@ config TOUCHSCREEN_CY8CTMG110
 	  To compile this driver as a module, choose M here: the
 	  module will be called cy8ctmg110_ts.
 
+config TOUCHSCREEN_CY8CTMA140
+	tristate "cy8ctma140 touchscreen"
+	depends on I2C
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say Y here if you have a Cypress CY8CTMA140 capacitive
+	  touchscreen also just known as "TMA140"
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called cy8ctma140.
+
 config TOUCHSCREEN_CYTTSP_CORE
 	tristate "Cypress TTSP touchscreen"
 	help
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 94c6162409b3..006444c8f87b 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_TOUCHSCREEN_BU21029)	+= bu21029_ts.o
 obj-$(CONFIG_TOUCHSCREEN_CHIPONE_ICN8318)	+= chipone_icn8318.o
 obj-$(CONFIG_TOUCHSCREEN_CHIPONE_ICN8505)	+= chipone_icn8505.o
 obj-$(CONFIG_TOUCHSCREEN_CY8CTMG110)	+= cy8ctmg110_ts.o
+obj-$(CONFIG_TOUCHSCREEN_CY8CTMA140)	+= cy8ctma140.o
 obj-$(CONFIG_TOUCHSCREEN_CYTTSP_CORE)	+= cyttsp_core.o
 obj-$(CONFIG_TOUCHSCREEN_CYTTSP_I2C)	+= cyttsp_i2c.o cyttsp_i2c_common.o
 obj-$(CONFIG_TOUCHSCREEN_CYTTSP_SPI)	+= cyttsp_spi.o
diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
new file mode 100644
index 000000000000..12ceec1e306b
--- /dev/null
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -0,0 +1,406 @@
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
+/* Used for driver name etc */
+#define CY8CTMA140_NAME "cy8ctma140"
+
+/*
+ * The datasheet claims the device supports 4 fingers but the firmware
+ * I've seen certainly only supports 2 fingers.
+ */
+#define CY8CTMA140_MAX_FINGERS 2
+#define CY8CTMA140_GET_FINGERS 0x00
+#define CY8CTMA140_GET_FW_INFO 0x19
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
+static irqreturn_t cy8ctma140_irq_thread(int irq, void *d)
+{
+	struct cy8ctma140 *ts = d;
+	u8 msgbuf0[1];
+	/* This message also fits some bytes for touchkeys, if used */
+	u8 buf[31];
+	struct i2c_msg msg[] = {
+		{
+			.addr = ts->client->addr,
+			.flags = 0,
+			.len = 1,
+			.buf = msgbuf0,
+		}, {
+			.addr = ts->client->addr,
+			.flags = I2C_M_RD,
+			.len = sizeof(buf),
+			.buf = buf,
+		},
+	};
+	u8 fingers;
+	/* X, Y and Width (W) supported */
+	u16 f1x, f1y;
+	u16 f2x, f2y;
+	u8 f1w, f2w;
+	u8 f1id, f2id;
+	int ret;
+	struct input_mt_pos pos;
+
+	msgbuf0[0] = CY8CTMA140_GET_FINGERS;
+	ret = __i2c_transfer(ts->client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret < 0) {
+		dev_err(ts->dev, "error reading message\n");
+		goto evt_out;
+	}
+	if (ret != ARRAY_SIZE(msg)) {
+		dev_err(ts->dev, "wrong number of messages\n");
+		goto evt_out;
+	}
+	if (buf[1] & 0x20) {
+		dev_info(ts->dev, "invalid event\n");
+		goto evt_out;
+	}
+
+	/* IDs are 1 and 2 so subtract 1 from ID */
+	f1id = (buf[8] >> 4) - 1;
+	f2id = (buf[8] & 0x0f) - 1;
+
+	f1x = get_unaligned_be16(&buf[3]);
+	f1y = get_unaligned_be16(&buf[5]);
+	f1w = buf[7];
+
+	f2x = get_unaligned_be16(&buf[9]);
+	f2y = get_unaligned_be16(&buf[11]);
+	f2w = buf[13];
+
+	fingers = buf[2] & 0x0f;
+
+	if (!fingers) {
+		/*
+		 * For the unlikely case that both fingers reports as released
+		 * by the same IRQ.
+		 */
+		if (ts->prev_fingers >= 2) {
+			dev_dbg(ts->dev, "release finger 2 ID: %02x\n",
+				ts->prev_f2id);
+			input_mt_slot(ts->input, ts->prev_f2id);
+			input_mt_report_slot_state(ts->input, MT_TOOL_FINGER,
+						   false);
+		}
+		if (ts->prev_fingers >= 1) {
+			dev_dbg(ts->dev, "release finger 1 ID: %02x\n",
+				ts->prev_f1id);
+			input_mt_slot(ts->input, ts->prev_f1id);
+			input_mt_report_slot_state(ts->input,
+						   MT_TOOL_FINGER, false);
+		}
+		goto fingers_out;
+	}
+
+	/*
+	 * When just handling two fingers this code is simple and we do not
+	 * need a loop increasing the complexity. If you need to modify
+	 * this driver for some firmware handling more than 2 fingers,
+	 * this is where you put in an array of coordinates and a loop
+	 * instead.
+	 */
+	if (fingers >= 1) {
+		touchscreen_set_mt_pos(&pos, &ts->props, f1x, f1y);
+		dev_dbg(ts->dev,
+			"%d fingers: finger 1 ID: %02x (%d, %d) w: %d\n",
+			fingers, f1id, pos.x, pos.y, f1w);
+		input_mt_slot(ts->input, f1id);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
+		input_report_abs(ts->input, ABS_MT_POSITION_X, pos.x);
+		input_report_abs(ts->input, ABS_MT_POSITION_Y, pos.y);
+		input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR, f1w);
+	}
+	if (fingers == 1 && ts->prev_fingers == 2) {
+		dev_dbg(ts->dev, "release finger 2 ID: %02x\n", ts->prev_f2id);
+		input_mt_slot(ts->input, ts->prev_f2id);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
+		goto fingers_out;
+	}
+	if (fingers >= 2) {
+		touchscreen_set_mt_pos(&pos, &ts->props, f2x, f2y);
+		dev_dbg(ts->dev,
+			"%d fingers: finger 2 ID %02x (%d, %d) w: %d\n",
+			fingers, f2id, pos.x, pos.y, f2w);
+		input_mt_slot(ts->input, f2id);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
+		input_report_abs(ts->input, ABS_MT_POSITION_X, pos.x);
+		input_report_abs(ts->input, ABS_MT_POSITION_Y, pos.y);
+		input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR, f2w);
+	}
+	if (fingers > 2)
+		dev_err(ts->dev, "%d fingers - unsupported!\n", fingers);
+
+fingers_out:
+	input_mt_sync_frame(ts->input);
+	input_sync(ts->input);
+	/*
+	 * The firmware just resports 1 or 0 finger without any indication of
+	 * the ID of the finger that just disappeared, so we need to cache
+	 * the previous finger IDs.
+	 */
+	ts->prev_fingers = fingers;
+	ts->prev_f1id = f1id;
+	ts->prev_f2id = f2id;
+evt_out:
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
+		dev_err(ts->dev, "error recieveing FW info message\n");
+		return ret;
+	}
+	if (ret != 5) {
+		dev_err(ts->dev, "got only %d bytes\n", ret);
+		return -EIO;
+	}
+
+	dev_info(ts->dev, "vendor %c%c, HW ID %.2d, FW ver %.4d\n",
+		 buf[0], buf[1], buf[3], buf[4]);
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
+	int ret;
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
+	ret = input_mt_init_slots(input, CY8CTMA140_MAX_FINGERS,
+				  INPUT_MT_DIRECT);
+	if (ret)
+		return ret;
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
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
+				      ts->regulators);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get regulators %d\n",
+				ret);
+		return ret;
+	}
+
+	ret = cy8ctma140_power_up(ts);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
+	if (ret) {
+		dev_err(dev, "failed to install power off handler\n");
+		return ret;
+	}
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					cy8ctma140_irq_thread,
+					IRQF_ONESHOT,
+					CY8CTMA140_NAME, ts);
+	if (ret) {
+		dev_err(dev, "irq %d busy? error %d\n", client->irq, ret);
+		goto err_reg_dis;
+	}
+
+	ret = cy8ctma140_init(ts);
+	if (ret)
+		return ret;
+
+	ret = input_register_device(input);
+	if (ret)
+		goto err_reg_dis;
+
+	i2c_set_clientdata(client, ts);
+
+	return 0;
+
+err_reg_dis:
+	cy8ctma140_power_down(ts);
+	return ret;
+}
+
+static int __maybe_unused cy8ctma140_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cy8ctma140 *ts = i2c_get_clientdata(client);
+
+	if (!device_may_wakeup(&client->dev))
+		cy8ctma140_power_down(ts);
+	input_mt_slot(ts->input, 0);
+	input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
+	input_mt_slot(ts->input, 1);
+	input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
+	input_mt_report_pointer_emulation(ts->input, true);
+	input_sync(ts->input);
+
+	return 0;
+}
+
+static int __maybe_unused cy8ctma140_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cy8ctma140 *ts = i2c_get_clientdata(client);
+	int ret;
+
+	if (!device_may_wakeup(&client->dev)) {
+		ret = cy8ctma140_power_up(ts);
+		if (ret)
+			return ret;
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
2.21.1

