Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8FA1052F2
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2019 14:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKUN2D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Nov 2019 08:28:03 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:48953 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUN2C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Nov 2019 08:28:02 -0500
Received: from orion.localdomain ([95.115.120.75]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mnqfc-1i4WUX3XLu-00pODl; Thu, 21 Nov 2019 14:27:59 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH] input: keyboard: gpio_keys_polled: use gpio lookup table
Date:   Thu, 21 Nov 2019 14:27:42 +0100
Message-Id: <20191121132742.13229-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:1OfNYO4swsve0M8W1DicuZ4rAzEafBKxUeqJOuaXHL1/gXGLaLs
 FUjr/ongM0PHTmKXy/DANWf8X2QmndKX/kTqdPjdMq9n4m3PCJjpOgnmABWBT7390CYcFl/
 E8ynsy7TUI35HkBx5/s2A9Skl+QNXxqIcOTm1xM7e/L8TSRDGJqsq2+FZgNPlTG15hNHbLU
 Eh2zbxZS9YvYnPHqeDMRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u+JV1FBqbeI=:oMIaJDmXtwcEUSxHA/iXfX
 ckS/UCMv5jZ3JMtNtKwoce8iD1rOoB8LGMEiNc5xjLSs7cIhwuEN1oM3FVUT5xJtX9VxiCXsF
 O5XPkSuC4Kz8400e2HrvuRYpwfCXEu9Tss7nu+IHOjh3TayR/PW2SuBt1b8a18IZnZPj1jJkU
 OgCYn7xYHILcBEozB5AwnkUhNRPNRoFFH/BcSxuO1Rs9oZIIhg+W5/FT0227IroQ6/Yxo7eUV
 1zAJFLcsbyEIh7oME/GLZLffUE5LNXrjRLZUSPFM+VRDHY5sDCA5flfS5K6UoakTswzgEX48G
 zcIDNu9h2aPHUV9vGhCjiRf7oDaCZq0T2daUOBXRzKUWz5KD+XmeimU3wVrJYw+LOuOQEhho4
 cxAfVimcOWVWFesxV9dAIYrulszqzyejNR31HEqweSmjtfv4dthyG7csG3U9M90W4OXMj2Tqh
 lCX4FUYJIjyLi7gZthoWCkKGDP41FnYtO+Gql+oGedKGmM53MxBK3sU6lnGimlmCd58UjLX+Y
 7py3Rm+o2jnsy8j5zgYNOpb4p3b9P/NwW3DVIqKsixuRT7AKGKZksvJtAxuwkqP379zcF4bKj
 wD3KK52/xMhxMiCwRs+fdHd3FxHv8ZHjkgajw1PbVxGtXpbhc2ARCT3YlxWZAa/KCMreQ4p8q
 pej9MCwI+YqptvoZEjH73v/Pc+8BP/COiwkh6sVkL2UjEktWVgMDuM37wkpcZpCVkR2CbLVNc
 LKkmZTsIdxi7pQd5S0Es34FvAEKkuDn/XrTXz9kFaH6Lv2IPnQ7P1Y6uSGLR06fxTCkHYzqNK
 nt/zV8T5iVwjcS/zmNDYggI2AgHcirjwfHykvxq+YDoUpnJMQ6X46cFOB77LvytDdB3kYmy4B
 vdD4LUmDojQFFdpkbAIA==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support the recently introduced gpio lookup tables for
attaching to gpio lines. So, harcoded gpio numbers aren't
needed anymore.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/input/keyboard/gpio_keys_polled.c | 167 +++++++++++++++++++++---------
 1 file changed, 119 insertions(+), 48 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 465eecfa6b3f..c268f657ba49 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio_keys.h>
 #include <linux/property.h>
 
@@ -226,6 +227,119 @@ static const struct of_device_id gpio_keys_polled_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, gpio_keys_polled_of_match);
 
+static struct gpio_desc *gpio_keys_polled_get_gpiod_fwnode(
+	struct device *dev,
+	int idx,
+	const char *desc)
+{
+	struct gpio_desc *gpiod;
+	struct fwnode_handle *child;
+	int x;
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
+	int error;
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
+		dev_err(dev, "failed fetching gpiod #%d: %d\n",
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
@@ -288,57 +402,14 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
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

