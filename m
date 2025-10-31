Return-Path: <linux-input+bounces-15841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694A2C26D55
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 20:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 272F4400BDB
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 19:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB97231AF1E;
	Fri, 31 Oct 2025 19:52:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63483126DE;
	Fri, 31 Oct 2025 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761940321; cv=none; b=RlW4DB0a2S+pXec4n1fIPrVmNRFbjdVvcgS1+gaBP4FGOGpfhYVkS8CBr4sLUSaz/Z2jhxogGBtQXJWEtAyMYG70D1d55gd/WDPAoqCzGvs28zT+awjByGd116h0jdGUGvy9E1u7seEb1WUrji22Imv6aLULNN6qq51fKw9dCTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761940321; c=relaxed/simple;
	bh=YUcyedh+Ntez3IQlxuY7679Cka78QeSfCB23BV2KlBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SssNKgjwvF7wkpLhCsZT84BwfIck7F8RR9v76oYVzwcN0BpkfjtT4lTcqdLrnWFJldfSaChsF3sfFDkOoao6Bxzhgp0kUMAORlQgeUrQ8j/ZrTQTy/QGXezX1lgyV625VkuTimLBaaPTTDFQHyRk+UN2Mq8weHR1enQ0N3YLJWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59VJvKHv001646;
	Fri, 31 Oct 2025 19:57:20 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59VJvKAD001642;
	Fri, 31 Oct 2025 19:57:20 GMT
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
Subject: [PATCH v7 2/6] Input: mc13783-pwrbutton: fix irq mixup and use resources
Date: Fri, 31 Oct 2025 19:57:14 +0000
Message-Id: <20251031195718.1586-3-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251031195718.1586-1-akurz@blala.de>
References: <20251031195718.1586-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mfd mc13xxx interrupt handling was migrated to regmap with commit
10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
As a consequence, button_irq() got get called with virtual irq instead
of chip-internal irq.

Make use of mfd_cell resources to pass interrupts from mfd so that
platform_get_irq_byname() can be used in mc13783-pwrbutton. The
amount of required interrupt related cleanup can be reduced this way.

Note, that mc13783-pwrbutton is still considered to support only the
model mc13783.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 103 +++++++++++--------------
 drivers/mfd/mc13xxx-core.c             |  39 ++++++++--
 drivers/mfd/mc13xxx.h                  |   2 +
 3 files changed, 79 insertions(+), 65 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 82434ea9cca5..20f68aab6edf 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -33,13 +33,15 @@
 struct mc13783_pwrb {
 	struct input_dev *pwr;
 	struct mc13xxx *mc13783;
-#define MC13783_PWRB_B1_POL_INVERT	(1 << 0)
-#define MC13783_PWRB_B2_POL_INVERT	(1 << 1)
-#define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
 	int flags;
 	unsigned short keymap[3];
+	int irq[3];
 };
 
+#define MC13783_PWRB_B1_POL_INVERT	(1 << 0)
+#define MC13783_PWRB_B2_POL_INVERT	(1 << 1)
+#define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
+
 #define MC13783_REG_INTERRUPT_SENSE_1		5
 #define MC13783_IRQSENSE1_ONOFD1S		(1 << 3)
 #define MC13783_IRQSENSE1_ONOFD2S		(1 << 4)
@@ -60,27 +62,21 @@ static irqreturn_t button_irq(int irq, void *_priv)
 
 	mc13xxx_reg_read(priv->mc13783, MC13783_REG_INTERRUPT_SENSE_1, &val);
 
-	switch (irq) {
-	case MC13783_IRQ_ONOFD1:
+	if (irq == priv->irq[0]) {
 		val = val & MC13783_IRQSENSE1_ONOFD1S ? 1 : 0;
 		if (priv->flags & MC13783_PWRB_B1_POL_INVERT)
 			val ^= 1;
 		input_report_key(priv->pwr, priv->keymap[0], val);
-		break;
-
-	case MC13783_IRQ_ONOFD2:
+	} else if (irq == priv->irq[1]) {
 		val = val & MC13783_IRQSENSE1_ONOFD2S ? 1 : 0;
 		if (priv->flags & MC13783_PWRB_B2_POL_INVERT)
 			val ^= 1;
 		input_report_key(priv->pwr, priv->keymap[1], val);
-		break;
-
-	case MC13783_IRQ_ONOFD3:
+	} else if (irq == priv->irq[2]) {
 		val = val & MC13783_IRQSENSE1_ONOFD3S ? 1 : 0;
 		if (priv->flags & MC13783_PWRB_B3_POL_INVERT)
 			val ^= 1;
 		input_report_key(priv->pwr, priv->keymap[2], val);
-		break;
 	}
 
 	input_sync(priv->pwr);
@@ -96,6 +92,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	struct mc13783_pwrb *priv;
 	int err = 0;
 	int reg = 0;
+	int irq = 0;
 
 	pdata = dev_get_platdata(&pdev->dev);
 	if (!pdata) {
@@ -131,12 +128,20 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		if (pdata->b1on_flags & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
 
-		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD1,
-					  button_irq, "b1on", priv);
-		if (err) {
+		irq = platform_get_irq_byname(pdev, "b1on");
+
+		if (irq < 0) {
 			dev_dbg(&pdev->dev, "Can't request irq\n");
 			goto free_mc13xxx_lock;
 		}
+
+		err = devm_request_any_context_irq(&pdev->dev, irq, button_irq,
+						   IRQF_ONESHOT, "b1on",
+						   priv);
+		if (err < 0)
+			goto free_mc13xxx_lock;
+
+		priv->irq[0] = irq;
 	}
 
 	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE) {
@@ -150,12 +155,20 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		if (pdata->b2on_flags & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
 
-		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD2,
-					  button_irq, "b2on", priv);
-		if (err) {
+		irq = platform_get_irq_byname(pdev, "b2on");
+
+		if (irq < 0) {
 			dev_dbg(&pdev->dev, "Can't request irq\n");
-			goto free_irq_b1;
+			goto free_mc13xxx_lock;
 		}
+
+		err = devm_request_any_context_irq(&pdev->dev, irq, button_irq,
+						   IRQF_ONESHOT, "b2on",
+						   priv);
+		if (err < 0)
+			goto free_mc13xxx_lock;
+
+		priv->irq[1] = irq;
 	}
 
 	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE) {
@@ -169,12 +182,20 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		if (pdata->b3on_flags & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
 
-		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD3,
-					  button_irq, "b3on", priv);
-		if (err) {
+		irq = platform_get_irq_byname(pdev, "b3on");
+
+		if (irq < 0) {
 			dev_dbg(&pdev->dev, "Can't request irq: %d\n", err);
-			goto free_irq_b2;
+			goto free_mc13xxx_lock;
 		}
+
+		err = devm_request_any_context_irq(&pdev->dev, irq, button_irq,
+						   IRQF_ONESHOT, "b3on",
+						   priv);
+		if (err < 0)
+			goto free_mc13xxx_lock;
+
+		priv->irq[2] = irq;
 	}
 
 	mc13xxx_reg_rmw(mc13783, MC13783_REG_POWER_CONTROL_2, 0x3FE, reg);
@@ -192,55 +213,21 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	err = input_register_device(pwr);
 	if (err) {
 		dev_dbg(&pdev->dev, "Can't register power button: %d\n", err);
-		goto free_irq;
+		return err;
 	}
 
 	platform_set_drvdata(pdev, priv);
 
 	return 0;
 
-free_irq:
-	mc13xxx_lock(mc13783);
-
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE)
-		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD3, priv);
-
-free_irq_b2:
-	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE)
-		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD2, priv);
-
-free_irq_b1:
-	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
-		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD1, priv);
-
 free_mc13xxx_lock:
 	mc13xxx_unlock(mc13783);
 
 	return err;
 }
 
-static void mc13783_pwrbutton_remove(struct platform_device *pdev)
-{
-	struct mc13783_pwrb *priv = platform_get_drvdata(pdev);
-	const struct mc13xxx_buttons_platform_data *pdata;
-
-	pdata = dev_get_platdata(&pdev->dev);
-
-	mc13xxx_lock(priv->mc13783);
-
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE)
-		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD3, priv);
-	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE)
-		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD2, priv);
-	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
-		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD1, priv);
-
-	mc13xxx_unlock(priv->mc13783);
-}
-
 static struct platform_driver mc13783_pwrbutton_driver = {
 	.probe		= mc13783_pwrbutton_probe,
-	.remove		= mc13783_pwrbutton_remove,
 	.driver		= {
 		.name	= "mc13783-pwrbutton",
 	},
diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 920797b806ce..1756c8d47d5e 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -13,6 +13,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/core.h>
+#include <linux/mfd/mc13783.h>
 
 #include "mc13xxx.h"
 
@@ -46,6 +47,12 @@
 
 #define MC13XXX_ADC2		45
 
+static const struct resource mc13783_button_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MC13783_IRQ_ONOFD1, "b1on"),
+	DEFINE_RES_IRQ_NAMED(MC13783_IRQ_ONOFD2, "b2on"),
+	DEFINE_RES_IRQ_NAMED(MC13783_IRQ_ONOFD3, "b3on"),
+};
+
 void mc13xxx_lock(struct mc13xxx *mc13xxx)
 {
 	if (!mutex_trylock(&mc13xxx->lock)) {
@@ -201,18 +208,22 @@ static void mc34708_print_revision(struct mc13xxx *mc13xxx, u32 revision)
 /* These are only exported for mc13xxx-i2c and mc13xxx-spi */
 struct mc13xxx_variant mc13xxx_variant_mc13783 = {
 	.name = "mc13783",
+	.button_resources = mc13783_button_resources,
+	.button_resources_size = ARRAY_SIZE(mc13783_button_resources),
 	.print_revision = mc13xxx_print_revision,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13783);
 
 struct mc13xxx_variant mc13xxx_variant_mc13892 = {
 	.name = "mc13892",
+	.button_resources_size = 0,
 	.print_revision = mc13xxx_print_revision,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13892);
 
 struct mc13xxx_variant mc13xxx_variant_mc34708 = {
 	.name = "mc34708",
+	.button_resources_size = 0,
 	.print_revision = mc34708_print_revision,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc34708);
@@ -362,15 +373,18 @@ int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
 }
 EXPORT_SYMBOL_GPL(mc13xxx_adc_do_conversion);
 
-static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
-		const char *format, void *pdata, size_t pdata_size)
+static int mc13xxx_add_subdevice_pdata_res(struct mc13xxx *mc13xxx,
+		const char *format, void *pdata, size_t pdata_size,
+		const struct resource *resources, int num_resources)
 {
 	char buf[30];
 	const char *name = mc13xxx_get_chipname(mc13xxx);
 
 	struct mfd_cell cell = {
-		.platform_data = pdata,
-		.pdata_size = pdata_size,
+		.platform_data	= pdata,
+		.pdata_size	= pdata_size,
+		.resources	= resources,
+		.num_resources	= num_resources,
 	};
 
 	/* there is no asnprintf in the kernel :-( */
@@ -385,6 +399,12 @@ static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
 			       regmap_irq_get_domain(mc13xxx->irq_data));
 }
 
+static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
+		const char *format, void *pdata, size_t pdata_size)
+{
+	return mc13xxx_add_subdevice_pdata_res(mc13xxx, format, pdata, pdata_size, NULL, 0);
+}
+
 static int mc13xxx_add_subdevice(struct mc13xxx *mc13xxx, const char *format)
 {
 	return mc13xxx_add_subdevice_pdata(mc13xxx, format, NULL, 0);
@@ -470,8 +490,10 @@ int mc13xxx_common_init(struct device *dev)
 			&pdata->regulators, sizeof(pdata->regulators));
 		mc13xxx_add_subdevice_pdata(mc13xxx, "%s-led",
 				pdata->leds, sizeof(*pdata->leds));
-		mc13xxx_add_subdevice_pdata(mc13xxx, "%s-pwrbutton",
-				pdata->buttons, sizeof(*pdata->buttons));
+		mc13xxx_add_subdevice_pdata_res(mc13xxx, "%s-pwrbutton",
+				pdata->buttons, sizeof(*pdata->buttons),
+				mc13xxx->variant->button_resources,
+				mc13xxx->variant->button_resources_size);
 		if (mc13xxx->flags & MC13XXX_USE_CODEC)
 			mc13xxx_add_subdevice_pdata(mc13xxx, "%s-codec",
 				pdata->codec, sizeof(*pdata->codec));
@@ -481,7 +503,10 @@ int mc13xxx_common_init(struct device *dev)
 	} else {
 		mc13xxx_add_subdevice(mc13xxx, "%s-regulator");
 		mc13xxx_add_subdevice(mc13xxx, "%s-led");
-		mc13xxx_add_subdevice(mc13xxx, "%s-pwrbutton");
+		mc13xxx_add_subdevice_pdata_res(mc13xxx, "%s-pwrbutton",
+				NULL, 0,
+				mc13xxx->variant->button_resources,
+				mc13xxx->variant->button_resources_size);
 		if (mc13xxx->flags & MC13XXX_USE_CODEC)
 			mc13xxx_add_subdevice(mc13xxx, "%s-codec");
 		if (mc13xxx->flags & MC13XXX_USE_TOUCHSCREEN)
diff --git a/drivers/mfd/mc13xxx.h b/drivers/mfd/mc13xxx.h
index bd5ba9a0e14f..b13ae652f4ec 100644
--- a/drivers/mfd/mc13xxx.h
+++ b/drivers/mfd/mc13xxx.h
@@ -18,6 +18,8 @@ struct mc13xxx;
 
 struct mc13xxx_variant {
 	const char *name;
+	const struct resource *button_resources;
+	int button_resources_size;
 	void (*print_revision)(struct mc13xxx *mc13xxx, u32 revision);
 };
 
-- 
2.39.5


