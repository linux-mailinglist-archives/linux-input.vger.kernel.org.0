Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7DD9AFA3
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 14:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389646AbfHWMgY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 08:36:24 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:57253 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387932AbfHWMgY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 08:36:24 -0400
X-Greylist: delayed 442 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Aug 2019 08:36:23 EDT
Received: from erd987.prtnl (erd987.prtnl [192.168.237.3])
        by sparta (Postfix) with ESMTP id 7B3D244A009E;
        Fri, 23 Aug 2019 14:30:56 +0200 (CEST)
From:   Robin van der Gracht <robin@protonic.nl>
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Robin Gong <yibin.gong@nxp.com>, Adam Ford <aford173@gmail.com>
Subject: [PATCH] input: keyboard: snvs_pwrkey: Send press and release event for i.MX6 S,DL and Q
Date:   Fri, 23 Aug 2019 14:30:02 +0200
Message-Id: <20190823123002.10448-1-robin@protonic.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The older generation i.MX6 processors send a powerdown request interrupt if
the powerkey is released before a hard shutdown (5 second press). This should
allow software to bring down the SoC safely.

For this driver to work as a regular powerkey with the older SoCs, we need to
send a keypress AND release when we get the powerdown request interrupt.

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 arch/arm/boot/dts/imx6qdl.dtsi       |  2 +-
 arch/arm/boot/dts/imx6sll.dtsi       |  2 +-
 arch/arm/boot/dts/imx6sx.dtsi        |  2 +-
 arch/arm/boot/dts/imx6ul.dtsi        |  2 +-
 arch/arm/boot/dts/imx7s.dtsi         |  2 +-
 drivers/input/keyboard/Kconfig       |  2 +-
 drivers/input/keyboard/snvs_pwrkey.c | 59 +++++++++++++++++++++++-----
 7 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index b3a77bcf00d51..c10d12658743c 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -836,7 +836,7 @@
 				};
 
 				snvs_pwrkey: snvs-powerkey {
-					compatible = "fsl,sec-v4.0-pwrkey";
+					compatible = "fsl,imx6qdl-sec-v4.0-pwrkey";
 					regmap = <&snvs>;
 					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 					linux,keycode = <KEY_POWER>;
diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index 1b4899f0fcded..91c7d5bdcc359 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -571,7 +571,7 @@
 				};
 
 				snvs_pwrkey: snvs-powerkey {
-					compatible = "fsl,sec-v4.0-pwrkey";
+					compatible = "fsl,imx6sx-sec-v4.0-pwrkey";
 					regmap = <&snvs>;
 					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 					linux,keycode = <KEY_POWER>;
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index b16a123990a26..b6736db65350f 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -733,7 +733,7 @@
 				};
 
 				snvs_pwrkey: snvs-powerkey {
-					compatible = "fsl,sec-v4.0-pwrkey";
+					compatible = "fsl,imx6sx-sec-v4.0-pwrkey";
 					regmap = <&snvs>;
 					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 					linux,keycode = <KEY_POWER>;
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index a7f6d1d58e20d..d4678c52b55db 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -644,7 +644,7 @@
 				};
 
 				snvs_pwrkey: snvs-powerkey {
-					compatible = "fsl,sec-v4.0-pwrkey";
+					compatible = "fsl,imx6sx-sec-v4.0-pwrkey";
 					regmap = <&snvs>;
 					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 					linux,keycode = <KEY_POWER>;
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 106711d2c01b0..bb68c23beb199 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -604,7 +604,7 @@
 				};
 
 				snvs_pwrkey: snvs-powerkey {
-					compatible = "fsl,sec-v4.0-pwrkey";
+					compatible = "fsl,imx6sx-sec-v4.0-pwrkey";
 					regmap = <&snvs>;
 					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 					linux,keycode = <KEY_POWER>;
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 7c4f19dab34fd..937e58da5ce17 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -436,7 +436,7 @@ config KEYBOARD_SNVS_PWRKEY
 	depends on OF
 	help
 	  This is the snvs powerkey driver for the Freescale i.MX application
-	  processors that are newer than i.MX6 SX.
+	  processors.
 
 	  To compile this driver as a module, choose M here; the
 	  module will be called snvs_pwrkey.
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 5342d8d45f811..c321e5f2d1087 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -29,6 +29,11 @@
 #define DEBOUNCE_TIME 30
 #define REPEAT_INTERVAL 60
 
+enum imx_snvs_hwtype {
+	IMX6SX_SNVS,	/* i.MX6 SoloX and newer */
+	IMX6QDL_SNVS,	/* i.MX6 Solo, DualLite adn Quad */
+};
+
 struct pwrkey_drv_data {
 	struct regmap *snvs;
 	int irq;
@@ -37,6 +42,19 @@ struct pwrkey_drv_data {
 	int wakeup;
 	struct timer_list check_timer;
 	struct input_dev *input;
+	enum imx_snvs_hwtype hwtype;
+};
+
+static const struct platform_device_id imx_snvs_devtype[] = {
+	{
+		.name = "imx6sx-snvs-pwrkey",
+		.driver_data = IMX6SX_SNVS,
+	}, {
+		.name = "imx6qdl-snvs-pwrkey",
+		.driver_data = IMX6QDL_SNVS,
+	}, {
+		/* sentinel */
+	}
 };
 
 static void imx_imx_snvs_check_for_events(struct timer_list *t)
@@ -67,13 +85,23 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 {
 	struct platform_device *pdev = dev_id;
 	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
+	struct input_dev *input = pdata->input;
 	u32 lp_status;
 
-	pm_wakeup_event(pdata->input->dev.parent, 0);
+	pm_wakeup_event(input->dev.parent, 0);
 
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
-	if (lp_status & SNVS_LPSR_SPO)
-		mod_timer(&pdata->check_timer, jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
+	if (lp_status & SNVS_LPSR_SPO) {
+		if (pdata->hwtype == IMX6QDL_SNVS) {
+			input_report_key(input, pdata->keycode, 1);
+			input_report_key(input, pdata->keycode, 0);
+			input_sync(input);
+			pm_relax(input->dev.parent);
+		} else {
+			mod_timer(&pdata->check_timer,
+				jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
+		}
+	}
 
 	/* clear SPO status */
 	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
@@ -88,11 +116,24 @@ static void imx_snvs_pwrkey_act(void *pdata)
 	del_timer_sync(&pd->check_timer);
 }
 
+static const struct of_device_id imx_snvs_pwrkey_ids[] = {
+	{
+		.compatible = "fsl,imx6sx-sec-v4.0-pwrkey",
+		.data = &imx_snvs_devtype[IMX6SX_SNVS],
+	}, {
+		.compatible = "fsl,imx6qdl-sec-v4.0-pwrkey",
+		.data = &imx_snvs_devtype[IMX6QDL_SNVS],
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx_snvs_pwrkey_ids);
+
 static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 {
 	struct pwrkey_drv_data *pdata = NULL;
 	struct input_dev *input = NULL;
 	struct device_node *np;
+	const struct of_device_id *of_id;
 	int error;
 
 	/* Get SNVS register Page */
@@ -100,6 +141,11 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (!np)
 		return -ENODEV;
 
+	of_id = of_match_node(imx_snvs_pwrkey_ids, np);
+	if (!of_id)
+		return -ENODEV;
+	pdev->id_entry = of_id->data;
+
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
@@ -116,6 +162,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	}
 
 	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
+	pdata->hwtype = pdev->id_entry->driver_data;
 
 	pdata->irq = platform_get_irq(pdev, 0);
 	if (pdata->irq < 0) {
@@ -175,12 +222,6 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id imx_snvs_pwrkey_ids[] = {
-	{ .compatible = "fsl,sec-v4.0-pwrkey" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, imx_snvs_pwrkey_ids);
-
 static struct platform_driver imx_snvs_pwrkey_driver = {
 	.driver = {
 		.name = "snvs_pwrkey",
-- 
2.20.1

