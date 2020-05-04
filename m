Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE9C1C4305
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 19:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgEDRh6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 13:37:58 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37962 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730039AbgEDRh5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 May 2020 13:37:57 -0400
Received: from zenbar.fritz.box (pD95EF30E.dip0.t-ipconnect.de [217.94.243.14])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 29A4A403F58;
        Mon,  4 May 2020 17:35:17 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 3/3] input: touchscreen: ads7846: switch to gpiod API
Date:   Mon,  4 May 2020 19:37:45 +0200
Message-Id: <20200504173745.1246505-3-daniel@zonque.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504173745.1246505-1-daniel@zonque.org>
References: <20200504173745.1246505-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use gpiod_* function to access the pendown GPIO line.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/ads7846.c | 53 ++++++++++++++++-------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 7f4ead542a73..b3e17ee4e499 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -27,7 +27,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
 #include <linux/regulator/consumer.h>
@@ -137,7 +137,7 @@ struct ads7846 {
 	void			*filter_data;
 	void			(*filter_cleanup)(void *data);
 	int			(*get_pendown_state)(void);
-	int			gpio_pendown;
+	struct gpio_desc	*gpio_pendown;
 
 	void			(*wait_for_sync)(void);
 };
@@ -598,7 +598,7 @@ static int get_pendown_state(struct ads7846 *ts)
 	if (ts->get_pendown_state)
 		return ts->get_pendown_state();
 
-	return !gpio_get_value(ts->gpio_pendown);
+	return !gpiod_get_value(ts->gpio_pendown);
 }
 
 static void null_wait_for_sync(void)
@@ -919,6 +919,7 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 				 struct ads7846 *ts,
 				 const struct ads7846_platform_data *pdata)
 {
+	struct device *dev = &spi->dev;
 	int err;
 
 	/*
@@ -929,27 +930,33 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 
 	if (pdata->get_pendown_state) {
 		ts->get_pendown_state = pdata->get_pendown_state;
-	} else if (gpio_is_valid(pdata->gpio_pendown)) {
-
-		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
-					    GPIOF_IN, "ads7846_pendown");
-		if (err) {
-			dev_err(&spi->dev,
-				"failed to request/setup pendown GPIO%d: %d\n",
-				pdata->gpio_pendown, err);
-			return err;
-		}
+		return 0;
+	}
 
-		ts->gpio_pendown = pdata->gpio_pendown;
+	ts->gpio_pendown = devm_gpiod_get(dev, "pendown", GPIOD_IN);
+	if (IS_ERR(ts->gpio_pendown)) {
+		err = PTR_ERR(ts->gpio_pendown);
 
-		if (pdata->gpio_pendown_debounce)
-			gpio_set_debounce(pdata->gpio_pendown,
-					  pdata->gpio_pendown_debounce);
-	} else {
-		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
-		return -EINVAL;
+		if (gpio_is_valid(pdata->gpio_pendown)) {
+			err = devm_gpio_request_one(dev, pdata->gpio_pendown,
+						    GPIOF_IN,
+						    "ads7846_pendown");
+			if (err < 0)
+				return err;
+
+			ts->gpio_pendown = gpio_to_desc(pdata->gpio_pendown);
+			if (!ts->gpio_pendown)
+				return -EINVAL;
+		}
+
+		if (err < 0)
+			return err;
 	}
 
+	if (pdata->gpio_pendown_debounce)
+		gpiod_set_debounce(ts->gpio_pendown,
+				   pdata->gpio_pendown_debounce);
+
 	return 0;
 }
 
@@ -1236,8 +1243,6 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
 	pdata->wakeup = of_property_read_bool(node, "wakeup-source") ||
 			of_property_read_bool(node, "linux,wakeup");
 
-	pdata->gpio_pendown = of_get_named_gpio(dev->of_node, "pendown-gpio", 0);
-
 	return pdata;
 }
 #else
@@ -1340,8 +1345,10 @@ static int ads7846_probe(struct spi_device *spi)
 	}
 
 	err = ads7846_setup_pendown(spi, ts, pdata);
-	if (err)
+	if (err) {
+		dev_err(dev, "Unable to request pendown GPIO: %d", err);
 		goto err_cleanup_filter;
+	}
 
 	if (pdata->penirq_recheck_delay_usecs)
 		ts->penirq_recheck_delay_usecs =
-- 
2.26.2

