Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E021B9157
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 17:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgDZP6G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 11:58:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25918 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725778AbgDZP6F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 11:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587916683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LYB9S6rV+o+1rD4bwRHtxGEjSvTL5pHEgCiFSadjtpo=;
        b=I6tsmRROlO3fUVN/q4OYZ1V2/VtVqQikCRiq1m96HD2X8y5babHxyB9EJbPMP6j8IyU7yx
        jQ3VKlGoYGM3gYOpachoX5MpmGw6I71sHLlp3y+BvaN0ckH0T/KH2qsXU2El3sT/qT3iNg
        bBPbenKJzCXdFk7rnOByFNL6NXvXlCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-D_R6W8-vPgWiMmBsJThLaA-1; Sun, 26 Apr 2020 11:58:01 -0400
X-MC-Unique: D_R6W8-vPgWiMmBsJThLaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2688015D2;
        Sun, 26 Apr 2020 15:58:00 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 446705C1D6;
        Sun, 26 Apr 2020 15:57:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Chen-Yu Tsai <wens@csie.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: axp20x-pek - Always register interrupt handlers
Date:   Sun, 26 Apr 2020 17:57:57 +0200
Message-Id: <20200426155757.297087-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On some X86 devices we do not register an input-device, because the
power-button is also handled by the soc_button_array (GPIO) input driver,
and we want to avoid reporting power-button presses to userspace twice.

Sofar when we did this we also did not register our interrupt handlers,
since those were only necessary to report input events.

But on at least 2 device models the Medion Akoya E1239T and the GPD win,
the GPIO pin used by the soc_button_array driver for the power-button
cannot wakeup the system from suspend. Why this does not work is not clea=
r,
I've tried comparing the value of all relevant registers on the Cherry
Trail SoC, with those from models where this does work. I've checked:
PMC registers: FUNC_DIS, FUNC_DIS2, SOIX_WAKE_EN, D3_STS_0, D3_STS_1,
D3_STDBY_STS_0, D3_STDBY_STS_1; PMC ACPI I/O regs: PM1_STS_EN, GPE0a_EN
and they all have identical contents in the working and non working cases=
.
I suspect that the firmware either sets some unknown register to a value
causing this, or that it turns off a power-plane which is necessary for
GPIO wakeups to work during suspend.

What does work on the Medion Akoya E1239T is letting the AXP288 wakeup
the system on a power-button press (the GPD win has a different PMIC).

Move the registering of the power-button press/release interrupt-handler
from axp20x_pek_probe_input_device() to axp20x_pek_probe() so that the
PMIC will wakeup the system on a power-button press, even if we do not
register an input device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/axp20x-pek.c | 72 +++++++++++++++++----------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-=
pek.c
index c8f87df93a50..9c6386b2af33 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -205,8 +205,11 @@ ATTRIBUTE_GROUPS(axp20x);
=20
 static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
 {
-	struct input_dev *idev =3D pwr;
-	struct axp20x_pek *axp20x_pek =3D input_get_drvdata(idev);
+	struct axp20x_pek *axp20x_pek =3D pwr;
+	struct input_dev *idev =3D axp20x_pek->input;
+
+	if (!idev)
+		return IRQ_HANDLED;
=20
 	/*
 	 * The power-button is connected to ground so a falling edge (dbf)
@@ -225,22 +228,9 @@ static irqreturn_t axp20x_pek_irq(int irq, void *pwr=
)
 static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 					 struct platform_device *pdev)
 {
-	struct axp20x_dev *axp20x =3D axp20x_pek->axp20x;
 	struct input_dev *idev;
 	int error;
=20
-	axp20x_pek->irq_dbr =3D platform_get_irq_byname(pdev, "PEK_DBR");
-	if (axp20x_pek->irq_dbr < 0)
-		return axp20x_pek->irq_dbr;
-	axp20x_pek->irq_dbr =3D regmap_irq_get_virq(axp20x->regmap_irqc,
-						  axp20x_pek->irq_dbr);
-
-	axp20x_pek->irq_dbf =3D platform_get_irq_byname(pdev, "PEK_DBF");
-	if (axp20x_pek->irq_dbf < 0)
-		return axp20x_pek->irq_dbf;
-	axp20x_pek->irq_dbf =3D regmap_irq_get_virq(axp20x->regmap_irqc,
-						  axp20x_pek->irq_dbf);
-
 	axp20x_pek->input =3D devm_input_allocate_device(&pdev->dev);
 	if (!axp20x_pek->input)
 		return -ENOMEM;
@@ -255,24 +245,6 @@ static int axp20x_pek_probe_input_device(struct axp2=
0x_pek *axp20x_pek,
=20
 	input_set_drvdata(idev, axp20x_pek);
=20
-	error =3D devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbr,
-					     axp20x_pek_irq, 0,
-					     "axp20x-pek-dbr", idev);
-	if (error < 0) {
-		dev_err(&pdev->dev, "Failed to request dbr IRQ#%d: %d\n",
-			axp20x_pek->irq_dbr, error);
-		return error;
-	}
-
-	error =3D devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbf,
-					  axp20x_pek_irq, 0,
-					  "axp20x-pek-dbf", idev);
-	if (error < 0) {
-		dev_err(&pdev->dev, "Failed to request dbf IRQ#%d: %d\n",
-			axp20x_pek->irq_dbf, error);
-		return error;
-	}
-
 	error =3D input_register_device(idev);
 	if (error) {
 		dev_err(&pdev->dev, "Can't register input device: %d\n",
@@ -280,8 +252,6 @@ static int axp20x_pek_probe_input_device(struct axp20=
x_pek *axp20x_pek,
 		return error;
 	}
=20
-	device_init_wakeup(&pdev->dev, true);
-
 	return 0;
 }
=20
@@ -339,6 +309,18 @@ static int axp20x_pek_probe(struct platform_device *=
pdev)
=20
 	axp20x_pek->axp20x =3D dev_get_drvdata(pdev->dev.parent);
=20
+	axp20x_pek->irq_dbr =3D platform_get_irq_byname(pdev, "PEK_DBR");
+	if (axp20x_pek->irq_dbr < 0)
+		return axp20x_pek->irq_dbr;
+	axp20x_pek->irq_dbr =3D regmap_irq_get_virq(
+			axp20x_pek->axp20x->regmap_irqc, axp20x_pek->irq_dbr);
+
+	axp20x_pek->irq_dbf =3D platform_get_irq_byname(pdev, "PEK_DBF");
+	if (axp20x_pek->irq_dbf < 0)
+		return axp20x_pek->irq_dbf;
+	axp20x_pek->irq_dbf =3D regmap_irq_get_virq(
+			axp20x_pek->axp20x->regmap_irqc, axp20x_pek->irq_dbf);
+
 	if (axp20x_pek_should_register_input(axp20x_pek, pdev)) {
 		error =3D axp20x_pek_probe_input_device(axp20x_pek, pdev);
 		if (error)
@@ -347,6 +329,26 @@ static int axp20x_pek_probe(struct platform_device *=
pdev)
=20
 	axp20x_pek->info =3D (struct axp20x_info *)match->driver_data;
=20
+	error =3D devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbr,
+					     axp20x_pek_irq, 0,
+					     "axp20x-pek-dbr", axp20x_pek);
+	if (error < 0) {
+		dev_err(&pdev->dev, "Failed to request dbr IRQ#%d: %d\n",
+			axp20x_pek->irq_dbr, error);
+		return error;
+	}
+
+	error =3D devm_request_any_context_irq(&pdev->dev, axp20x_pek->irq_dbf,
+					  axp20x_pek_irq, 0,
+					  "axp20x-pek-dbf", axp20x_pek);
+	if (error < 0) {
+		dev_err(&pdev->dev, "Failed to request dbf IRQ#%d: %d\n",
+			axp20x_pek->irq_dbf, error);
+		return error;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+
 	platform_set_drvdata(pdev, axp20x_pek);
=20
 	return 0;
--=20
2.26.0

