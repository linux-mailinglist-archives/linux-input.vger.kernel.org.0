Return-Path: <linux-input+bounces-17117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9CD25B09
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 17:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24AB2300B881
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A76A3B8BC5;
	Thu, 15 Jan 2026 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I4jKrukT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UO1a36mD"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE1B29DB9A;
	Thu, 15 Jan 2026 16:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493957; cv=none; b=NgWMSWxJDS+cPrG3CQyMF4tDEl/MX/Y1PRY1yJOeh8Skwn+zPcmwZWVQQnHqLl7U/Zp8DjVqeuLdH5DnTiKsEBhM/7L6v+HF1WsLSgGFm5Zj/8mAFtth3p+WX8pBmIM6ipmHncg6Gqz+POhexWb+0+xHUWwJH2vyXmp71byr3GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493957; c=relaxed/simple;
	bh=WzVv+8iouPVJ+m1US+3PFY6WBcG5SATZy/XNyNTcFqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5ZhY04wqZuLoy7N9yh4EFJNg+6kwrxcrJUYqAOSsZxTDJtwROpHp4scAsQo0+Y4TQUH57k68zTTchtC/kPu3JQZm4KJp82GdfsNTzPV2gQk0wAs3W2/qlHBOWvWO24SlERDG5MOAtjEFQrlkPSFuSA4M1v4akX7A25iVof5B2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I4jKrukT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UO1a36mD; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dsSq53Xbjz9t4B;
	Thu, 15 Jan 2026 17:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768493953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CanoL8d9PSW24Gvuy7/NSWxvNU/H+wlyEpBYVsJoeG0=;
	b=I4jKrukT/oZ/UQOOaaI9p9yin0T+W1eKE72HcmoUuSz6EElDzOEpArGBsWeiatjB3bnBPi
	Z8+7+xWBX7lHNfnjpQ1aTtWs2R2jKW+D1yRqsK98VVAJz0lKe8X7h1L6brYqvh5xUbKWHL
	asGJKp+40tI7VJN8A04DooABLaXNtbNJuNhnxbrMkIJA2puXS36PYq+ybTa5AbyMXym07z
	qtrm4cJxzGogJQMdB1Gv9ogi8n7PxQRIiW0woR0tvALmhpv+ezXLTsjv3XDZlJJzL7aFoe
	Z9PXhA30RXu1amlapR3i4r53hrGMkPI3zMtA71kembslVrpem7qQedw+wPAVSg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768493951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CanoL8d9PSW24Gvuy7/NSWxvNU/H+wlyEpBYVsJoeG0=;
	b=UO1a36mDHeO9ePXPqR/79lJWaVBxOyEVjcJNhLjaUC98NEMbuhSf24YcAUabLxGQ4QLBKN
	z6lKZhIYujz3TziEAHCIK8BGLv1nrdg5BDb25+WO9aV1m1C4qi4+V5s9sv3jkRrtjjtcCc
	FlPu0XpoKLKsuwhg5omyg2edLmigwTBNL20mi/GpkvD2xAdS+7Q8vm6CE/5JxS+K+CqQXa
	2gII7WvEOVIUZ1ZhU9fl41fo6nHKGX3+xtfZKmDfuIcOd7rocRE30ef1Ka4aS8iSV4Y0J1
	t9KUltYBH+/h5PbQavIhIanzoyR+086xCxPOv9UdPNYD85ibPqn9WelfjtJ+EQ==
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
Subject: [PATCH v3 2/3] Input: ili210x - convert to dev_err_probe()
Date: Thu, 15 Jan 2026 17:18:08 +0100
Message-ID: <20260115161858.20226-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org>
References: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jyho1euzfeqtba9bfbdpchd9d3kq6up5
X-MBO-RS-ID: 53aaa11035fafb8208f

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
---
 drivers/input/touchscreen/ili210x.c | 31 ++++++++++-------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index fa38d70aded7b..a3c5321d34d7b 100644
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
+		dev_err_probe(dev, -EINVAL, "No IRQ!\n");
 
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


