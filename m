Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D47E4C1835
	for <lists+linux-input@lfdr.de>; Wed, 23 Feb 2022 17:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242649AbiBWQJk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Feb 2022 11:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242041AbiBWQJi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Feb 2022 11:09:38 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E385C2E71;
        Wed, 23 Feb 2022 08:09:08 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id w3so44991373edu.8;
        Wed, 23 Feb 2022 08:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s31hezoSs/EJQHNO2S6IMunkqEYsavDy6vdEqKs71Rk=;
        b=iPRKypyDRH9Gpi+H5acOjK7qUX9ytRmbXc9Lk1Qo+cI8b81tvtDhCrK8ot8xWJJt3X
         3deEH2UoVGuQiddDQZCOuvt7tg+iRDFRHCY7dnbbjl5Hb46BGtpYtlke1ukZ4Yi6sjv7
         zsYprsKSbiIUqarM0KSVIGinKlZs/a/eC7/QfoG+4QuG24pAyOC0vHNDUu8ZzhIqrGM4
         bIk0P+sgNh2JRuAjL9XbtET0FIbC06ig+TICsoXNs3/BiQ745Uoed9uDx9z4TBKEtQeu
         rePaJPys7CwUb8LqC5/jpk4tgYoa3VMILX3eyPjudRcNivOltihhj2Gjei8VXJYtzN8Y
         X2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s31hezoSs/EJQHNO2S6IMunkqEYsavDy6vdEqKs71Rk=;
        b=V5QRvsd75IA9m9nJGJY3X+toN5xDk5HmRYIrK0D0U/HEvz+1byPIIwtxNqKy21F7iA
         MF9CyXM9OnGgBNL8m70YfTVbH82xE97EQTRTwPCB4ZEqvJqGO0Q5a6Sv8DY08+5XbQ/w
         knDdxoBOooyIJh52Oc+wfv6RMzVF5WFSrjQq0v/njFaDUGrfHQ6b4PX45tq3i8Rn6fFM
         TyokT+2uqTkHsu/Nh+DdObBL9V5d1T/LeVSxid5jWPHN62gm/IP5vMeaLfwTZ1c+aDMf
         HrPxBP/X5nmkceRjqvLDvMGPPocqyc+y6T/IPqwCXkvhSxpSKxqI4FXob8n3mH1INCXu
         eg2Q==
X-Gm-Message-State: AOAM532+GVxb8ZKxRSXVr7M9f2CzQVbjlx1aI+0AGd6OAL3auSUdlkef
        ZI6IbP4K8u9cT/hzm3tbEH5rnuK2Ub4qgiNd
X-Google-Smtp-Source: ABdhPJwsv/cviJV41BqNu7lHrinkImiUsBofzwcmbmTvnU9161L3KCz84EqZ3bGTRyZKBMVOZMfTDg==
X-Received: by 2002:aa7:d7c8:0:b0:3f9:3b65:f2b3 with SMTP id e8-20020aa7d7c8000000b003f93b65f2b3mr86829eds.389.1645632546395;
        Wed, 23 Feb 2022 08:09:06 -0800 (PST)
Received: from nergzd-desktop.localdomain ([62.122.67.26])
        by smtp.gmail.com with ESMTPSA id x7sm52005edr.12.2022.02.23.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 08:09:06 -0800 (PST)
From:   Markuss Broks <markuss.broks@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Markuss Broks <markuss.broks@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 2/2] Input: add Imagis touchscreen driver
Date:   Wed, 23 Feb 2022 18:07:41 +0200
Message-Id: <20220223160749.37001-3-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223160749.37001-1-markuss.broks@gmail.com>
References: <20220223160749.37001-1-markuss.broks@gmail.com>
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
 drivers/input/touchscreen/imagis.c | 348 +++++++++++++++++++++++++++++
 4 files changed, 365 insertions(+)
 create mode 100644 drivers/input/touchscreen/imagis.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a899828a8d4e..3b99c60e9f4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9411,6 +9411,12 @@ M:	Stanislaw Gruszka <stf_xl@wp.pl>
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
index 000000000000..5117d8674d82
--- /dev/null
+++ b/drivers/input/touchscreen/imagis.c
@@ -0,0 +1,348 @@
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
+static int imagis_power_off(struct imagis_ts *ts)
+{
+	int error;
+
+	error = regulator_bulk_disable(ARRAY_SIZE(ts->supplies),
+				       ts->supplies);
+	if (error)
+		dev_err(&ts->client->dev,
+			"Failed to disable regulators: %d\n", error);
+	return error;
+}
+
+static int imagis_power_on(struct imagis_ts *ts)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(ts->supplies),
+				      ts->supplies);
+	if (error)
+		dev_err(&ts->client->dev,
+			"Failed to enable regulators: %d\n", error);
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
+	return imagis_power_off(ts);
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
+	if (error) {
+		dev_err(&ts->client->dev,
+			"Failed to register input device: %d", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int imagis_init_regulators(struct imagis_ts *ts)
+{
+	struct i2c_client *client = ts->client;
+	int error = 0;
+
+	ts->supplies[0].supply = "vdd";
+	ts->supplies[1].supply = "vddio";
+	error = devm_regulator_bulk_get(&client->dev,
+					ARRAY_SIZE(ts->supplies),
+					ts->supplies);
+
+	return error;
+}
+
+static int imagis_probe(struct i2c_client *i2c)
+{
+	struct device *dev;
+	struct imagis_ts *ts;
+	int chip_id, ret, error;
+
+	dev = &i2c->dev;
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
+	error = imagis_power_on(ts);
+	if (error)
+		return dev_err_probe(dev, error, "failed to enable regulators: %d\n", error);
+
+	msleep(IST3038C_CHIP_ON_DELAY_MS);
+
+	ret = imagis_i2c_read_reg(ts, IST3038C_REG_CHIPID | IST3038C_DIRECT_ACCESS, &chip_id);
+	if (ret) {
+		imagis_power_off(ts);
+		return dev_err_probe(dev, error, "chip ID read failure: %d\n", ret);
+	}
+
+	if (chip_id != IST3038C_WHOAMI) {
+		imagis_power_off(ts);
+		return dev_err_probe(dev, -EINVAL, "unknown chip ID: 0x%x\n", chip_id);
+	}
+
+	error = devm_request_threaded_irq(dev, i2c->irq,
+					  NULL, imagis_interrupt,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  "imagis-touchscreen", ts);
+	if (error) {
+		imagis_power_off(ts);
+		return dev_err_probe(dev, error, "IRQ allocation failure: %d\n", error);
+	}
+
+	error = imagis_init_input_dev(ts);
+	if (error) {
+		imagis_power_off(ts);
+		return dev_err_probe(dev, error, "input subsystem init error: %d\n", error);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused imagis_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct imagis_ts *ts = i2c_get_clientdata(client);
+	int ret = 0;
+
+	mutex_lock(&ts->input_dev->mutex);
+
+	if (input_device_enabled(ts->input_dev))
+		ret = imagis_stop(ts);
+
+	mutex_unlock(&ts->input_dev->mutex);
+
+	return ret;
+}
+
+static int __maybe_unused imagis_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct imagis_ts *ts = i2c_get_clientdata(client);
+	int ret = 0;
+
+	mutex_lock(&ts->input_dev->mutex);
+
+	if (input_device_enabled(ts->input_dev))
+		ret = imagis_start(ts);
+
+	mutex_unlock(&ts->input_dev->mutex);
+
+	return ret;
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
2.35.0

