Return-Path: <linux-input+bounces-4809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F47925BC3
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 13:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED7AB2912A9
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 11:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CDF19DF41;
	Wed,  3 Jul 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERIj6EAf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9319194A63;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004303; cv=none; b=ucMjnrKXjVw2i8F5nQFiXFOOMiJhDvVr1eMHrZQNZvglKfJrRtZK4uygK7vMP/lPwjMvBusYNkUu2DdLOsSgO2bWdXVC5iqXdGwx2TPWhkbStmNe36kki75NoWyaSqmTJQW8ApcVGCadFqEgonjK4m0osLMn2u9WHX+S+zTBcq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004303; c=relaxed/simple;
	bh=CEs8+DRIeGmiY561Jx5O7M3jRBsDAakbraDmK/LnE38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7iKXT2Ro34yq5GRdC9CoZeMlaYTXpug3IZBnCKDzFvzQzn0RYaolXZdJbrMOs8Tojnwv8gwP+HgjWbBECPmCfJDBYAZXRL92mma3o5qGjc/oo12U41Ss1Z+onCb7vqOmb0IR06QFWmPE0vogJ9nAJ+K7cFeTA/2VUnrbgMHcJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERIj6EAf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4317C4AF10;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720004302;
	bh=CEs8+DRIeGmiY561Jx5O7M3jRBsDAakbraDmK/LnE38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ERIj6EAf62GA6PxpHTAnqAHl9HFEtlDAT72A4aVJ2m7BRUOlcI//hgTfwgmE/7Q7A
	 /UArRY+6jFUGIqHqw1WJVNiTLl56VukBtwa9JSjwHJrrSNUBm2h3t1o6yan+9263ho
	 149q+FrlaC+7uB2c6DrQEX0TuEpDrPlFrixjv3L1QWriWkz3DszvMAfWJ2exglOy0L
	 bF92okZiB8327xb1kLL7F3B7JVfp4NjLCfouc+Ax4GObbAfMntR6kfY6RV3XrkBYY5
	 1NT8qEbSWGpWNU1xzYl601cpzqxQipt+HkozdsXB/HsZNHY0h+JG6JPavrryxr0srz
	 Hp4nncH8JXClA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F48C3271E;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Wed, 03 Jul 2024 11:58:15 +0100
Subject: [PATCH v5 2/3] Input: adp5588-keys - add support for pure gpio
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-adp5588_gpio_support-v5-2-49fcead0d390@analog.com>
References: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
In-Reply-To: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004298; l=1837;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=klq1Qyb0WqtpIF6DNp6B1Ru2NbKchTFAx0S9eaqYMPw=;
 b=46q6iaWJTKRlCxyzM6hfyyT1WBMh37c2qgQvk6UGnT26xoQgiQtbEoysYCyRLaafxr61i/IP2
 rk0sNi9+nscCJSBXeQq3MrOT+m4kTHBSm2KLreH7tGt6jqCgjf1kxqF
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
 drivers/input/keyboard/adp5588-keys.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 09bcfc6b9408..691f5790bc81 100644
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
 
+	if (kpad->gpio_only) {
+		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
+		return 0;
+	}
+
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  adp5588_hard_irq, adp5588_thread_irq,
 					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,

-- 
2.34.1



