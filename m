Return-Path: <linux-input+bounces-14389-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E6B3C395
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 22:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733AD5856FF
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 20:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5491924A06B;
	Fri, 29 Aug 2025 20:10:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974442367D9;
	Fri, 29 Aug 2025 20:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756498222; cv=none; b=DPnURKV7lH64YHl3OWnM/MxKzIMiMjnPkoLSH5l4YOwrZhg4YNbFCaijHAkG5D+HQInNM/mAzTBmpZ7l8vFpaZAHqLMc1qDqjxDGsr9keJURJayjrPuGIzwXStOTPhMBGud2axZb4/QS4KdxMId2lJoCugJbgsg7Eqg99TYkFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756498222; c=relaxed/simple;
	bh=J77z28Rsps3f58rOZXV1bcV8fV7whl06dun+g/QrRHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dOi7ftZybPscx3kH76c9MiaRSwGGHBem57aNMOCoXi9wPLFUmspW6qrMq2f0WUbkSqMchn74gJeYCbWB3X54U0vzUs9ir/Bu1X6BG3AL6INLrZqteDylsr5izdMK0guSjey7pkHfWjAR43+uOMWs9FCRO5qj10sNCxxEIE1laao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57TKFIR7015425;
	Fri, 29 Aug 2025 20:15:18 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57TKFIeP015419;
	Fri, 29 Aug 2025 20:15:18 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v3 1/7] Input: mc13783-pwrbutton: fix irq mixup
Date: Fri, 29 Aug 2025 20:15:11 +0000
Message-Id: <20250829201517.15374-2-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250829201517.15374-1-akurz@blala.de>
References: <20250829201517.15374-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mfd mc13xxx interrupt handling was migrated to regmap with commit
10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
As a consequence, button_irq() will get called with virtual irq instead
of chip-internal irq now. Add wrappers for the three supported interrupts.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 1c7faa9b7afe..4765b25bc9f6 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -88,6 +88,21 @@ static irqreturn_t button_irq(int irq, void *_priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t button1_irq(int irq, void *_priv)
+{
+	return button_irq(MC13783_IRQ_ONOFD1, _priv);
+}
+
+static irqreturn_t button2_irq(int irq, void *_priv)
+{
+	return button_irq(MC13783_IRQ_ONOFD2, _priv);
+}
+
+static irqreturn_t button3_irq(int irq, void *_priv)
+{
+	return button_irq(MC13783_IRQ_ONOFD3, _priv);
+}
+
 static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 {
 	const struct mc13xxx_buttons_platform_data *pdata;
@@ -137,7 +152,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
 
 		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD1,
-					  button_irq, "b1on", priv);
+					  button1_irq, "b1on", priv);
 		if (err) {
 			dev_dbg(&pdev->dev, "Can't request irq\n");
 			goto free_priv;
@@ -156,7 +171,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
 
 		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD2,
-					  button_irq, "b2on", priv);
+					  button2_irq, "b2on", priv);
 		if (err) {
 			dev_dbg(&pdev->dev, "Can't request irq\n");
 			goto free_irq_b1;
@@ -175,7 +190,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
 
 		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD3,
-					  button_irq, "b3on", priv);
+					  button3_irq, "b3on", priv);
 		if (err) {
 			dev_dbg(&pdev->dev, "Can't request irq: %d\n", err);
 			goto free_irq_b2;
-- 
2.39.5


