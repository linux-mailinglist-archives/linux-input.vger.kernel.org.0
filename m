Return-Path: <linux-input+bounces-14270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A507CB32945
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 16:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7455653C7
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 14:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960F1267714;
	Sat, 23 Aug 2025 14:40:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C725EFB7;
	Sat, 23 Aug 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755960002; cv=none; b=oDgcoO7YTLU/fRFTrGupkb+SKo6gjIjG2YeoJqLvsC7h25dcUV42Gvw5IHZPTzY/pmnGgHOM8dUPC1oyl6ED0MQh8s3ZnzHNZJZZGadokzxvnER4GNy9lBWVlbq2xkoKmUfu6d9U0I+n+fHx6nKtnjm9PpZDjyqDNDIeqvmTOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755960002; c=relaxed/simple;
	bh=zwCKbGXggOaqJ8uTfRzG+GN5/bBIs5BndwN2dGTZa2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cg85iX7SPnpFGl5gcN61WjDKmkG0cF5XrRcaMICCrHPbe+7Bdkzx02gvQVcyPI0Q2V6/24XhPn7gv129bk61eG1W0LmnuD9sa8fvuVdW4JeDT8b/PryKjSbjR6mcVuL4kOLm6Ka4r4cyWSYSkDHi82dHZFpolussCg9iisGs5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57NEitku012723;
	Sat, 23 Aug 2025 14:44:55 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57NEitHI012718;
	Sat, 23 Aug 2025 14:44:55 GMT
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
Subject: [PATCH v2 3/9] Input: mc13783-pwrbutton: convert pdata members to array
Date: Sat, 23 Aug 2025 14:44:35 +0000
Message-Id: <20250823144441.12654-4-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250823144441.12654-1-akurz@blala.de>
References: <20250823144441.12654-1-akurz@blala.de>
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
 drivers/input/misc/mc13783-pwrbutton.c | 54 +++++++++++++-------------
 include/linux/mfd/mc13xxx.h            |  8 +---
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 9fd84b8d163d..ace9f286fd24 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -127,24 +127,24 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
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
@@ -155,15 +155,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
@@ -174,15 +174,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE) {
-		priv->keymap[2] = pdata->b3on_key;
-		if (pdata->b3on_key != KEY_RESERVED)
-			__set_bit(pdata->b3on_key, pwr->keybit);
+	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
+		priv->keymap[2] = pdata->b_on_key[2];
+		if (pdata->b_on_key[2] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[2], pwr->keybit);
 
-		if (pdata->b3on_flags & MC13783_BUTTON_POL_INVERT)
+		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
 			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
 
-		if (pdata->b3on_flags & MC13783_BUTTON_RESET_EN)
+		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
 
 		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD3,
@@ -218,15 +218,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
@@ -244,11 +244,11 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 
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
index f372926d5894..0393083af28a 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -187,12 +187,8 @@ struct mc13xxx_leds_platform_data {
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


