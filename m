Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB463253672
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgHZSRj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:17:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbgHZSRh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:17:37 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85CCE20786;
        Wed, 26 Aug 2020 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465857;
        bh=qIxzQTne6y0qZdRLOwKO8AtpCeZ51Mwuxugkramq3r4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iznPRqJXhF1sfCAosHrglMY2+nUq+qC/BMTRB1Wz3OYhbMi47Ie56wiJaD1Vikkrv
         s49VIa1V9mElFYrKLb+Tu4+ksVzgZiuJMzjcw2uwgbwJbWUzK9Cy8PRXxl0/32q5Oq
         BQp6Z2bAd/nYCCEKYppLU1uVg6fHlV+u9UCZmp08=
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
Subject: [PATCH 05/24] Input: pwm-beeper - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:16:47 +0200
Message-Id: <20200826181706.11098-5-krzk@kernel.org>
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
 drivers/input/misc/pwm-beeper.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
index d6b12477748a..8c0085e8c552 100644
--- a/drivers/input/misc/pwm-beeper.c
+++ b/drivers/input/misc/pwm-beeper.c
@@ -132,13 +132,8 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	beeper->pwm = devm_pwm_get(dev, NULL);
-	if (IS_ERR(beeper->pwm)) {
-		error = PTR_ERR(beeper->pwm);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request PWM device: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(beeper->pwm))
+		return dev_err_probe(dev, PTR_ERR(beeper->pwm), "Failed to request PWM device\n");
 
 	/* Sync up PWM state and ensure it is off. */
 	pwm_init_state(beeper->pwm, &state);
@@ -151,13 +146,9 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 	}
 
 	beeper->amplifier = devm_regulator_get(dev, "amp");
-	if (IS_ERR(beeper->amplifier)) {
-		error = PTR_ERR(beeper->amplifier);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'amp' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(beeper->amplifier))
+		return dev_err_probe(dev, PTR_ERR(beeper->amplifier),
+				     "Failed to get 'amp' regulator\n");
 
 	INIT_WORK(&beeper->work, pwm_beeper_work);
 
-- 
2.17.1

