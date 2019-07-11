Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D6B66191
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 00:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfGKWYO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 18:24:14 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:51051 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbfGKWYN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 18:24:13 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45l9Zf61F5z1rGSB;
        Fri, 12 Jul 2019 00:24:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45l9Zf5mS8z1qqkC;
        Fri, 12 Jul 2019 00:24:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Qn7ffnkYmm1F; Fri, 12 Jul 2019 00:24:09 +0200 (CEST)
X-Auth-Info: uf+vXaAjZNMEvBgcK/vglH6UHJmHersBNWwew3z5VDI=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 12 Jul 2019 00:24:09 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2 3/3] input: touchscreen mc13xxx: Add mc34708 support
Date:   Fri, 12 Jul 2019 00:23:46 +0200
Message-Id: <20190711222346.5245-4-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190711222346.5245-1-lukma@denx.de>
References: <20190711222346.5245-1-lukma@denx.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sascha Hauer <s.hauer@pengutronix.de>

The mc34708 has a different bit to enable pen detection. This
adds the driver data and devtype necessary to probe the device
and to distinguish between the mc13783 and the mc34708.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v2:
- Change nested if statements to a single one (with cr0 > ...)
- Replace hardcoded max resistance value (4080) with a generic driver data
  value.
- Introduce new include/linux/mfd/mc34708.h header file for mc34708 specific
  defines
- Define as driver data mask and value for accessing mc13xxx registers

Changes from the original patch:
- Simplify the mcXXXXX_set_pen_detection functions
- Fix checkpatch warnings
---
 drivers/input/touchscreen/mc13783_ts.c | 59 +++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
index edd49e44e0c9..8fd3d0e47f57 100644
--- a/drivers/input/touchscreen/mc13783_ts.c
+++ b/drivers/input/touchscreen/mc13783_ts.c
@@ -10,6 +10,7 @@
  */
 #include <linux/platform_device.h>
 #include <linux/mfd/mc13783.h>
+#include <linux/mfd/mc34708.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/input.h>
@@ -30,6 +31,8 @@ MODULE_PARM_DESC(sample_tolerance,
 		"is supposed to be wrong and is discarded.  Set to 0 to "
 		"disable this check.");
 
+struct mc13xxx_driver_data;
+
 struct mc13783_ts_priv {
 	struct input_dev *idev;
 	struct mc13xxx *mc13xxx;
@@ -37,6 +40,33 @@ struct mc13783_ts_priv {
 	unsigned int sample[4];
 	u8 ato;
 	bool atox;
+	struct mc13xxx_driver_data *drvdata;
+};
+
+enum mc13xxx_type {
+	MC13XXX_TYPE_MC13783,
+	MC13XXX_TYPE_MC34708,
+};
+
+struct mc13xxx_driver_data {
+	enum mc13xxx_type type;
+	int max_resistance;
+	u32 reg_mask;
+	u32 reg_value;
+};
+
+static struct mc13xxx_driver_data mc13783_driver_data = {
+	.type = MC13XXX_TYPE_MC13783,
+	.max_resistance = 4096,
+	.reg_mask = MC13XXX_ADC0_TSMOD_MASK,
+	.reg_value = MC13XXX_ADC0_TSMOD0,
+};
+
+static struct mc13xxx_driver_data mc34708_driver_data = {
+	.type = MC13XXX_TYPE_MC34708,
+	.max_resistance = 4080,
+	.reg_mask = MC34708_ADC0_TSMASK,
+	.reg_value = MC34708_ADC0_TSPENDETEN,
 };
 
 static irqreturn_t mc13783_ts_handler(int irq, void *data)
@@ -93,6 +123,10 @@ static void mc13783_ts_report_sample(struct mc13783_ts_priv *priv)
 
 	cr0 = (cr0 + cr1) / 2;
 
+	if (priv->drvdata->type == MC13XXX_TYPE_MC34708 &&
+	    cr0 > priv->drvdata->max_resistance)
+		cr0 = 0;
+
 	if (!cr0 || !sample_tolerance ||
 			(x2 - x0 < sample_tolerance &&
 			 y2 - y0 < sample_tolerance)) {
@@ -102,14 +136,14 @@ static void mc13783_ts_report_sample(struct mc13783_ts_priv *priv)
 			input_report_abs(idev, ABS_Y, y1);
 
 			dev_dbg(&idev->dev, "report (%d, %d, %d)\n",
-					x1, y1, 0x1000 - cr0);
+				x1, y1, priv->drvdata->max_resistance - cr0);
 			schedule_delayed_work(&priv->work, HZ / 50);
 		} else {
 			dev_dbg(&idev->dev, "report release\n");
 		}
 
 		input_report_abs(idev, ABS_PRESSURE,
-				cr0 ? 0x1000 - cr0 : cr0);
+				 cr0 ? priv->drvdata->max_resistance - cr0 : 0);
 		input_report_key(idev, BTN_TOUCH, cr0);
 		input_sync(idev);
 	} else {
@@ -146,7 +180,8 @@ static int mc13783_ts_open(struct input_dev *dev)
 		goto out;
 
 	ret = mc13xxx_reg_rmw(priv->mc13xxx, MC13XXX_ADC0,
-			MC13XXX_ADC0_TSMOD_MASK, MC13XXX_ADC0_TSMOD0);
+			      priv->drvdata->reg_mask,
+			      priv->drvdata->reg_value);
 	if (ret)
 		mc13xxx_irq_free(priv->mc13xxx, MC13XXX_IRQ_TS, priv);
 out:
@@ -160,7 +195,7 @@ static void mc13783_ts_close(struct input_dev *dev)
 
 	mc13xxx_lock(priv->mc13xxx);
 	mc13xxx_reg_rmw(priv->mc13xxx, MC13XXX_ADC0,
-			MC13XXX_ADC0_TSMOD_MASK, 0);
+			priv->drvdata->reg_mask, 0);
 	mc13xxx_irq_free(priv->mc13xxx, MC13XXX_IRQ_TS, priv);
 	mc13xxx_unlock(priv->mc13xxx);
 
@@ -172,6 +207,7 @@ static int __init mc13783_ts_probe(struct platform_device *pdev)
 	struct mc13783_ts_priv *priv;
 	struct mc13xxx_ts_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct input_dev *idev;
+	const struct platform_device_id *id = platform_get_device_id(pdev);
 	int ret = -ENOMEM;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
@@ -182,6 +218,7 @@ static int __init mc13783_ts_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&priv->work, mc13783_ts_work);
 	priv->mc13xxx = dev_get_drvdata(pdev->dev.parent);
 	priv->idev = idev;
+	priv->drvdata = (void *)id->driver_data;
 
 	if (pdata) {
 		priv->atox = pdata->atox;
@@ -228,7 +265,21 @@ static int mc13783_ts_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id mc13xxx_ts_idtable[] = {
+	{
+		.name = "mc13783-ts",
+		.driver_data = (kernel_ulong_t)&mc13783_driver_data,
+	}, {
+		.name = "mc34708-ts",
+		.driver_data = (kernel_ulong_t)&mc34708_driver_data,
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(platform, mc13xxx_ts_idtable);
+
 static struct platform_driver mc13783_ts_driver = {
+	.id_table	= mc13xxx_ts_idtable,
 	.remove		= mc13783_ts_remove,
 	.driver		= {
 		.name	= MC13783_TS_NAME,
-- 
2.11.0

