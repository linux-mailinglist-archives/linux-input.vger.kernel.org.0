Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B01532A592
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447158AbhCBMu7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379998AbhCBKYn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:24:43 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E01DC061797;
        Tue,  2 Mar 2021 02:22:08 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id e2so16059180ljo.7;
        Tue, 02 Mar 2021 02:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4J6EjSuefLNlwS0ypISOC/mzldjx8zJnTcq60uLqUsg=;
        b=JVVsQOC48Ok2XChynYCkw4o8UfJ/XjGVY5YTYaANQSHra+TjLkNlliPyRdKNXGaDpd
         mSIin2dTNXgnuTXLiwcWa9D/cqqx0lkLlD5ZgFDpMvObLb9UJuSKRQMWHXOehpQ9zZPX
         zeBSlfjAG5iSgyCy5Eet5wOC4MN60Rb12k3yoojwUFsk4ZHltulw3TEnnL2Lw44qZxa+
         x3v4sZjwkSLQe1E4Yy3ra54naaqCSJbMEFtMdrH36n/nvozGIshq2I1DoehVCG/1G67o
         MbHItHE5RVb04SszjwHykCXU/hoGYqWzoVgvecFp20fBGij4AoIIv9JgT3Hbbmafu2l9
         DlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4J6EjSuefLNlwS0ypISOC/mzldjx8zJnTcq60uLqUsg=;
        b=LNN5Vo8PGKlKgAWF4ntMzJ174YnJUpS1sv8YweQqiL57FtwRgyrP9Swn95QLLRC5mv
         7vonZQf9eA2Bp0Va1TnE7iajD6AnLvt6GMqhP/fA4bW2ia5N+fnfGY8+z6D61ugDxsvt
         +mZVGFrxXiQZJisXFhS7Ub/PlmHhdMsh1YEWNLZOQsCR1PglTUr5SkkHSBaQXsrPCT4j
         JyUruQvQgiujq/+KUjKrCW1ZbUI2p7lxUKcNKYJ3Xc+r0ZVJdyYAYFlVM6FolN8eDEIZ
         Lnml/o8YC3oJaP8ENrj3EXwsowkXtN8nrvwDxEgse95tnTZHqTxDdWD5xwG9YRnpPXYM
         nulg==
X-Gm-Message-State: AOAM533/M6BJgaVPSUm22agcQbGOXXFX0cXVTPNaiK9rYby3Fa37+g3V
        aXMM8tkH6SYMlXGN7pXsqxU=
X-Google-Smtp-Source: ABdhPJyXDRoT64bllqqEE0boG4Uwo1agjyjf0DFOPpzGZSqAodcuWIdgJsZtYKsYOksCqlnc/Z6zvw==
X-Received: by 2002:a2e:910d:: with SMTP id m13mr11690755ljg.189.1614680525507;
        Tue, 02 Mar 2021 02:22:05 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id n2sm2586369lfu.274.2021.03.02.02.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:22:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] Input: atmel_mxt_ts - support wakeup methods
Date:   Tue,  2 Mar 2021 13:21:57 +0300
Message-Id: <20210302102158.10533-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302102158.10533-1-digetx@gmail.com>
References: <20210302102158.10533-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to datasheets, chips like mXT1386 have a WAKE line, it is used
to wake the chip up from deep sleep mode before communicating with it via
the I2C-compatible interface.

If the WAKE line is connected to a GPIO line, the line must be asserted
25 ms before the host attempts to communicate with the controller. If the
WAKE line is connected to the SCL pin, the controller will send a NACK on
the first attempt to address it, the host must then retry 25 ms later.

Implement the wake-up methods in the driver. Touchscreen now works
properly on devices like Acer A500 tablet, fixing problems like this:

 atmel_mxt_ts 0-004c: __mxt_read_reg: i2c transfer failed (-121)
 atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
 atmel_mxt_ts 0-004c: Trying alternate bootloader address
 atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
 atmel_mxt_ts: probe of 0-004c failed with error -121

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 78 ++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 383a848eb601..5ed23689047b 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -31,6 +31,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-vmalloc.h>
+#include <dt-bindings/input/atmel-maxtouch.h>
 
 /* Firmware files */
 #define MXT_FW_NAME		"maxtouch.fw"
@@ -199,6 +200,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME		25	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -312,6 +314,7 @@ struct mxt_data {
 	struct mxt_dbg dbg;
 	struct regulator_bulk_data regulators[2];
 	struct gpio_desc *reset_gpio;
+	struct gpio_desc *wake_gpio;
 	bool use_retrigen_workaround;
 
 	/* Cached parameters from object table */
@@ -342,6 +345,8 @@ struct mxt_data {
 	unsigned int t19_num_keys;
 
 	enum mxt_suspend_mode suspend_mode;
+
+	u32 wakeup_method;
 };
 
 struct mxt_vb2_buffer {
@@ -621,10 +626,42 @@ static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
 	return mxt_bootloader_write(data, buf, sizeof(buf));
 }
 
+static bool mxt_wakeup_toggle(struct i2c_client *client,
+			      bool wake_up, bool in_i2c)
+{
+	struct mxt_data *data = i2c_get_clientdata(client);
+
+	switch (data->wakeup_method) {
+	case ATMEL_MXT_WAKEUP_I2C_SCL:
+		if (!in_i2c)
+			return false;
+		break;
+
+	case ATMEL_MXT_WAKEUP_GPIO:
+		if (in_i2c)
+			return false;
+
+		gpiod_set_value(data->wake_gpio, wake_up);
+		break;
+
+	default:
+		return false;
+	}
+
+	if (wake_up) {
+		dev_dbg(&client->dev, "waking up controller\n");
+
+		msleep(MXT_WAKEUP_TIME);
+	}
+
+	return true;
+}
+
 static int __mxt_read_reg(struct i2c_client *client,
 			       u16 reg, u16 len, void *val)
 {
 	struct i2c_msg xfer[2];
+	bool retried = false;
 	u8 buf[2];
 	int ret;
 
@@ -643,9 +680,13 @@ static int __mxt_read_reg(struct i2c_client *client,
 	xfer[1].len = len;
 	xfer[1].buf = val;
 
+retry:
 	ret = i2c_transfer(client->adapter, xfer, 2);
 	if (ret == 2) {
 		ret = 0;
+	} else if (!retried && mxt_wakeup_toggle(client, true, true)) {
+		retried = true;
+		goto retry;
 	} else {
 		if (ret >= 0)
 			ret = -EIO;
@@ -659,6 +700,7 @@ static int __mxt_read_reg(struct i2c_client *client,
 static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 			   const void *val)
 {
+	bool retried = false;
 	u8 *buf;
 	size_t count;
 	int ret;
@@ -672,9 +714,13 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 	buf[1] = (reg >> 8) & 0xff;
 	memcpy(&buf[2], val, len);
 
+retry:
 	ret = i2c_master_send(client, buf, count);
 	if (ret == count) {
 		ret = 0;
+	} else if (!retried && mxt_wakeup_toggle(client, true, true)) {
+		retried = true;
+		goto retry;
 	} else {
 		if (ret >= 0)
 			ret = -EIO;
@@ -2975,6 +3021,8 @@ static const struct attribute_group mxt_attr_group = {
 
 static void mxt_start(struct mxt_data *data)
 {
+	mxt_wakeup_toggle(data->client, true, false);
+
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
 		mxt_soft_reset(data);
@@ -3009,6 +3057,8 @@ static void mxt_stop(struct mxt_data *data)
 		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
 		break;
 	}
+
+	mxt_wakeup_toggle(data->client, false, false);
 }
 
 static int mxt_input_open(struct input_dev *dev)
@@ -3155,6 +3205,15 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
+	/* Request the WAKE line as asserted so we go out of sleep */
+	data->wake_gpio = devm_gpiod_get_optional(&client->dev,
+						  "wake", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->wake_gpio)) {
+		error = PTR_ERR(data->wake_gpio);
+		dev_err(&client->dev, "Failed to get wake gpio: %d\n", error);
+		return error;
+	}
+
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, mxt_interrupt, IRQF_ONESHOT,
 					  client->name, data);
@@ -3185,6 +3244,25 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
+	/*
+	 * Controllers like mXT1386 have a dedicated WAKE line that could be
+	 * connected to a GPIO or to I2C SCL pin, or permanently asserted low.
+	 *
+	 * This WAKE line is used for waking controller from a deep-sleep and
+	 * it needs to be asserted low for 25 milliseconds before I2C transfers
+	 * could be accepted by controller if it was in a deep-sleep mode.
+	 * Controller will go into sleep automatically after 2 seconds of
+	 * inactivity if WAKE line is deasserted and deep sleep is activated.
+	 *
+	 * If WAKE line is connected to I2C SCL pin, then the first I2C transfer
+	 * will get an instant NAK and transfer needs to be retried after 25ms.
+	 *
+	 * If WAKE line is connected to a GPIO line, the line must be asserted
+	 * 25ms before the host attempts to communicate with the controller.
+	 */
+	device_property_read_u32(&client->dev, "atmel,wakeup-method",
+				 &data->wakeup_method);
+
 	error = mxt_initialize(data);
 	if (error)
 		goto err_disable_regulators;
-- 
2.29.2

