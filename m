Return-Path: <linux-input+bounces-4808-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85C925BB7
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 13:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5572C1F251D3
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 11:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C4119D8B2;
	Wed,  3 Jul 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3/JcvEi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D55194A61;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004302; cv=none; b=q/1Xj8XpbOUcj1E8qBTKrElMtSmWifjnouTMVzdLhY/dSFh6fvXATr/BQ4c0+PXWfJVnntYB6sFm/Ysdu1DDuQOUGorGFO/3DD2yXV9Zx0VHzToHZ6KAuINKs5ILvsQ8nFA8lyfzXhakxm4k3slexwKyI7oU74hy7UsPzunHw9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004302; c=relaxed/simple;
	bh=aEuCjWxRkzWwfDTMdgU+LpngRSgkeUQ7WrIWnqmQ1+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HjAD4mDezL3F1/9u4DKn6Gpwgal2dfxQY56IanPW+858FdFkimJcCiXWp0jYX35vZ+Yl+jMZV47zpNwwL9HUpVu4c/hqV11UIkXH29qyjom2H4NDWW9w1QSNUNLUxfRfGB+FjopSYT640hRLwsTba9eAjXoja5Yr4FZ2YvkQlaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3/JcvEi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A048FC4AF0C;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720004302;
	bh=aEuCjWxRkzWwfDTMdgU+LpngRSgkeUQ7WrIWnqmQ1+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I3/JcvEiwOginYTFAnj+tYCVxSmrkuJ1tk2Vnevrmh0X1MhI3ugqmM4Mop2s7G2DS
	 GABk6/peN/3skwvld22hxvU7G6M20QpqJLlSEV/hZGcFgTYXz5BzR4P+ufEDgpsHpk
	 zMJrRYATd9fjE1DCpYJiv+dGyJ+B1atofDIhUxfx/gLlkO4FhHm1G8zsrIaeWMkFA+
	 leC2dwZoc81BASnzKQPrV5REufclSUkm7P4Y2nS2jCqL5SudMTFk/6P4f3wVbGDPUJ
	 F6/g/zl8ejre+OW4OmQvpPVrovekF0tHk1RIgHrg4Q2cbcx+615hVxvkbiDXri0Hb1
	 G/zh7L9iD6TZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6F5C30653;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Wed, 03 Jul 2024 11:58:14 +0100
Subject: [PATCH v5 1/3] iInput: adp5588-keys - use guard notation when
 acquiring mutexes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-adp5588_gpio_support-v5-1-49fcead0d390@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004298; l=4350;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=mDwNB6wUzoZc6JGCdhyWFTBkDbZltiAbjw3N6y6sDvU=;
 b=jjBqSWcwnCVzitZS8QoidLwX+c3dn+VHXbdi+9FWtIk/bQ05CH4Ff5URgrqubb75obuhY4T6X
 spmwdD+N+NZDIUSyhLwXe1W268/QaPs5KuoVnKqVFQaPQ4sfGHDsnqJ
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



