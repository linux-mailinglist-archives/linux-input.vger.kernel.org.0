Return-Path: <linux-input+bounces-5375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD7948B98
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 10:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF14728126C
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 08:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9541BD4E7;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/Hw7Cw6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5A01BD006;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722934168; cv=none; b=Nkvpi5OynQ+OfqpPzYnoDjfmvQaJzlAQysv729/5C2a9mX755rlUoE9uBseGqWNWTnrrhUW62pWb2fiEfNfqtKLKXAq6a29FBjzwQ8leH8fsLx3vRaNL8uNCAx5ElxDY63rbWs1k+CBgCpnvlZTtuFBK6xUIehds0r27smEtCbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722934168; c=relaxed/simple;
	bh=aEuCjWxRkzWwfDTMdgU+LpngRSgkeUQ7WrIWnqmQ1+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuAm2mwgxIm04nnapHR5Dvv4/AQUbfIHDzV0ZQR2FNIGj+k0kwMNAvoQTXuqRI82ii6k9e8gqPpareW70Mxnv1ggteknojx93gi4nVYi1mR3xG+X3AFoAlUHucVHnsm5ym994JK9m+mzRJUELP3bcxbstyH6AnPRvsdVvqK3o1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/Hw7Cw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11404C4AF09;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722934168;
	bh=aEuCjWxRkzWwfDTMdgU+LpngRSgkeUQ7WrIWnqmQ1+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e/Hw7Cw6s844/rEGJvUySv1Zqupiy12WP1QsgKY4mzftKHzAEW47tOddwUThQLBJW
	 Samq+lJPXX8/qdrRzFAPLy9vjXMKiE5s3F/g7Sq43XyeBKk275OakkSxyXOQ8M3TUQ
	 I76JrcsB7x7+TtRbngOxbZhi/l3CgcStzdFnF6VaA9r4lWZNWKnMzyiNxnecHV/pAi
	 lT88pL46lpzLDKM2+CFJTYjy/LkQ82mvu8q4jaoUKPPP7+7muah/ErrOdnMGSu3Fxw
	 iOOtM8MqjM3++I+QEYcYDkOfKsaHwTDQTaBy6EqabcM2K5Jy6ArXnIzRvGM07RWjoe
	 6uziRXNroZm+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9557C52D70;
	Tue,  6 Aug 2024 08:49:27 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Tue, 06 Aug 2024 09:48:02 +0100
Subject: [PATCH v9 1/3] Input: adp5588-keys - use guard notation when
 acquiring mutexes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-adp5588_gpio_support-v9-1-4d6118b6d653@analog.com>
References: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
In-Reply-To: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722934106; l=4350;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=mDwNB6wUzoZc6JGCdhyWFTBkDbZltiAbjw3N6y6sDvU=;
 b=UNBidsq6/oHQn9kzLAo4fwEqmeEumu0eL5ADWjLJVIvoBLH4FLZnqUUeEJxGqaB8IMF9Eipji
 6x3rZeExX0nBoxfbdE2BvGtfGPcBqX62Qf3mUCdD58Co0eBjj3yltDF
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

This makes the code more compact and error handling more robust.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 49 ++++++++++++-----------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 1b0279393df4..09bcfc6b9408 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -221,15 +221,13 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 	int val;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (kpad->dir[bank] & bit)
 		val = kpad->dat_out[bank];
 	else
 		val = adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
 
-	mutex_unlock(&kpad->gpio_lock);
-
 	return !!(val & bit);
 }
 
@@ -240,7 +238,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (val)
 		kpad->dat_out[bank] |= bit;
@@ -248,8 +246,6 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 		kpad->dat_out[bank] &= ~bit;
 
 	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
 }
 
 static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
@@ -259,7 +255,6 @@ static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
 	bool pull_disable;
-	int ret;
 
 	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_BIAS_PULL_UP:
@@ -272,19 +267,15 @@ static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 		return -ENOTSUPP;
 	}
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (pull_disable)
 		kpad->pull_dis[bank] |= bit;
 	else
 		kpad->pull_dis[bank] &= bit;
 
-	ret = adp5588_write(kpad->client, GPIO_PULL1 + bank,
-			    kpad->pull_dis[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return ret;
+	return adp5588_write(kpad->client, GPIO_PULL1 + bank,
+			     kpad->pull_dis[bank]);
 }
 
 static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off)
@@ -292,16 +283,11 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
-	int ret;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] &= ~bit;
-	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return ret;
+	return adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
 }
 
 static int adp5588_gpio_direction_output(struct gpio_chip *chip,
@@ -310,9 +296,9 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
 	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
-	int ret;
+	int error;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] |= bit;
 
@@ -321,17 +307,16 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	ret = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-			    kpad->dat_out[bank]);
-	if (ret)
-		goto out_unlock;
-
-	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
+	error = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
+			      kpad->dat_out[bank]);
+	if (error)
+		return error;
 
-out_unlock:
-	mutex_unlock(&kpad->gpio_lock);
+	error = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
+	if (error)
+		return error;
 
-	return ret;
+	return 0;
 }
 
 static int adp5588_build_gpiomap(struct adp5588_kpad *kpad)

-- 
2.34.1



