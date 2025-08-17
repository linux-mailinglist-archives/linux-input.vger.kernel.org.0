Return-Path: <linux-input+bounces-14060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9DBB2929F
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 12:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFBAE7A1D12
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 10:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AF824339D;
	Sun, 17 Aug 2025 10:23:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8412248B4;
	Sun, 17 Aug 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755426182; cv=none; b=T3KBK/Gd3PVqQBX/lsWPJFDFoScSBMz9OxE8lIVse1mBCm8hakqYTk1GxqkdLYUtV8e8KqQQTI/zLRVsj1aHLxyzIBnEUE+q/OeMVnGG1X/Qv2xmtmiyoWwmH65jemBalfxT55IyzbxOzbx84YBFj+M7k1lLV7V2Yaw5C/A06u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755426182; c=relaxed/simple;
	bh=585Abtsi7kLDK7HjA8PidTqFDuFQS3xTittK7OJfS58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fsIfSg1wECEUWRjrFDe6bMFUjDiAJ4ILUJVQyCxxVljRQXt39phCY6/lGivVQGQhT9vQRZnkwUu8bfsEK5ZdpkMwljQnSERprkhQBd80CNbIF1wbV45tzN4SvKfGFXoIjjufZCpvRrdusim5rGS4ifmCI9qmLU2AFYlbAPLGCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57HARrLH029800;
	Sun, 17 Aug 2025 10:27:53 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57HARrrt029795;
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
Subject: [PATCH 6/6] Input: mc13783-pwrbutton: add OF support
Date: Sun, 17 Aug 2025 10:27:50 +0000
Message-Id: <20250817102751.29709-7-akurz@blala.de>
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

Add OF support for the mc13783-pwrbutton so that it can be used with
modern DT based systems.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 78 +++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 49bc5d25f098..11a97ce070a5 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -29,6 +29,7 @@
 #include <linux/mfd/mc13783.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 struct mc13783_pwrb {
 	struct input_dev *pwr;
@@ -105,8 +106,75 @@ static irqreturn_t button3_irq(int irq, void *_priv)
 	return button_irq(MC13783_IRQ_ONOFD3, _priv);
 }
 
+#ifdef CONFIG_OF
+static inline struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(
+	struct platform_device *pdev)
+{
+	struct mc13xxx_buttons_platform_data *pdata;
+	struct device_node *parent, *child;
+	struct device *dev = &pdev->dev;
+	enum mc13xxx_chip_type chip = platform_get_device_id(pdev)->driver_data;
+	int ret = -ENODATA;
+
+	/* ONOFD3 is only supported for MC13783. */
+	int max_idx = chip != MC13XXX_CHIP_TYPE_MC13783 ? 2 : 1;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	parent = of_get_child_by_name(dev->parent->of_node, "pwrbuttons");
+	if (!parent)
+		goto out_node_put;
+
+	for_each_child_of_node(parent, child) {
+		u32 idx;
+		u8 dbnc = MC13783_BUTTON_DBNC_30MS;
+
+		if (of_property_read_u32(child, "reg", &idx))
+			continue;
+
+		if (idx > max_idx) {
+			dev_warn(dev, "reg out of range\n");
+			continue;
+		}
+
+		of_property_read_u8(child, "debounce-delay-value", &dbnc);
+		if (dbnc > MC13783_BUTTON_DBNC_750MS) {
+			dev_warn(dev, "debounce-delay-value out of range\n");
+			continue;
+		}
+
+		if (of_property_read_u32(child, "linux,code", &pdata->b_on_key[idx]))
+			continue;
+
+		if (of_property_read_bool(child, "active-low"))
+			pdata->b_on_flags[idx] |= MC13783_BUTTON_POL_INVERT;
+
+		if (of_property_read_bool(child, "enable-reset"))
+			pdata->b_on_flags[idx] |= MC13783_BUTTON_RESET_EN;
+
+		pdata->b_on_flags[idx] |= MC13783_BUTTON_ENABLE | dbnc;
+	}
+
+	ret = 0;
+
+out_node_put:
+	of_node_put(parent);
+
+	return ret ? ERR_PTR(ret) : pdata;
+}
+#else
+static inline struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(
+	struct platform_device *pdev)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	const struct mc13xxx_buttons_platform_data *pdata;
 	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
 	enum mc13xxx_chip_type chip = platform_get_device_id(pdev)->driver_data;
@@ -116,9 +184,13 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
-- 
2.39.5


