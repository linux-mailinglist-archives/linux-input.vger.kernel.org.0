Return-Path: <linux-input+bounces-14064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750AB292A8
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 12:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30BC17A571F
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 10:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE9324A043;
	Sun, 17 Aug 2025 10:23:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4B23D298;
	Sun, 17 Aug 2025 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755426183; cv=none; b=jY+9okbXVlWfZEb5ciPNjZfTHgDCfz/7a88ghLp9okjEqmIEP1es7CcQ0qvKcm/Asr3Y1v+e3JH8v4Z7ira6/AymsFZNuK/3vm3smScV6t8/Jzzc6pN6Rmowx5Uf/H3Owz6VJPywx71qo/FnSCGK3fUA+MqKtSsnne001DyZhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755426183; c=relaxed/simple;
	bh=q8/DbBKbrBgEINTYssy1UUKBdYsb7f2nRa/oHEffnS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cP5X9ye7PuDTRKv57Ma0Ru89jFiHxnIssZbgbU1ETEADi3rY0MKqpJvf0vXS1mocI16ygQK6vcip/9FY0vFrcuKkNsrRs6mcquciFAkXEP+BZvm1WGoDwzCyYWzGBPq5Zhl/7fXgpBh1DF0V44CEZSfXlOY2621X3U+zkHaMT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57HARr82029784;
	Sun, 17 Aug 2025 10:27:53 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57HARrHB029779;
	Sun, 17 Aug 2025 10:27:53 GMT
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
Subject: [PATCH 4/6] Input: mc13783-pwrbutton: convert members to array
Date: Sun, 17 Aug 2025 10:27:48 +0000
Message-Id: <20250817102751.29709-5-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250817102751.29709-1-akurz@blala.de>
References: <20250817102751.29709-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As preparation for mc13783-pwrbutton OF support, convert the members of
mc13xxx_buttons_platform_data to arrays to allow index access within
the next commit.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 56 +++++++++++++-------------
 include/linux/mfd/mc13xxx.h            |  8 +---
 2 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index cb2f25a1a757..49bc5d25f098 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -130,28 +130,28 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* ONOFD3 is only supported for MC13783. */
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE &&
+	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE &&
 		chip != MC13XXX_CHIP_TYPE_MC13783)
 		return -ENODEV;
 
-	reg |= (pdata->b1on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
-	reg |= (pdata->b2on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
-	reg |= (pdata->b3on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
+	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
+	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
+	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
 
 	priv->pwr = pwr;
 	priv->mc13783 = mc13783;
 
 	mc13xxx_lock(mc13783);
 
-	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE) {
-		priv->keymap[0] = pdata->b1on_key;
-		if (pdata->b1on_key != KEY_RESERVED)
-			__set_bit(pdata->b1on_key, pwr->keybit);
+	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE) {
+		priv->keymap[0] = pdata->b_on_key[0];
+		if (pdata->b_on_key[0] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[0], pwr->keybit);
 
-		if (pdata->b1on_flags & MC13783_BUTTON_POL_INVERT)
+		if (pdata->b_on_flags[0] & MC13783_BUTTON_POL_INVERT)
 			priv->flags |= MC13783_PWRB_B1_POL_INVERT;
 
-		if (pdata->b1on_flags & MC13783_BUTTON_RESET_EN)
+		if (pdata->b_on_flags[0] & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
 
 		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD1,
@@ -162,15 +162,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE) {
-		priv->keymap[1] = pdata->b2on_key;
-		if (pdata->b2on_key != KEY_RESERVED)
-			__set_bit(pdata->b2on_key, pwr->keybit);
+	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE) {
+		priv->keymap[1] = pdata->b_on_key[1];
+		if (pdata->b_on_key[1] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[1], pwr->keybit);
 
-		if (pdata->b2on_flags & MC13783_BUTTON_POL_INVERT)
+		if (pdata->b_on_flags[1] & MC13783_BUTTON_POL_INVERT)
 			priv->flags |= MC13783_PWRB_B2_POL_INVERT;
 
-		if (pdata->b2on_flags & MC13783_BUTTON_RESET_EN)
+		if (pdata->b_on_flags[1] & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
 
 		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD2,
@@ -181,15 +181,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE) {
-		priv->keymap[2] = pdata->b3on_key;
-		if (pdata->b3on_key != KEY_RESERVED)
-			__set_bit(pdata->b3on_key, pwr->keybit);
+	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
+		priv->keymap[2] = pdata->b_on_key[3];
+		if (pdata->b_on_key[3] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[3], pwr->keybit);
 
-		if (pdata->b3on_flags & MC13783_BUTTON_POL_INVERT)
+		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
 			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
 
-		if (pdata->b3on_flags & MC13783_BUTTON_RESET_EN)
+		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
 
 		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD3,
@@ -225,15 +225,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 free_irq:
 	mc13xxx_lock(mc13783);
 
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE)
+	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD3, priv);
 
 free_irq_b2:
-	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE)
+	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD2, priv);
 
 free_irq_b1:
-	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
+	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD1, priv);
 
 free_mc13xxx_lock:
@@ -251,11 +251,11 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 
 	mc13xxx_lock(priv->mc13783);
 
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE)
+	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD3, priv);
-	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE)
+	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD2, priv);
-	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
+	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD1, priv);
 
 	mc13xxx_unlock(priv->mc13783);
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index 6984ea69db3e..8bd25b0532ba 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -196,12 +196,8 @@ struct mc13xxx_leds_platform_data {
 #define MC13783_BUTTON_RESET_EN		(1 << 4)
 
 struct mc13xxx_buttons_platform_data {
-	int b1on_flags;
-	unsigned short b1on_key;
-	int b2on_flags;
-	unsigned short b2on_key;
-	int b3on_flags;
-	unsigned short b3on_key;
+	int b_on_flags[3];
+	unsigned int b_on_key[3];
 };
 
 #define MC13783_TS_ATO_FIRST	false
-- 
2.39.5


