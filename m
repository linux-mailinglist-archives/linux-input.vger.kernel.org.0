Return-Path: <linux-input+bounces-17105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E8D22232
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 03:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57E223048C45
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 02:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F2C277C81;
	Thu, 15 Jan 2026 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vY85HOpp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="D3Q0czur"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761B1FA859;
	Thu, 15 Jan 2026 02:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444543; cv=none; b=f7PnMJUlWCxFs1PTmwFKnZGcltb+aXKVFZHfeQsHST0LAQ1ERMTMq/lpXxAD8qJA7dL2QcGskbMlnrDNKoz4wNGFrK9JtC6lXXB5rFuhHKDWTlk5eLw0osj8FVJmutgfLE0tn4k/t5qyiU0cfhpJp+11wFY47BN0OnG4E8MyZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444543; c=relaxed/simple;
	bh=Q0kqKt7wB0kVx+xWfSqCvpitZ0DJ8Z4lWyk1V63DWFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=li09TcyjKux1B1zHqy5DvkDu1WoA18RcwDLoPJPEqYHpjdZ229yraNfkzy0h0L/ZZWrbryF0/1bWkTMFcIPxBMa5r74TXBkU7PLSSnCCthsysDexSD+uOgxw3couQhM33PAAmuEaDBGrtFX7n2tTELBue/91/5iradfhTNT6BJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vY85HOpp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D3Q0czur; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ds6Xq4dK4z9tdM;
	Thu, 15 Jan 2026 03:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNhGOfV7K8sNUWZWhs2ddMFWe99sbmMz7q9K0T0IVe0=;
	b=vY85HOppt4XDagMBGWhGG49/N3o/X+l2tiASuDNmJq1cqL4tD2YDC5wpecmlxM6tCRu8CK
	r7547stSACuNa0tHJdUlWkrP7JQvi8LpVRU2rHlaM8L8iBxD2GbiwJpwSrV0QYUFrYkrv9
	9Z4ol9HxcT3q01zY5SZizlWdqagv9dHTHrxHScW42SD9RCVkiUyuDKwBR/TXzWvn5F7iEK
	zuaYKVjkAogKoHiF2ZXj/eVmckX99924SwtZg9AHqpx6dUFzTyXMHAeCqNvABzJVdQeylv
	CX3/cNBH6eb3yy1+8FI6cD8KNrnoNaa9dsQWaBdlYJ+GFw76v3AYq7QNxMqn5A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=D3Q0czur;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNhGOfV7K8sNUWZWhs2ddMFWe99sbmMz7q9K0T0IVe0=;
	b=D3Q0czur0Gwk+JCM8andWacqVULxdIFzqX2IbcDpWUGi1kAZjyIHKS/L5oMii/FeEi2rQU
	yJi0WCl74WjN5f9ljt5FIFECaZ5X5UPJaGZg3+8lJKM8RS0OMq/CtcR9B57r7lrv+4xdKr
	nJZ2DwCAzR0dJv5e19e3VGu+CIsHLkNGdgkunIEtwPtT+lAbIu845tdYGsI9nsNlnbmSHZ
	76ENOdcEadAHZu/Hctnmgnifohhfo3O1ArmKsgF2uiKi5NOCuIi870EweEmpUix1NysDjC
	oDpoe1ifdUOHanY5TM+93AheT8oYHVknwSUjPRZpBklqDngHxFv4FnDQhsMFVw==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] Input: ili210x - add support for polling mode
Date: Thu, 15 Jan 2026 03:34:59 +0100
Message-ID: <20260115023530.656645-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115023530.656645-1-marek.vasut+renesas@mailbox.org>
References: <20260115023530.656645-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 56656c65e9ea87a9440
X-MBO-RS-META: ja4pqp8w41hk7uqj6r9fcc3hd64nyr5t
X-Rspamd-Queue-Id: 4ds6Xq4dK4z9tdM

There are designs incorporating Ilitek ILI2xxx touch controller that
do not connect interrupt pin, for example Waveshare 13.3" DSI display.
To support such systems use polling mode for the input device when I2C
client does not have interrupt assigned to it.

Factor out ili210x_firmware_update_noirq() to allow conditional scoped
guard around this code. The scoped guard has to be applied only in case
the IRQ line is connected, and not applied otherwise.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Job Noorman <job@noorman.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Test client->irq > 0 for IRQ presence
---
 drivers/input/touchscreen/ili210x.c | 84 ++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 24 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index fa38d70aded7b..0574f2e86580f 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -327,9 +327,8 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
 	return contact;
 }
 
-static irqreturn_t ili210x_irq(int irq, void *irq_data)
+static void ili210x_process_events(struct ili210x *priv)
 {
-	struct ili210x *priv = irq_data;
 	struct i2c_client *client = priv->client;
 	const struct ili2xxx_chip *chip = priv->chip;
 	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
@@ -356,8 +355,22 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 				usleep_range(time_delta, time_delta + 1000);
 		}
 	} while (!priv->stop && keep_polling);
+}
+
+static irqreturn_t ili210x_irq(int irq, void *irq_data)
+{
+	struct ili210x *priv = irq_data;
+
+	ili210x_process_events(priv);
 
 	return IRQ_HANDLED;
+};
+
+static void ili210x_work_i2c_poll(struct input_dev *input)
+{
+	struct ili210x *priv = input_get_drvdata(input);
+
+	ili210x_process_events(priv);
 }
 
 static int ili251x_firmware_update_resolution(struct device *dev)
@@ -829,12 +842,32 @@ static int ili210x_do_firmware_update(struct ili210x *priv,
 	return 0;
 }
 
+static ssize_t ili210x_firmware_update_noirq(struct device *dev,
+					     const u8 *fwbuf, u16 ac_end, u16 df_end)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	const char *fwname = ILI251X_FW_FILENAME;
+	int error;
+
+	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
+
+	ili210x_hardware_reset(priv->reset_gpio);
+
+	error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
+
+	ili210x_hardware_reset(priv->reset_gpio);
+
+	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
+
+	return error;
+}
+
 static ssize_t ili210x_firmware_update_store(struct device *dev,
 					     struct device_attribute *attr,
 					     const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	struct ili210x *priv = i2c_get_clientdata(client);
 	const char *fwname = ILI251X_FW_FILENAME;
 	u16 ac_end, df_end;
 	int error;
@@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	 * the touch controller to disable the IRQs during update, so we have
 	 * to do it this way here.
 	 */
-	scoped_guard(disable_irq, &client->irq) {
-		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
-
-		ili210x_hardware_reset(priv->reset_gpio);
-
-		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
-
-		ili210x_hardware_reset(priv->reset_gpio);
-
-		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
+	if (!client->irq) {
+		scoped_guard(disable_irq, &client->irq) {
+			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
+		}
+	} else {
+		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
 	}
 
 	return error ?: count;
@@ -947,11 +976,6 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	if (client->irq <= 0) {
-		dev_err(dev, "No IRQ!\n");
-		return -EINVAL;
-	}
-
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio))
 		return PTR_ERR(reset_gpio);
@@ -1003,12 +1027,24 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 		return error;
 	}
 
-	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
-					  IRQF_ONESHOT, client->name, priv);
-	if (error) {
-		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
-			error);
-		return error;
+	input_set_drvdata(input, priv);
+
+	if (client->irq > 0) {
+		error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
+						  IRQF_ONESHOT, client->name, priv);
+		if (error) {
+			dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
+				error);
+			return error;
+		}
+	} else {
+		error = input_setup_polling(input, ili210x_work_i2c_poll);
+		if (error) {
+			dev_err(dev, "Could not set up polling mode, err: %d\n",
+				error);
+			return error;
+		}
+		input_set_poll_interval(input, ILI2XXX_POLL_PERIOD);
 	}
 
 	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
-- 
2.51.0


