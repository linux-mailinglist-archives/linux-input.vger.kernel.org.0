Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4770E7900B
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfG2P77 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 11:59:59 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53961 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbfG2P76 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 11:59:58 -0400
Received: from orion.localdomain ([77.4.29.213]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mr9OA-1iCcpO1IpS-00oESs; Mon, 29 Jul 2019 17:59:56 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH 2/2] input: keyboard: gpio-keys-polled: skip oftree code when CONFIG_OF disabled
Date:   Mon, 29 Jul 2019 17:59:54 +0200
Message-Id: <1564415994-22871-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564415994-22871-1-git-send-email-info@metux.net>
References: <1564415994-22871-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:tf+NxGZLMNSxLcJ3t8Jh0ndT+DTNEXndmtNrGT7uHDoTsy1tSJD
 wEmZRl0gISmE3lhL1teCAVMJmPK94fNzCJfkCFtvTYgBje6Do9xBdldtZbqUCqgl+Shh7AO
 6OO+GQaESRcuE8LQa3YE9F3SqZr0WRsCHKepktGTnoqWtBv65XXlbZKgu9eL8oEAILBjv4x
 Byo3m7y9zgBEaxiJvDPRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UbFBrWOH35c=:G92D1TlQZggFxkSvV6UjpO
 441npqugcJ1NHX1s3Q7t3j1JucxToACTsawWJv+B2IFwecM3wOPEm8Bqrv6nXjAFW1sCVGFM5
 JNFFwScCMFxyQiF6RxN9eIdyN0u24sn/rOMA4/u9aekHea5U6XRaMM9k29OFPMOsbF8V/mX1f
 ++W3V1PWdXY8j/Jt0+96Nbyrazt0Hp58e9pZT2lMkUzF/N/Rc/D5RTTYrxuH8EHW5ChbsyoHD
 xCxqEOHEkCWuUaZCrtYXGgJQRrBmjPYeHUkf5cBtiJIWOuLkfW0YGORkLrLb/2wBpYTIZPuqX
 rj/jmTo+1y02sJmTn/6tjfkyfXzBMomA8nPnrPzgRfKp02EcAr+K9Y9z1q7s/aBaqmhE0OMCl
 Xh4q9ol6DuajP2j3rtOeSrxhVgp1Cau8tRw94CnhM6N+jnr6x+Zi//UVvuhsiAeSkteaA+1/H
 YF7h4Z9EOVhE2SxfDU23JaiGWzfTGcTU3sXFMzB/G49B9xWBoTcNxBRbjEjmal+1+dJN+b2l7
 PvCcnLSE0HpluhOKrPuANy03tDitMHeRd3/Sj/Wbl1Hw2kTZhPuC+m/LUcpXCwMeUQCBzjCxZ
 yGSWyQaxArxMZGV7dYVjL38r4U9gx4kGXC5y9lBglKkpc4uP445AOT0FuTgQB8WImNID1DG7H
 X5BcyzyLsCnj8L6ZARs15xNzJqBCPtJJSvv6vpo7LOFS0NN6IGFB/eR1IgdLL9wEQR9DxKfhb
 SdTNIe67x2eFYun5B6z+LwuoAyzHd62ELrz3sw==
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
index 91754de..d8123ad 100644
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
@@ -199,6 +200,9 @@ static void gpio_keys_polled_close(struct input_polled_dev *dev)
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
@@ -448,7 +454,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 	.probe	= gpio_keys_polled_probe,
 	.driver	= {
 		.name	= DRV_NAME,
-		.of_match_table = gpio_keys_polled_of_match,
+		.of_match_table = of_match_ptr(gpio_keys_polled_of_match),
 	},
 };
 module_platform_driver(gpio_keys_polled_driver);
-- 
1.9.1

