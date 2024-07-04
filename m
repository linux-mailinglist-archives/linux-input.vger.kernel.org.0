Return-Path: <linux-input+bounces-4846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB5392744B
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 12:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74CE1B22636
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 10:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6281AC226;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebO1yfGc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A01A0AED;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089955; cv=none; b=qRVt/cNAxJtcbrKJZpp6D3YASpGapHgG62PG4H15snVG5tkIUdHnZHPOyrsSexjmDH7P58SZMg8wx2dihkmQNjlxcaHoPfWC3n1JGwxUdBIXev4maTX70IkrrK9gDQyzSwJrBVDQw2gooDTc/P25BUVx2RJ6kVeuOOrcxUp4Zso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089955; c=relaxed/simple;
	bh=Lvvrrd7mYjOlQxC3TN6pgCaiOiNL8DLaS982MVUlJBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+9aOh7aFSZUJn0dJ3f7/SkwJjKMvB9u/dWeIT7nIBPc53ew2J7qO/ejz9whPVUWWtpJAPYgBE2bdYY49JhMQK/e44arzEB1GhfTunTE4E9/74cpSfdp8dXcxXfddbyYxMfvAQNOV8I7cV9SUeF3fGBf6jqwb4dFF0cVz6Io1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebO1yfGc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E460C4AF0E;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720089955;
	bh=Lvvrrd7mYjOlQxC3TN6pgCaiOiNL8DLaS982MVUlJBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ebO1yfGc72lm0agkjiEbG/DymwuoQ7OgoPzDDFCR4kWgdHo3HWrNArSZkGKUOdMqB
	 C7czhLB83M15IDW9LYGti0SRoLW7BdQrm58s/A0m+Z+lgAh0S5oOpXGhAR65Uo6ZX7
	 eIE29i5wPu7yVbGWdbbCsQns2tEL5z5zd399dnBmY9gX2Vi1R/1ST5Htcfksu6hmgV
	 nlArC6DTljcEn0ExrwZGB0hegzqNrAIJ5e10flOIlTRei5kkRF3+/jcXul1M2KDC0z
	 DBdvZRUh5Ey/qA1TRQOPADSO/KW2aI/tbVJSmCeBhPqmt7IVpOG05je7wdDdPf+IOp
	 lVWAJYRUxlTsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDCDC38150;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Thu, 04 Jul 2024 11:45:46 +0100
Subject: [PATCH v6 2/3] Input: adp5588-keys - add support for pure gpio
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-adp5588_gpio_support-v6-2-cb65514d714b@analog.com>
References: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
In-Reply-To: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
To: Utsav Agarwal <utsav.agarwal@analog.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, 
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>, 
 Oliver Gaskell <oliver.gaskell@analog.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720089949; l=2182;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=RLvbAKclXYThmpc9z3NjA2d/lPg83Ijm1bN8oVwBbz8=;
 b=c7lQA6euh/Nx5PmNJOAwwb0pAOQ+h2u3neUxFTbLPvvxiqvY983gzqdBExD+WxEJEaGswnJQf
 +p2+TJJQAAUAus/rMuo9ufD/wad50rjb0K5tIFE1uTTH3mo0P2YJRFi
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

From: Utsav Agarwal <utsav.agarwal@analog.com>

Keypad specific setup is relaxed if no keypad rows/columns are specified,
enabling a purely gpio operation.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 09bcfc6b9408..572335c8ef0f 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -188,6 +188,7 @@ struct adp5588_kpad {
 	u32 cols;
 	u32 unlock_keys[2];
 	int nkeys_unlock;
+	bool gpio_only;
 	unsigned short keycode[ADP5588_KEYMAPSIZE];
 	unsigned char gpiomap[ADP5588_MAXGPIO];
 	struct gpio_chip gc;
@@ -632,6 +633,21 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 	struct i2c_client *client = kpad->client;
 	int ret, i;
 
+	/*
+	 * Check if the device is to be operated purely in GPIO mode. To do
+	 * so, check that no keypad rows or columns have been specified,
+	 * since all GPINS should be configured as GPIO.
+	 */
+	ret = device_property_present(&client->dev,
+			"keypad,num-rows");
+	ret |= device_property_present(&client->dev,
+			"keypad,num-columns");
+	/* If purely GPIO, skip keypad setup */
+	if (!ret) {
+		kpad->gpio_only = true;
+		return 0;
+	}
+
 	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
 					     &kpad->cols);
 	if (ret)
@@ -775,6 +791,11 @@ static int adp5588_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
+	if (kpad->gpio_only && !client->irq) {
+		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
+		return 0;
+	}
+
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  adp5588_hard_irq, adp5588_thread_irq,
 					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
@@ -785,6 +806,12 @@ static int adp5588_probe(struct i2c_client *client)
 		return error;
 	}
 
+	if (kpad->gpio_only) {
+		dev_info(&client->dev, "Rev.%d GPIO only, irq %d\n",
+				revid, client->irq);
+		return 0;
+	}
+
 	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
 	return 0;
 }

-- 
2.34.1



