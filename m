Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB9C7A8266
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236235AbjITM7Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235970AbjITM7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA33E13E
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-00058A-Hc; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-007gyW-J3; Wed, 20 Sep 2023 14:58:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-003ICd-9v; Wed, 20 Sep 2023 14:58:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 03/52] input: ep93xx_keypad - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:40 +0200
Message-Id: <20230920125829.1478827-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hVWEogBRF9HOBpKbk4TbioPyeK/sU0xWv9lfkh7mdZc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw293JnWR4/NKW4uglnfwItjy/4XjR8tFvVx m3gMEDjgqWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsNgAKCRCPgPtYfRL+ Tpj9CACkcz0YAJJyTUZU3Dxf1tIQHnk9PaWlsSpFUPuXGSDFJgW2Bd7RqTT9JbKuotMd5ALhaRm +NwIFz/vvd4AOOKRKm67dvIZhfvvOp7vp02W1SqV65KpNAAj1W8092FvjW1kJEMPyMDZK1dhTwa Q07Nef9t1ne+/JEeObpxtNyKBsHinBj8jk7OdmE0yemYK++EpJ4r148j48K9zLaW0mgx/II3j12 SiLR+vFeE6oY8zwdAylp/NH15p5TVBKCGJRytc+YWCOGBQ3a7J/4mBKdvp3C568BHIqA/jvOPgC k3UUv8txBdyWAqZ/tK44yoCQXH2XT4x57dhLbpwIV8TqTEWL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/keyboard/ep93xx_keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 55075addcac2..6b811d6bf625 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -308,11 +308,9 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ep93xx_keypad_remove(struct platform_device *pdev)
+static void ep93xx_keypad_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
-
-	return 0;
 }
 
 static struct platform_driver ep93xx_keypad_driver = {
@@ -321,7 +319,7 @@ static struct platform_driver ep93xx_keypad_driver = {
 		.pm	= pm_sleep_ptr(&ep93xx_keypad_pm_ops),
 	},
 	.probe		= ep93xx_keypad_probe,
-	.remove		= ep93xx_keypad_remove,
+	.remove_new	= ep93xx_keypad_remove,
 };
 module_platform_driver(ep93xx_keypad_driver);
 
-- 
2.40.1

