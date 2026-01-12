Return-Path: <linux-input+bounces-17008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8ED15DB1
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 00:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD465302D5E1
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 23:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D636A29D28B;
	Mon, 12 Jan 2026 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yqJbVjjv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ESlC4FOH"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF9422A4E8;
	Mon, 12 Jan 2026 23:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261554; cv=none; b=etAY965yS4psyqZkoUxVUgLqRluJrNuo5Y9ikq++RGJG23jJEjESxope3+KIFGRcpZqMB7ZWzQuNIMB8VOhqTXTjEZ/Cwc7BttKz4iPCo3a0xG1fl7J0IMysTmOh+0lUqzph5gLv2+Av/SwpS77PP3Y1QZnEdV5azV1OtBAMkVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261554; c=relaxed/simple;
	bh=S8o6XiVxcBKqXULOCHBcyIrf3g7zSl3dua7oaaizVB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFTyapDiBqiNR50c/Nreg2RbGKaGGZTvONXY5hn5hXFC50HOV6KtuHLgj/dxlcYA4y/C6w+oVWXoFO5v2kpIImriPf1OcWBXaQfNwrjvhcExrfKEC9PPTo7FS3AoxaV4m/ECFjp1gVukVHsu7hMaVc8NA30Vs51gATxsjP54PCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yqJbVjjv; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ESlC4FOH; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dqpsj3Kkcz9tNF;
	Tue, 13 Jan 2026 00:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9ENM3uGGrt9g37LJMgS7wZrJE+6FX6DsT8Eg+brpvc=;
	b=yqJbVjjvE+Dbw8GqmmI0Uk+Kr5jBtAm8OlLafsZz0QsRLjcRzQNVWGRPJeDnmtadb8v/8D
	PBn4atkWgRw5gxn811ITStyj+Pq+qYWfrZZf8kb1dLPtvxT0CkT7+6kb5jQryhf+DMUBci
	UhRPctqKsfAkODYpQha72twXGkVcxAVAxrNl52gGShxPv9dOXN3ib93B2n+nCDaw1bptE0
	F8IgRFq+IokdkiEU9GLI7UYO3TqPE7LNTcmHxccv0AyVEMZ542+5AtjdAGBP080ZratDz8
	JuvlAcM7fOnz+s3Y1rjJFMsbpWixOpqmyVShRUeBZm/3zU5zPdG0B1dQL8quPw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9ENM3uGGrt9g37LJMgS7wZrJE+6FX6DsT8Eg+brpvc=;
	b=ESlC4FOHwW+94oJ8P0IcMUFz+pJBY2fcG5OMjJ9A5N5FNUmYHmRTLoLng1B9t8pXwhz0OE
	wvaiDKPI9RtgiF6GiNWvdRAI2UbT27OrqCZdnP+uiYjNwHpm0D3nGwAr7W5+mOTBvFCBgs
	/mwpCzcr4y3zPql12qdWj/1rsvVW7xLJ4U+ysmigSdNyJfT3xaZ7D58cBsnG67O1ljDtNL
	ZUtOfYcc8JviBrM84KmXSJpFVhTwL3Tx+RVSenHByCR04YJjaumTrfaR7+V9stJzxe8eGy
	k7KPBOGPC1+ZOVvjZgnb34s871qxovnGhSHxPp+DbY1B7nl8hZDupbMaP8pZEQ==
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
Subject: [PATCH 2/2] Input: ili210x - add support for polling mode
Date: Tue, 13 Jan 2026 00:44:57 +0100
Message-ID: <20260112234534.225954-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: fd8adea8957a44d05b1
X-MBO-RS-META: mjtoqjr44akixgj1bw5tfej4w5x7xein

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
 drivers/input/touchscreen/ili210x.c | 84 ++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 24 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index fa38d70aded7b..3220848a4b843 100644
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
+	if (client->irq) {
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


