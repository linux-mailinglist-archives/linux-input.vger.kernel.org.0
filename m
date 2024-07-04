Return-Path: <linux-input+bounces-4864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D792784C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 16:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA1D1F2442C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 14:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C001B0119;
	Thu,  4 Jul 2024 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8lWNT0G"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6D91B0101;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103199; cv=none; b=HSErw54bRNCrBrbMKXdeUQBIfpCaN6QPxXlZViLhHBPPJmCd0etCIYfdndpILz2Q4yi9tPqBXSl6iMSaqB3jSMP+Sec+dtRigXeMpXgfkdkYSMw+qI03WIJk3fv08wDZx1jrtNtJQyWa+KO4iF2gMKH5OwUGQPqNqO3agPCDbEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103199; c=relaxed/simple;
	bh=O0v8K5vaPRQTq2/wF6rZKbUrAmhKcaa5rFfZIeOMg78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpdTzRgEFiecUwVLZ9PrPLH7dqieyD3Y8hY5K6S2GnyF7RO2c42HrXhDsE3Z6KItMWOeSpG6xnSeQ0/FMMzzbOgHv3mmpGEmmtGabtfaJ9zeG81figAbNkCEl4kGaPHhX0XsVAe7mSIjZbtIljEz7MbdYM8PuKBjE1iV7SHhj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8lWNT0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2527C4AF0B;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103198;
	bh=O0v8K5vaPRQTq2/wF6rZKbUrAmhKcaa5rFfZIeOMg78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i8lWNT0GSmGgo4WBms7sLfjc7CEk9yNfdFv0mue9MUGm7nfNqO0Ook8Yoft5FKqwP
	 2XVkyJMOZ21eRYHh4+9VexYXS+QyI5s5U+dBr4X6BCK9eFDokff+PZ7swSmu0hGlAM
	 voJ9Gfs2rtFFaPc89JViAU3bEV7tpZ/Nyd1B9nUdKjjjgwikIKR1goMvET05XUyCiD
	 Vlg3Bmao9pWirpuoYVaWlKKLRagbeUpFmXNYWYuzU7yKHte0gqwibQWP/AuYvbD2pM
	 FPZLUvm6j7tY3aYTExl84tYmfhoFak9ceAvjXMWnaxWLcP44L4DKQhLrCPLompbvKt
	 +FuRG+9o4xS3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B8CC3DA40;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Thu, 04 Jul 2024 15:26:31 +0100
Subject: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
In-Reply-To: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720103192; l=2712;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=88wNMy4rmPbRWjXCvkVchg8jmUobzR++Hoq2qUZYJ2A=;
 b=6nJxBYXzgyKOwQfdHF3Dn/UeYFs5pOG+POFurBa6V/clJ+9R1gW5HcYZGKyTtCZqC6ebSDYzA
 PjOj/ryVcBVBZExpPVNywFh3MvUY+9erqNf6TsiJOi1uy2FXH9OyW7q
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



