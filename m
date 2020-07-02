Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7A921223A
	for <lists+linux-input@lfdr.de>; Thu,  2 Jul 2020 13:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728805AbgGBL0g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jul 2020 07:26:36 -0400
Received: from vps.xff.cz ([195.181.215.36]:43646 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728710AbgGBL0g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Jul 2020 07:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1593688846; bh=OH0uafqw3wiAiFdr3Xq7r48sm5oT4+qFhajRJjz8lvE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Nbj0ty8XPOyIPBt+Yk3OnUCyp8Vhl4W9EOcurV0TFZyviKtjf76Lv14HmUxOY34U4
         iyCtX5sr8gWGwYgYpzmtjYbFuAQk0RhRsOQFTjy2xiUZswkMLaQeGA+GAdclfBN+5s
         0tmbcBzmcczTBAMIiXert+DF/+3/JuX/+Y4KR5Lc=
From:   Ondrej Jirman <megous@megous.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] input: gpio-vibra: Allow to use vcc-supply alone to control the vibrator
Date:   Thu,  2 Jul 2020 13:20:39 +0200
Message-Id: <20200702112041.1942707-3-megous@megous.com>
In-Reply-To: <20200702112041.1942707-1-megous@megous.com>
References: <20200702112041.1942707-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make enable-gpio optional to allow using this driver with boards that
have vibrator connected to a power supply without intermediate gpio
based enable circuitry.

Also avoid a case where neither regulator nor enable gpio is specified,
and bail out in probe in such a case.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/input/misc/gpio-vibra.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index f79f75595dd7..b3bb7e61ed1d 100644
--- a/drivers/input/misc/gpio-vibra.c
+++ b/drivers/input/misc/gpio-vibra.c
@@ -39,7 +39,7 @@ static int gpio_vibrator_start(struct gpio_vibrator *vibrator)
 	struct device *pdev = vibrator->input->dev.parent;
 	int err;
 
-	if (!vibrator->vcc_on) {
+	if (vibrator->vcc && !vibrator->vcc_on) {
 		err = regulator_enable(vibrator->vcc);
 		if (err) {
 			dev_err(pdev, "failed to enable regulator: %d\n", err);
@@ -57,7 +57,7 @@ static void gpio_vibrator_stop(struct gpio_vibrator *vibrator)
 {
 	gpiod_set_value_cansleep(vibrator->gpio, 0);
 
-	if (vibrator->vcc_on) {
+	if (vibrator->vcc && vibrator->vcc_on) {
 		regulator_disable(vibrator->vcc);
 		vibrator->vcc_on = false;
 	}
@@ -112,7 +112,7 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 	if (!vibrator->input)
 		return -ENOMEM;
 
-	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
+	vibrator->vcc = devm_regulator_get_optional(&pdev->dev, "vcc");
 	err = PTR_ERR_OR_ZERO(vibrator->vcc);
 	if (err) {
 		if (err != -EPROBE_DEFER)
@@ -121,7 +121,8 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
+	vibrator->gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						 GPIOD_OUT_LOW);
 	err = PTR_ERR_OR_ZERO(vibrator->gpio);
 	if (err) {
 		if (err != -EPROBE_DEFER)
@@ -130,6 +131,11 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (!vibrator->vcc && !vibrator->gpio) {
+		dev_err(&pdev->dev, "Neither gpio nor regulator provided\n");
+		return -EINVAL;
+	}
+
 	INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
 
 	vibrator->input->name = "gpio-vibrator";
-- 
2.27.0

