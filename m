Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133F42332F2
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 15:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgG3NYv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 09:24:51 -0400
Received: from vps.xff.cz ([195.181.215.36]:54988 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728760AbgG3NYv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 09:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1596115489; bh=z0TyS2KjMxaB3mAxoJny4kSRkgxtN+e0hcvKu1IAJzY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=t06Dc9u58MmLXeHH549DDineJPBx7yQrsTBnjwrgH1NrCO1cbOcFa2KMlCQOmHo1/
         lu3bYlfcdsHWeSiqgfnU41T9sD117Ai3zVOf+7HSmtjIT1lw0zadas0mAYVlcbCbTY
         pRjwkwy3ohud/9+d8SYZZWlQLycDMzCcRp5rofzw=
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
Subject: [PATCH v5 2/4] input: gpio-vibra: Allow to use vcc-supply alone to control the vibrator
Date:   Thu, 30 Jul 2020 15:24:44 +0200
Message-Id: <20200730132446.3139980-3-megous@megous.com>
In-Reply-To: <20200730132446.3139980-1-megous@megous.com>
References: <20200730132446.3139980-1-megous@megous.com>
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
 drivers/input/misc/gpio-vibra.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index f79f75595dd7..87508c3939e9 100644
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
@@ -112,16 +112,19 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 	if (!vibrator->input)
 		return -ENOMEM;
 
-	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
+	vibrator->vcc = devm_regulator_get_optional(&pdev->dev, "vcc");
 	err = PTR_ERR_OR_ZERO(vibrator->vcc);
-	if (err) {
+	if (err == -ENODEV) {
+		vibrator->vcc = NULL;
+	} else if (err) {
 		if (err != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "Failed to request regulator: %d\n",
 				err);
 		return err;
 	}
 
-	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
+	vibrator->gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						 GPIOD_OUT_LOW);
 	err = PTR_ERR_OR_ZERO(vibrator->gpio);
 	if (err) {
 		if (err != -EPROBE_DEFER)
@@ -130,6 +133,11 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
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

