Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D767A8264
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236228AbjITM7P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236227AbjITM7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8144D1B8
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-0005YI-6g; Wed, 20 Sep 2023 14:58:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-007h0o-MJ; Wed, 20 Sep 2023 14:58:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-003IEy-AP; Wed, 20 Sep 2023 14:58:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 39/52] input: ps2-gpio - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:16 +0200
Message-Id: <20230920125829.1478827-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nNh6iMKT6pcM5eScSqbtcJjQ2yirgWQ7MUdUQrNO8fs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxgKmz0HcLLYcf6ezcM4pLN1hg7L2OyGjnEf GBF9J20rYaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsYAAKCRCPgPtYfRL+ TmFiB/9faoX7R/oj/4sv44WCLv5b//ew31j/h/bEi3OOMx4xwSv4mEr8oV9rbHw5u2pVKwCJkZP 7CuvblNnFC8en7FLdmOQGoT99e7qEdYnIuzPruabb0zlVL1rgpq2WKscgl0cf9+r+5w0oB8yAhX 8NgDvzJunyjYPGrnUEQMv4JYObM8smZDid7mmXev8adNqwLNlbCBBvgdAxIJ6poRWiP07cMwKwF Cpp1Is4xwhQaNIrt5QOxRx3/mQktEHqwBalB5aJhVpYX96CbO2PNxLz+XLaH7uiRZY1OHld6I5I lTxXUH39xKfe4wfE4oTa3chG0Ufke8oTfzEJz9amxGMwM9d9
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
 drivers/input/serio/ps2-gpio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index bc1dc484389b..c3ff60859a03 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -476,12 +476,11 @@ static int ps2_gpio_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int ps2_gpio_remove(struct platform_device *pdev)
+static void ps2_gpio_remove(struct platform_device *pdev)
 {
 	struct ps2_gpio_data *drvdata = platform_get_drvdata(pdev);
 
 	serio_unregister_port(drvdata->serio);
-	return 0;
 }
 
 #if defined(CONFIG_OF)
@@ -494,7 +493,7 @@ MODULE_DEVICE_TABLE(of, ps2_gpio_match);
 
 static struct platform_driver ps2_gpio_driver = {
 	.probe		= ps2_gpio_probe,
-	.remove		= ps2_gpio_remove,
+	.remove_new	= ps2_gpio_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = of_match_ptr(ps2_gpio_match),
-- 
2.40.1

