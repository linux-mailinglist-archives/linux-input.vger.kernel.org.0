Return-Path: <linux-input+bounces-7081-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AAA9904C1
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 15:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03C771F22CA3
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768B62141A0;
	Fri,  4 Oct 2024 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bidOoLtR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7E212EF5
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049617; cv=none; b=RmsJON4h8du5hjikKwnPvcvv5jenZp7rQ05k6zbDg61pyjIXhqfERldQitvhwyVlAXWVLXTOWyLYzTDglhtTbPfyiUrd9caN1BN6hSCrps/OFh1+St9kNnttn508ZrSQIo2opvbH/RwAOWHX7u0KxNcuDmikwW91qDaXs8gygsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049617; c=relaxed/simple;
	bh=GaGVBlUAZAzixzMPjr2GKd8qLJQJTfvw7fhOCSOmZbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hhpu5Mcg21KDSuVdah3V8bHxOs9A1bvcNmDftpxZLCucvf0Ui0p4bWtEMZLm9A+tVp7ijMDPO9HlSuHinzl7Q9+Bx4w/GMy5wqkCRSV2N9ZAa4MtH9rUCW/GZ6fnNRNwWFcKAIAAoYiLkbjROMJ00cklfWjzSl8Dd+GHHVh/bCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bidOoLtR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC557C4CECF;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728049616;
	bh=GaGVBlUAZAzixzMPjr2GKd8qLJQJTfvw7fhOCSOmZbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bidOoLtRJsexYyg3ZsTsv8KZaq2UiDPzlIb5UfOAaeB64y3ju4TLoYA7vM76SSVGT
	 VAchmtTPYH+wR255Rl3M7RIVTs3gHbmxD2ddtvLCq3rVcBqim/HKvbves3kiuxyDEC
	 aZuQfWpjxmZmLM71lVw5u3191Q1Nsc7mrY7zm4IrPYMi87db97W/RuTSkdq3C9gRYN
	 +DmkeQ6ftQJMmjrfpP6X1JJWefwOP72iCoixuN2ihjVq17hHX7sNvS8FqpTKwexaW9
	 SkvGGjPvo2r4Esv/hJwpmbaaQ1ygOpZwgmHVDzQl5Z0xOtpxpMyj+OwQFPn5v9TpKT
	 n1B68FdGIE7FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E1FCFA77F;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 04 Oct 2024 15:46:52 +0200
Subject: [PATCH v2 3/3] Input: adp5588-keys: make use of dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-fix-adp5588-read-refactor-v2-3-275a093758ae@analog.com>
References: <20241004-fix-adp5588-read-refactor-v2-0-275a093758ae@analog.com>
In-Reply-To: <20241004-fix-adp5588-read-refactor-v2-0-275a093758ae@analog.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728049615; l=5144;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=gt3jhPKFLDsBuarU+NtzbRqk71V3bunZcxmUsG25ZIQ=;
 b=0zjhhTtwyPOawLFp+Or7GywbXi577wNF/msX2A0anWmqpASw+FALS8e+MEo/CLiqfnE2pjXSh
 yc7C14dMxcnAaqUXVZ28wYOlVixJmwkoUinMjBIx95RDVsrca8XX8ma
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

Simplify the probe error path by using dev_err_probe().

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 70 +++++++++++++++--------------------
 1 file changed, 29 insertions(+), 41 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 0152e4fa088c..60a7cb040af7 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -439,10 +439,9 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	kpad->gc.owner = THIS_MODULE;
 
 	if (device_property_present(dev, "interrupt-controller")) {
-		if (!kpad->client->irq) {
-			dev_err(dev, "Unable to serve as interrupt controller without interrupt");
-			return -EINVAL;
-		}
+		if (!kpad->client->irq)
+			return dev_err_probe(dev, -EINVAL,
+					     "Unable to serve as interrupt controller without interrupt");
 
 		girq = &kpad->gc.irq;
 		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
@@ -453,10 +452,8 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	mutex_init(&kpad->gpio_lock);
 
 	error = devm_gpiochip_add_data(dev, &kpad->gc, kpad);
-	if (error) {
-		dev_err(dev, "gpiochip_add failed: %d\n", error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "gpiochip_add failed\n");
 
 	for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
 		error = adp5588_read(kpad->client,
@@ -680,21 +677,19 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 		return 0;
 	}
 
-	if (!client->irq) {
-		dev_err(&client->dev, "Keypad configured but no IRQ present\n");
-		return -EINVAL;
-	}
+	if (!client->irq)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Keypad configured but no IRQ present\n");
 
 	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
 					     &kpad->cols);
 	if (ret)
 		return ret;
 
-	if (kpad->rows > ADP5588_ROWS_MAX || kpad->cols > ADP5588_COLS_MAX) {
-		dev_err(&client->dev, "Invalid nr of rows(%u) or cols(%u)\n",
-			kpad->rows, kpad->cols);
-		return -EINVAL;
-	}
+	if (kpad->rows > ADP5588_ROWS_MAX || kpad->cols > ADP5588_COLS_MAX)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Invalid nr of rows(%u) or cols(%u)\n",
+				     kpad->rows, kpad->cols);
 
 	ret = matrix_keypad_build_keymap(NULL, NULL, kpad->rows, kpad->cols,
 					 kpad->keycode, kpad->input);
@@ -714,11 +709,10 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 		return 0;
 	}
 
-	if (kpad->nkeys_unlock > ARRAY_SIZE(kpad->unlock_keys)) {
-		dev_err(&client->dev, "number of unlock keys(%d) > (%zu)\n",
-			kpad->nkeys_unlock, ARRAY_SIZE(kpad->unlock_keys));
-		return -EINVAL;
-	}
+	if (kpad->nkeys_unlock > ARRAY_SIZE(kpad->unlock_keys))
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "number of unlock keys(%d) > (%zu)\n",
+				     kpad->nkeys_unlock, ARRAY_SIZE(kpad->unlock_keys));
 
 	ret = device_property_read_u32_array(&client->dev, "adi,unlock-keys",
 					     kpad->unlock_keys,
@@ -735,11 +729,10 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 		 * part of keypad matrix to be used and if a reliable way of
 		 * using GPIs is found, this condition can be removed/lightened.
 		 */
-		if (kpad->unlock_keys[i] >= kpad->cols * kpad->rows) {
-			dev_err(&client->dev, "Invalid unlock key(%d)\n",
-				kpad->unlock_keys[i]);
-			return -EINVAL;
-		}
+		if (kpad->unlock_keys[i] >= kpad->cols * kpad->rows)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid unlock key(%d)\n",
+					     kpad->unlock_keys[i]);
 
 		/*
 		 * Firmware properties keys start from 0 but on the device they
@@ -761,10 +754,9 @@ static int adp5588_probe(struct i2c_client *client)
 	u8 id;
 
 	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
-		return -EIO;
-	}
+				     I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(&client->dev, -EIO,
+				     "SMBUS Byte Data not Supported\n");
 
 	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
@@ -814,11 +806,9 @@ static int adp5588_probe(struct i2c_client *client)
 	input->id.version = revid;
 
 	error = input_register_device(input);
-	if (error) {
-		dev_err(&client->dev, "unable to register input device: %d\n",
-			error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "unable to register input device\n");
 
 	error = adp5588_setup(kpad);
 	if (error)
@@ -833,11 +823,9 @@ static int adp5588_probe(struct i2c_client *client)
 						  adp5588_hard_irq, adp5588_thread_irq,
 						  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 						  client->dev.driver->name, kpad);
-		if (error) {
-			dev_err(&client->dev, "failed to request irq %d: %d\n",
-				client->irq, error);
-			return error;
-		}
+		if (error)
+			return dev_err_probe(&client->dev, error,
+					     "failed to request irq %d\n", client->irq);
 	}
 
 	dev_info(&client->dev, "Rev.%d controller\n", revid);

-- 
2.46.1



