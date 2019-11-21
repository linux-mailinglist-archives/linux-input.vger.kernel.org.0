Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2256B105323
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2019 14:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfKUNcl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Nov 2019 08:32:41 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55205 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbfKUNcj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Nov 2019 08:32:39 -0500
Received: from orion.localdomain ([95.115.120.75]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MTzve-1iOXPb1Qri-00R0jc; Thu, 21 Nov 2019 14:32:37 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH 2/2] input: keyboard: gpio-keys-polled: skip oftree code when CONFIG_OF disabled
Date:   Thu, 21 Nov 2019 14:32:20 +0100
Message-Id: <20191121133220.13989-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191121133220.13989-1-info@metux.net>
References: <20191121133220.13989-1-info@metux.net>
X-Provags-ID: V03:K1:7d7SQUjeY6C4MPblBKG7KWj9tcwYNFidA/f7jKQhCk7fN1shJw1
 ef8hJ+5EUeDoU7hKuATfslkUt37P+iZiUewcCkxK5YWAUR/GxKp4Q6p5eL0noGDYMe48m2S
 +kFHAQ9JdHAk9FrQ35adc12yj3peisDuKN3Ho5DHyvnauWfIC8qyYcbRRsGOAdtjCygnAU9
 CB2iDmyhe79o3h9nGzf1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mB7XKHnNTNU=:gvisEP4zG9e3czFTse4L72
 QDosjls7njoQs2jOBglI78hQ0V2hshWJYK9yGheYLKAMn4WIpoEpeR1ij20bfyUikzB92cl0S
 JXHES7RTxL0eEKBcZw3NWWYzb4mJHj88yTpJ23V822hfVLV3bb1HMcq90yE9tGFMtbENF5q/2
 5WwI0+z+7sN14m5nbJjl+VnL4HmfX+lNEICFxSD6vhQ5aT2nGASxBnznCDweJGl1oo9f8fUsh
 K6uqDKhIjFCYk4jVFfrYOjFYRoJCTPYnTlonIkCYfw0iU+ihN2OVsyJfCWow1byMz+mKSLgiF
 FxpqpZVkPI/inHYY6bQ4L8mWTX/P1KoOqtJ0STQDmlYMyZMsRVOKYfxCrjzMltFYnJoq71sdR
 qD34w+x9KfFPyN+ZjUHQfC+ZSmoV7mGoikHJ6dPlC8KB0cQaSw0le//EmucCJhE6MQ/MT+UdQ
 AAPexZdwYPF451Hpxa5cA2Z832GXKdqCJjmd84ApD+754cle4vqbfDp4LgdLH7CqCB1N/rMXQ
 kPUyhaBBe3tuJoYTUX4RxwY90WeitoA6evNSlZnmMMSZSZM7WY/4VpcN/er/gpGIMYQ5YOVbY
 pJpaDdTHs78JgQIpTbdueStblLszEF5z/9taaqSniK8k2iDWAt/w62AKGINODFIZiZnfY6EWY
 5TcLl0/nUDijemuhOcnyBgSdvpF9KgKamyu7PZvJyUxWYXgVoNimMR5rQBTxpkNOK6X9sP+FW
 +fR7TwsH46aqcan5UKnEx+RAiJyDq8P8rPVsIP/04EOiZkWh+VVvXW9ampANVoAzCR69b1RZY
 cPwvaAP5SD7oHG5NUBNutSlxeKsyh1sA8/+31uZT6qox5wfSpAm7MFIbprcfzImxiXtJKnMVD
 yrNvJxOhWpSa9XbV0N+A==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

we don't need to build in oftree probing stuff when oftree isn't
enabled at all.

changes v2: use of_match_ptr() macro instead of ifdef's

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/input/keyboard/gpio_keys_polled.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 91754de7e763..d8123adfdbcb 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -144,6 +144,7 @@ static void gpio_keys_polled_close(struct input_polled_dev *dev)
 static struct gpio_keys_platform_data *
 gpio_keys_polled_get_devtree_pdata(struct device *dev)
 {
+#ifdef CONFIG_OF
 	struct gpio_keys_platform_data *pdata;
 	struct gpio_keys_button *button;
 	struct fwnode_handle *child;
@@ -199,6 +200,9 @@ gpio_keys_polled_get_devtree_pdata(struct device *dev)
 	}
 
 	return pdata;
+#else /* CONFIG_OF */
+	return ERR_PTR(-ENOENT);
+#endif /* CONFIG_OF */
 }
 
 static void gpio_keys_polled_set_abs_params(struct input_dev *input,
@@ -221,11 +225,13 @@ static void gpio_keys_polled_set_abs_params(struct input_dev *input,
 	input_set_abs_params(input, code, min, max, 0, 0);
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id gpio_keys_polled_of_match[] = {
 	{ .compatible = "gpio-keys-polled", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, gpio_keys_polled_of_match);
+#endif /* CONFIG_OF */
 
 static struct gpio_desc *gpio_keys_polled_get_gpiod_fwnode(
 	struct device *dev,
@@ -448,7 +454,7 @@ static struct platform_driver gpio_keys_polled_driver = {
 	.probe	= gpio_keys_polled_probe,
 	.driver	= {
 		.name	= DRV_NAME,
-		.of_match_table = gpio_keys_polled_of_match,
+		.of_match_table = of_match_ptr(gpio_keys_polled_of_match),
 	},
 };
 module_platform_driver(gpio_keys_polled_driver);
-- 
2.11.0

