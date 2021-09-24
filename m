Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDAB8416CA1
	for <lists+linux-input@lfdr.de>; Fri, 24 Sep 2021 09:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244191AbhIXHSs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Sep 2021 03:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244324AbhIXHSr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Sep 2021 03:18:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C38C061756
        for <linux-input@vger.kernel.org>; Fri, 24 Sep 2021 00:17:14 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:5dd8:9bc4:3752:5710])
        by michel.telenet-ops.be with bizsmtp
        id xjHD2500C2gynNa06jHD1y; Fri, 24 Sep 2021 09:17:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mTfSL-008VhM-0i; Fri, 24 Sep 2021 09:17:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mTfSK-007LTR-Hf; Fri, 24 Sep 2021 09:17:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Input: gpio-keys - convert to dev_err_probe()
Date:   Fri, 24 Sep 2021 09:17:11 +0200
Message-Id: <5cc045d789a71f5c2896b7c11eb79ea75a9fabf8.1632467778.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the dev_err_probe() helper, instead of open-coding the same
operation.

While at it, invert the error checking logic to simplify code flow.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/keyboard/gpio_keys.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 8dbf1e69c90ac92f..0f2250c6aa4978d5 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -523,18 +523,15 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 						     NULL, GPIOD_IN, desc);
 		if (IS_ERR(bdata->gpiod)) {
 			error = PTR_ERR(bdata->gpiod);
-			if (error == -ENOENT) {
-				/*
-				 * GPIO is optional, we may be dealing with
-				 * purely interrupt-driven setup.
-				 */
-				bdata->gpiod = NULL;
-			} else {
-				if (error != -EPROBE_DEFER)
-					dev_err(dev, "failed to get gpio: %d\n",
-						error);
-				return error;
-			}
+			if (error != -ENOENT)
+				return dev_err_probe(dev, error,
+						     "failed to get gpio\n");
+
+			/*
+			 * GPIO is optional, we may be dealing with
+			 * purely interrupt-driven setup.
+			 */
+			bdata->gpiod = NULL;
 		}
 	} else if (gpio_is_valid(button->gpio)) {
 		/*
-- 
2.25.1

