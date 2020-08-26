Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6A4253681
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgHZSSg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:18:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:42356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbgHZSSc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:18:32 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D961208E4;
        Wed, 26 Aug 2020 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465911;
        bh=wc+b82bTQHczHUSk3dpD7WERqiGfyqDJdv7UpdSi9RM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wTIn6Baf6gF7WS/c37UJaugfgZk7yAvxZba56OhEt0JtNfy9QX/5n9gzEJsENo2FT
         SBxzgCkNOWq4IXJqAlC3N+mYZsG3Fo6i4znpkkwlDfjE917kfkL3UjxrVwhkPKQUjH
         4JuSvg5VFUlNOXCjmH94GbwXAgkhL5Z9dnV8jrdU=
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
Subject: [PATCH 16/24] Input: goodix - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:16:58 +0200
Message-Id: <20200826181706.11098-16-krzk@kernel.org>
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
 drivers/input/touchscreen/goodix.c | 40 ++++++++----------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 02c75ea385e0..48c4c3d297fe 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -864,7 +864,6 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
  */
 static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 {
-	int error;
 	struct device *dev;
 	struct gpio_desc *gpiod;
 	bool added_acpi_mappings = false;
@@ -874,33 +873,20 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	dev = &ts->client->dev;
 
 	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
-	if (IS_ERR(ts->avdd28)) {
-		error = PTR_ERR(ts->avdd28);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev,
-				"Failed to get AVDD28 regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->avdd28))
+		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
 
 	ts->vddio = devm_regulator_get(dev, "VDDIO");
-	if (IS_ERR(ts->vddio)) {
-		error = PTR_ERR(ts->vddio);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev,
-				"Failed to get VDDIO regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->vddio))
+		return dev_err_probe(dev, PTR_ERR(ts->vddio), "Failed to get VDDIO regulator\n");
 
 retry_get_irq_gpio:
 	/* Get the interrupt GPIO pin number */
 	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
-	if (IS_ERR(gpiod)) {
-		error = PTR_ERR(gpiod);
-		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
-				GOODIX_GPIO_INT_NAME, error);
-		return error;
-	}
+	if (IS_ERR(gpiod))
+		return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
+				     GOODIX_GPIO_INT_NAME);
+
 	if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings) {
 		added_acpi_mappings = true;
 		if (goodix_add_acpi_gpio_mappings(ts) == 0)
@@ -911,13 +897,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 
 	/* Get the reset line GPIO pin number */
 	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, GPIOD_IN);
-	if (IS_ERR(gpiod)) {
-		error = PTR_ERR(gpiod);
-		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
-				GOODIX_GPIO_RST_NAME, error);
-		return error;
-	}
+	if (IS_ERR(gpiod))
+		return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
+				     GOODIX_GPIO_RST_NAME);
 
 	ts->gpiod_rst = gpiod;
 
-- 
2.17.1

