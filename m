Return-Path: <linux-input+bounces-777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169F8120E8
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 22:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA6C282765
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 21:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503247E562;
	Wed, 13 Dec 2023 21:48:28 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 95583DB;
	Wed, 13 Dec 2023 13:48:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,273,1695654000"; 
   d="scan'208";a="186385655"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Dec 2023 06:48:24 +0900
Received: from localhost.localdomain (unknown [10.26.240.14])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4A6B340BB731;
	Thu, 14 Dec 2023 06:48:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] Input: da9063 - Add polling support
Date: Wed, 13 Dec 2023 21:48:03 +0000
Message-Id: <20231213214803.9931-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
References: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no
onkey IRQ populated by default. Add polling support.

While at it, doing some cleanups in da9063_poll_on()
as regmap_read() and dev_err() can fit in single line.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description
 * Fixed the logical mistake for optional IRQ handling.
---
 drivers/input/misc/da9063_onkey.c | 89 +++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 23 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index b18232e91844..734cee9e9253 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -19,6 +19,8 @@
 #include <linux/mfd/da9062/core.h>
 #include <linux/mfd/da9062/registers.h>
 
+#define DA9062_KEY_THRESHOLD_MSEC	(200)
+
 struct da906x_chip_config {
 	/* REGS */
 	int onkey_status;
@@ -42,6 +44,8 @@ struct da9063_onkey {
 	const struct da906x_chip_config *config;
 	char phys[32];
 	bool key_power;
+	unsigned int poll_interval;
+	unsigned int key_threshold_release_time;
 };
 
 static const struct da906x_chip_config da9063_regs = {
@@ -86,15 +90,27 @@ static void da9063_poll_on(struct work_struct *work)
 	int error;
 
 	/* Poll to see when the pin is released */
-	error = regmap_read(onkey->regmap,
-			    config->onkey_status,
-			    &val);
+	error = regmap_read(onkey->regmap, config->onkey_status, &val);
 	if (error) {
-		dev_err(onkey->dev,
-			"Failed to read ON status: %d\n", error);
+		dev_err(onkey->dev, "Failed to read ON status: %d\n", error);
 		goto err_poll;
 	}
 
+	if (onkey->poll_interval &&
+	    onkey->key_threshold_release_time <= DA9062_KEY_THRESHOLD_MSEC) {
+		/* detect short or long key press */
+		if (!(val & config->onkey_nonkey_mask)) {
+			input_report_key(onkey->input, KEY_POWER, 0);
+			input_sync(onkey->input);
+			onkey->key_threshold_release_time = 0;
+			dev_dbg(onkey->dev, "KEY_POWER short press.\n");
+		} else {
+			schedule_delayed_work(&onkey->work, msecs_to_jiffies(50));
+			onkey->key_threshold_release_time += 50;
+		}
+		return;
+	}
+
 	if (!(val & config->onkey_nonkey_mask)) {
 		error = regmap_update_bits(onkey->regmap,
 					   config->onkey_pwr_signalling,
@@ -177,6 +193,21 @@ static irqreturn_t da9063_onkey_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void da9063_onkey_polled_poll(struct input_dev *input)
+{
+	struct da9063_onkey *onkey = input_get_drvdata(input);
+	const struct da906x_chip_config *config = onkey->config;
+	unsigned int val;
+	int error;
+
+	error = regmap_read(onkey->regmap, config->onkey_status, &val);
+	if (onkey->key_power && !error && (val & config->onkey_nonkey_mask)) {
+		input_report_key(onkey->input, KEY_POWER, 1);
+		input_sync(onkey->input);
+		schedule_delayed_work(&onkey->work, 0);
+	}
+}
+
 static int da9063_onkey_probe(struct platform_device *pdev)
 {
 	struct da9063_onkey *onkey;
@@ -219,25 +250,37 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	irq = platform_get_irq_byname(pdev, "ONKEY");
-	if (irq < 0)
+	irq = platform_get_irq_byname_optional(pdev, "ONKEY");
+	if (irq >= 0) {
+		error = devm_request_threaded_irq(&pdev->dev, irq,
+						  NULL, da9063_onkey_irq_handler,
+						  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						  "ONKEY", onkey);
+		if (error)
+			return dev_err_probe(&pdev->dev, error,
+					     "Failed to allocate onkey irq\n");
+
+		error = dev_pm_set_wake_irq(&pdev->dev, irq);
+		if (error)
+			dev_warn(&pdev->dev,
+				 "Failed to set IRQ %d as a wake IRQ: %d\n",
+				 irq, error);
+		else
+			device_init_wakeup(&pdev->dev, true);
+	} else if (irq != -ENXIO) {
 		return irq;
-
-	error = devm_request_threaded_irq(&pdev->dev, irq,
-					  NULL, da9063_onkey_irq_handler,
-					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					  "ONKEY", onkey);
-	if (error)
-		return dev_err_probe(&pdev->dev, error,
-				     "Failed to allocate onkey IRQ\n");
-
-	error = dev_pm_set_wake_irq(&pdev->dev, irq);
-	if (error)
-		dev_warn(&pdev->dev,
-			 "Failed to set IRQ %d as a wake IRQ: %d\n",
-			 irq, error);
-	else
-		device_init_wakeup(&pdev->dev, true);
+	} else {
+		input_set_drvdata(onkey->input, onkey);
+		device_property_read_u32(&pdev->dev, "poll-interval",
+					 &onkey->poll_interval);
+		error = input_setup_polling(onkey->input,
+					    da9063_onkey_polled_poll);
+		if (error)
+			return dev_err_probe(&pdev->dev, error,
+					     "unable to set up polling\n");
+
+		input_set_poll_interval(onkey->input, onkey->poll_interval);
+	}
 
 	return input_register_device(onkey->input);
 }
-- 
2.25.1


