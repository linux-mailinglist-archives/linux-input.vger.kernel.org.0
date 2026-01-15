Return-Path: <linux-input+bounces-17118-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B80D25B12
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 17:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1F083018E8A
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6563B95FF;
	Thu, 15 Jan 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eX9culEw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bS7FFJoo"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A053B95EB;
	Thu, 15 Jan 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493966; cv=none; b=Pf8EBy8mwg3wSN3Ba4zGhw1BUoGik5+qgPFFmGg6VJi0jaiydmaLf/xvTuvBRY1dqBqdmiUfU81PVD7iU9zNMMTYMNCGbWiu+tFdIUHQ+YgMIEuDSeFLKQV/+hPeCYZQFu02GDQdJzgd/T5oKMryeoG3Vc2FAzvMBaVmLfy/B8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493966; c=relaxed/simple;
	bh=aJjq/hD5Cdb+JclXZ+rTlSKfBjMs+T18YWTVB3X4YRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QC0XgpE3MSKNNjOzcsjpupdrUIJceDsCzVqIcm1T73lmtavk7/Si194QXU23qO/b+hVzoUPS4taW9mfv1txlWnjUjEClvj8VgafIbJUg6QMg7JnOMHiuiaHqdXa06EfiLb2Ux4reIA4PR4v2DtG1khWfKPpwMco+f26DOphxdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eX9culEw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bS7FFJoo; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dsSq93SY3z9t39;
	Thu, 15 Jan 2026 17:19:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768493957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M8Xeh4oxLm29/Qa6x/HBG+XopzEIENHeAvNZd71Vy3U=;
	b=eX9culEw0aiQ4Yj4mCHMDSBR6OG75hAfpNK8/b0M2GO6LrlYY21LTOFmHo3nACSqHYp2lk
	Tb8741T4EiXsIGapakSjEu4HPtHER/+oPcpWHas8zqD2aJOX6Gwbfc1vYmmXIqCmLt0Gs4
	5JQAAfpINvCgBt7iLjd8YQkWlS+secyrtuMGbO/hxTLJGu3jyQoA7gBTT8IFXCUx4a8anx
	zxHazOesrTnZ3PZAYpHQ8RjJue7Oafa0vmsXmlYBAUbWfAMQtpFV4QS/ifRiX/FZLksJkQ
	3MaGy87srfV9+BCv5zGPW9LNvhJnZEOXTU9jWRFzSqWd0qcczhlFJmrkjIzESg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768493955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M8Xeh4oxLm29/Qa6x/HBG+XopzEIENHeAvNZd71Vy3U=;
	b=bS7FFJoocBe3zoLEtqTyjnVeYPTUdLdDvenxxb9jRSVst6CNLicsWr4hVzyprdI3gR6qMY
	JpPOyvzT+Oyg3UrOGwomdjaG5B9KBi0f9Aa6WHgHj5bWGI1mNdFkoMUAR+JjM6myRmeL84
	zViaM6NfeQkQjGI86fkCkelo0gD+75yh8RN/eBPKnhW3vujHgNWX0ksbb0ctz9zTMCVUEd
	l+/fvntC8Sti82R/tcrICceKpyHl8eOHuCW2vYEzWwujIznHqz21b9HrXnvregVbze4ff+
	F0XbQsW+tk8XdRJN67ObcTqxFwWIs+6VA7/KhTImr29jw+SXOeJzFlqP3CUU+g==
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
Subject: [PATCH v3 3/3] Input: ili210x - add support for polling mode
Date: Thu, 15 Jan 2026 17:18:09 +0100
Message-ID: <20260115161858.20226-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org>
References: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jfdbeyza4mcjp4zynre7wp3ibrgtb1s7
X-MBO-RS-ID: b2ef8b83ae0c7a44171

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
V3: - Rebase on dev_err_probe() conversion
    - Fix if (client->irq > 0) in ili210x_firmware_update_store()
---
 drivers/input/touchscreen/ili210x.c | 76 +++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index a3c5321d34d7b..22917a5825778 100644
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
+	if (client->irq > 0) {
+		scoped_guard(disable_irq, &client->irq) {
+			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
+		}
+	} else {
+		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
 	}
 
 	return error ?: count;
@@ -945,9 +974,6 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 	if (!chip)
 		return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
 
-	if (client->irq <= 0)
-		dev_err_probe(dev, -EINVAL, "No IRQ!\n");
-
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio))
 		return PTR_ERR(reset_gpio);
@@ -997,10 +1023,20 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 	if (error)
 		return dev_err_probe(dev, error, "Unable to set up slots\n");
 
-	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
-					  IRQF_ONESHOT, client->name, priv);
-	if (error)
-		return dev_err_probe(dev, error, "Unable to request touchscreen IRQ\n");
+	input_set_drvdata(input, priv);
+
+	if (client->irq > 0) {
+		error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
+						  IRQF_ONESHOT, client->name, priv);
+		if (error)
+			return dev_err_probe(dev, error, "Unable to request touchscreen IRQ\n");
+	} else {
+		error = input_setup_polling(input, ili210x_work_i2c_poll);
+		if (error)
+			return dev_err_probe(dev, error, "Could not set up polling mode\n");
+
+		input_set_poll_interval(input, ILI2XXX_POLL_PERIOD);
+	}
 
 	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
 	if (error)
-- 
2.51.0


