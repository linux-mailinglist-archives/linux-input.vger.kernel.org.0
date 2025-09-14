Return-Path: <linux-input+bounces-14716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A4B56BC5
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 21:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14BC71896E78
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9669A2E1720;
	Sun, 14 Sep 2025 19:35:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A92E11B8;
	Sun, 14 Sep 2025 19:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878552; cv=none; b=NqEt7pV+6W/VbdxqcHxMK7wcnHEnZNvkFiONtWxY7Gu9rKBq7BalLVPqqagBv802OAvzJaHuDJ6RNKjasSYj+Pz+LqKKUXOHrw85Izxql8mJNvXLjBHVStG5jxPqVbv3ELDqFWEM7NzFLMr5QgkFo3ETs2nJcp+fTJsN2/krgqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878552; c=relaxed/simple;
	bh=wQiby7wRPkklNCARvA/jcIM2aN/AonZNYqQIMPKvH1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TqSzHPfzNuLG2GWQ81GfjukecERciHLFueqhy8azhL/4u1rYN5tyEJaroOIhkRyyXlK9qHDK5wUDUKYiiqshpgV9DjnyBhuK5g7+zqxUICOEODk0gqR6RY4Lhv+k1wb6Ak7i9H70+idH4wfIamFYBO1OVNzxa16J0uao7BPWpkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 58EJbQuU010651;
	Sun, 14 Sep 2025 19:37:26 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 58EJbQEI010646;
	Sun, 14 Sep 2025 19:37:26 GMT
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
Subject: [PATCH v4 8/8] Input: mc13783-pwrbutton: add OF support
Date: Sun, 14 Sep 2025 19:37:23 +0000
Message-Id: <20250914193723.10544-9-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250914193723.10544-1-akurz@blala.de>
References: <20250914193723.10544-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add OF support for the mc13783-pwrbutton so that it can be used with
modern DT based systems.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 82 ++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 08618c59197f..46bef0af46ee 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -27,6 +27,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/mc13783.h>
+#include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -88,8 +89,74 @@ static irqreturn_t button_irq(int irq, void *_priv)
 	return IRQ_HANDLED;
 }
 
-static int mc13783_pwrbutton_probe(struct platform_device *pdev)
+static struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(
+	struct platform_device *pdev)
 {
+	struct mc13xxx_buttons_platform_data *pdata;
+	struct fwnode_handle *child;
+	struct device *dev = &pdev->dev;
+	struct mc13xxx_button_devtype *devtype =
+		(struct mc13xxx_button_devtype *)platform_get_device_id(pdev)->driver_data;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	struct fwnode_handle *parent __free(fwnode_handle) =
+		device_get_named_child_node(dev->parent, "buttons");
+	if (!parent)
+		return ERR_PTR(-ENODATA);
+
+	fwnode_for_each_named_child_node(parent, child, "onkey") {
+		u32 idx;
+		u8 dbnc = MC13783_BUTTON_DBNC_30MS;
+		u16 dbnc_ms;
+
+		if (fwnode_property_read_u32(child, "reg", &idx))
+			continue;
+
+		if (idx > devtype->button_id_max) {
+			dev_warn(dev, "reg out of range\n");
+			continue;
+		}
+
+		fwnode_property_read_u16(child, "debounce-delay-ms", &dbnc_ms);
+		switch (dbnc_ms) {
+		case 0:
+			dbnc = MC13783_BUTTON_DBNC_0MS;
+			break;
+		case 30:
+			dbnc = MC13783_BUTTON_DBNC_30MS;
+			break;
+		case 150:
+			dbnc = MC13783_BUTTON_DBNC_150MS;
+			break;
+		case 750:
+			dbnc = MC13783_BUTTON_DBNC_750MS;
+			break;
+		default:
+			dev_warn(dev, "invalid debounce-delay-ms value\n");
+			continue;
+		}
+
+		if (fwnode_property_read_u32(child, "linux,code", &pdata->b_on_key[idx]))
+			continue;
+
+		if (fwnode_property_read_bool(child, "active-low"))
+			pdata->b_on_flags[idx] |= MC13783_BUTTON_POL_INVERT;
+
+		if (fwnode_property_read_bool(child, "fsl,enable-reset"))
+			pdata->b_on_flags[idx] |= MC13783_BUTTON_RESET_EN;
+
+		pdata->b_on_flags[idx] |= MC13783_BUTTON_ENABLE | dbnc;
+	}
+
+	return pdata;
+}
+
+static int __init mc13783_pwrbutton_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	const struct mc13xxx_buttons_platform_data *pdata;
 	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
 	struct mc13xxx_button_devtype *devtype =
@@ -101,9 +168,13 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	int irq = 0;
 
 	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "missing platform data\n");
-		return -ENODEV;
+	if (dev->parent->of_node) {
+		pdata = mc13xxx_pwrbutton_probe_dt(pdev);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
+	} else if (!pdata) {
+		dev_err(dev, "missing platform data\n");
+		return -ENODATA;
 	}
 
 	pwr = devm_input_allocate_device(&pdev->dev);
@@ -214,13 +285,12 @@ static const struct platform_device_id mc13xxx_pwrbutton_idtable[] = {
 
 static struct platform_driver mc13783_pwrbutton_driver = {
 	.id_table	= mc13xxx_pwrbutton_idtable,
-	.probe		= mc13783_pwrbutton_probe,
 	.driver		= {
 		.name	= "mc13783-pwrbutton",
 	},
 };
 
-module_platform_driver(mc13783_pwrbutton_driver);
+module_platform_driver_probe(mc13783_pwrbutton_driver, mc13783_pwrbutton_probe);
 
 MODULE_ALIAS("platform:mc13783-pwrbutton");
 MODULE_DESCRIPTION("MC13783 Power Button");
-- 
2.39.5


