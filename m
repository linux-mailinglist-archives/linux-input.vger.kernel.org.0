Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5C327900C
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbfG2QAA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 12:00:00 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34559 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbfG2P76 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 11:59:58 -0400
Received: from orion.localdomain ([77.4.29.213]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQvH5-1i3RmN0P3v-00O0Kl; Mon, 29 Jul 2019 17:59:56 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH 1/2] input: keyboard: gpio_keys_polled: use gpio lookup table
Date:   Mon, 29 Jul 2019 17:59:53 +0200
Message-Id: <1564415994-22871-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:ZAmw34Aq9doQ/9pPHR88cUNMw9M3YJ8+/2ShDQM+6EQ3NnMWy+w
 B6PVXMC2PMrVWeYKTJZRFH9+mLHCY5j+j+9mHAzU0JNbX7mNat+WKIs+nKeU5LnTQNc/5mx
 7MqpsfNLO0IGzq8ln4GIWQVTNtAxZp12R91XCDqnGzC7MchsmRZ3MDvveRUkhLMgV4m7uX9
 hcvVdzcydA4ija9C0t2OQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y5lnNuufQUQ=:54uSroeLlBhPZJqSzjHy8P
 sckYNpemCUBexpbhVTLu7pWpQYkC7xlaSyWAdG4yQybYL4hNktT30FsKzkMw35MYEbtTNTh2H
 4xk6cFDFCUtCrr+BFpnhdcd1miAltKztpeJ/a3EkNVsshTgoUZuA2RO/505+bCZ73HvjALUts
 SnlZPfQg5HD9qu9UB35KlkiZ6UFjwrwBvm9gNqEBzqFSiYFhEao9pJ3g4ZMBa71CoDaZ55Z9F
 Z84uPE3SA+p+1k7IX7Cj4xEU4s3omckavgqpFEKh0LZ7ylFjRBGtHWveTjvtzKfKjRZOWeb9+
 ZhWZKEbb0sZUZHjCSgk9967+KQirA7eiSOOwEDyhenHa7HPRoEOJiArwqQzXbNfZiY42mUjcy
 ZYSCCZvQjRoFKJff4LNL7XRTce48TzbviH9phQq/DvNChsvn8cfTQybGHDGh9iubEiJXPwkAb
 TmXxSfm6sevKF/lHvPmJleJUg9zDgFmFlUNZEJ8KgaH5VDUfaYToCL7LJjMyo3cLqJtVOOjX3
 eSux6oEzf4Ap1xAEPmGrk79MhhcPUz2wPpwTOaeGco9loFShiRQ3fvWz1PstijmvpTyeBdDGM
 PLQEpFuIHdrU92Ztyxe7pCPwOaFGAlI+X3KDFPRrvgN+1dPv8xjB2R/7CDf1ek6qOI4hjKDS4
 cVqNC8Zj8KXW5pYQW9uI5CARMRiA5N3wk29NAKj7PYUxyYj7mCJiFkIvUXdVis0NJUL0Ch8DY
 6zh7i2duceQher7TaCZBERQpV1RXKu1QQllb+g==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Support the recently introduced gpio lookup tables for
attaching to gpio lines. So, harcoded gpio numbers aren't
needed anymore.

changes v3:
    * fix printf string in gpio_keys_polled_get_gpiod()
    * fix unused variable 'error' in gpio_keys_polled_get_gpiod()
    * fix uninitialized variable in gpio_keys_polled_get_gpiod_fwnode()

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/input/keyboard/gpio_keys_polled.c | 166 +++++++++++++++++++++---------
 1 file changed, 118 insertions(+), 48 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 465eecf..91754de 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio_keys.h>
 #include <linux/property.h>
 
@@ -226,6 +227,118 @@ static void gpio_keys_polled_set_abs_params(struct input_dev *input,
 };
 MODULE_DEVICE_TABLE(of, gpio_keys_polled_of_match);
 
+static struct gpio_desc *gpio_keys_polled_get_gpiod_fwnode(
+	struct device *dev,
+	int idx,
+	const char *desc)
+{
+	struct gpio_desc *gpiod;
+	struct fwnode_handle *child;
+	int x = idx;
+
+	/* get the idx'th child node */
+	child = device_get_next_child_node(dev, NULL);
+	while (child && x) {
+		child = device_get_next_child_node(dev, child);
+		x--;
+	}
+
+	if (!child) {
+		dev_err(dev, "missing oftree child node #%d\n", idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	gpiod = devm_fwnode_get_gpiod_from_child(dev,
+						 NULL,
+						 child,
+						 GPIOD_IN,
+						 desc);
+	if (IS_ERR(gpiod)) {
+		if (PTR_ERR(gpiod) != -EPROBE_DEFER)
+			dev_err(dev,
+				"failed to get gpio: %ld\n",
+				PTR_ERR(gpiod));
+		fwnode_handle_put(child);
+		return gpiod;
+	}
+
+	return gpiod;
+}
+
+static struct gpio_desc *gpio_keys_polled_get_gpiod_legacy(
+	struct device *dev,
+	int idx,
+	const struct gpio_keys_button *button)
+{
+	/*
+	 * Legacy GPIO number so request the GPIO here and
+	 * convert it to descriptor.
+	 */
+	unsigned int flags = GPIOF_IN;
+	struct gpio_desc *gpiod;
+	int error;
+
+	dev_info(dev, "hardcoded gpio IDs are deprecated.\n");
+
+	if (button->active_low)
+		flags |= GPIOF_ACTIVE_LOW;
+
+	error = devm_gpio_request_one(dev, button->gpio,
+			flags, button->desc ? : DRV_NAME);
+	if (error) {
+		dev_err(dev,
+			"unable to claim gpio %u, err=%d\n",
+			button->gpio, error);
+		return ERR_PTR(error);
+	}
+
+	gpiod = gpio_to_desc(button->gpio);
+	if (!gpiod) {
+		dev_err(dev,
+			"unable to convert gpio %u to descriptor\n",
+			button->gpio);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return gpiod;
+}
+
+static struct gpio_desc *gpio_keys_polled_get_gpiod(
+	struct device *dev,
+	int idx,
+	const struct gpio_keys_button *button)
+{
+	struct gpio_desc *gpiod = NULL;
+
+	/* No legacy static platform data - use oftree */
+	if (!dev_get_platdata(dev)) {
+		return gpio_keys_polled_get_gpiod_fwnode(
+			dev, idx, button->desc);
+	}
+
+	gpiod = devm_gpiod_get_index(dev, NULL, idx, GPIOF_IN);
+
+	if (!IS_ERR(gpiod)) {
+		dev_info(dev, "picked gpiod idx %d from gpio table\n", idx);
+		gpiod_set_consumer_name(gpiod, button->desc ? : DRV_NAME);
+		return gpiod;
+	}
+
+	if (PTR_ERR(gpiod) != -ENOENT) {
+		dev_err(dev, "failed fetching gpiod #%d: %ld\n",
+			idx, PTR_ERR(gpiod));
+		return gpiod;
+	}
+
+	/* Use legacy gpio id, if defined */
+	if (gpio_is_valid(button->gpio)) {
+		return gpio_keys_polled_get_gpiod_legacy(
+			dev, idx, button);
+	}
+
+	return ERR_PTR(-ENOENT);
+}
+
 static int gpio_keys_polled_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -288,57 +401,14 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 		if (button->wakeup) {
 			dev_err(dev, DRV_NAME " does not support wakeup\n");
-			fwnode_handle_put(child);
 			return -EINVAL;
 		}
 
-		if (!dev_get_platdata(dev)) {
-			/* No legacy static platform data */
-			child = device_get_next_child_node(dev, child);
-			if (!child) {
-				dev_err(dev, "missing child device node\n");
-				return -EINVAL;
-			}
-
-			bdata->gpiod = devm_fwnode_get_gpiod_from_child(dev,
-								NULL, child,
-								GPIOD_IN,
-								button->desc);
-			if (IS_ERR(bdata->gpiod)) {
-				error = PTR_ERR(bdata->gpiod);
-				if (error != -EPROBE_DEFER)
-					dev_err(dev,
-						"failed to get gpio: %d\n",
-						error);
-				fwnode_handle_put(child);
-				return error;
-			}
-		} else if (gpio_is_valid(button->gpio)) {
-			/*
-			 * Legacy GPIO number so request the GPIO here and
-			 * convert it to descriptor.
-			 */
-			unsigned flags = GPIOF_IN;
-
-			if (button->active_low)
-				flags |= GPIOF_ACTIVE_LOW;
-
-			error = devm_gpio_request_one(dev, button->gpio,
-					flags, button->desc ? : DRV_NAME);
-			if (error) {
-				dev_err(dev,
-					"unable to claim gpio %u, err=%d\n",
-					button->gpio, error);
-				return error;
-			}
-
-			bdata->gpiod = gpio_to_desc(button->gpio);
-			if (!bdata->gpiod) {
-				dev_err(dev,
-					"unable to convert gpio %u to descriptor\n",
-					button->gpio);
-				return -EINVAL;
-			}
+		bdata->gpiod = gpio_keys_polled_get_gpiod(dev, i, button);
+
+		if (IS_ERR(bdata->gpiod)) {
+			dev_err(dev, "failed to fetch gpiod #%d\n", i);
+			return PTR_ERR(bdata->gpiod);
 		}
 
 		bdata->last_state = -1;
-- 
1.9.1

