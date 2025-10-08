Return-Path: <linux-input+bounces-15304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A76BC380E
	for <lists+linux-input@lfdr.de>; Wed, 08 Oct 2025 08:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 994794EEE0B
	for <lists+linux-input@lfdr.de>; Wed,  8 Oct 2025 06:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417A42EB5A4;
	Wed,  8 Oct 2025 06:45:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE572EACFB;
	Wed,  8 Oct 2025 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759905946; cv=none; b=p36WiNwUo9/puoQH8XgmUV7e0yERGHJ+cM0T/rzhdGyGoXfDCOmiO63bhhoDB3qs8XbuTjbZquq33y0Ic12O2UfyG/CkNWsK2FiTnNu6NHA9OivF+Kap2s/0wi+vRPN3w9Y9waWx5v10FvBzoKLbyL5Og1/CpKLSXhoc+2pgCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759905946; c=relaxed/simple;
	bh=/+GETeLQjjLscAF7KRcPnmg2AU1mx2FJb5U3/C8fEbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IqssqRW5Iu/qYpxG5aU0UYEWlnCOW2r4QZXynmxof5idXxr5i2gbWp9CkcWcAy8balNfDTQpsTlx7IN6u8zfM83VmU7ERwkspp+zd20/1KBFET3MxfuRV9O0pmv53FOKl42N9OMb5tPBA2ndQpqis6bILR38a5onHRHrNYijxdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 5986i3Nd013938;
	Wed, 8 Oct 2025 06:44:03 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 5986i39M013934;
	Wed, 8 Oct 2025 06:44:03 GMT
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
Subject: [PATCH v5 4/5] Input: mc13783-pwrbutton: enable other mc13xxx PMIC
Date: Wed,  8 Oct 2025 06:44:00 +0000
Message-Id: <20251008064401.13863-5-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251008064401.13863-1-akurz@blala.de>
References: <20251008064401.13863-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All three mc13xxx types feature two common power buttons referred in
the datasheets as ONOFD[12] (mc13783) and PWRON[12] (mc13892/mc34708).
A third button is available on the mc13783 and mc13892 models, which
however uses distinct interrupt register bits.

Add support for mc13892/mc34708 to support all available power buttons
in the mc13xxx series.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/Kconfig             |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c | 131 +++++++++++--------------
 drivers/mfd/mc13xxx-core.c             |  22 ++++-
 include/linux/mfd/mc13783.h            |   4 +-
 include/linux/mfd/mc13892.h            |   1 +
 include/linux/mfd/mc13xxx.h            |   2 +
 6 files changed, 84 insertions(+), 80 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0e6b49fb54bc..c36c575f11e5 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -286,8 +286,8 @@ config INPUT_MC13783_PWRBUTTON
 	tristate "MC13783 ON buttons"
 	depends on MFD_MC13XXX
 	help
-	  Support the ON buttons of MC13783 PMIC as an input device
-	  reporting power button status.
+	  Support the ON buttons of MC13783/MC13892/MC34708 PMIC as an input
+	  device reporting power button status.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called mc13783-pwrbutton.
diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 2ee115d77b1c..08618c59197f 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -30,9 +30,16 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 
+struct mc13xxx_button_devtype {
+	int button_id_max;
+	const char *irq_name[3];
+	int irq_sense_reg[3];
+};
+
 struct mc13783_pwrb {
 	struct input_dev *pwr;
 	struct mc13xxx *mc13783;
+	const struct mc13xxx_button_devtype *devtype;
 	int flags;
 	unsigned short keymap[3];
 	int irq[3];
@@ -43,9 +50,6 @@ struct mc13783_pwrb {
 #define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
 
 #define MC13783_REG_INTERRUPT_SENSE_1		5
-#define MC13783_IRQSENSE1_ONOFD1S		(1 << 3)
-#define MC13783_IRQSENSE1_ONOFD2S		(1 << 4)
-#define MC13783_IRQSENSE1_ONOFD3S		(1 << 5)
 
 #define MC13783_REG_POWER_CONTROL_2		15
 #define MC13783_POWER_CONTROL_2_ON1BDBNC	4
@@ -63,17 +67,17 @@ static irqreturn_t button_irq(int irq, void *_priv)
 	mc13xxx_reg_read(priv->mc13783, MC13783_REG_INTERRUPT_SENSE_1, &val);
 
 	if (irq == priv->irq[0]) {
-		val = val & MC13783_IRQSENSE1_ONOFD1S ? 1 : 0;
+		val = val & (1 << priv->devtype->irq_sense_reg[0]) ? 1 : 0;
 		if (priv->flags & MC13783_PWRB_B1_POL_INVERT)
 			val ^= 1;
 		input_report_key(priv->pwr, priv->keymap[0], val);
 	} else if (irq == priv->irq[1]) {
-		val = val & MC13783_IRQSENSE1_ONOFD2S ? 1 : 0;
+		val = val & (1 << priv->devtype->irq_sense_reg[1]) ? 1 : 0;
 		if (priv->flags & MC13783_PWRB_B2_POL_INVERT)
 			val ^= 1;
 		input_report_key(priv->pwr, priv->keymap[1], val);
-	} else if (irq == priv->irq[2]) {
-		val = val & MC13783_IRQSENSE1_ONOFD3S ? 1 : 0;
+	} else if (irq == priv->irq[2] && priv->devtype->button_id_max >= 2) {
+		val = val & (1 << priv->devtype->irq_sense_reg[2]) ? 1 : 0;
 		if (priv->flags & MC13783_PWRB_B3_POL_INVERT)
 			val ^= 1;
 		input_report_key(priv->pwr, priv->keymap[2], val);
@@ -88,6 +92,8 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 {
 	const struct mc13xxx_buttons_platform_data *pdata;
 	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
+	struct mc13xxx_button_devtype *devtype =
+		(struct mc13xxx_button_devtype *)pdev->id_entry->driver_data;
 	struct input_dev *pwr;
 	struct mc13783_pwrb *priv;
 	int err = 0;
@@ -108,54 +114,36 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	if (devtype->button_id_max < 2 && pdata->b_on_flags[2] & 0x3) {
+		dev_err(&pdev->dev, "button not supported\n");
+		return -ENODEV;
+	}
+
 	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
 	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
 	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
 
 	priv->pwr = pwr;
 	priv->mc13783 = mc13783;
+	priv->devtype = devtype;
 
 	mc13xxx_lock(mc13783);
 
-	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE) {
-		priv->keymap[0] = pdata->b_on_key[0];
-		if (pdata->b_on_key[0] != KEY_RESERVED)
-			__set_bit(pdata->b_on_key[0], pwr->keybit);
+	for (int i = 0; i < devtype->button_id_max; i++) {
+		if ((pdata->b_on_flags[i] & MC13783_BUTTON_ENABLE) == 0)
+			continue;
 
-		if (pdata->b_on_flags[0] & MC13783_BUTTON_POL_INVERT)
-			priv->flags |= MC13783_PWRB_B1_POL_INVERT;
+		priv->keymap[i] = pdata->b_on_key[i];
+		if (pdata->b_on_key[i] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[i], pwr->keybit);
 
-		if (pdata->b_on_flags[0] & MC13783_BUTTON_RESET_EN)
-			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
+		if (pdata->b_on_flags[i] & MC13783_BUTTON_POL_INVERT)
+			priv->flags |= (MC13783_PWRB_B1_POL_INVERT << i);
 
-		irq = platform_get_irq_byname(pdev, "b1on");
+		if (pdata->b_on_flags[i] & MC13783_BUTTON_RESET_EN)
+			reg |= (MC13783_POWER_CONTROL_2_ON1BRSTEN << i);
 
-		if (irq < 0) {
-			dev_dbg(&pdev->dev, "Can't request irq\n");
-			goto free_mc13xxx_lock;
-		}
-
-		err = devm_request_any_context_irq(&pdev->dev, irq, button_irq,
-						   IRQF_ONESHOT, "b1on",
-						   priv);
-		if (err < 0)
-			goto free_mc13xxx_lock;
-
-		priv->irq[0] = irq;
-	}
-
-	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE) {
-		priv->keymap[1] = pdata->b_on_key[1];
-		if (pdata->b_on_key[1] != KEY_RESERVED)
-			__set_bit(pdata->b_on_key[1], pwr->keybit);
-
-		if (pdata->b_on_flags[1] & MC13783_BUTTON_POL_INVERT)
-			priv->flags |= MC13783_PWRB_B2_POL_INVERT;
-
-		if (pdata->b_on_flags[1] & MC13783_BUTTON_RESET_EN)
-			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
-
-		irq = platform_get_irq_byname(pdev, "b2on");
+		irq = platform_get_irq_byname(pdev, devtype->irq_name[i]);
 
 		if (irq < 0) {
 			dev_dbg(&pdev->dev, "Can't request irq\n");
@@ -163,39 +151,12 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		}
 
 		err = devm_request_any_context_irq(&pdev->dev, irq, button_irq,
-						   IRQF_ONESHOT, "b2on",
-						   priv);
+					   IRQF_ONESHOT, devtype->irq_name[i],
+					   priv);
 		if (err < 0)
 			goto free_mc13xxx_lock;
 
-		priv->irq[1] = irq;
-	}
-
-	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
-		priv->keymap[2] = pdata->b_on_key[2];
-		if (pdata->b_on_key[2] != KEY_RESERVED)
-			__set_bit(pdata->b_on_key[2], pwr->keybit);
-
-		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
-			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
-
-		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)
-			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
-
-		irq = platform_get_irq_byname(pdev, "b3on");
-
-		if (irq < 0) {
-			dev_dbg(&pdev->dev, "Can't request irq: %d\n", err);
-			goto free_mc13xxx_lock;
-		}
-
-		err = devm_request_any_context_irq(&pdev->dev, irq, button_irq,
-						   IRQF_ONESHOT, "b3on",
-						   priv);
-		if (err < 0)
-			goto free_mc13xxx_lock;
-
-		priv->irq[2] = irq;
+		priv->irq[i] = irq;
 	}
 
 	mc13xxx_reg_rmw(mc13783, MC13783_REG_POWER_CONTROL_2, 0x3FE, reg);
@@ -226,7 +187,33 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	return err;
 }
 
+static const struct mc13xxx_button_devtype mc13783_button_devtype = {
+	.button_id_max	= 2,
+	.irq_name = { "b1on", "b2on", "b3on" },
+	.irq_sense_reg = { 3, 4, 5 },
+};
+
+static const struct mc13xxx_button_devtype mc13892_button_devtype = {
+	.button_id_max	= 2,
+	.irq_name = { "b1on", "b2on", "b3on" },
+	.irq_sense_reg = { 3, 4, 2 },
+};
+
+static const struct mc13xxx_button_devtype mc34708_button_devtype = {
+	.button_id_max	= 1,
+	.irq_name = { "b1on", "b2on" },
+	.irq_sense_reg = { 3, 4 },
+};
+
+static const struct platform_device_id mc13xxx_pwrbutton_idtable[] = {
+	{ "mc13783-pwrbutton", (kernel_ulong_t)&mc13783_button_devtype },
+	{ "mc13892-pwrbutton", (kernel_ulong_t)&mc13892_button_devtype },
+	{ "mc34708-pwrbutton", (kernel_ulong_t)&mc34708_button_devtype },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver mc13783_pwrbutton_driver = {
+	.id_table	= mc13xxx_pwrbutton_idtable,
 	.probe		= mc13783_pwrbutton_probe,
 	.driver		= {
 		.name	= "mc13783-pwrbutton",
diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 1756c8d47d5e..c29974722704 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/mc13783.h>
+#include <linux/mfd/mc13892.h>
 
 #include "mc13xxx.h"
 
@@ -48,11 +49,22 @@
 #define MC13XXX_ADC2		45
 
 static const struct resource mc13783_button_resources[] = {
-	DEFINE_RES_IRQ_NAMED(MC13783_IRQ_ONOFD1, "b1on"),
-	DEFINE_RES_IRQ_NAMED(MC13783_IRQ_ONOFD2, "b2on"),
+	DEFINE_RES_IRQ_NAMED(MC13XXX_IRQ_PWRON1, "b1on"),
+	DEFINE_RES_IRQ_NAMED(MC13XXX_IRQ_PWRON2, "b2on"),
 	DEFINE_RES_IRQ_NAMED(MC13783_IRQ_ONOFD3, "b3on"),
 };
 
+static const struct resource mc13892_button_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MC13XXX_IRQ_PWRON1, "b1on"),
+	DEFINE_RES_IRQ_NAMED(MC13XXX_IRQ_PWRON2, "b2on"),
+	DEFINE_RES_IRQ_NAMED(MC13892_IRQ_PWRON3, "b3on"),
+};
+
+static const struct resource mc34708_button_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MC13XXX_IRQ_PWRON1, "b1on"),
+	DEFINE_RES_IRQ_NAMED(MC13XXX_IRQ_PWRON2, "b2on"),
+};
+
 void mc13xxx_lock(struct mc13xxx *mc13xxx)
 {
 	if (!mutex_trylock(&mc13xxx->lock)) {
@@ -216,14 +228,16 @@ EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13783);
 
 struct mc13xxx_variant mc13xxx_variant_mc13892 = {
 	.name = "mc13892",
-	.button_resources_size = 0,
+	.button_resources = mc13892_button_resources,
+	.button_resources_size = ARRAY_SIZE(mc13892_button_resources),
 	.print_revision = mc13xxx_print_revision,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13892);
 
 struct mc13xxx_variant mc13xxx_variant_mc34708 = {
 	.name = "mc34708",
-	.button_resources_size = 0,
+	.button_resources = mc34708_button_resources,
+	.button_resources_size = ARRAY_SIZE(mc34708_button_resources),
 	.print_revision = mc34708_print_revision,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc34708);
diff --git a/include/linux/mfd/mc13783.h b/include/linux/mfd/mc13783.h
index c25b1676741b..ab6db774e1fa 100644
--- a/include/linux/mfd/mc13783.h
+++ b/include/linux/mfd/mc13783.h
@@ -65,8 +65,8 @@
 #define MC13783_IRQ_UDM		23
 #define MC13783_IRQ_1HZ		MC13XXX_IRQ_1HZ
 #define MC13783_IRQ_TODA	MC13XXX_IRQ_TODA
-#define MC13783_IRQ_ONOFD1	27
-#define MC13783_IRQ_ONOFD2	28
+#define MC13783_IRQ_ONOFD1	MC13XXX_IRQ_PWRON1
+#define MC13783_IRQ_ONOFD2	MC13XXX_IRQ_PWRON2
 #define MC13783_IRQ_ONOFD3	29
 #define MC13783_IRQ_SYSRST	MC13XXX_IRQ_SYSRST
 #define MC13783_IRQ_RTCRST	MC13XXX_IRQ_RTCRST
diff --git a/include/linux/mfd/mc13892.h b/include/linux/mfd/mc13892.h
index 880cd949d12a..567d527825df 100644
--- a/include/linux/mfd/mc13892.h
+++ b/include/linux/mfd/mc13892.h
@@ -33,4 +33,5 @@
 #define MC13892_PWGT2SPI	22
 #define MC13892_VCOINCELL	23
 
+#define MC13892_IRQ_PWRON3	26
 #endif
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index 4437ab80fcf8..71c7d3614d4c 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -61,6 +61,8 @@ int mc13xxx_irq_unmask(struct mc13xxx *mc13xxx, int irq);
 #define MC13XXX_IRQ_LOBATH	14
 #define MC13XXX_IRQ_1HZ		24
 #define MC13XXX_IRQ_TODA	25
+#define MC13XXX_IRQ_PWRON1	27
+#define MC13XXX_IRQ_PWRON2	28
 #define MC13XXX_IRQ_SYSRST	30
 #define MC13XXX_IRQ_RTCRST	31
 #define MC13XXX_IRQ_PC		32
-- 
2.39.5


