Return-Path: <linux-input+bounces-14392-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4710B3C39D
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 22:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF02A05D51
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 20:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8E52580DE;
	Fri, 29 Aug 2025 20:10:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7530238D42;
	Fri, 29 Aug 2025 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756498224; cv=none; b=Cz605no9M90t5dlIoAQteY7b0/MAmXB/hf1LljVtGl7P7A6pzcszzy7gKYFOQ2xFVZKqvslPpPZ+edVRPukNAEsDOq+qAhtSTfBB+rw2EZAdIxzawuSdmY45WyjBpVWej5zLTOS6cX+dVP0/X8MV/qetbZZ14Tl5N8N3PA2G9qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756498224; c=relaxed/simple;
	bh=MlWD0uXzHVUujtienSVm4PzgEV8DKzyPNLaItkFBVPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L7jb5B+PFpjg6YwvErDHRcRaaU34itkZtEkUkiIEcDgoOHCfR0U26cB2QNtI5Si//aIK7G3fuUGmm9EK5+xmM9JwdAgN6D1UiDmcaQgPmG23UhhG0s1X0V6torifnC1R2JEZih6H0f0QWpTgxNWpprU48yQRqzai79+/fDp4B5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57TKFJt6015473;
	Fri, 29 Aug 2025 20:15:19 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57TKFJdN015468;
	Fri, 29 Aug 2025 20:15:19 GMT
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
Subject: [PATCH v3 7/7] Input: mc13783-pwrbutton: add OF support
Date: Fri, 29 Aug 2025 20:15:17 +0000
Message-Id: <20250829201517.15374-8-akurz@blala.de>
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

Add OF support for the mc13783-pwrbutton so that it can be used with
modern DT based systems.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 94 +++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index c9eea57ceedd..a20236b19103 100644
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


