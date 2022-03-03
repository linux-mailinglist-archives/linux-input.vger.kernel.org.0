Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F5E4CC2DB
	for <lists+linux-input@lfdr.de>; Thu,  3 Mar 2022 17:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbiCCQcf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Mar 2022 11:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbiCCQcf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Mar 2022 11:32:35 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500F219D60A;
        Thu,  3 Mar 2022 08:31:48 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m14so9464928lfu.4;
        Thu, 03 Mar 2022 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6NXEC0U+YwTxJJ44NZD07H1gd6g2MgdnlprSP413fiM=;
        b=PcX6xbSlEyJJ0RCo3p+/z8PKc0xpLhtZ4n+KQLH9NCOBVkqz/yRT79l9LaIFIPQJAb
         H6i5D3SRkf52jygwti9aUHW+tPBwqISQcB9oE/s/jslAXpk3BIH2oLBOj6PKv0YX7qE0
         j4Uy1qinrOX2dvVWDIEXsID0DvSA7iqIZ6VCuGWUhRmHO8ougTVgxR7frSN02VFR31+R
         Qfr/HGpe/W0zpiqoybx8A+YjcsSIz5WClzhf4EFWLA+2cNrFUkNm6U1A4weSiOgalLYV
         sdTJl1T9L40XD0dN2NWHoZINr3DiQZjzrpUM7jDRhdrISXiP2IaOuLRYAGpWANKy9Wqk
         owoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NXEC0U+YwTxJJ44NZD07H1gd6g2MgdnlprSP413fiM=;
        b=1ISKZRpZYA2M4HoQ+WfBuhkiU/3zoIXwLWOgDNRMl+qoNBzrFDlWiOr+DlHjfc9XM0
         /4Ricb6bPSmZCk02K8gOFQ6AiZfmFTAMuA/BLzubPp/2rEoqtDwBLNkQVnrfJcyUk6tp
         L8mG/VDVWCe2lagQNKhuvOZrvW7WBN011GKY8ozIm17GNcw7gntY+wcjcE19GKL/eNLm
         4SVDNl+1s1KRW7baHH7rAOhZ8qvd9DyJA04xI4gkGhj2RxUoe7FIdgWnVnxVu6nkNx3H
         rWPHyE27VUqvOe/m0ZVMN0Plo59Qr0RyTdh2Ru9QJRTuR6JWqN+FUEyM7e0hlvgZY+PS
         cWgA==
X-Gm-Message-State: AOAM530KijvZ4L5fjqghoBnOpBgp4OIX31eCJSx33P/ggjH+0XB5DGev
        BGwrSvLyzZPXXEbzZ9S0kkJZCcWV78M9fx4Y
X-Google-Smtp-Source: ABdhPJwK4aUU/MKuCRzrKazZgpIIj81dU6+8xKswc3eYqmh2b2XZ+9wEGstyp14YBZ2it8VnVwKczg==
X-Received: by 2002:a05:6512:e8a:b0:443:7225:247a with SMTP id bi10-20020a0565120e8a00b004437225247amr22559019lfb.680.1646325104487;
        Thu, 03 Mar 2022 08:31:44 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id g18-20020a19ee12000000b00443af3721f2sm510678lfb.237.2022.03.03.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 08:31:44 -0800 (PST)
From:   Markuss Broks <markuss.broks@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        jeff@labundy.com, markuss.broks@gmail.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com, rydberg@bitmath.com,
        sfr@canb.auug.org.au, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v9 2/2] Input: add Imagis touchscreen driver
Date:   Thu,  3 Mar 2022 18:31:33 +0200
Message-Id: <20220303163133.1418-3-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220303163133.1418-1-markuss.broks@gmail.com>
References: <20220303163133.1418-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the IST3038C touchscreen IC from Imagis, based on
downstream driver. The driver supports multi-touch (10 touch points)
The IST3038C IC supports touch keys, but the support isn't added
because the touch screen used for testing doesn't utilize touch keys.
Looking at the downstream driver, it is possible to add support
for other Imagis ICs of IST30**C series.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 MAINTAINERS                        |   6 +
 drivers/input/touchscreen/Kconfig  |  10 +
 drivers/input/touchscreen/Makefile |   1 +
 drivers/input/touchscreen/imagis.c | 331 +++++++++++++++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 drivers/input/touchscreen/imagis.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d7ea92ce1b1d..feab0c765d4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9509,6 +9509,12 @@ M:	Stanislaw Gruszka <stf_xl@wp.pl>
 S:	Maintained
 F:	drivers/usb/atm/ueagle-atm.c
 
+IMAGIS TOUCHSCREEN DRIVER
+M:	Markuss Broks <markuss.broks@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
+F:	drivers/input/touchscreen/imagis.c
+
 IMGTEC ASCII LCD DRIVER
 M:	Paul Burton <paulburton@kernel.org>
 S:	Maintained
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 2f6adfb7b938..f1414f0ad7af 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -638,6 +638,16 @@ config TOUCHSCREEN_MTOUCH
 	  To compile this driver as a module, choose M here: the
 	  module will be called mtouch.
 
+config TOUCHSCREEN_IMAGIS
+	tristate "Imagis touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have an Imagis IST30xxC touchscreen.
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imagis.
+
 config TOUCHSCREEN_IMX6UL_TSC
 	tristate "Freescale i.MX6UL touchscreen controller"
 	depends on ((OF && GPIOLIB) || COMPILE_TEST) && HAS_IOMEM
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 39a8127cf6a5..557f84fd2075 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
+obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
 obj-$(CONFIG_TOUCHSCREEN_IMX6UL_TSC)	+= imx6ul_tsc.o
 obj-$(CONFIG_TOUCHSCREEN_INEXIO)	+= inexio.o
 obj-$(CONFIG_TOUCHSCREEN_IPROC)		+= bcm_iproc_tsc.o
diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen/imagis.c
new file mode 100644
index 000000000000..5776bd5c0422
--- /dev/null
+++ b/drivers/input/touchscreen/imagis.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#define IST3038C_HIB_ACCESS		(0x800B << 16)
+#define IST3038C_DIRECT_ACCESS		BIT(31)
+#define IST3038C_REG_CHIPID		0x40001000
+#define IST3038C_REG_HIB_BASE		0x30000100
+#define IST3038C_REG_TOUCH_STATUS		(IST3038C_REG_HIB_BASE | IST3038C_HIB_ACCESS)
+#define IST3038C_REG_TOUCH_COORD		(IST3038C_REG_HIB_BASE | IST3038C_HIB_ACCESS | 0x8)
+#define IST3038C_REG_INTR_MESSAGE		(IST3038C_REG_HIB_BASE | IST3038C_HIB_ACCESS | 0x4)
+#define IST3038C_WHOAMI			0x38c
+#define IST3038C_CHIP_ON_DELAY_MS		60
+#define IST3038C_I2C_RETRY_COUNT		3
+#define IST3038C_MAX_SUPPORTED_FINGER_NUM		10
+#define IST3038C_X_MASK		GENMASK(23, 12)
+#define IST3038C_X_SHIFT		12
+#define IST3038C_Y_MASK		GENMASK(11, 0)
+#define IST3038C_AREA_MASK		GENMASK(27, 24)
+#define IST3038C_AREA_SHIFT		24
+#define IST3038C_FINGER_COUNT_MASK		GENMASK(15, 12)
+#define IST3038C_FINGER_COUNT_SHIFT		12
+#define IST3038C_FINGER_STATUS_MASK		GENMASK(9, 0)
+
+struct imagis_ts {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	struct touchscreen_properties prop;
+	struct regulator_bulk_data supplies[2];
+};
+
+static int imagis_i2c_read_reg(struct imagis_ts *ts,
+			       unsigned int reg, unsigned int *buffer)
+{
+	__be32 ret_be;
+	__be32 reg_be = cpu_to_be32(reg);
+	struct i2c_msg msg[] = {
+		{
+			.addr = ts->client->addr,
+			.flags = 0,
+			.buf = (unsigned char *)&reg_be,
+			.len = sizeof(reg_be),
+		}, {
+			.addr = ts->client->addr,
+			.flags = I2C_M_RD,
+			.buf = (unsigned char *)&ret_be,
+			.len = sizeof(ret_be),
+		},
+	};
+	int ret, error;
+	int retry = IST3038C_I2C_RETRY_COUNT;
+
+	/* Retry in case the controller fails to respond */
+	do {
+		ret = i2c_transfer(ts->client->adapter, msg, ARRAY_SIZE(msg));
+		if (ret == ARRAY_SIZE(msg)) {
+			*buffer = be32_to_cpu(ret_be);
+			return 0;
+		}
+
+		error = ret < 0 ? ret : -EIO;
+		dev_err(&ts->client->dev,
+			"%s - i2c_transfer failed: %d (%d)\n",
+			__func__, error, ret);
+	} while (--retry);
+
+	return error;
+}
+
+static irqreturn_t imagis_interrupt(int irq, void *dev_id)
+{
+	struct imagis_ts *ts = dev_id;
+	unsigned int finger_status, intr_message;
+	int error, i, finger_count, finger_pressed;
+
+	error = imagis_i2c_read_reg(ts, IST3038C_REG_INTR_MESSAGE, &intr_message);
+	if (error) {
+		dev_err(&ts->client->dev, "failed to read the interrupt message\n");
+		return IRQ_HANDLED;
+	}
+
+	finger_count = (intr_message & IST3038C_FINGER_COUNT_MASK) >> IST3038C_FINGER_COUNT_SHIFT;
+	finger_pressed = intr_message & IST3038C_FINGER_STATUS_MASK;
+	if (finger_count > IST3038C_MAX_SUPPORTED_FINGER_NUM) {
+		dev_err(&ts->client->dev, "finger count is more than maximum supported\n");
+		return IRQ_HANDLED;
+	}
+
+	for (i = 0; i < finger_count; i++) {
+		error = imagis_i2c_read_reg(ts, IST3038C_REG_TOUCH_COORD + (i * 4), &finger_status);
+		if (error) {
+			dev_err(&ts->client->dev, "failed to read coordinates for finger %d\n", i);
+			return IRQ_HANDLED;
+		}
+		input_mt_slot(ts->input_dev, i);
+		input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER,
+					   finger_pressed & BIT(i));
+		touchscreen_report_pos(ts->input_dev, &ts->prop,
+				       (finger_status & IST3038C_X_MASK) >> IST3038C_X_SHIFT,
+				       finger_status & IST3038C_Y_MASK, 1);
+		input_report_abs(ts->input_dev, ABS_MT_TOUCH_MAJOR,
+				 (finger_status & IST3038C_AREA_MASK) >> IST3038C_AREA_SHIFT);
+	}
+	input_mt_sync_frame(ts->input_dev);
+	input_sync(ts->input_dev);
+
+	return IRQ_HANDLED;
+}
+
+static void imagis_power_off(void *_ts)
+{
+	struct imagis_ts *ts = _ts;
+
+	regulator_bulk_disable(ARRAY_SIZE(ts->supplies), ts->supplies);
+}
+
+static int imagis_power_on(struct imagis_ts *ts)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(ts->supplies), ts->supplies);
+	msleep(IST3038C_CHIP_ON_DELAY_MS);
+
+	return error;
+}
+
+static int imagis_start(struct imagis_ts *ts)
+{
+	int error;
+
+	error = imagis_power_on(ts);
+	if (error)
+		return error;
+
+	msleep(IST3038C_CHIP_ON_DELAY_MS);
+
+	enable_irq(ts->client->irq);
+	return error;
+}
+
+static int imagis_stop(struct imagis_ts *ts)
+{
+	disable_irq(ts->client->irq);
+
+	imagis_power_off(ts);
+
+	return 0;
+}
+
+static int imagis_input_open(struct input_dev *dev)
+{
+	struct imagis_ts *ts = input_get_drvdata(dev);
+
+	return imagis_start(ts);
+}
+
+static void imagis_input_close(struct input_dev *dev)
+{
+	struct imagis_ts *ts = input_get_drvdata(dev);
+
+	imagis_stop(ts);
+}
+
+static int imagis_init_input_dev(struct imagis_ts *ts)
+{
+	struct input_dev *input_dev;
+	int error;
+
+	input_dev = devm_input_allocate_device(&ts->client->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	ts->input_dev = input_dev;
+
+	input_dev->name = "Imagis capacitive touchscreen";
+	input_dev->phys = "input/ts";
+	input_dev->id.bustype = BUS_I2C;
+	input_dev->open = imagis_input_open;
+	input_dev->close = imagis_input_close;
+
+	input_set_drvdata(input_dev, ts);
+
+	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
+	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(input_dev, true, &ts->prop);
+	if (!ts->prop.max_x || !ts->prop.max_y) {
+		dev_err(&ts->client->dev,
+			"Touchscreen-size-x and/or touchscreen-size-y not set in dts\n");
+		return -EINVAL;
+	}
+
+	error = input_mt_init_slots(input_dev, IST3038C_MAX_SUPPORTED_FINGER_NUM,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(&ts->client->dev,
+			"Failed to initialize MT slots: %d", error);
+		return error;
+	}
+
+	error = input_register_device(input_dev);
+	if (error)
+		dev_err(&ts->client->dev,
+			"Failed to register input device: %d", error);
+
+	return error;
+}
+
+static int imagis_init_regulators(struct imagis_ts *ts)
+{
+	struct i2c_client *client = ts->client;
+
+	ts->supplies[0].supply = "vdd";
+	ts->supplies[1].supply = "vddio";
+	return devm_regulator_bulk_get(&client->dev,
+				       ARRAY_SIZE(ts->supplies),
+				       ts->supplies);
+
+}
+
+static int imagis_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct imagis_ts *ts;
+	int chip_id, error;
+
+	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	ts->client = i2c;
+
+	error = imagis_init_regulators(ts);
+	if (error)
+		return dev_err_probe(dev, error, "regulator init error: %d\n", error);
+
+	error = devm_add_action_or_reset(dev, imagis_power_off, ts);
+	if (error)
+		return dev_err_probe(dev, error, "failed to install poweroff action: %d\n", error);
+
+	error = imagis_power_on(ts);
+	if (error)
+		return dev_err_probe(dev, error, "failed to enable regulators: %d\n", error);
+
+	error = imagis_i2c_read_reg(ts, IST3038C_REG_CHIPID | IST3038C_DIRECT_ACCESS, &chip_id);
+	if (error)
+		return dev_err_probe(dev, error, "chip ID read failure: %d\n", error);
+
+	if (chip_id != IST3038C_WHOAMI)
+		return dev_err_probe(dev, -EINVAL, "unknown chip ID: 0x%x\n", chip_id);
+
+	error = devm_request_threaded_irq(dev, i2c->irq,
+					  NULL, imagis_interrupt,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  "imagis-touchscreen", ts);
+	if (error)
+		return dev_err_probe(dev, error, "IRQ allocation failure: %d\n", error);
+
+	error = imagis_init_input_dev(ts);
+	if (error)
+		return dev_err_probe(dev, error, "input subsystem init error: %d\n", error);
+
+	return 0;
+}
+
+static int __maybe_unused imagis_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct imagis_ts *ts = i2c_get_clientdata(client);
+	int error = 0;
+
+	mutex_lock(&ts->input_dev->mutex);
+
+	if (input_device_enabled(ts->input_dev))
+		error = imagis_stop(ts);
+
+	mutex_unlock(&ts->input_dev->mutex);
+
+	return error;
+}
+
+static int __maybe_unused imagis_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct imagis_ts *ts = i2c_get_clientdata(client);
+	int error = 0;
+
+	mutex_lock(&ts->input_dev->mutex);
+
+	if (input_device_enabled(ts->input_dev))
+		error = imagis_start(ts);
+
+	mutex_unlock(&ts->input_dev->mutex);
+
+	return error;
+}
+
+static SIMPLE_DEV_PM_OPS(imagis_pm_ops, imagis_suspend, imagis_resume);
+
+#ifdef CONFIG_OF
+static const struct of_device_id imagis_of_match[] = {
+	{ .compatible = "imagis,ist3038c", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, imagis_of_match);
+#endif
+
+static struct i2c_driver imagis_ts_driver = {
+	.driver = {
+		.name = "imagis-touchscreen",
+		.pm = &imagis_pm_ops,
+		.of_match_table = of_match_ptr(imagis_of_match),
+	},
+	.probe_new = imagis_probe,
+};
+
+module_i2c_driver(imagis_ts_driver);
+
+MODULE_DESCRIPTION("Imagis IST3038C Touchscreen Driver");
+MODULE_AUTHOR("Markuss Broks <markuss.broks@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.20.1

