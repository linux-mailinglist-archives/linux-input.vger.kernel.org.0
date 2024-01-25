Return-Path: <linux-input+bounces-1466-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9283C3D3
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 14:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 164F81C22EA8
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 13:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18D55731D;
	Thu, 25 Jan 2024 13:37:51 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEE356B75;
	Thu, 25 Jan 2024 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189871; cv=none; b=dvjoXFVzwmCGJqWliCS7GiEeFO0RwF4ZKsl1b8VUMbnM2JBTTS0ZD9lhrW7s4UHC0r5IB0qJqJBOZseYcNrk1ofayTFQJDjWhyaemAdjLjeQDkzMM/UW6tuYBmC/89hv7bciSWk0kx9QCsbMZQgmu7MaZ610WShyOkOlbDRecFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189871; c=relaxed/simple;
	bh=tDakhK7MuPp1CjIbCF97eY1KYSROvJFeTa/X8T74ivw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ib73HDSgCFpFC+qHnp2YBPy5ukHd+40ZiZZW9p5w0F3LnfEufrQ5oUTjjhO5c9X722NuEa0Nt2II1YadSzXx4Z1mAzpKTALt3KDy81bWpCtuK9PrJ6ySfFc3ByOEcRnwRNqzlkI8Epnxqlq/5LzUE5faXlvJelGAo/kgPKPGRvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="191712569"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2024 22:37:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.215])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2661842C93B0;
	Thu, 25 Jan 2024 22:37:45 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/3] Input: da9063_onkey - Add polling support
Date: Thu, 25 Jan 2024 13:37:33 +0000
Message-Id: <20240125133733.95081-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125133733.95081-1-biju.das.jz@bp.renesas.com>
References: <20240125133733.95081-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no
onkey IRQ populated by default. Add polling support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description as cleanup is done in patch#1
 * Dropped scheduling work instead start using polling as in the polling
 * case scheduling any additional works will create confused state for
 * driver if we repeatedly open and close input device.
v1->v2:
 * Updated commit description
 * Fixed the logical mistake for optional IRQ handling.
---
 drivers/input/misc/da9063_onkey.c | 83 ++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 18 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index e5256bf31140..71f1325b309b 100644
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
@@ -41,6 +43,8 @@ struct da9063_onkey {
 	const struct da906x_chip_config *config;
 	char phys[32];
 	bool key_power;
+	unsigned int poll_interval;
+	unsigned int key_threshold_release_time;
 };
 
 static const struct da906x_chip_config da9063_regs = {
@@ -95,6 +99,22 @@ static bool da9063_poll_on(struct da9063_onkey *onkey)
 		goto err_poll;
 	}
 
+	if (onkey->poll_interval &&
+	    onkey->key_threshold_release_time <= DA9062_KEY_THRESHOLD_MSEC) {
+		bool ret = true;
+
+		/* detect short or long key press */
+		if (!(val & config->onkey_nonkey_mask)) {
+			da9063_onkey_report_key(onkey, KEY_POWER, 0);
+			onkey->key_threshold_release_time = 0;
+			dev_dbg(onkey->dev, "KEY_POWER short press.\n");
+			ret = false;
+		} else {
+			onkey->key_threshold_release_time += 50;
+		}
+		return ret;
+	}
+
 	if (!(val & config->onkey_nonkey_mask)) {
 		error = regmap_update_bits(onkey->regmap,
 					   config->onkey_pwr_signalling,
@@ -170,6 +190,21 @@ static irqreturn_t da9063_onkey_irq_handler(int irq, void *data)
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
+		da9063_onkey_report_key(onkey, KEY_POWER, 1);
+		while (da9063_poll_on(onkey))
+			msleep(50);
+	}
+}
+
 static int da9063_onkey_probe(struct platform_device *pdev)
 {
 	struct da9063_onkey *onkey;
@@ -206,25 +241,37 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 
 	input_set_capability(onkey->input, EV_KEY, KEY_POWER);
 
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
 
 	error = input_register_device(onkey->input);
 	if (error)
-- 
2.25.1


