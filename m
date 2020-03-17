Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4A24189038
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 22:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgCQVRr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 17:17:47 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43907 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgCQVRq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 17:17:46 -0400
Received: by mail-lj1-f194.google.com with SMTP id r7so24628012ljp.10
        for <linux-input@vger.kernel.org>; Tue, 17 Mar 2020 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWIFpTLJmVoozEPeCYhTHRtuuiOP0O/jAcTQ8mSm4Lc=;
        b=v8EDYuP/xo4P+k6sgY8rIvrkbIFYRDXlMSKVyE4ERtfa8zX84GOCrLGZKikd7uE08d
         3fWQjjq4XuDiZODxQeAudaAgrG0AmAmHSAwoCnXnTrfILHE2gE41a1vB7zL0wG2f/iva
         V2pse77x0G9XIOkxhqQUjE1d4n1gfOo1GYfisB8ymf+Ocd+KHr0mKEJ8AIXKqG4y6AsU
         pu4YCrePApiAPXU1c9IPuDbMkr9XBz7CXfP2KscPXJEDik5p8EyzcDQdcmC8MQwFhV20
         6dY7W7HpT+lG+Gq+ZnJYILhMwYfrpeksi//516kA8PExN/kllblWL8LtdolxrR5Ks8iP
         CG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWIFpTLJmVoozEPeCYhTHRtuuiOP0O/jAcTQ8mSm4Lc=;
        b=H8azdeN/+H7oF9iVoAC8jeKq6ZyttUHywlLYEstskR4u6uJGGGxv9nYLMcO1JvpUcC
         HhK0Cec588Wk4JRfYjN6dv4jcJDbErnwn/8ZuFrg4Cf5jX0P93Uedadht9iFPcAST9qC
         CMsnTChrZU1KvJDYmK9W3nD5YQ6PZWsyQqOhOF4R1E4YbPwKPONiAmPkUSrnWOCzGrSU
         nGo0OTjvdoQNRQGiazPbv1/9IrL4EXBf4mTT4CQGSHLIwi5LjhlrSxpP3YN1frCPR6mY
         TATpnhKdJGAhS5Yaxf7hzvfkfflOJE1ehTYv1hnLblSJ7hkba3vLwbL8wFJjPT9TuTaA
         MIyA==
X-Gm-Message-State: ANhLgQ30FhHr4msVuh7f8ZTQCtD5wWz5wBSdcqVQ3NQTRACReuKCPtg5
        UsiFlHg6Au6KK5EV2yJ9kf6Jz1oBy70aRA==
X-Google-Smtp-Source: ADFU+vukCeJ6xD4sKBW6/0eS0bQVQ2JCdAbHlDpN03qR1p8yjMEopPVmKhaLMyJdB1xH30WSWmZVLg==
X-Received: by 2002:a2e:97d7:: with SMTP id m23mr436361ljj.122.1584479862647;
        Tue, 17 Mar 2020 14:17:42 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id l17sm3656646lje.81.2020.03.17.14.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 14:17:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: [PATCH 2/2 v2] Input: cy8ctma140 - add driver
Date:   Tue, 17 Mar 2020 22:17:32 +0100
Message-Id: <20200317211732.8150-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
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
 drivers/input/touchscreen/cy8ctma140.c | 352 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
 create mode 100644 drivers/input/touchscreen/cy8ctma140.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e7433d74530..39163de1a082 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4628,6 +4628,12 @@ T:	git git://linuxtv.org/anttip/media_tree.git
 S:	Maintained
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
index 000000000000..3413132ef4ed
--- /dev/null
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -0,0 +1,352 @@
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
+};
+
+static irqreturn_t cy8ctma140_irq_thread(int irq, void *d)
+{
+	struct cy8ctma140 *ts = d;
+	u8 msgbuf0[1];
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
+	u16 f1x, f1y, f1z;
+	u16 f2x, f2y, f2z;
+	int ret;
+	int slots[CY8CTMA140_MAX_FINGERS];
+	struct input_mt_pos pos[CY8CTMA140_MAX_FINGERS];
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
+	f1x = get_unaligned_be16(&buf[3]);
+	f1y = get_unaligned_be16(&buf[5]);
+	f1z = buf[7];
+
+	f2x = get_unaligned_be16(&buf[9]);
+	f2y = get_unaligned_be16(&buf[11]);
+	f2z = buf[13];
+
+	fingers = buf[2] & 0x0f;
+	if (fingers == 0) {
+		dev_dbg(ts->dev, "no fingers\n");
+		goto evt_out;
+	}
+
+	input_mt_assign_slots(ts->input, slots, pos, fingers, 0);
+
+	/*
+	 * When just handling two fingers this code is simple and we do not
+	 * need a loop increasing the complexity. If you need to modify
+	 * this driver for some firmware handling more than 2 fingers,
+	 * this is where you put in an array of coordinated and a loop
+	 * instead.
+	 */
+	if (fingers >= 1) {
+		touchscreen_set_mt_pos(&pos[0], &ts->props, f1x, f1y);
+		dev_dbg(ts->dev, "%d fingers: finger 1 ID: %02x (%d, %d, %d)\n",
+			fingers, buf[8] >> 4, pos[0].x, pos[0].y, f1z);
+		input_mt_slot(ts->input, slots[0]);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
+		input_report_abs(ts->input, ABS_MT_POSITION_X, pos[0].x);
+		input_report_abs(ts->input, ABS_MT_POSITION_Y, pos[0].y);
+		input_report_abs(ts->input, ABS_MT_PRESSURE, f1z);
+	}
+	if (fingers >= 2) {
+		touchscreen_set_mt_pos(&pos[1], &ts->props, f2x, f2y);
+		dev_dbg(ts->dev, "%d fingers: finger 2 ID %02x (%d, %d, %d)\n",
+			fingers, buf[8] & 0x0f, pos[1].x, pos[1].y, f2z);
+		input_mt_slot(ts->input, slots[1]);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
+		input_report_abs(ts->input, ABS_MT_POSITION_X, pos[1].x);
+		input_report_abs(ts->input, ABS_MT_POSITION_Y, pos[1].y);
+		input_report_abs(ts->input, ABS_MT_PRESSURE, f2z);
+	}
+	if (fingers > 2)
+		dev_err(ts->dev, "%d fingers - unsupported!\n", fingers);
+
+	input_mt_sync_frame(ts->input);
+	input_sync(ts->input);
+
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

