Return-Path: <linux-input+bounces-17159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C9DD38A82
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 01:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42AEC30596A1
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 00:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E107617D2;
	Sat, 17 Jan 2026 00:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="li9X9EQn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VUey2lqA"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388BD5695;
	Sat, 17 Jan 2026 00:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608754; cv=none; b=ZG+vbwgnDDGGIEbTafEBe5YLKaxMdWt+qohRUWSuwSrhJa+zQ3Tw2AqGCTlCHnLY30ky6K64iO0K/Eab6JDzK6ib+lJJZ2Q7u7/oFAqQHpC38etoW9/X2t+bVTu0e73fvuEPOaK2tOF/CRzM/zqxrYj3H9tYGzfkhGkK1CYvFGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608754; c=relaxed/simple;
	bh=H4u3yURZMDHPK7U4FJzeGfSbDJYIGgPQpryt/g+lvtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gP287Hk+KKrgWHJ75yJoCAEd/OvdPOYY8+0wJyo5Fsl/l3SePIcHShKAV52D2LubtfdOccgsLU/EoOuFFFLjpVXdyiK04JL7XX2oz8C9ajmireux+SERgumuxsJBdUAResWklkvMSSQycOFtFwAfkU6/jDuTS/g4zSLDvat4ONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=li9X9EQn; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VUey2lqA; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dtHGd2Lcyz9v86;
	Sat, 17 Jan 2026 01:12:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULdO5qjuVPtF93XiFDAh/UjP94yjMLLVLv7LjZhX9CA=;
	b=li9X9EQnsT/nddMaZN9ohdKXevILu4ToxhnzuNsREpxMjtBxrUFL0bq0Es7I0U8+xcYnpo
	2wZQQj0wB1lT2/MVryd7S5aDWJyHpQcWb+Y0NQ3ec5eRqlbewfyX+3LeFi4bKgzRWejH8X
	DyX4mBu03LMsivAESxrKSRTJ+8b3XhgGNTZJL5s/NbnSVCIDbxrvLboDHhgC3zd7OTdmUP
	JWd5xftYE/HgnIcTpxpNeSY1gwAqkQZrysnjBRh+wA7tlG9+dXqeg/lzGaF+I8BaU5G3o9
	sPb6U/1xviGh79cKoDmewq3Q7J/MqF/OkvOR19L9AQO3hc/VeTNmEpQRum1J1A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VUey2lqA;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULdO5qjuVPtF93XiFDAh/UjP94yjMLLVLv7LjZhX9CA=;
	b=VUey2lqARABBlByvr1GF8u3bo2h6ou2Og6r4wcdlz6A/9rFGTcsfGkxtz00zCQmJMhJ9M8
	wM+B6blIxWQPGKdUGLanVZvEcLHfC0R7RfLGCDVW9/HG8R1Mq2Fiyxvtnz/7UiecbLz1Ge
	8C+ME+vgPGR/3AQFXbJ9h+VDY3Usq6cDh40c3q/kBluRhhzROKPXhhVhlK7gGmuWS2+JSa
	nqhiDQCdV3ktXLTWJM2V01MWNLLY1Bokg3ClWococOB59NFMYM7sYOqPkjd7jW2+R2Q470
	qKaAcTcc2GA2IP+ghcgaoA2tmWNQLvjaACqtkS0ygu8Avcihtxu9/HpeSZAr+w==
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
Subject: [PATCH v4 2/3] Input: ili210x - convert to dev_err_probe()
Date: Sat, 17 Jan 2026 01:12:03 +0100
Message-ID: <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xnyc6qbrcdo5pt58fez38ejj34cgh15r
X-MBO-RS-ID: ac28842c2fee68941fd
X-Rspamd-Queue-Id: 4dtHGd2Lcyz9v86

Simplify error return handling, use dev_err_probe() where possible.
No functional change.

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
V3: New patch
V4: Add missing return to dev_err_probe(dev, -EINVAL, "No IRQ!\n");
---
 drivers/input/touchscreen/ili210x.c | 31 ++++++++++-------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index fa38d70aded7b..264eee3e61d0a 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -942,15 +942,11 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 	chip = device_get_match_data(dev);
 	if (!chip && id)
 		chip = (const struct ili2xxx_chip *)id->driver_data;
-	if (!chip) {
-		dev_err(&client->dev, "unknown device model\n");
-		return -ENODEV;
-	}
+	if (!chip)
+		return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
 
-	if (client->irq <= 0) {
-		dev_err(dev, "No IRQ!\n");
-		return -EINVAL;
-	}
+	if (client->irq <= 0)
+		return dev_err_probe(dev, -EINVAL, "No IRQ!\n");
 
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio))
@@ -998,28 +994,21 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 
 	error = input_mt_init_slots(input, priv->chip->max_touches,
 				    INPUT_MT_DIRECT);
-	if (error) {
-		dev_err(dev, "Unable to set up slots, err: %d\n", error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "Unable to set up slots\n");
 
 	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
 					  IRQF_ONESHOT, client->name, priv);
-	if (error) {
-		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
-			error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "Unable to request touchscreen IRQ\n");
 
 	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
 	if (error)
 		return error;
 
 	error = input_register_device(priv->input);
-	if (error) {
-		dev_err(dev, "Cannot register input device, err: %d\n", error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "Cannot register input device\n");
 
 	return 0;
 }
-- 
2.51.0


