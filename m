Return-Path: <linux-input+bounces-7006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D098D1B7
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58102286A86
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B851EBFF8;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bogkEwXB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7057C1E7666
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866312; cv=none; b=CGr/OW2AnOugPuqgAHtEbbYFrVSPRF4FwGBcpKl98VgFZtJhhruz/QbQQAcrJQOxHhuTLzebnrB2n6QR5db2dow7bba1SsOYkguxjkLz+TYb9Xtn/CzwyR12hNOfuCrXuuPgz2lWB/zmVR4+eeGtFzeexF7jSux4C++6vlqxk0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866312; c=relaxed/simple;
	bh=GaGVBlUAZAzixzMPjr2GKd8qLJQJTfvw7fhOCSOmZbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYeeyYAlLybTwZLOJtSS7Cx5DlBkHZJAtlBc+aXmHLruyKFluHmAzT6LxIUHa5yeVz1+A3ZJmcf9Af2FGOjhOPgxrGK1NW4iSyHE6iOxdQC+q2oIs9V+jSzoEy50jdDDRAxZLodteyIEJvIOg16q8GpPJg/PA4nVZrAONjzPnOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bogkEwXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F433C4CED2;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866312;
	bh=GaGVBlUAZAzixzMPjr2GKd8qLJQJTfvw7fhOCSOmZbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bogkEwXBJTtTgdYvZEpG0DGad6Qex2vlTJpfDs6oWZmTAdtR7yZ+wWpamDx5uDFXh
	 /W9zpUr1I9o5WpAZdy03UpTvP4GOJ+e0zAhYnG+IhNydSIJC2OkqesEems3FbjQR0h
	 OANtJUDejt09c5VKxujJmkuuBISiST0G6RnW7b90w8cYxidB2dnDz6oCX0IocrQkBw
	 +VDqn4C9cTEpTHiCs5LjlXzGbPzJOl5JVOQr7v58dSuWSjuDmWmvfqOpoN1LAfIicy
	 Nr38EbrwnBSpvMyNbup8W+rHb9G8Ox5HtBWr+BDvY373fyjgpjch5+gimZNpO4EJYo
	 JTh1cNhE/Eyrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479B9CF31B6;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 02 Oct 2024 12:51:53 +0200
Subject: [PATCH 4/4] Input: adp5588-keys: make use of dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-fix-adp5588-read-refactor-v1-4-28800f1b9773@analog.com>
References: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
In-Reply-To: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727866310; l=5144;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=gt3jhPKFLDsBuarU+NtzbRqk71V3bunZcxmUsG25ZIQ=;
 b=gYKNBNlZ5DgRpUEr53HOJRV/oouU2DiX5Mx5Tv95+9Wz1Z7RRCPjpYehpYB3KUrA+QjPQZsPW
 l5m0ER1dhWlCTIehYW/9+Q2D8uo+CdH/ToS421XGySxM1Q0ndKlmfLH
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



