Return-Path: <linux-input+bounces-14062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47282B292A2
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 12:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C82031B239AC
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 10:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2795B247293;
	Sun, 17 Aug 2025 10:23:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6148A223337;
	Sun, 17 Aug 2025 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755426183; cv=none; b=W9MirwoFV19fN7F2KvwSojHEoYX/W3q+XwMaGaON1+pb1WflGyUyw2WZxKHJmly23rAA8LcB6HIbcXSQSx3DKwiPujTfaZp2dvwqvcPZDZg59Bhy2k1zKgZz/KFEbELfieXTQSSedjOWn83dH0zTfgKUxhX8A0Ina0sKXMdWMis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755426183; c=relaxed/simple;
	bh=VTgi9DtXP6kPqmsaARkv7ETfo+rq9PKhR/wvxlwOHFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PqO1BechWGCHgPacGTqzY5+tT6kcDSEsofhmgMyhqK/V837XaOsBsHGpBklO5dV7xiEGzj6dYAub1/zES6C36SpLsFtsScKgQ/xZ2dzZIgEHQehwHMg5/F9kOZ8J58rN/nfkG4xWOoBg3wPih0GF1sFyqXMOG9J9du645VZLLok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57HARruk029768;
	Sun, 17 Aug 2025 10:27:53 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57HARrq7029764;
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
Subject: [PATCH 2/6] Input: mc13783-pwrbutton: use managed resources
Date: Sun, 17 Aug 2025 10:27:46 +0000
Message-Id: <20250817102751.29709-3-akurz@blala.de>
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

Use devres functionality to simplify resource freeing, dev.parent will
be set by devm_input_allocate_device().

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 28 ++++++++------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 4765b25bc9f6..9fd84b8d163d 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -21,6 +21,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
@@ -118,18 +119,13 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	pwr = input_allocate_device();
-	if (!pwr) {
-		dev_dbg(&pdev->dev, "Can't allocate power button\n");
+	pwr = devm_input_allocate_device(&pdev->dev);
+	if (!pwr)
 		return -ENOMEM;
-	}
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		err = -ENOMEM;
-		dev_dbg(&pdev->dev, "Can't allocate power button\n");
-		goto free_input_dev;
-	}
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
 	reg |= (pdata->b1on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
 	reg |= (pdata->b2on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
@@ -155,7 +151,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 					  button1_irq, "b1on", priv);
 		if (err) {
 			dev_dbg(&pdev->dev, "Can't request irq\n");
-			goto free_priv;
+			goto free_mc13xxx_lock;
 		}
 	}
 
@@ -203,7 +199,6 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 
 	pwr->name = "mc13783_pwrbutton";
 	pwr->phys = "mc13783_pwrbutton/input0";
-	pwr->dev.parent = &pdev->dev;
 
 	pwr->keycode = priv->keymap;
 	pwr->keycodemax = ARRAY_SIZE(priv->keymap);
@@ -234,12 +229,8 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD1, priv);
 
-free_priv:
+free_mc13xxx_lock:
 	mc13xxx_unlock(mc13783);
-	kfree(priv);
-
-free_input_dev:
-	input_free_device(pwr);
 
 	return err;
 }
@@ -261,9 +252,6 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD1, priv);
 
 	mc13xxx_unlock(priv->mc13783);
-
-	input_unregister_device(priv->pwr);
-	kfree(priv);
 }
 
 static struct platform_driver mc13783_pwrbutton_driver = {
-- 
2.39.5


