Return-Path: <linux-input+bounces-14393-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F25B3C3A0
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 22:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA55A06279
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 20:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5A4258EC8;
	Fri, 29 Aug 2025 20:10:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C99248F7F;
	Fri, 29 Aug 2025 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756498224; cv=none; b=fmEgVSM5GsnLJx5OFbzw3cvP/K0R3ai2g3mGiI9E15C2/mtU28IT36TZh9SP3sB0b4KQ2OSk0s4sBDgvFvNXOnRUsc8Jm9ailfof1KnFS6o5WESbF2MpZtZwDRm+mbY0fETK6aGXV69IteQdmnY+lmq5E+dlJFbl+bS91JB8Nxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756498224; c=relaxed/simple;
	bh=6RcZ3TQA44I6NJ7PQs2oekr3AcYY4NwDdz17CtUSIQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gy1XsFALYSBD1wNr4OgGg/3ANh+z6ZFEhs5eNQU1HY6LXaBpkyYfFlkAyE/dVW8CGFKD9pfRsIzlNa+MSE9CaMx/O/JC7uzywmJDSvkFR82cBcalZY+iP8wOHBsWKGCTdukec8l20khwMWRdtG92ziiPoMM4QxGAXBvp48MC0+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57TKFJ9B015449;
	Fri, 29 Aug 2025 20:15:19 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57TKFJcX015444;
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
Subject: [PATCH v3 4/7] Input: mc13783-pwrbutton: enable other mc13xxx PMIC
Date: Fri, 29 Aug 2025 20:15:14 +0000
Message-Id: <20250829201517.15374-5-akurz@blala.de>
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

All three mc13xxx types do feature two common power buttons referred as
ONOFD[12] (mc13783) and PWRON[12] (mc13892/mc34708) in the SoC reference
manuals. Add support for PWRON[12] (mc13892/mc34708) but skip support for
button PWRON3 (mc13892) for sake of simplicity.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/Kconfig             |  4 +--
 drivers/input/misc/mc13783-pwrbutton.c | 44 +++++++++++++++++++++++---
 include/linux/mfd/mc13783.h            |  4 +--
 include/linux/mfd/mc13xxx.h            |  2 ++
 4 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0fb21c99a5e3..b66e920369f2 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -276,8 +276,8 @@ config INPUT_MC13783_PWRBUTTON
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
index ace9f286fd24..c9eea57ceedd 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -30,16 +30,21 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 
+struct mc13xxx_button_devtype {
+	int button_id_max;
+};
+
 struct mc13783_pwrb {
 	struct input_dev *pwr;
 	struct mc13xxx *mc13783;
-#define MC13783_PWRB_B1_POL_INVERT	(1 << 0)
-#define MC13783_PWRB_B2_POL_INVERT	(1 << 1)
-#define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
 	int flags;
 	unsigned short keymap[3];
 };
 
+#define MC13783_PWRB_B1_POL_INVERT	(1 << 0)
+#define MC13783_PWRB_B2_POL_INVERT	(1 << 1)
+#define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
+
 #define MC13783_REG_INTERRUPT_SENSE_1		5
 #define MC13783_IRQSENSE1_ONOFD1S		(1 << 3)
 #define MC13783_IRQSENSE1_ONOFD2S		(1 << 4)
@@ -108,6 +113,8 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 {
 	const struct mc13xxx_buttons_platform_data *pdata;
 	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
+	struct mc13xxx_button_devtype *devtype =
+		(struct mc13xxx_button_devtype *)pdev->id_entry->driver_data;
 	struct input_dev *pwr;
 	struct mc13783_pwrb *priv;
 	int err = 0;
@@ -127,6 +134,11 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
@@ -239,12 +251,15 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 {
 	struct mc13783_pwrb *priv = platform_get_drvdata(pdev);
 	const struct mc13xxx_buttons_platform_data *pdata;
+	struct mc13xxx_button_devtype *devtype =
+		(struct mc13xxx_button_devtype *)pdev->id_entry->driver_data;
 
 	pdata = dev_get_platdata(&pdev->dev);
 
 	mc13xxx_lock(priv->mc13783);
 
-	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
+	if (devtype->button_id_max >= 2 &&
+		pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD3, priv);
 	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE)
 		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD2, priv);
@@ -254,7 +269,28 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 	mc13xxx_unlock(priv->mc13783);
 }
 
+static const struct mc13xxx_button_devtype mc13783_button_devtype = {
+	.button_id_max	= 2,
+};
+
+static const struct mc13xxx_button_devtype mc13892_button_devtype = {
+	/* PWRON3 is not supported yet. */
+	.button_id_max	= 1,
+};
+
+static const struct mc13xxx_button_devtype mc34708_button_devtype = {
+	.button_id_max	= 1,
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
 	.remove		= mc13783_pwrbutton_remove,
 	.driver		= {
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
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index 0393083af28a..36e5e7de7cb2 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -67,6 +67,8 @@ int mc13xxx_irq_unmask(struct mc13xxx *mc13xxx, int irq);
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


