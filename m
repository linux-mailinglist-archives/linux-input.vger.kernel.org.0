Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91DE711C12F
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfLLANo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:13:44 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56225 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfLLANo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:13:44 -0500
Received: from orion.localdomain ([95.118.81.154]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRk8w-1iHehw16t8-00TE0F; Thu, 12 Dec 2019 01:13:42 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH v4] input: keyboard: gpio_keys_polled: use gpio lookup table
Date:   Thu, 12 Dec 2019 01:13:11 +0100
Message-Id: <20191212001311.4268-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:hzkcK0KVH3HkZ1kB/dsKgamqh1CtK0vjkGCIf569CcCy32nvihO
 qwLG7k+DkCi9x72Y4mCC8ze4vjZwGknTijFYJYYXahXWpT5kZ4O0zVY5kdVfrsQzIEVTwYg
 i1PkUPFnRiKvIUu8QRkXrD7nRQxg7iK5Q6ma7e8OynDI4dpgpYPgwynH1vgye5h5OUZ2mQU
 UJX7cnd5XVkTnkAEJeojg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cHgGsh2LhJ0=:OBOH/rCptuMNuuEaKYUmw4
 A+dWhhYpUDvxAbG6AEpLIEVPvmuHwyRDCkPreK+/Xs624yh3mPYDoZfhpPTZ95Zg4RSvH4ARm
 gum4R/gvhMFu48wYm9MKPGuSkjZvdIxbV75uh7jpKnNaTFOg2lQfqzqaylZ1Xwqvd7IjcuuDX
 G0EmkWjO4/XU+Mo8e5UYmzqq3b6k+iha4vLPbh9EdCRuB+sv6cu8El3UQmtszW4kG58Dl7Lfa
 SytValFR7aCHWRa55eZGqtCUQXjurI2ENLgTiKNexUNQdg1oFW2P2eGw3vjTvlDXUe5saQokA
 f8A5YYv/vanNg5mIVAkNIkRqRKBiGQ08GNw8ZeMkjaOVxKoJI7L5jEEmk7WTnJbXhVgymdDUm
 /sUsbyZNd2FSvc5Nli3uFpUoCtF4h66irjqb0qb+uqVDiMCoh1iiaA6oOWmO9QS+0UP76v6Ga
 QUYslecDpoj7nLBjSnWmzISvEUJyWCMygbReWgpaa3UdNZloeRQ46W/wXPOpXixFBBLwazVG5
 K/Skig4UHtOVvXbKH+gD0nHvG5JaHJg6IDo6Dv/EP927xM17uuDJda/+phiGkZ+AsyAhEeLkH
 npEW81vVrUxaZiQRNTCzzCTBbZJgZYYCKln2anyy3xmCcMuovlp02JgWRITc1Jj9BPP6M7yuj
 SlT1QlVLH3zcrFpdZ8RdTrr7cULjmo97r0oWhWsRdN7UBD0QUXmpfm1xV1nItGxS1ocMBK035
 hLuRBVEHXiW+ZkTE1JGH9YHEiPs3Toj3n4K2qHcDi7/brOw97x/yag+aGjzJE1LZFHBmSNYYr
 OKLHSBReDM9dIsouuRgOSWUOflwXR7tdZ9Ma4VyGGUr3TCY1PnupBldeLcMm0foGQY7S8TCRf
 xYPIbweJ/VB9LQFa8bqA==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Support the recently introduced gpio lookup tables for
attaching to gpio lines. So, harcoded gpio numbers aren't
needed anymore.

changes v4:
    * completely rewritten in a much simpler way, now just adding
      a third case (in the button probe loop), where neither oftree
      nor raw gpio number exists.

changes v3:
    * fix printf string in gpio_keys_polled_get_gpiod()
    * fix unused variable 'error' in gpio_keys_polled_get_gpiod()
    * fix uninitialized variable in gpio_keys_polled_get_gpiod_fwnode()

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/input/keyboard/gpio_keys_polled.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 6eb0a2f3f9de..9ef8c7dade27 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -307,7 +307,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 				fwnode_handle_put(child);
 				return error;
 			}
-		} else if (gpio_is_valid(button->gpio)) {
+		} else if ((button->gpio > 0) && gpio_is_valid(button->gpio)) {
 			/*
 			 * Legacy GPIO number so request the GPIO here and
 			 * convert it to descriptor.
@@ -333,6 +333,18 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 					button->gpio);
 				return -EINVAL;
 			}
+		} else {
+			/* try via gpio lookup table */
+			bdata->gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOF_IN);
+			if (IS_ERR(bdata->gpiod)) {
+				dev_err(dev,
+					"unable to get gpio for button %d: %ld\n",
+					i, PTR_ERR(bdata->gpiod));
+				return PTR_ERR(bdata->gpiod);
+			}
+
+			gpiod_set_consumer_name(bdata->gpiod,
+						button->desc ? : DRV_NAME);
 		}
 
 		bdata->last_state = -1;
-- 
2.11.0

