Return-Path: <linux-input+bounces-17160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BFD38A86
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 01:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8AB30B8907
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 00:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9FB288D6;
	Sat, 17 Jan 2026 00:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Gf68cN0S";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wVhl31DP"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A56500944;
	Sat, 17 Jan 2026 00:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608758; cv=none; b=dj7npjvU7XjKiwxmK7QOobCEv5w1jqfO2V1tNjKBR5KG7ul/yHgtedZzcK3cC1a6BDXNEceqtOOg3y7Lx2Y5Uunt5P/EPsoWgeiadJU/Eex/2qR9J0SM+7XFEXddXHtQVuAH893Jpcm905Ybd2TBgPsKqFoAQ4tOqWSvn1SPVWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608758; c=relaxed/simple;
	bh=R4s4slxdwJENWgVa2tSLPLS0AEIaqtewzCylfp1L8qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejmfvM9Jp3nnPFA5eYkHmRhfwpVvCD24hIgsUqEap6y2fo6oDdWPqtVG83SaBNptWQoprpCgkOyO6WNA9ngi8P2KfSqJxaOwDNg+gh49ShDeh7PUJcrGQzL9A2RD/NcbRp17Atg4xvalGkrOZ71Cr/OpDvHtJ43XzTVAHLYcL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Gf68cN0S; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wVhl31DP; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dtHGg69Vkz9t0P;
	Sat, 17 Jan 2026 01:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t1ibJdgfNAmHJ/goAhlBo6+AS9PXOdDzmC9nb2CHrmo=;
	b=Gf68cN0SL1pU0aOUdsnVbGjxPkIEoiGtrHumj6hW6vODG25lTX7/YrIqjpgxZnzaqsUtH+
	FeE5YW+Qk9LC86ROat1VxQsBZ9B4fqsn0HWy1uXRqCGDvUw4iddXAP6hbIzVOt/c7iuR+U
	mj3mwpUPboYbGhbdJXcbiB9DBlIUwXOkr/6/1npukUOJF5u77G/PEB/yV+rMwlmb8JjNL0
	WE3srmHAloPvPZxZEizp6HiE/W+RcRFNkng4eJOyw1MYbIUeotxM60sRLbNuFhZHjRglk4
	Fi4N1DvWPkXml1oCTa+IHVogMSEZhoH1rKP4mUOLUneGCNdI7bgcobuqpvCNMQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wVhl31DP;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t1ibJdgfNAmHJ/goAhlBo6+AS9PXOdDzmC9nb2CHrmo=;
	b=wVhl31DPROGWQmkvbzXm0oNCkALpFMJlrO27TXjiALDGIm7W8rqI/eeUNZ38hc82eSWCd1
	NPB+tgRPj8dMIHK+yDwbjaKxpoggO8HULPQgGnD3kcZ4PVncrNP5wwJstiuGNGht8krkbj
	jKJxOOoxb1U3ztepxAXOIGBKDEWTIl9X2Yibs4s0xsyUxQ4z8EBC1i7PbVZlijToFdIS9q
	ykMfyE4PoSKmViZ+h0n1PsmYDJR5k7s48nPQYEcYoU4/f891KPry4N0crS4Kq6FzfCws1m
	vpBs+8HqjyYObvlcmL55OMdRF/upDjf96I3oD4KKIBx1qoj3Et0AX4raB+YKcQ==
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
Subject: [PATCH v4 3/3] Input: ili210x - add support for polling mode
Date: Sat, 17 Jan 2026 01:12:04 +0100
Message-ID: <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c208e9887e151f7b990
X-MBO-RS-META: 7p36rc8nnihumwgoqq71bgch6kojnoy8
X-Rspamd-Queue-Id: 4dtHGg69Vkz9t0P

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
V4: No change
---
 drivers/input/touchscreen/ili210x.c | 76 +++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 264eee3e61d0a..22917a5825778 100644
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
-		return dev_err_probe(dev, -EINVAL, "No IRQ!\n");
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


