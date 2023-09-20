Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087E27A8257
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235290AbjITM7H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235812AbjITM67 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:59 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9E4122
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-0005JU-CC; Wed, 20 Sep 2023 14:58:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-007h08-Ve; Wed, 20 Sep 2023 14:58:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-003IEF-MW; Wed, 20 Sep 2023 14:58:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 28/52] input: navpoint - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:05 +0200
Message-Id: <20230920125829.1478827-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3AQRc2nNT2SkdX2eRxLRmjZGWiHn4Xb2m6xzSSPLTUE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxTdKj5BUEJUuCD5Xd/qLKKmU2tB8FKadnx+ HO1zts54guJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsUwAKCRCPgPtYfRL+ Tqq8B/42RX29NdVfQBExb1OqsUN5FY1QfQEkVR7mqxb9QuoDgMZgPxlFlseodfLEGYt68wtaopO vidz2D/uSzRofVG/Hjt/OSm2XK3gSBWWBPvOw57+mjjlrG4ONN52bhiFlXGvxA6Mpy1WaPN7kpD fEng08qL3HuFFD3PajFsFRNkv+WR/Of+L5Dky+7x1t3XjkmrlnLP6tbcoyPMHJdEr6GF4ymjAYX eTbtxnPw2D0Q28wy5IszmS4Du4JUTrIkzH9e7T88E3qWZ/52jmEAvhLnaKSue37ArsjQdOZ4Zsq 8Y52n2J5btNrt7O8oxALHn9QjqcrxpSwWYYXAl/SKrrm4s6e
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
 drivers/input/mouse/navpoint.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/navpoint.c b/drivers/input/mouse/navpoint.c
index 2b7b86eef280..c00dc1275da2 100644
--- a/drivers/input/mouse/navpoint.c
+++ b/drivers/input/mouse/navpoint.c
@@ -295,7 +295,7 @@ static int navpoint_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int navpoint_remove(struct platform_device *pdev)
+static void navpoint_remove(struct platform_device *pdev)
 {
 	const struct navpoint_platform_data *pdata =
 					dev_get_platdata(&pdev->dev);
@@ -311,8 +311,6 @@ static int navpoint_remove(struct platform_device *pdev)
 
 	if (gpio_is_valid(pdata->gpio))
 		gpio_free(pdata->gpio);
-
-	return 0;
 }
 
 static int navpoint_suspend(struct device *dev)
@@ -348,7 +346,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(navpoint_pm_ops,
 
 static struct platform_driver navpoint_driver = {
 	.probe		= navpoint_probe,
-	.remove		= navpoint_remove,
+	.remove_new	= navpoint_remove,
 	.driver = {
 		.name	= "navpoint",
 		.pm	= pm_sleep_ptr(&navpoint_pm_ops),
-- 
2.40.1

