Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA728300F77
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 22:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbhAVV6N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 16:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730922AbhAVUId (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 15:08:33 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C3FC061786;
        Fri, 22 Jan 2021 12:07:52 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 3so7951400ljc.4;
        Fri, 22 Jan 2021 12:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TUaRvOEi60+ahDPC5dNjnTAB3VCzFhob4s0bHzIKzHo=;
        b=UwVVvouUG50Vz6ATGPnsgqdzGSzdXv9VsXob8FH39XMmOU8zoHl607wNWjWvndxJgE
         vffAMvrMI3wPlHGCz8KtV/5v3mr47JOxVdH6H+Nwq29Th1d/WIj45OgcE6sVHIMAfSll
         j2WYb+4bzHi9bMxKruYI69x3SrRu/ns8GJ/SduRP5AfuDJSfeV9SODT1bsW0MAUMBG5q
         l6zzorJUa/vU2jldyaOuhppBsZ93hQRVgIl229s37i4zOBmqjxA0rNV3jszy8U05Wvx0
         1ron6QYAu7RLn12lsidgA6AuhWOt6Y3EwGlR/hnNR/bzPbwtfTrSOKHHOYEeRdx8wst1
         W2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TUaRvOEi60+ahDPC5dNjnTAB3VCzFhob4s0bHzIKzHo=;
        b=SIoP2pvDDfm7zirU/9QA/hMCYnanOo481nZM1I3ntuItKksZWvIg8cBjK1+zsvGwaj
         jhqrHcRVoirM4r6zHrDim61o4wc5BKlvk2yBP5vFmVQK5gp5ydtJTjokvKTv1dVmAkcG
         oGuOHhRbRl82DPClOjSczvIlbOo6ag5HtckWFkYtrDPExcazdy8EsYcYq5iYF/81kszp
         6q0IUTvj/bnf2He1N1yzW2uM6yIciP0Q6Tf+Ke78Fv8crIRqfRxIxWCQvpQlO90A2Lp0
         GjskCFL3ZPtDmJ4RILI5LKbC+vRBrL5pSITUZ37Car/n9680esK5FSK07oIQamoCy1KN
         auZw==
X-Gm-Message-State: AOAM533QcmV95pnWrtyTWIU1IDM4ixFq+WNvotISMtaSl7f3xS7tGDDj
        GnHtExFKNiypJMDlzzYviWOza2nlveo=
X-Google-Smtp-Source: ABdhPJym7rSzCr1amFziXRW7kdcc8YolwZobl05sojSG2dBuUcho85+VbasTrLfoiLYlfPVQFl74Qg==
X-Received: by 2002:a05:651c:1356:: with SMTP id j22mr997521ljb.237.1611346071448;
        Fri, 22 Jan 2021 12:07:51 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u6sm994589lfk.127.2021.01.22.12.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:07:50 -0800 (PST)
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
Subject: [PATCH v4 2/3] Input: atmel_mxt_ts - support wakeup methods
Date:   Fri, 22 Jan 2021 23:06:58 +0300
Message-Id: <20210122200659.7404-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122200659.7404-1-digetx@gmail.com>
References: <20210122200659.7404-1-digetx@gmail.com>
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

