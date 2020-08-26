Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D915D253665
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgHZSRS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:17:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:39424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbgHZSRR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:17:17 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 706AD20737;
        Wed, 26 Aug 2020 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465836;
        bh=fotpd/goB8x161LaxWE7cPWJ2+c6Vmm0EGcW3JpQGWI=;
        h=From:To:Cc:Subject:Date:From;
        b=FXyal6QV6uvVCxpGkD1cCsgr5aDrmD/lJTMEAIEk3a1ohHIy+UF+l3CkanBnm4daS
         Q9Cae6ndODk+P0bz2Y2uHyi1dR9NyJmyT0vT0IeYOD6cazmgJmusUO4Y74Ffg6V7oN
         pf+Rjhb2if6DCmsxK17r2Dp6DNUg6bQTjC3ZN1Bc=
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
Subject: [PATCH 01/24] Input: bcm-keypad - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:16:43 +0200
Message-Id: <20200826181706.11098-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/keyboard/bcm-keypad.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
index 2b771c3a5578..1bf71e7c9e0d 100644
--- a/drivers/input/keyboard/bcm-keypad.c
+++ b/drivers/input/keyboard/bcm-keypad.c
@@ -379,11 +379,9 @@ static int bcm_kp_probe(struct platform_device *pdev)
 	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
 	if (IS_ERR(kp->clk)) {
 		error = PTR_ERR(kp->clk);
-		if (error != -ENOENT) {
-			if (error != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "Failed to get clock\n");
-			return error;
-		}
+		if (error != -ENOENT)
+			return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
+
 		dev_dbg(&pdev->dev,
 			"No clock specified. Assuming it's enabled\n");
 		kp->clk = NULL;
-- 
2.17.1

