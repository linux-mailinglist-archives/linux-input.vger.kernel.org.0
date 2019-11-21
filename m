Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD01105320
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2019 14:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfKUNcj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Nov 2019 08:32:39 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:34363 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfKUNci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Nov 2019 08:32:38 -0500
Received: from orion.localdomain ([95.115.120.75]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M277h-1iaGTs0W2D-002Yn9; Thu, 21 Nov 2019 14:32:37 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH 1/2] input: keyboard: gpio_keys_polled: use gpio lookup table
Date:   Thu, 21 Nov 2019 14:32:19 +0100
Message-Id: <20191121133220.13989-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:xszCC3KB46jhAVMI5MH++Ctgk+20sv6EaYD9EcQyDwMD2f23JPD
 18kbGJtYPLptXEOJg7eY8MU8gackXqnVM1/xSaMvufmE4cfHwddBGuzFTUOvyulqAGfxGzc
 btBIuUsDJyvMMOMFtT4MGcl/T8kh3bbreA+VSNexzJP/5LkyUibB1DbUx31OmxUIF2IM8ao
 EV9bfmzTZOuk6s6ZcZj9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/i9YT3zU46w=:rKx3kKK/mLfPbLLAvP0EZ+
 WJo5Gx/fwatV8uCg7eKELTHlRt2osQ+XN8I1mOY/OMUkTrOMng0eAPHJhrLQLcNOYeqIQn3bc
 1aO3s1jmk3B5ZgYZdYkmPNJyZ5/kT0BzEvItbd7wcHuFzl6TYtPR2q/kpfir/ECRJ7VkZWdjl
 uN0o1iapFzG/yNXf3l2rOzIVNN6p7bjolewGmZD957MBM/ppyHsfwaOJrC6ZzlDodZZu1GZw0
 HWUF+MhN9vJMrclK+VpFoGsGAGPwSbXjc3DjhNCFxYMLwGTXyfvt9dIirajfYJ4MeRtoK43ys
 6ItsA12SSceb/K/y35j+EvoKvV0J4Fc7bOoN7+mkxcpjWa4z+2MyS1hGgwdUNRdcJjRz7OEhS
 zErwOoMFWroVaCe2cIumQ4ffianPCkfZzbfd7TeTKDhShSvl5fg8BSpyQpr5GF6ZThHSV87pf
 fgdutVL02zto7KsTGB/w54ZrFFjLbMqvVYb+3fK/xS0+nd15TOvwg2b7/tdZVwrvApE4az7jv
 EhKz/QayfUU3ljeCtYlKhc3ERcOpVwPZAF97CVbIFKcrdrrkMd+6Z4WH7VhgV2PQurE7JJrOm
 sNFiLwlxBsM83IPA3G25H8z0Pjpyrf/ogqCgkXgRL124DRUIp+6+/J20Izn9u6Kun1pjJLI8U
 6PvV+ZaM05Bj85ytopSJ56v8TIeIWeVkBeomCF40ndHc+optDC7pef/71gZvCYobKPTQ77LhX
 M89VwZMiHt5rG02uL2G/HoA4b6dP/e1laIhKNV2JaQZd7zHj22i4hXv5HZ7woc6LRQf5CCzj7
 o5L/PL3quBrpvL4w1TOPX5hHBSZeLs9+2SYSy2eabZhGYCCv6YQ4EmEg5kKafNtRPRmqDQu7S
 al0r1dCBp7DgA0NdKcLw==
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
index 465eecfa6b3f..91754de7e763 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio_keys.h>
 #include <linux/property.h>
 
@@ -226,6 +227,118 @@ static const struct of_device_id gpio_keys_polled_of_match[] = {
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
2.11.0

