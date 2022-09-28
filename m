Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB9535EE89B
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 23:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbiI1VsV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 17:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbiI1VsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 17:48:19 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C922290C47;
        Wed, 28 Sep 2022 14:48:17 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-131c8ccae75so186734fac.3;
        Wed, 28 Sep 2022 14:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PnV6YKGsG6adF3AdYkpDBAAWZLViGYgex5i4MLsEDsc=;
        b=j4cODE6vCV2eLFxn9feY+DFys81bHpirmODO1zDJRolyU1YJOTddP3slYF0pkX9CQI
         9E4zaktNdSBisPeXB94d1LgezAFotEjDIV1myd7baSgwvXy9+a8bJkendibznRHivzfH
         NLhwxRh/IFz6nMTEPV0TzDg/rDb3c3tTfjR0ev5O2wHc1xR8NLXasROOtQ6t/DlOHxX1
         cS5r4SSNRt3EtH1GRALgx2QeubMMbSZhvBnFtF0T8pziAQl6wOdK/VhiFGUDNgaxoJcK
         eNOadRLkl2XIqDLTqqsbyDB6qU5IQv5hAgPmTM19Hqcj8pM4leNfuc+adgwOt1sKb/s6
         TvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PnV6YKGsG6adF3AdYkpDBAAWZLViGYgex5i4MLsEDsc=;
        b=YJ4FRGWBHBs5tzcqZs8MBCSLloLUEPpR2sMSNZ5A+iLca0fygIemd2uOR3qv3ssRkH
         /jSX6f5Q9MR1653O2CHWsgNO/8Pj6DlkweDuAYp/t5VtirwU7cjyjXKeA76ZBs414XLP
         cAnWBrgJpyFapa7HmRxTAqhJZDolwMX8trEjyX5j51PmPXjucSAjdIgDmPQPkSqoR8jg
         rzwmoYpIv9HPunSuQj553po+qRu7VqKclnT7uoLTiOQvHFqIMfPE01PaoIfDDJWkn2vc
         jVYzMBnAuoeN0rJQ1r4ibIYsOye706JDHbIQu9KNHZR4Zt8vwmUZWovUzR1LakTG15AO
         V1vg==
X-Gm-Message-State: ACrzQf0o9BM4pOgw5MdbqCkNqyD/yzpDuhH+cJFU3gBkW/x2p5XdBkAh
        7dss41uyYOP66E4/GdVPaJ0wEbzlFc4=
X-Google-Smtp-Source: AMsMyM5nWGLZ3uCswQCnSFSFHDUjV4m9a7GG5ky8wuz1OIdmCMHKEWGolvmm/zCGvpty9eXDLGXWBA==
X-Received: by 2002:a05:6870:524b:b0:131:a6c2:3bb1 with SMTP id o11-20020a056870524b00b00131a6c23bb1mr2796684oai.211.1664401696719;
        Wed, 28 Sep 2022 14:48:16 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id m18-20020a9d6452000000b00657a221eb71sm2623211otl.65.2022.09.28.14.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:48:16 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Date:   Wed, 28 Sep 2022 16:48:06 -0500
Message-Id: <20220928214806.13572-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928214806.13572-1-macroalpha82@gmail.com>
References: <20220928214806.13572-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Hynitron cst3xx controller found on devices such
as the Anbernic RG353P and RG353V (the Hynitron CST348). This driver
was built from sources provided by Hynitron to Anbernic (possibly
via Rockchip as an intermediary) and marked as GPLv2 in the code.
This driver was written strictly for the cst3xx series, but in
most places was left somewhat generic so support could be easily
added to other devices in the future.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/input/touchscreen/Kconfig           |  12 +
 drivers/input/touchscreen/Makefile          |   1 +
 drivers/input/touchscreen/hynitron_cstxxx.c | 483 ++++++++++++++++++++
 3 files changed, 496 insertions(+)
 create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 2d70c945b20a..9a9528e59c36 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -422,6 +422,18 @@ config TOUCHSCREEN_HYCON_HY46XX
 	  To compile this driver as a module, choose M here: the
 	  module will be called hycon-hy46xx.
 
+config TOUCHSCREEN_HYNITRON_CSTXXX
+	tristate "Hynitron touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have a touchscreen using a Hynitron
+	  touchscreen controller.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hynitron-cstxxx.
+
 config TOUCHSCREEN_ILI210X
 	tristate "Ilitek ILI210X based touchscreen"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 557f84fd2075..43860ca19b98 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
 obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
+obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
new file mode 100644
index 000000000000..e963968593c3
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron_cstxxx.c
@@ -0,0 +1,483 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Driver for Hynitron cstxxx Touchscreen
+ *
+ *  Copyright (c) 2022 Chris Morgan <macromorgan@hotmail.com>
+ *
+ *  This code is based on hynitron_core.c authored by Hynitron.
+ *  Note that no datasheet was available, so much of these registers
+ *  are undocumented. This is essentially a cleaned-up version of the
+ *  vendor driver with support removed for hardware I cannot test and
+ *  device-specific functions replated with generic functions wherever
+ *  possible.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+/* Per device data */
+struct hynitron_ts_platform_data {
+	unsigned int max_touch_num;
+	u32 ic_chkcode;
+	int (*firmware_info)(struct i2c_client *client);
+	int (*bootloader_enter)(struct i2c_client *client);
+	int (*init_input)(struct i2c_client *client);
+	void (*report_touch)(struct i2c_client *client);
+};
+
+/* Data generic to all (supported and non-supported) controllers. */
+struct hynitron_ts_data {
+	const struct hynitron_ts_platform_data *pdata;
+	struct i2c_client *client;
+	struct device *dev;
+	struct input_dev *input_dev;
+	struct touchscreen_properties prop;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *irq_gpio;
+	u32 fw_version;
+};
+
+/*
+ * Hard coded reset delay value of 20ms not IC dependent in
+ * vendor driver.
+ */
+void hyn_reset_proc(struct i2c_client *client, int delay)
+{
+	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
+
+	gpiod_set_value(ts_data->reset_gpio, 1);
+	mdelay(20);
+	gpiod_set_value(ts_data->reset_gpio, 0);
+	if (delay)
+		mdelay(delay);
+}
+
+static irqreturn_t hyn_interrupt_handler(int irq, void *dev_id)
+{
+	struct i2c_client *client = dev_id;
+	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
+
+	ts_data->pdata->report_touch(client);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * The vendor driver would retry twice before failing to read or write
+ * to the i2c device.
+ */
+int cst3xx_i2c_read(struct i2c_client *client,
+		    unsigned char *buf, int len)
+{
+	int ret;
+	int retries = 0;
+
+	while (retries < 2) {
+		ret = i2c_master_recv(client, buf, len);
+		if (ret <= 0)
+			retries++;
+		else
+			break;
+	}
+
+	return ret;
+}
+
+int cst3xx_i2c_write(struct i2c_client *client,
+		     unsigned char *buf, int len)
+{
+	int ret;
+	int retries = 0;
+
+	while (retries < 2) {
+		ret = i2c_master_send(client, buf, len);
+		if (ret <= 0)
+			retries++;
+		else
+			break;
+	}
+
+	return ret;
+}
+
+int cst3xx_i2c_read_register(struct i2c_client *client,
+			     unsigned char *buf, int len)
+{
+	int ret;
+
+	ret = cst3xx_i2c_write(client, buf, 2);
+	ret = cst3xx_i2c_read(client, buf, len);
+
+	return ret;
+}
+
+int cst3xx_firmware_info(struct i2c_client *client)
+{
+	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
+	int ret;
+	u32 tmp;
+	unsigned char buf[4];
+
+	/*
+	 * Testing suggests command is required to allow reading of
+	 * firmware registers.
+	 */
+	buf[0] = 0xd1;
+	buf[1] = 0x01;
+	ret = cst3xx_i2c_write(client, buf, 2);
+	if (ret < 0)
+		return -EIO;
+
+	mdelay(10);
+
+	/*
+	 * Read register for check-code to determine if device detected
+	 * correctly.
+	 */
+	buf[0] = 0xd1;
+	buf[1] = 0xfc;
+	ret = cst3xx_i2c_read_register(client, buf, 4);
+	if (ret < 0)
+		return -EIO;
+
+	memcpy(&tmp, buf, 4);
+	if ((le32_to_cpu(tmp) & 0xffff0000) != ts_data->pdata->ic_chkcode) {
+		dev_err(&client->dev, "%s ic mismatch\n", __func__);
+		return -ENODEV;
+	}
+
+	mdelay(10);
+
+	/* Read firmware version and test if firmware missing. */
+	buf[0] = 0xd2;
+	buf[1] = 0x08;
+	ret = cst3xx_i2c_read_register(client, buf, 4);
+	if (ret < 0)
+		return -EIO;
+
+	memcpy(&tmp, buf, 4);
+
+	ts_data->fw_version = le32_to_cpu(tmp);
+	if (ts_data->fw_version == 0xa5a5a5a5) {
+		dev_err(&client->dev, "Device firmware missing\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Testing suggests command required to exit register reading mode
+	 * and allow device to function as touchscreen.
+	 */
+	buf[0] = 0xd1;
+	buf[1] = 0x09;
+	ret = cst3xx_i2c_write(client, buf, 2);
+	if (ret < 0)
+		return -EIO;
+
+	mdelay(5);
+
+	return 0;
+}
+
+int cst3xx_bootloader_enter(struct i2c_client *client)
+{
+	int ret;
+	u8 retry;
+	unsigned char buf[4];
+
+	for (retry = 0; retry < 5; retry++) {
+		hyn_reset_proc(client, (7 + retry));
+		/* set cmd to enter program mode */
+		buf[0] = 0xa0;
+		buf[1] = 0x01;
+		buf[2] = 0xaa;
+		ret = cst3xx_i2c_write(client, buf, 3);
+		if (ret < 0)
+			continue;
+		mdelay(2);
+
+		/* check whether in program mode */
+		buf[0] = 0xa0;
+		buf[1] = 0x02;
+		ret = cst3xx_i2c_read_register(client, buf, 1);
+
+		if (ret < 0)
+			continue;
+
+		if (buf[0] == 0xac)
+			break;
+	}
+
+	if (buf[0] != 0xac) {
+		dev_err(&client->dev, "%s unable to enter bootloader mode\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	hyn_reset_proc(client, 40);
+
+	return 0;
+}
+
+static void cst3xx_touch_update(struct hynitron_ts_data *ts_data, s32 id,
+				s32 x, s32 y, s32 w)
+{
+	input_mt_slot(ts_data->input_dev, id);
+	input_mt_report_slot_state(ts_data->input_dev, MT_TOOL_FINGER, 1);
+	touchscreen_report_pos(ts_data->input_dev, &ts_data->prop, x, y, true);
+	input_report_abs(ts_data->input_dev, ABS_MT_TOUCH_MAJOR, w);
+}
+
+int cst3xx_finish_touch_read(struct i2c_client *client)
+{
+	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
+	unsigned char buf[3];
+	int ret;
+
+	buf[0] = 0xd0;
+	buf[1] = 0x00;
+	buf[2] = 0xab;
+	ret = cst3xx_i2c_write(ts_data->client, buf, 3);
+	if (ret < 0) {
+		dev_err(ts_data->dev, "send read touch info ending failed.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Handle events from IRQ. Note that for cst3xx it appears that IRQ
+ * fires continuously while touched, otherwise once every 1500ms
+ * when not touched (assume touchscreen waking up periodically).
+ */
+static void cst3xx_touch_report(struct i2c_client *client)
+{
+	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
+	unsigned char buf[30];
+	unsigned char finger_id, sw;
+	unsigned int input_x = 0;
+	unsigned int input_y = 0;
+	unsigned int input_w = 0;
+	int idx = 0;
+	int i, ret;
+	int touch_cnt, i2c_len;
+
+	buf[0] = 0xd0;
+	buf[1] = 0x00;
+
+	/* Read and validate the first bits of input data. */
+	ret = cst3xx_i2c_read_register(ts_data->client, buf, 7);
+	if ((ret < 0) || (buf[6] != 0xab) || (buf[0] == 0xab))
+		goto end;
+
+	touch_cnt = buf[5] & 0x7f;
+
+	/* If no touches registered, clear the input slots. */
+	if (touch_cnt == 0) {
+		input_mt_sync_frame(ts_data->input_dev);
+		input_sync(ts_data->input_dev);
+		return;
+	}
+
+	/*
+	 * If we have only one touch, we have enough data to process
+	 * the event. If we have more than one touch we need to read
+	 * the rest of the data. Note these functions are not combined
+	 * because this is how it was done in the vendor driver and I
+	 * lack the datasheet to modify the necessary values for
+	 * reading from all the registers at once.
+	 */
+	if (touch_cnt > 1) {
+		buf[5] = 0xd0;
+		buf[6] = 0x07;
+		i2c_len = (touch_cnt - 1) * 5 + 1;
+		ret = cst3xx_i2c_read_register(ts_data->client,
+					       &buf[5], i2c_len);
+		if (ret < 0)
+			goto end;
+		i2c_len += 5;
+
+		if (buf[i2c_len - 1] != 0xab)
+			goto end;
+	}
+
+	ret = cst3xx_finish_touch_read(client);
+	if (ret < 0) {
+		dev_err(ts_data->dev, "cst3xx touch read failure\n");
+		return;
+	}
+
+	for (i = 0; i < touch_cnt; i++) {
+		input_x = ((buf[idx + 1] << 4) | ((buf[idx + 3] >> 4) & 0x0f));
+		input_y = ((buf[idx + 2] << 4) | (buf[idx + 3] & 0x0f));
+		input_w = (buf[idx + 4] >> 3);
+		sw = (buf[idx] & 0x0f) >> 1;
+		finger_id = (buf[idx] >> 4) & 0x0f;
+
+		/* Sanity check we don't have more fingers than we expect */
+		if (ts_data->pdata->max_touch_num < finger_id) {
+			dev_err(ts_data->dev, "cst3xx touch read failure\n");
+			break;
+		}
+
+		/* sw value of 0 means no touch, 0x03 means touch */
+		if (sw == 0x03)
+			cst3xx_touch_update(ts_data, finger_id,
+					    input_x, input_y, input_w);
+
+		idx += 5;
+	}
+
+	input_mt_sync_frame(ts_data->input_dev);
+	input_sync(ts_data->input_dev);
+	return;
+end:
+	cst3xx_finish_touch_read(client);
+	dev_err(ts_data->dev, "cst3xx touch read failure\n");
+}
+
+int cst3xx_input_dev_int(struct i2c_client *client)
+{
+	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
+	int ret = 0;
+
+	ts_data->input_dev = devm_input_allocate_device(&ts_data->client->dev);
+	if (!ts_data->input_dev) {
+		dev_err(&ts_data->client->dev,
+			"Failed to allocate input device.\n");
+		return -ENOMEM;
+	}
+
+	ts_data->input_dev->name = "Hynitron cst3xx Touchscreen";
+	ts_data->input_dev->phys = "input/ts";
+	ts_data->input_dev->id.bustype = BUS_I2C;
+	ts_data->input_dev->dev.parent = ts_data->dev;
+
+	input_set_drvdata(ts_data->input_dev, ts_data);
+
+	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_Y);
+	input_set_abs_params(ts_data->input_dev, ABS_MT_TOUCH_MAJOR,
+			     0, 255, 0, 0);
+
+	touchscreen_parse_properties(ts_data->input_dev, true, &ts_data->prop);
+
+	if (!ts_data->prop.max_x || !ts_data->prop.max_y) {
+		dev_err(&ts_data->client->dev,
+			"Invalid x/y (%d, %d), using defaults\n",
+			ts_data->prop.max_x, ts_data->prop.max_y);
+		ts_data->prop.max_x = 1152;
+		ts_data->prop.max_y = 1920;
+		input_abs_set_max(ts_data->input_dev,
+				  ABS_MT_POSITION_X, ts_data->prop.max_x);
+		input_abs_set_max(ts_data->input_dev,
+				  ABS_MT_POSITION_Y, ts_data->prop.max_y);
+	}
+
+	input_mt_init_slots(ts_data->input_dev, ts_data->pdata->max_touch_num,
+			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+
+	ret = input_register_device(ts_data->input_dev);
+	if (ret < 0) {
+		dev_err(&ts_data->client->dev,
+			"Input device registration failed\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int hyn_probe(struct i2c_client *client)
+{
+	struct hynitron_ts_data *ts_data;
+	int ret;
+
+	ts_data = devm_kzalloc(&client->dev, sizeof(*ts_data), GFP_KERNEL);
+	if (!ts_data)
+		return -ENOMEM;
+
+	ts_data->client = client;
+	ts_data->dev = &client->dev;
+	i2c_set_clientdata(client, ts_data);
+
+	ts_data->reset_gpio = devm_gpiod_get(&client->dev,
+					     "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ts_data->reset_gpio)) {
+		ret = PTR_ERR(ts_data->reset_gpio);
+		dev_err(&client->dev, "request reset gpio failed: %d\n", ret);
+		return ret;
+	}
+
+	ts_data->pdata = of_device_get_match_data(&client->dev);
+	if (!ts_data->pdata)
+		return -EINVAL;
+
+	hyn_reset_proc(client, 60);
+
+	ret = ts_data->pdata->bootloader_enter(client);
+	if (ret < 0)
+		return ret;
+
+	ret = ts_data->pdata->init_input(client);
+	if (ret < 0)
+		return ret;
+
+	ret = ts_data->pdata->firmware_info(client);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					hyn_interrupt_handler,
+					IRQF_ONESHOT,
+					"Hynitron Touch Int", client);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to request IRQ\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct hynitron_ts_platform_data cst3xx_data = {
+	.max_touch_num		= 5,
+	.ic_chkcode		= 0xcaca0000,
+	.firmware_info		= &cst3xx_firmware_info,
+	.bootloader_enter	= &cst3xx_bootloader_enter,
+	.init_input		= &cst3xx_input_dev_int,
+	.report_touch		= &cst3xx_touch_report,
+};
+
+static const struct i2c_device_id hyn_tpd_id[] = {
+	{ .name = "hynitron_ts", 0 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i2c, hyn_tpd_id);
+
+static const struct of_device_id hyn_dt_match[] = {
+	{ .compatible = "hynitron,cst3xx", .data = &cst3xx_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, hyn_dt_match);
+
+static struct i2c_driver hynitron_i2c_driver = {
+	.driver = {
+		.name = "Hynitron-TS",
+		.of_match_table = of_match_ptr(hyn_dt_match),
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = hyn_tpd_id,
+	.probe_new = hyn_probe,
+};
+
+module_i2c_driver(hynitron_i2c_driver);
+
+MODULE_AUTHOR("Chris Morgan");
+MODULE_DESCRIPTION("Hynitron Touchscreen Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

