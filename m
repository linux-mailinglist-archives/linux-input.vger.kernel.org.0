Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C2A7A8270
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236231AbjITM7W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234463AbjITM7J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:09 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632BAF7
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn3-0005nt-9C; Wed, 20 Sep 2023 14:58:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn1-007h1X-BQ; Wed, 20 Sep 2023 14:58:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn1-003IFl-2C; Wed, 20 Sep 2023 14:58:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 51/52] input: wm831x-ts - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:28 +0200
Message-Id: <20230920125829.1478827-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kQlCA2NL+Ej0oQRdTH+atbteL8w2LJMkYJLOiJLucpI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxuBo7oAUy2Wl7oYbsrsYUF/QBhb/7qjpGis w69RCCohjWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsbgAKCRCPgPtYfRL+ Tq6yB/0cZoGjUpGgORAmSU+paZYWiflNhECFrbSkBSDG89DiILTi+cCxALNKpsQHxzLQtADkPSk n30l+Q4ot/LLKjNmN35JVWiLFoCLql+DNzRyd2ntycU77sIpaHYodsoSZfiSusCckyZQHgjm2aQ J1tl8mLvaP3qL/F1k46PZKUBO5pxYebNPiW67mJ/oF0uYkILY3G8kK++iZ5deMxfRTlRP/3joj3 /9J3RpBOSNgcwzkKo0qJDUEKWbCJdLxBb15N/VDAB/eU1axW+SXVV0evUzxP8UJ+p/O89IQ5zBa yko6G/p1X7ZcJR4aAhPWIA3TezCI1fR0EURayzZva4jLxTtv
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
 drivers/input/touchscreen/wm831x-ts.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/wm831x-ts.c b/drivers/input/touchscreen/wm831x-ts.c
index 319f57fb9af5..9cee26b63341 100644
--- a/drivers/input/touchscreen/wm831x-ts.c
+++ b/drivers/input/touchscreen/wm831x-ts.c
@@ -374,14 +374,12 @@ static int wm831x_ts_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int wm831x_ts_remove(struct platform_device *pdev)
+static void wm831x_ts_remove(struct platform_device *pdev)
 {
 	struct wm831x_ts *wm831x_ts = platform_get_drvdata(pdev);
 
 	free_irq(wm831x_ts->pd_irq, wm831x_ts);
 	free_irq(wm831x_ts->data_irq, wm831x_ts);
-
-	return 0;
 }
 
 static struct platform_driver wm831x_ts_driver = {
@@ -389,7 +387,7 @@ static struct platform_driver wm831x_ts_driver = {
 		.name = "wm831x-touch",
 	},
 	.probe = wm831x_ts_probe,
-	.remove = wm831x_ts_remove,
+	.remove_new = wm831x_ts_remove,
 };
 module_platform_driver(wm831x_ts_driver);
 
-- 
2.40.1

