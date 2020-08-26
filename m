Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8D0253696
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgHZSS4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:18:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:43336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727919AbgHZSSy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:18:54 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63936207BC;
        Wed, 26 Aug 2020 18:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465934;
        bh=/FkqaqIXZzbXcSTu05JXN8zxrYdqxFmLMeqEbZbaSRA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=06p6JI0CrZMQzNjpp2j1O2a/1td+bpk6bQoJR98SDTin+KM7qKpyiQ7lCPL8UJG/B
         yaVugQ9q9hBo2021b97piey1GLeGcmVphlu8oozFilhbpNMgGd4VXF3XyyzhAD3VzB
         iYboRS5ZSDDIAR35JXMqx8UQXvX3fainUSrUJizk=
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
Subject: [PATCH 23/24] Input: surface3_spi - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:17:05 +0200
Message-Id: <20200826181706.11098-23-krzk@kernel.org>
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
 drivers/input/touchscreen/surface3_spi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index ce4828b1415a..25bb77ddf2ef 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -223,7 +223,6 @@ static void surface3_spi_power(struct surface3_ts_data *data, bool on)
  */
 static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
 {
-	int error;
 	struct device *dev;
 	struct gpio_desc *gpiod;
 	int i;
@@ -233,15 +232,9 @@ static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
 	/* Get the reset lines GPIO pin number */
 	for (i = 0; i < 2; i++) {
 		gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			error = PTR_ERR(gpiod);
-			if (error != -EPROBE_DEFER)
-				dev_err(dev,
-					"Failed to get power GPIO %d: %d\n",
-					i,
-					error);
-			return error;
-		}
+		if (IS_ERR(gpiod))
+			return dev_err_probe(dev, PTR_ERR(gpiod),
+					     "Failed to get power GPIO %d\n", i);
 
 		data->gpiod_rst[i] = gpiod;
 	}
-- 
2.17.1

