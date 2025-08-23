Return-Path: <linux-input+bounces-14274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A294B3295B
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 16:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543D616B152
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99F226FA6E;
	Sat, 23 Aug 2025 14:40:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B99261B6C;
	Sat, 23 Aug 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755960003; cv=none; b=CdcdRoM9ves7iPWWF9JigS8/2XjHFFLDRcTC9CW+dwPRu4xuSDECYgYQGgdoHpza9hbdBN/rIvmeDwt46piGs7URjX6prSDsg5OL6DKqvAfw1ALlKxtTxp8lVN/fq5ptl6r/mUnBhy9Nti9SL+TlcAMvyzrvdDOFeqBGHs0RYwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755960003; c=relaxed/simple;
	bh=+beTnrHFYYAkbuJ6t6U2fN6G9ThH7Eu8ABD5TMXa9yM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aieEZSejHezBqNzIdWwdtbpPjskMru+hGodH+B1IL8wsVMpawEVhlQ5forAZoF16nciK93DW8hSXFbklxleXMWVjcu5actjGpHeUiTB1ipXWrute/+QsmDzYhCk1ZaB5wo8ZRRp+rbu2q0+B+EYwzb2ZffO3p2QHhzF6UMoelb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57NEiuNq012771;
	Sat, 23 Aug 2025 14:44:56 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57NEiuXF012766;
	Sat, 23 Aug 2025 14:44:56 GMT
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
Subject: [PATCH v2 9/9] Input: mc13783-pwrbutton: add OF support
Date: Sat, 23 Aug 2025 14:44:41 +0000
Message-Id: <20250823144441.12654-10-akurz@blala.de>
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

Add OF support for the mc13783-pwrbutton so that it can be used with
modern DT based systems.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 94 +++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index c9eea57ceedd..f06d993b231c 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -27,6 +27,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/mc13783.h>
+#include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -109,8 +110,82 @@ static irqreturn_t button3_irq(int irq, void *_priv)
 	return button_irq(MC13783_IRQ_ONOFD3, _priv);
 }
 
-static int mc13783_pwrbutton_probe(struct platform_device *pdev)
+#ifdef CONFIG_OF
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
+	fwnode_for_each_child_node(parent, child) {
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
+#else
+static inline struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(
+	struct platform_device *pdev)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+static int __init mc13783_pwrbutton_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	const struct mc13xxx_buttons_platform_data *pdata;
 	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
 	struct mc13xxx_button_devtype *devtype =
@@ -121,9 +196,13 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	int reg = 0;
 
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
@@ -290,15 +369,14 @@ static const struct platform_device_id mc13xxx_pwrbutton_idtable[] = {
 };
 
 static struct platform_driver mc13783_pwrbutton_driver = {
-	.id_table	= mc13xxx_pwrbutton_idtable,
-	.probe		= mc13783_pwrbutton_probe,
-	.remove		= mc13783_pwrbutton_remove,
 	.driver		= {
 		.name	= "mc13783-pwrbutton",
 	},
+	.id_table	= mc13xxx_pwrbutton_idtable,
+	.remove		= mc13783_pwrbutton_remove,
 };
 
-module_platform_driver(mc13783_pwrbutton_driver);
+module_platform_driver_probe(mc13783_pwrbutton_driver, mc13783_pwrbutton_probe);
 
 MODULE_ALIAS("platform:mc13783-pwrbutton");
 MODULE_DESCRIPTION("MC13783 Power Button");
-- 
2.39.5


