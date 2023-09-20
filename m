Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325877A824F
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbjITM7F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235907AbjITM65 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:57 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A222EB
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-0005J9-5Q; Wed, 20 Sep 2023 14:58:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-007h03-P1; Wed, 20 Sep 2023 14:58:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-003IEA-FY; Wed, 20 Sep 2023 14:58:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 27/52] input: wm831x-on - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:04 +0200
Message-Id: <20230920125829.1478827-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gZQXYItcz9dC2SwCMhvQ+Td964wO5CgvcNX1T4i05e4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxSkPBHquZYF2rov+EcXNFW9bRRsNRVOPfwC NCoKHcG4WyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsUgAKCRCPgPtYfRL+ TurGB/9aOfQ/UOLvyQyJDt3sjWRAPo8Q+zZUjbDzInm01Wps1ke9iLapVo5OgBr5qkgUlc/gLzF Q0+blFGtj65jkGCw/u+OboiUfPv9uDzr8+CsLcu+25+dMtwb6EqELAwKlDXKo+lfpuwvWVMLwch VktwHwJ+j0KPOD5Qjv0jTI6hi+fXprz2BvX4db0SRxNZcoXTrEbVpYETV1a22FU8naqOqIx4LXL xWinLtBkiNCiV7Y5UK35gNPI6q4RVboYQXLwK9Tcyl6nf6RZGII1eJVpQOFGlEcokQtsOyXg/GW EMB0dHln+rG4a8v1LTDyr8lRUrjWLRJuSnuyBnfb1U2pjeeE
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
 drivers/input/misc/wm831x-on.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/wm831x-on.c b/drivers/input/misc/wm831x-on.c
index a42fe041b73c..e4a06c73b72d 100644
--- a/drivers/input/misc/wm831x-on.c
+++ b/drivers/input/misc/wm831x-on.c
@@ -123,20 +123,18 @@ static int wm831x_on_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wm831x_on_remove(struct platform_device *pdev)
+static void wm831x_on_remove(struct platform_device *pdev)
 {
 	struct wm831x_on *wm831x_on = platform_get_drvdata(pdev);
 	int irq = platform_get_irq(pdev, 0);
 
 	free_irq(irq, wm831x_on);
 	cancel_delayed_work_sync(&wm831x_on->work);
-
-	return 0;
 }
 
 static struct platform_driver wm831x_on_driver = {
 	.probe		= wm831x_on_probe,
-	.remove		= wm831x_on_remove,
+	.remove_new	= wm831x_on_remove,
 	.driver		= {
 		.name	= "wm831x-on",
 	},
-- 
2.40.1

