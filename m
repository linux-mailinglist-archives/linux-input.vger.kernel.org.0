Return-Path: <linux-input+bounces-15818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E509C22158
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 20:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CA183BF46C
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 19:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F22F329C52;
	Thu, 30 Oct 2025 19:51:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F22FF171;
	Thu, 30 Oct 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853915; cv=none; b=dmd9rNuIRWBvVMmRT0v/ZV93NdTAJHf+IdbxrW+//KJVJFpdDIDQ54pw/PgYD7g6rNv6e2hT/Snjefg0tKIT+2HaRcaK6ciFlqjqtNQNmjL5X755h61U4zoPpx+dq+iEbEKjOeyocM4vWkMm5nZ6fGWtWRN6rK56XWAnFXbzIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853915; c=relaxed/simple;
	bh=f3nk6RtA5IYDVa82v6LnaN3lzAk1OrTgcNHp4zY+tDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YcFdPCbVe7eY6PgIuzT716sMpHcr97LeFRrGE9A3EFJofx6fzqQkiqdqr055dwLmmQbPtxIfSeaoJppCffG6p6SieBmzX/SRqNFY4JpwSWo9TC0OBVW23crd26IPUGLluzhbWuDLMiwHG8Syg7wJqQ7GX3lrxwknoeIJNmUKaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59UJvBPJ020215;
	Thu, 30 Oct 2025 19:57:11 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59UJvBeG020212;
	Thu, 30 Oct 2025 19:57:11 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Dr . David Alan Gilbert" <linux@treblig.org>,
        Job Sava <jsava@criticallink.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v6 3/6] Input: mc13783-pwrbutton: convert pdata members to array
Date: Thu, 30 Oct 2025 19:56:51 +0000
Message-Id: <20251030195654.20142-4-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251030195654.20142-1-akurz@blala.de>
References: <20251030195654.20142-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As preparation for the extension of support for all three mc13xxx
variants, convert the members of mc13xxx_buttons_platform_data to
arrays to allow index access within the next commit.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 42 +++++++++++++-------------
 include/linux/mfd/mc13xxx.h            |  8 ++---
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 20f68aab6edf..2ee115d77b1c 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -108,24 +108,24 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
 
 		irq = platform_get_irq_byname(pdev, "b1on");
@@ -144,15 +144,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		priv->irq[0] = irq;
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
 
 		irq = platform_get_irq_byname(pdev, "b2on");
@@ -171,15 +171,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		priv->irq[1] = irq;
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
 
 		irq = platform_get_irq_byname(pdev, "b3on");
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index dd46fe424a80..4437ab80fcf8 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -181,12 +181,8 @@ struct mc13xxx_leds_platform_data {
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


