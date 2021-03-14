Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF4233A824
	for <lists+linux-input@lfdr.de>; Sun, 14 Mar 2021 22:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhCNVKK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Mar 2021 17:10:10 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:42992 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229870AbhCNVJ7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Mar 2021 17:09:59 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id a1070ab1-8509-11eb-9eb8-005056bdd08f;
        Sun, 14 Mar 2021 23:09:56 +0200 (EET)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 1/2] Input: tsc2007 - convert to GPIO descriptors
Date:   Sun, 14 Mar 2021 23:09:50 +0200
Message-Id: <20210314210951.645783-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This converts the driver to use GPIO descriptors.

Note that it now uses logical polarity and thus nagation has been dropped.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v3: left ->get_pendown_state() assignment conditionally (Dmitry)
 drivers/input/touchscreen/tsc2007.h      |  4 +++-
 drivers/input/touchscreen/tsc2007_core.c | 12 ++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
index 91c60bf6dcaf..69b08dd6c8df 100644
--- a/drivers/input/touchscreen/tsc2007.h
+++ b/drivers/input/touchscreen/tsc2007.h
@@ -19,6 +19,8 @@
 #ifndef _TSC2007_H
 #define _TSC2007_H
 
+struct gpio_desc;
+
 #define TSC2007_MEASURE_TEMP0		(0x0 << 4)
 #define TSC2007_MEASURE_AUX		(0x2 << 4)
 #define TSC2007_MEASURE_TEMP1		(0x4 << 4)
@@ -69,7 +71,7 @@ struct tsc2007 {
 	int			fuzzy;
 	int			fuzzz;
 
-	unsigned int		gpio;
+	struct gpio_desc	*gpiod;
 	int			irq;
 
 	wait_queue_head_t	wait;
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 3b80abfc1eca..e4ab5962ddd4 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -19,11 +19,11 @@
 
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_data/tsc2007.h>
 #include "tsc2007.h"
 
@@ -226,11 +226,12 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct tsc2007 *ts = i2c_get_clientdata(client);
 
-	return !gpio_get_value(ts->gpio);
+	return gpiod_get_value(ts->gpiod);
 }
 
 static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
 {
+	struct device *dev = &client->dev;
 	struct device_node *np = client->dev.of_node;
 	u32 val32;
 	u64 val64;
@@ -266,8 +267,11 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
 		return -EINVAL;
 	}
 
-	ts->gpio = of_get_gpio(np, 0);
-	if (gpio_is_valid(ts->gpio))
+	ts->gpiod = devm_gpiod_get_optional(dev, NULL, GPIOD_IN);
+	if (IS_ERR(ts->gpiod))
+		return PTR_ERR(ts->gpiod);
+
+	if (ts->gpiod)
 		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
 	else
 		dev_warn(&client->dev,
-- 
2.30.2

