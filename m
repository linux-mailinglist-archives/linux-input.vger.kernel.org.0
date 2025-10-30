Return-Path: <linux-input+bounces-15815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA414C22125
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 20:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2F094E2921
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 19:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BCA30F534;
	Thu, 30 Oct 2025 19:51:54 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D82192F5;
	Thu, 30 Oct 2025 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853914; cv=none; b=P9Ya4hBUqWSQRF/2/qKBCIPRbyHfeUFrrUDXU85PxQFAXDMpg6dPDUWv24eSq/ATLqdLcH66CW63s/QFEwu/t48g0HH3AOp7HA9oX1p1d3plu8vyeBAsNHkJAUcL6mg2+FmOAsUghS5ntqtDkn4XqIo+CYzqwb2TsigYIM/L0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853914; c=relaxed/simple;
	bh=G0xQgQyrwSJHVmBE1CSnLN/FrJeKs1BASiMsyj5D/lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XsC0T1rSlZJcNq1dUN87/gb0NATeBnEpvOnTg8lAknINn9HKU0HylHzUxJg6dVVYG33E9Ailas3vnHcYflGHT4ZhPkL8I1AQvWRUfxOhoW7mSRgLjTV6hn9osIwOA9NfHNFOVDlY2d6JBWJnNRk+Kd9ZhXRtD3Do3IeNcG6pGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59UJvBY4020199;
	Thu, 30 Oct 2025 19:57:11 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59UJvBit020194;
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
Subject: [PATCH v6 1/6] Input: mc13783-pwrbutton: use managed resources
Date: Thu, 30 Oct 2025 19:56:49 +0000
Message-Id: <20251030195654.20142-2-akurz@blala.de>
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

Use devres functionality to simplify resource freeing, dev.parent will
be set by devm_input_allocate_device().

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 28 ++++++++------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index b83d762ae2e9..82434ea9cca5 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -21,6 +21,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
@@ -102,18 +103,13 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
@@ -139,7 +135,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 					  button_irq, "b1on", priv);
 		if (err) {
 			dev_dbg(&pdev->dev, "Can't request irq\n");
-			goto free_priv;
+			goto free_mc13xxx_lock;
 		}
 	}
 
@@ -187,7 +183,6 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 
 	pwr->name = "mc13783_pwrbutton";
 	pwr->phys = "mc13783_pwrbutton/input0";
-	pwr->dev.parent = &pdev->dev;
 
 	pwr->keycode = priv->keymap;
 	pwr->keycodemax = ARRAY_SIZE(priv->keymap);
@@ -218,12 +213,8 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
@@ -245,9 +236,6 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD1, priv);
 
 	mc13xxx_unlock(priv->mc13783);
-
-	input_unregister_device(priv->pwr);
-	kfree(priv);
 }
 
 static struct platform_driver mc13783_pwrbutton_driver = {
-- 
2.39.5


