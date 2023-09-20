Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2EEA7A8277
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbjITM7X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236279AbjITM7L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:11 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AFFC2
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn3-0005oZ-GS; Wed, 20 Sep 2023 14:58:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn1-007h1b-He; Wed, 20 Sep 2023 14:58:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn1-003IFp-8E; Wed, 20 Sep 2023 14:58:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 52/52] input: wm97xx-core - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:29 +0200
Message-Id: <20230920125829.1478827-53-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=71HgYUKiNIm19iVrPl0W4L7SGw74AtUzgLH8Po3g26s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxvDK8FKadSf/H8l+ExpGhItbrqDOcWzrWhD aQua9r4TVKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsbwAKCRCPgPtYfRL+ ToVJB/4hwHs7QOP5HKNJcXRh8aLqiSiYCJB1xuh9AKN+tTdKog48MDIu67TC5KAjXSPi91Zbqi5 aTuaRgeJ1jAYzcMFtECe9iVoihTq5ColhL9FEVWDQ1d+XCzxuLFocNDgUvZ+HDl/l0ojsRAleNm FgtUL7+TWs7KEhY18mJyq+ilb5xSio3dgPp2GFK6Rc4nA6BlA9aN3SeIt96D2JBPRbm4HiOWXYp wEde2fVGwJ4P+kvz5T5cXFaTLckutXpRpSAnbR64ytkk7ILwBuI0FKKWTh8x1W/nQZDOZoh+eTz P3PZJyZFA/Quns/BvqToFsxhOWAFdXwD1rMq4faIPl6uBlnl
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
 drivers/input/touchscreen/wm97xx-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index ac3b3dd59488..f01f6cc9b59f 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -756,11 +756,9 @@ static int wm97xx_mfd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wm97xx_mfd_remove(struct platform_device *pdev)
+static void wm97xx_mfd_remove(struct platform_device *pdev)
 {
 	wm97xx_remove(&pdev->dev);
-
-	return 0;
 }
 
 static int wm97xx_suspend(struct device *dev)
@@ -878,7 +876,7 @@ static struct platform_driver wm97xx_mfd_driver = {
 		.pm =		pm_sleep_ptr(&wm97xx_pm_ops),
 	},
 	.probe =	wm97xx_mfd_probe,
-	.remove =	wm97xx_mfd_remove,
+	.remove_new =	wm97xx_mfd_remove,
 };
 
 static int __init wm97xx_init(void)
-- 
2.40.1

