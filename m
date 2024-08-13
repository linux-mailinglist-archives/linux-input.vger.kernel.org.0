Return-Path: <linux-input+bounces-5558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8E950D9F
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 22:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B3F1F23A50
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 20:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4BD1A4F3B;
	Tue, 13 Aug 2024 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhBYzxNb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417C01A4F28;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579722; cv=none; b=K/f7vF1thNiJ3zyiNJrf/nclsX3TWw/tepMGKDcblQOahdB8+SicQm+FAgHfnl5ylGPY1UeEbw09X2nL/b52vWbbWEFmGeW1bqWHe9xUCdx3KukL2xwMwZMt9G4MDMPFamfAQmO5P2uyd4IIFiXA7TuIlmybqQ/bJSbGkB0Vm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579722; c=relaxed/simple;
	bh=9Td4swnVF8NKLMcauXwWH+DSBDJe1nM7mcNOPWwcfRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XXb7DYSpgNUXm9w2kWjJlDum9PXYYxpZWjqlmKEjRyMCXPLoWzFnJPXoebVF7E4qVpcuGvnoOZOGhwkFksAPzlXTAz+ir3mCD94ICLiavMY3VvpUAJ5Fy5uNZKTSCA6VZVtEXWwIF04yEo5rZmAWmQc4z/gFzVfMFT5aha7xSMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhBYzxNb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9DABC4AF11;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723579721;
	bh=9Td4swnVF8NKLMcauXwWH+DSBDJe1nM7mcNOPWwcfRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lhBYzxNbVI70X7kaBhjYpLhbX+OGFWP/dEPoi0+3PXrgEhH/cAmpjTMMe14aglV+g
	 DLsaHn3VA9EnBUZtWvcLHNq+Tl+YP5gu3hCMC798/fmeVe+3s/tw+61viXqAaNhA8F
	 MWNdVFdNuIivGyrZQg5vOM+YDTmGoQQBUW+8Ct/SPD8A1fLcJzlarPel6LN5rKZq6l
	 EgA9tG0lbmHH+MoVwgfHxgukChxiuS9GwhJCdWWmVeqbiPknmTJWdljSaYW+Dem9eU
	 gkcU+VeJZhXnUKNRSP8OlJ7FdUgRyoqfI/4UsQXCjs321dY5mwTNmBHUCN888k3Vv9
	 +lb+psi9lzwFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9059C52D7B;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Tue, 13 Aug 2024 21:07:18 +0100
Subject: [PATCH v11 2/3] Input: adp5588-keys - add support for pure gpio
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-adp5588_gpio_support-v11-2-9ea490d6c41d@analog.com>
References: <20240813-adp5588_gpio_support-v11-0-9ea490d6c41d@analog.com>
In-Reply-To: <20240813-adp5588_gpio_support-v11-0-9ea490d6c41d@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723579648; l=2755;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=Eu2lV0vTpN9Abv9n1z4OYRsDPkCZkTfQntOwZUtyC/k=;
 b=1gQPzbe8iYWoov9Uzy5TGHtBJeQ7TkGkLCS8ag/Enf4TcEwTwVLg/HT0/xQhB8/V6Na5OTYdQ
 vcbmaPibOmwBMmRnDZ9eOJS1Y2aRxZe1Ww6LUN4UYkOnREHeR3Ei6Pn
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

From: Utsav Agarwal <utsav.agarwal@analog.com>

Keypad specific setup is relaxed if no keypad rows/columns are specified,
enabling a purely gpio operation.

Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 37 +++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 09bcfc6b9408..7c32f8b69a3e 100644
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
@@ -431,10 +432,12 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	kpad->gc.label = kpad->client->name;
 	kpad->gc.owner = THIS_MODULE;
 
-	girq = &kpad->gc.irq;
-	gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
-	girq->handler = handle_bad_irq;
-	girq->threaded = true;
+	if (kpad->client->irq) {
+		girq = &kpad->gc.irq;
+		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
+		girq->handler = handle_bad_irq;
+		girq->threaded = true;
+	}
 
 	mutex_init(&kpad->gpio_lock);
 
@@ -632,6 +635,21 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
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
@@ -775,6 +793,11 @@ static int adp5588_probe(struct i2c_client *client)
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
@@ -785,6 +808,12 @@ static int adp5588_probe(struct i2c_client *client)
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



