Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F419486393
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 12:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238348AbiAFLQy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 06:16:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25319 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229624AbiAFLQx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 Jan 2022 06:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641467813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=PysC8z62ZyxukkGBNBLs959vcOfRwEd9JJkcoqTrLGI=;
        b=Ex7SKNZNE1X/+4yKPpsfwydZvcYO87fAv/fNFY4GisCQdPMXlTkkvbjnWKDIfE040YILhK
        LtdL2wuZj1BBn/TTXLEZhzpWq2ePQhLx5lkFx+wZ+t0JcyL5x5SOJAtjVOJST84bJXgMx8
        4izAwHopkVRP+Rwmp61uDX2pA0bNclU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-LQb5b9U2NECpWimjvipvWA-1; Thu, 06 Jan 2022 06:16:50 -0500
X-MC-Unique: LQb5b9U2NECpWimjvipvWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0491B1800D50;
        Thu,  6 Jan 2022 11:16:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D97E9752AE;
        Thu,  6 Jan 2022 11:16:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: axp20x-pek - Revert "always register interrupt handlers" change
Date:   Thu,  6 Jan 2022 12:16:47 +0100
Message-Id: <20220106111647.66520-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The power button on Cherry Trail systems with an AXP288 PMIC is connected
to both the power button pin of the PMIC as well as to a power button GPIO
on the Cherry Trail SoC itself. This leads to double power button event
reporting which is a problem.

Since reporting power button presses through the PMIC is not supported on
all PMICs used on Cherry Trail systems, we want to keep the GPIO
power button events, so the axp20x-pek code checks for the presence of
a GPIO power button and in that case does not register its input-device.

On most systems the GPIO power button also can wake-up the system from
suspend, so the axp20x-pek driver would also not register its interrupt
handler. But on some systems there was a bug causing wakeup by the GPIO
power button handler to not work.

Commit 9747070c11d6 ("Input: axp20x-pek - always register interrupt
handlers") was added as a work around for this registering the axp20x-pek
interrupts, but not the input-device on Cherry Trail systems.

In the mean time the root-cause of the GPIO power button wakeup events
not working has been found and fixed by the "pinctrl: cherryview: Do not
allow the same interrupt line to be used by 2 pins" patch,
so this is no longer necessary.

This reverts the workaround going back to only registering the
interrupt handlers on systems where we also register the input-device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/axp20x-pek.c | 72 ++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index e09b1fae42e1..04da7916eb70 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -206,11 +206,8 @@ ATTRIBUTE_GROUPS(axp20x);
 
 static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
 {
-	struct axp20x_pek *axp20x_pek = pwr;
-	struct input_dev *idev = axp20x_pek->input;
-
-	if (!idev)
-		return IRQ_HANDLED;
+	struct input_dev *idev = pwr;
+	struct axp20x_pek *axp20x_pek = input_get_drvdata(idev);
 
 	/*
 	 * The power-button is connected to ground so a falling edge (dbf)
@@ -229,9 +226,22 @@ static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
 static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 					 struct platform_device *pdev)
 {
+	struct axp20x_dev *axp20x = axp20x_pek->axp20x;
 	struct input_dev *idev;
 	int error;
 
+	axp20x_pek->irq_dbr = platform_get_irq_byname(pdev, "PEK_DBR");
+	if (axp20x_pek->irq_dbr < 0)
+		return axp20x_pek->irq_dbr;
+	axp20x_pek->irq_dbr = regmap_irq_get_virq(axp20x->regmap_irqc,
+						  axp20x_pek->irq_dbr);
+
+	axp20x_pek->irq_dbf = platform_get_irq_byname(pdev, "PEK_DBF");
+	if (axp20x_pek->irq_dbf < 0)
+		return axp20x_pek->irq_dbf;
+	axp20x_pek->irq_dbf = regmap_irq_get_virq(axp20x->regmap_irqc,
+						  axp20x_pek->irq_dbf);
+
 	axp20x_pek->input = devm_input_allocate_device(&pdev->dev);
 	if (!axp20x_pek->input)
 		return -ENOMEM;
@@ -246,6 +256,24 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 
 	input_set_drvdata(idev, axp20x_pek);
 
+	error = devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbr,
+					     axp20x_pek_irq, 0,
+					     "axp20x-pek-dbr", idev);
+	if (error < 0) {
+		dev_err(&pdev->dev, "Failed to request dbr IRQ#%d: %d\n",
+			axp20x_pek->irq_dbr, error);
+		return error;
+	}
+
+	error = devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbf,
+					  axp20x_pek_irq, 0,
+					  "axp20x-pek-dbf", idev);
+	if (error < 0) {
+		dev_err(&pdev->dev, "Failed to request dbf IRQ#%d: %d\n",
+			axp20x_pek->irq_dbf, error);
+		return error;
+	}
+
 	error = input_register_device(idev);
 	if (error) {
 		dev_err(&pdev->dev, "Can't register input device: %d\n",
@@ -253,6 +281,8 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 		return error;
 	}
 
+	device_init_wakeup(&pdev->dev, true);
+
 	return 0;
 }
 
@@ -293,18 +323,6 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 
 	axp20x_pek->axp20x = dev_get_drvdata(pdev->dev.parent);
 
-	axp20x_pek->irq_dbr = platform_get_irq_byname(pdev, "PEK_DBR");
-	if (axp20x_pek->irq_dbr < 0)
-		return axp20x_pek->irq_dbr;
-	axp20x_pek->irq_dbr = regmap_irq_get_virq(
-			axp20x_pek->axp20x->regmap_irqc, axp20x_pek->irq_dbr);
-
-	axp20x_pek->irq_dbf = platform_get_irq_byname(pdev, "PEK_DBF");
-	if (axp20x_pek->irq_dbf < 0)
-		return axp20x_pek->irq_dbf;
-	axp20x_pek->irq_dbf = regmap_irq_get_virq(
-			axp20x_pek->axp20x->regmap_irqc, axp20x_pek->irq_dbf);
-
 	if (axp20x_pek_should_register_input(axp20x_pek)) {
 		error = axp20x_pek_probe_input_device(axp20x_pek, pdev);
 		if (error)
@@ -313,26 +331,6 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 
 	axp20x_pek->info = (struct axp20x_info *)match->driver_data;
 
-	error = devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbr,
-					     axp20x_pek_irq, 0,
-					     "axp20x-pek-dbr", axp20x_pek);
-	if (error < 0) {
-		dev_err(&pdev->dev, "Failed to request dbr IRQ#%d: %d\n",
-			axp20x_pek->irq_dbr, error);
-		return error;
-	}
-
-	error = devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbf,
-					  axp20x_pek_irq, 0,
-					  "axp20x-pek-dbf", axp20x_pek);
-	if (error < 0) {
-		dev_err(&pdev->dev, "Failed to request dbf IRQ#%d: %d\n",
-			axp20x_pek->irq_dbf, error);
-		return error;
-	}
-
-	device_init_wakeup(&pdev->dev, true);
-
 	platform_set_drvdata(pdev, axp20x_pek);
 
 	return 0;
-- 
2.33.1

