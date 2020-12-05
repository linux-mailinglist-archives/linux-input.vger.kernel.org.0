Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DFA2CF9E6
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgLEFso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgLEFso (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:48:44 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70ABC061A51;
        Fri,  4 Dec 2020 21:48:03 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id a9so10674471lfh.2;
        Fri, 04 Dec 2020 21:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KlqrHpg9VRNbCwXu96M18BYS9mP1p7Mskd/ZrOWE/+o=;
        b=G0CKhy4wlTiWTOF0Bo6EOeCcekMp7bshTBvWtTQViBLqppk+cMETA+V0WD7e5CGQCn
         7wGTBxPPgPy7DmbzsF5YdGXZc2JmH2VR9wVfgdSVvuaHzAqmC30xA5Zajioc9zQB4d8y
         1IBtMtIKEotaE2qN6u55VS1KF+2p3g7n6A95ebplqWXjUod3a+9SvY7DO1hgIveSRVLH
         kTbZ1hUfGOm68MlN9HDHRF3bLhpiMgMZz/QCFtEIYjM6t5eRLlB/1xqJsf7jrQXBaf1j
         +QZmF87Q45wcTT9hNv3gn8/EkDM05oWApDLwGMzwHVUvMSjdKyIKqLY/M930k44v7pdP
         tezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KlqrHpg9VRNbCwXu96M18BYS9mP1p7Mskd/ZrOWE/+o=;
        b=PVKC1AxiNnnORQUcE5BjoFMsf9HqUycT/QFkHYo04TuLkgyG3QNcFQWPM00Ulgpsp6
         m2li5CfDc2iu4mJkW8DeiROYRof5ND5LzfphBjNkQD+68oyTDirVEqUJ4PzoGlB+S56s
         NzQGswWCm/a3+Sg0cxG43EyN8GAzhdqxOViBJJEoVqd7XyEZ3Wu7I+joj1U4Va/TJt1D
         svMD7OWp18c7BeAZr2L7+soXks0StPLsgaYxDfhDoYMvB0EAO9tDsZzd2ApzX0tSpt/h
         CjrQUmtS08wxIwwJuWa1pC676+RWgM/bjhuPTy1EpugWZBxHFdP6pnoUms7EbjQsJc0v
         Z0bA==
X-Gm-Message-State: AOAM532aEOLUdLxygce5+wgDPam4/9FZczkV8FGM36N4qKrGkq2DG1Ny
        2y+XZLUDSpMyAm+RVDpYtoM=
X-Google-Smtp-Source: ABdhPJwgOi8XjXaQF/2vShYAlmOiw07RREPPXObf6X3CRziTUWGRC+frhSQPSUcxc4kMAGswfUSLLw==
X-Received: by 2002:a19:7012:: with SMTP id h18mr1074485lfc.191.1607147282098;
        Fri, 04 Dec 2020 21:48:02 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id w28sm2231490ljd.48.2020.12.04.21.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:48:01 -0800 (PST)
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
Subject: [PATCH v2 2/3] Input: atmel_mxt_ts - support wakeup methods
Date:   Sat,  5 Dec 2020 08:47:48 +0300
Message-Id: <20201205054749.26487-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205054749.26487-1-digetx@gmail.com>
References: <20201205054749.26487-1-digetx@gmail.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 2b3fff0822fe..cd52420a1f2b 100644
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
@@ -626,10 +631,25 @@ static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
 	return 0;
 }
 
+static bool mxt_wake_up(struct i2c_client *client)
+{
+	struct mxt_data *data = i2c_get_clientdata(client);
+
+	if (data->wakeup_method != ATMEL_MXT_WAKEUP_I2C_SCL)
+		return false;
+
+	dev_dbg(&client->dev, "waking up controller\n");
+
+	msleep(MXT_WAKEUP_TIME);
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
 
@@ -648,9 +668,13 @@ static int __mxt_read_reg(struct i2c_client *client,
 	xfer[1].len = len;
 	xfer[1].buf = val;
 
+retry:
 	ret = i2c_transfer(client->adapter, xfer, 2);
 	if (ret == 2) {
 		ret = 0;
+	} else if (!retried && mxt_wake_up(client)) {
+		retried = true;
+		goto retry;
 	} else {
 		if (ret >= 0)
 			ret = -EIO;
@@ -664,6 +688,7 @@ static int __mxt_read_reg(struct i2c_client *client,
 static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 			   const void *val)
 {
+	bool retried = false;
 	u8 *buf;
 	size_t count;
 	int ret;
@@ -677,9 +702,13 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 	buf[1] = (reg >> 8) & 0xff;
 	memcpy(&buf[2], val, len);
 
+retry:
 	ret = i2c_master_send(client, buf, count);
 	if (ret == count) {
 		ret = 0;
+	} else if (!retried && mxt_wake_up(client)) {
+		retried = true;
+		goto retry;
 	} else {
 		if (ret >= 0)
 			ret = -EIO;
@@ -3160,6 +3189,15 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
+	/* Request the WAKE line as asserted so controller won't sleep */
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
@@ -3190,6 +3228,23 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
+	/*
+	 * Controllers like mXT1386 have a dedicated WAKE line that could be
+	 * connected to a GPIO or to I2C SCL pin, or permanently asserted low.
+	 *
+	 * This WAKE line is used for waking controller from a deep-sleep and
+	 * it needs to be asserted low for 25 milliseconds before I2C transfers
+	 * could be accepted by controller if it was in a deep-sleep mode.
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

