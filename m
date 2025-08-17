Return-Path: <linux-input+bounces-14063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D21B292A4
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 12:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B5E11B23954
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 10:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502FE248868;
	Sun, 17 Aug 2025 10:23:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E93F22A7E4;
	Sun, 17 Aug 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755426183; cv=none; b=JgQW6RoH02NnuhC0+SBAB7hKkNbRydySlxRIvBhPjC13GgAimtwdP6JUiHhmYy1CklJVowkBJtlOKez9dwKmm6PqKMcyiXh/SUv81F7UriVtppXSzY1VWKZ4zjme8s9HdwjhLyQrICqCS2EyADzhPQyE8PLY7rHgnIqVUxpBdYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755426183; c=relaxed/simple;
	bh=rw4iAVJQoJquBUkqo0t0jQUlOZeouEUPovjZIlCnB2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KP9/58eZWmWnZh5cxbeFzKhZ33OESMMkxKOyu6Ahw6oU1nF0M9H+H5BUUMal1cjQNwuhfHk60GRzaFgOh6lb0TWC8hxMt8atQAdmwWWF5YSTgBjfHW08SbVo55k3h6Ic5yf7TiaibwCJJ+z3AsbU4zViu8KTuK6bZpQzJIuIclw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57HARr3W029776;
	Sun, 17 Aug 2025 10:27:53 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57HARrZE029771;
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
Subject: [PATCH 3/6] Input: mc13783-pwrbutton: enable other mc13xxx PMIC
Date: Sun, 17 Aug 2025 10:27:47 +0000
Message-Id: <20250817102751.29709-4-akurz@blala.de>
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

All three mc13xxx types do feature two common power buttons while mc13783
and mc13892 provide one extra button each that differs unfortunately.
The common buttons are ONOFD[12] (mc13783) and PWRON[12] (mc13892/mc34708).
ONOFD3 on mc13783 will still be supported while support for PWRON3 for
mc13892 will be left unsupported for simplicity.
Add the similarities to the header files for reference, extend the
platform_driver struct with the id table to support all three types.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/Kconfig             |  4 ++--
 drivers/input/misc/mc13783-pwrbutton.c | 21 ++++++++++++++++++---
 include/linux/mfd/mc13783.h            |  4 ++--
 include/linux/mfd/mc13xxx.h            |  9 +++++++++
 4 files changed, 31 insertions(+), 7 deletions(-)

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
index 9fd84b8d163d..cb2f25a1a757 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -33,13 +33,14 @@
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
@@ -108,6 +109,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 {
 	const struct mc13xxx_buttons_platform_data *pdata;
 	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
+	enum mc13xxx_chip_type chip = platform_get_device_id(pdev)->driver_data;
 	struct input_dev *pwr;
 	struct mc13783_pwrb *priv;
 	int err = 0;
@@ -127,6 +129,11 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	/* ONOFD3 is only supported for MC13783. */
+	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE &&
+		chip != MC13XXX_CHIP_TYPE_MC13783)
+		return -ENODEV;
+
 	reg |= (pdata->b1on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
 	reg |= (pdata->b2on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
 	reg |= (pdata->b3on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
@@ -254,7 +261,15 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 	mc13xxx_unlock(priv->mc13783);
 }
 
+static const struct platform_device_id mc13xxx_pwrbutton_idtable[] = {
+	{ "mc13783-pwrbutton", MC13XXX_CHIP_TYPE_MC13783 },
+	{ "mc13892-pwrbutton", MC13XXX_CHIP_TYPE_MC13892 },
+	{ "mc34708-pwrbutton", MC13XXX_CHIP_TYPE_MC34708 },
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
index f372926d5894..6984ea69db3e 100644
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
@@ -78,6 +80,13 @@ int mc13xxx_irq_unmask(struct mc13xxx *mc13xxx, int irq);
 
 struct regulator_init_data;
 
+enum mc13xxx_chip_type {
+	MC13XXX_CHIP_TYPE_MC13783,
+	MC13XXX_CHIP_TYPE_MC13892,
+	MC13XXX_CHIP_TYPE_MC34708,
+	MC13XXX_CHIP_TYPE_AMOUNT
+};
+
 struct mc13xxx_regulator_init_data {
 	int id;
 	struct regulator_init_data *init_data;
-- 
2.39.5


