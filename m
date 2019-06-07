Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA65A38D81
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2019 16:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbfFGOjj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jun 2019 10:39:39 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38177 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfFGOjj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jun 2019 10:39:39 -0400
Received: from orion.localdomain ([77.2.74.140]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mnq0I-1gkCgc1m4A-00pMLs; Fri, 07 Jun 2019 16:39:36 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH] input: keyboard: gpio_keys_polled: use gpio lookup table
Date:   Fri,  7 Jun 2019 16:39:34 +0200
Message-Id: <1559918374-7749-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:3X2lnydmm30AHyhp5y/Nd1eD95I/Iq/DSyTfK74YNXDUvwJ5AcY
 HTe95NLzE7bqDqUM+84a9PvWdBXezy9d7vVwCzK1eqtQ+6mhS2aE0qJ7gU//2EH17ZYvli6
 moUk6FHBSa1BYgWCPg98Kds2WJRxdjZpcVVp/WvbzprIE7Ra5q3Imknz6B7ywJcYn0ZMk0/
 Q06VZH+lPO5QpBOPJCDPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:60VJaZjUlZY=:4tA3vbU6jRz7OYS0xskXO0
 VgiE4GqT8pTRbNPtp81kaYCQu4Ga3+1bk8Ssgyq5zwFK3AHPjhTNpO4wiBv5ieHvi0O23FFcn
 CT3YvDsumJkqR/kQbOVABqc/R4FeuveIR52DkgtfmX37tg9Hqdlvx59XCIzUp+kO24iR3caL/
 81ipRPeA+drtKsfAtANPjz85471/Bxe+ecsYTciqBio3uzW1DtiJJI9uStRFMAqF5NpXNqJM3
 mQQnZc+njWUB6fvlUzXCMOwC2A7mkDSIAg5SFBaaMoE0ujPAnjLRHIfu5UinUQuXdxMl6tuPQ
 ddZe+MsI7b95nwxYiYhk3paboEyogNuDgbv2Ae1JsqTxwHr2/eUySApGIesmv+pSbWcllYIm0
 wALoeBuftE1Byvfkph7vqI/IUTJYK/7Wpk5shHkDCMu6XFBvq18AgLI9dnVXpcfdP0ATS7rhz
 1SCkbSGfYLCawHRYZnYaOw2UOJZrZ0DEiPcvzGJQNIEnpyDv5v3vEa8M6C8xIGwNFsBOAk3lK
 KfrM19cnpmIGTlCQz5zBpHz4Q70RhkYpEbWsQ7V6DixtVQ+Lj4pRZm+rFKCqhq5ToBGvjSt+Y
 Y3KOrlY1Quw6hS3Zt7ytVKiV7Ov3csXh4+gUzyoaTLH2PBnkNrqqh2SKAl1GJgHRn9cwoe7nY
 HtCCHn2/tcu1ftYryaRXB6vPeXc0SAke4e9QwcEhjis4iodxH1s9pUqyB52GeSrltuAvMzfC/
 Qyr7aA1NNv2KrGAslze4wGlV5/t0RGfXPVIWzA==
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
index edc7262..683ab84 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio_keys.h>
 #include <linux/property.h>
 
@@ -227,6 +228,118 @@ static void gpio_keys_polled_set_abs_params(struct input_dev *input,
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
@@ -291,57 +404,14 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
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

