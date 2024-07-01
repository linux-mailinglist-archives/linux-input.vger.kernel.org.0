Return-Path: <linux-input+bounces-4768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7F91E35D
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 17:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2487E1F23525
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 15:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE1616C86D;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2R3vbWC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9282A16C850;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846303; cv=none; b=HVxJMoZ5AHbSkV9XiXeXZoKAIRNQULoW1rPLy0Q0r9eeePT5BzVujAwMBLSCEQewLsoNXoQQsDt8C6ZcIF6JtHJpkfxochrYDZg//tMRzbiXmQpDgeTJKnKDvPXkyKWuiF+8odsjhDUAZPeAei0EeN0C9/CWm2hv32xNd9kA5/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846303; c=relaxed/simple;
	bh=y5N/8gcyMHIxAa9yP/tfjecoJYFpqjhq0ooiXguECmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6/Bl0GdJlOuGPmZVnsv9xScJXcEvai0bsbR19EtZADpLwn+bRt4oYe8MVr+JdL21AH8JXTWG47UGZ/+b25tmaQo6snSScvoy/MFVNh6B6T/JV25Zb7k0Ev6HFHilSrSnIsYv9M8g6/D+QOkOcatE1bmmgdgZAjjPMXM+PB9tRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2R3vbWC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4715CC2BD10;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846303;
	bh=y5N/8gcyMHIxAa9yP/tfjecoJYFpqjhq0ooiXguECmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N2R3vbWC3CfKX/XkzLniLKdj+mZCkJ9nUsj/fq9jNJYcScq2DfQj/xrGW1tWJRpaK
	 ZPrUHqCMGvRo1VGLzqj0KPLgmG2MvnbmF8Zff/grQNnbtAjdMemEHMMWnKmmnzCwLU
	 G3FdZLHGn1nzKO09e4ze2XwFdHQglay0LiaMFhXs/yi9Rp7/gWiTctQ7T8rbol0b82
	 VxiLTMW0FAYqalLzTvmhLaOF0QAJ2+hNnBY6Ohhu/9ifLRqTVXykA92QVzl7KvO//p
	 ISwkCnWd3HNB00J8odj9EEfU4f5ERpo2zM3SRUddT5gei6CmoYJXu7BoZb5pUdnylk
	 /cPqrniJUxdGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C97C3065D;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Mon, 01 Jul 2024 16:04:50 +0100
Subject: [PATCH v4 1/2] Input: adp5588-keys - add support for pure gpio
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-adp5588_gpio_support-v4-1-44bba0445e90@analog.com>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
In-Reply-To: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719846302; l=2707;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=4MOqqbvu+G4mWGneQ9XlZytwFprVvyttFAs0sfdSVt8=;
 b=AXq4+34Kr6HuK+m3l4PkJn6TEktCmcrhFRM3v2rbScSMc4u+oOQPD/BS95WIgw3aoWo6/JXsM
 6CFL+P6xJfaAcNktKmAsEVrlKdXnVfbm6q5yvInMojx+4CckfWSpWZz
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

From: Utsav Agarwal <utsav.agarwal@analog.com>

Keypad specific checks in the probe function are relaxed if the
following conditions are met:
	1) "gpio-only" property has been specified for the node
	2) No keypad rows/columns are specified

The "gpio-only" property is introduced to simplify usage since it
serves as a clear indication of the user's intention as opposed to being
inferred from the number of rows and columns specified. This
adds simplicity for the accompanying dt binding update as well
as interpretation of the same.

In such a scenario, additional checks are also introduced to make sure
that keypad and pure GPIO operation are mutually exclusive resulting
in an error if unintentional/incompatible changes are present.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 1b0279393df4..6f4a52ce20f8 100644
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
@@ -647,6 +648,32 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 	struct i2c_client *client = kpad->client;
 	int ret, i;
 
+	kpad->gpio_only = device_property_present(&client->dev, "gpio-only");
+	/*
+	 * Check if the device is to be operated purely in GPIO mode. If so,
+	 * confirm that no keypad rows or columns have been specified, since
+	 * all GPINS should be configured as GPIO.
+	 */
+	if (kpad->gpio_only) {
+		ret = device_property_present(&client->dev,
+				"keypad,num-rows");
+		if (ret) {
+			dev_err(&client->dev,
+				"Specified num-rows with mode gpio-only\n");
+			return -EINVAL;
+		}
+
+		ret = device_property_present(&client->dev,
+				"keypad,num-columns");
+		if (ret) {
+			dev_err(&client->dev,
+				"Specified num-columns with mode gpio-only\n");
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
 	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
 					     &kpad->cols);
 	if (ret)
@@ -790,6 +817,11 @@ static int adp5588_probe(struct i2c_client *client)
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



