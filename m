Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28A62536A9
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgHZSRf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:17:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:39978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbgHZSRc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:17:32 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 359A020737;
        Wed, 26 Aug 2020 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465852;
        bh=R/wON7Dd1kYOf9N5F6c4o26RPuVpWmsv1WDvdKWb24A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kurPqRyWew4kwvgkIRJu5txJPZdqjY6ppdsSeovEc+/Oqllkxg8lZxG1k2gxFX5SH
         1O3ROXotMDmNy76N8wzyEcPSOJEWeyiT+B/K6M30RRsq4mLB45AcKR2GDGvKXMi9Zk
         4Pa287LfJy6LjPXa2VYux/jxgJ25qVTlGyd8mldg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 04/24] Input: gpio-vibra - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:16:46 +0200
Message-Id: <20200826181706.11098-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
References: <20200826181706.11098-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/misc/gpio-vibra.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index f79f75595dd7..53042e0ba9ee 100644
--- a/drivers/input/misc/gpio-vibra.c
+++ b/drivers/input/misc/gpio-vibra.c
@@ -114,21 +114,13 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 
 	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
 	err = PTR_ERR_OR_ZERO(vibrator->vcc);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request regulator: %d\n",
-				err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");
 
 	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
 	err = PTR_ERR_OR_ZERO(vibrator->gpio);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
-				err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "Failed to request main gpio\n");
 
 	INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
 
-- 
2.17.1

