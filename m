Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 996057A8260
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbjITM7M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236133AbjITM7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96FD1B3
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-00058Y-CP; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-007gyj-GQ; Wed, 20 Sep 2023 14:58:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-003ICt-6s; Wed, 20 Sep 2023 14:58:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Yangtao Li <frank.li@vivo.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 07/52] input: omap4-keypad - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:44 +0200
Message-Id: <20230920125829.1478827-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Uz/Y04WZLM79PWiMT26rLD1RyhwSjpu2sAD/2b79i2o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw7k2ZOP5UjEEGPagZNYfkqEykY/YNM9VXTA qr07CnY4KyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsOwAKCRCPgPtYfRL+ TnifB/4/9ZdLr1MGcWVixaHoyGkr1oOA1cGMfsDX2cxIbpBaDdv18X/uJXFn9QthuNOeWsE7CfK DSXBxtTjxnUlHI+L3FjAT5dyCPDCh0XfnB1GL0iVnRDyi+zw+dc7n/5V7x6DD0wUYHIteQGG/zZ k+UpVjszVZLpXT74UMzYc31twnNMIwhy4qxU/aVT+Idh/uX7kMbNszu0z6aRQo67UMfe8q2rAtx WWPnIJuBQK+63NAu8R+SPSGa7N24J571AEsjQ09nJj5k+nku1a7S9Dr9awdo2+qHiDaSze7d5BK rx5MxLFwBj/nFnEwEvtzPw5PUzAcKR9IZQjh3AhFgTZw786D
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
 drivers/input/keyboard/omap4-keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 773e55eed88b..d3f8688fdd9c 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -461,11 +461,9 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int omap4_keypad_remove(struct platform_device *pdev)
+static void omap4_keypad_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id omap_keypad_dt_match[] = {
@@ -476,7 +474,7 @@ MODULE_DEVICE_TABLE(of, omap_keypad_dt_match);
 
 static struct platform_driver omap4_keypad_driver = {
 	.probe		= omap4_keypad_probe,
-	.remove		= omap4_keypad_remove,
+	.remove_new	= omap4_keypad_remove,
 	.driver		= {
 		.name	= "omap4-keypad",
 		.of_match_table = omap_keypad_dt_match,
-- 
2.40.1

