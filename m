Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6633304F4
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 23:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhCGWWP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 17:22:15 -0500
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:23038 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233139AbhCGWVz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Mar 2021 17:21:55 -0500
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 47bc417c-7f91-11eb-88cb-005056bdf889;
        Mon, 08 Mar 2021 00:05:51 +0200 (EET)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 2/2] Input: tsc2007 - make use of device properties
Date:   Mon,  8 Mar 2021 00:05:49 +0200
Message-Id: <20210307220549.354263-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210307220549.354263-1-andy.shevchenko@gmail.com>
References: <20210307220549.354263-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Device property API allows to gather device resources from different sources,
such as ACPI. Convert the drivers to unleash the power of device property API.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 35 +++++++-----------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 9b747c7d11f1..2759eb6a9bad 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -23,7 +23,8 @@
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/platform_data/tsc2007.h>
 #include "tsc2007.h"
 
@@ -220,7 +221,6 @@ static void tsc2007_close(struct input_dev *input_dev)
 	tsc2007_stop(ts);
 }
 
-#ifdef CONFIG_OF
 static int tsc2007_get_pendown_state_gpio(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -232,38 +232,32 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
 static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
 {
 	struct device *dev = &client->dev;
-	struct device_node *np = client->dev.of_node;
 	u32 val32;
 	u64 val64;
 
-	if (!np) {
-		dev_err(&client->dev, "missing device tree data\n");
-		return -EINVAL;
-	}
-
-	if (!of_property_read_u32(np, "ti,max-rt", &val32))
+	if (!device_property_read_u32(dev, "ti,max-rt", &val32))
 		ts->max_rt = val32;
 	else
 		ts->max_rt = MAX_12BIT;
 
-	if (!of_property_read_u32(np, "ti,fuzzx", &val32))
+	if (!device_property_read_u32(dev, "ti,fuzzx", &val32))
 		ts->fuzzx = val32;
 
-	if (!of_property_read_u32(np, "ti,fuzzy", &val32))
+	if (!device_property_read_u32(dev, "ti,fuzzy", &val32))
 		ts->fuzzy = val32;
 
-	if (!of_property_read_u32(np, "ti,fuzzz", &val32))
+	if (!device_property_read_u32(dev, "ti,fuzzz", &val32))
 		ts->fuzzz = val32;
 
-	if (!of_property_read_u64(np, "ti,poll-period", &val64))
+	if (!device_property_read_u64(dev, "ti,poll-period", &val64))
 		ts->poll_period = msecs_to_jiffies(val64);
 	else
 		ts->poll_period = msecs_to_jiffies(1);
 
-	if (!of_property_read_u32(np, "ti,x-plate-ohms", &val32)) {
+	if (!device_property_read_u32(dev, "ti,x-plate-ohms", &val32)) {
 		ts->x_plate_ohms = val32;
 	} else {
-		dev_err(&client->dev, "missing ti,x-plate-ohms devicetree property.");
+		dev_err(dev, "missing ti,x-plate-ohms devicetree property.");
 		return -EINVAL;
 	}
 
@@ -275,13 +269,6 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
 
 	return 0;
 }
-#else
-static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
-{
-	dev_err(&client->dev, "platform data is required!\n");
-	return -EINVAL;
-}
-#endif
 
 static int tsc2007_probe_pdev(struct i2c_client *client, struct tsc2007 *ts,
 			      const struct tsc2007_platform_data *pdata,
@@ -430,18 +417,16 @@ static const struct i2c_device_id tsc2007_idtable[] = {
 
 MODULE_DEVICE_TABLE(i2c, tsc2007_idtable);
 
-#ifdef CONFIG_OF
 static const struct of_device_id tsc2007_of_match[] = {
 	{ .compatible = "ti,tsc2007" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tsc2007_of_match);
-#endif
 
 static struct i2c_driver tsc2007_driver = {
 	.driver = {
 		.name	= "tsc2007",
-		.of_match_table = of_match_ptr(tsc2007_of_match),
+		.of_match_table = tsc2007_of_match,
 	},
 	.id_table	= tsc2007_idtable,
 	.probe		= tsc2007_probe,
-- 
2.30.1

