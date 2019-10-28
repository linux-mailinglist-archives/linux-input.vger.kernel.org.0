Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB0B5E7C33
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2019 23:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfJ1WPN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 18:15:13 -0400
Received: from vps.xff.cz ([195.181.215.36]:50408 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfJ1WPN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 18:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572300911; bh=6cUEPE++PT7bm/+2yXk5OlWnhW9Q2aMhm/b2mJdGUmE=;
        h=From:To:Cc:Subject:Date:From;
        b=VjETtQHRQrDTpLtKSrqvJ6yAOr4p44MmViCQBsyKn+J6ifWreBrDcRG72ZYUDn4tS
         dXzFMwjF+L5F9rBI663kGszmMqFihPdqROZ+SORr+Dx15R+FoQuH71qi4QuJ/b8/MV
         0w0J6ISfYXj1nL0btEHSfszfXWFKVg1kht3duTv4=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com
Cc:     Ondrej Jirman <megous@megous.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org (open list:SUN4I LOW RES ADC ATTACHED
        TABLET KEYS DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner
        sunXi SoC support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] input: sun4i-lradc-keys: Add wakup support
Date:   Mon, 28 Oct 2019 23:15:02 +0100
Message-Id: <20191028221502.3503543-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the driver to wakeup the system on key press.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 4a796bed48ac..bba679d7b54b 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -22,6 +22,8 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -226,8 +228,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 {
 	struct sun4i_lradc_data *lradc;
 	struct device *dev = &pdev->dev;
-	int i;
-	int error;
+	int i, error, irq;
 
 	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
 	if (!lradc)
@@ -272,8 +273,13 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
-				 sun4i_lradc_irq, 0,
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "Failed to get IRQ\n");
+		return irq;
+	}
+
+	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
 				 "sun4i-a10-lradc-keys", lradc);
 	if (error)
 		return error;
@@ -282,6 +288,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	device_init_wakeup(dev, true);
+
+	error = dev_pm_set_wake_irq(dev, irq);
+	if (error) {
+		dev_err(dev, "Could not set wake IRQ\n");
+		return error;
+	}
+
 	return 0;
 }
 
-- 
2.23.0

