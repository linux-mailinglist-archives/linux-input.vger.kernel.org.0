Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8017A826C
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbjITM7U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236231AbjITM7I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:08 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B001BF
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn1-0005fX-Vv; Wed, 20 Sep 2023 14:58:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-007h18-St; Wed, 20 Sep 2023 14:58:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-003IFJ-JE; Wed, 20 Sep 2023 14:58:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 44/52] input: da9052_tsi - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:21 +0200
Message-Id: <20230920125829.1478827-45-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=N4QvTtRg+QIoVVoGZ9+IlG3wZB2FK+cFhbbKpC8LFHA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxmE8dCEFLyZcR4CQM4pCGSI59yO8sPOroDv R4VpApqWtiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsZgAKCRCPgPtYfRL+ Tsg3B/4w/1vMFhi/0uhFd6SkXFpwm3jq4WSb964/7ruLnQRw4mmkbuFoTIIRrvteJOMq+7dD/mi MPUjohMDB++zDaLrYGW1cQ54QO6iVY21ayC8mYvFWuATjvd9+eK8rnqNecaxuy4ws8gKSW2Rtrj naezhG3z1S//oK5BepR4OX3XVwhCOvk/VSm7BB11Op2Ifl1zmYirh9sZem5sA+TNEMiHvhq+LKr t8S4W8iM85dUW1pL5MyscG0uCQbT4Abymvs5STiGjl9rHtKFA8YG2FyI7t/0rm2FoNG+LJFpkpU VhEXLdYBZ2hYqwNe4QOawpys/AbdnyOQBDkPDtuEiQ8n1Fj7
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
 drivers/input/touchscreen/da9052_tsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/da9052_tsi.c b/drivers/input/touchscreen/da9052_tsi.c
index f91d0e02ddae..d71690ce6463 100644
--- a/drivers/input/touchscreen/da9052_tsi.c
+++ b/drivers/input/touchscreen/da9052_tsi.c
@@ -311,7 +311,7 @@ static int da9052_ts_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int  da9052_ts_remove(struct platform_device *pdev)
+static void da9052_ts_remove(struct platform_device *pdev)
 {
 	struct da9052_tsi *tsi = platform_get_drvdata(pdev);
 
@@ -322,13 +322,11 @@ static int  da9052_ts_remove(struct platform_device *pdev)
 
 	input_unregister_device(tsi->dev);
 	kfree(tsi);
-
-	return 0;
 }
 
 static struct platform_driver da9052_tsi_driver = {
 	.probe	= da9052_ts_probe,
-	.remove	= da9052_ts_remove,
+	.remove_new = da9052_ts_remove,
 	.driver	= {
 		.name	= "da9052-tsi",
 	},
-- 
2.40.1

