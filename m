Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8FB7A825E
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbjITM7L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235980AbjITM7E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:04 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D85135
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwms-00058M-Ss; Wed, 20 Sep 2023 14:58:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-007gyg-96; Wed, 20 Sep 2023 14:58:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-003ICp-Vs; Wed, 20 Sep 2023 14:58:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 06/52] input: omap-keypad - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:43 +0200
Message-Id: <20230920125829.1478827-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uxlM5fM0hmcHs7yfBhv3L8aGpaydP5QBqb1hJSrgwIA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw6lXG7MS0w0/7gi+4czRm96EBdyJY5PuWth tJTUEtrZt6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsOgAKCRCPgPtYfRL+ Tmb/B/9NHv7mangivh8p6pAsSMlMsYqV7tmIc9olTin/8g7xHrPR3ChZPt5xx8ZVBNSufdbEx+k a3jvq7ejwglF8R7iAUaw+CLN9tv34DHCcO6xp0KUCI7drNxH9qSVWgzVA6OU9hIOM0vv4UQrsJK ABPSPkJ+0R94J1Ww61CfeDYziPBTz6br3+49OQlFicl9gaoPWKyBJIFvHPmOSHX5zVqCuiYg6ev HVudEm39UGnhOsXtFTJjng1jBJhXX/Gies7IRNswwzwLCMrPjDUOOOugSC2W37iGgkKsfOAB1WG WMV+eFkC7SyRckJ7ZLXCNNGbqKl5PfwU4yK3LXQUYer1wNyJ
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
 drivers/input/keyboard/omap-keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index 24440b498645..454fb8675657 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -287,7 +287,7 @@ static int omap_kp_probe(struct platform_device *pdev)
 	return -EINVAL;
 }
 
-static int omap_kp_remove(struct platform_device *pdev)
+static void omap_kp_remove(struct platform_device *pdev)
 {
 	struct omap_kp *omap_kp = platform_get_drvdata(pdev);
 
@@ -303,13 +303,11 @@ static int omap_kp_remove(struct platform_device *pdev)
 	input_unregister_device(omap_kp->input);
 
 	kfree(omap_kp);
-
-	return 0;
 }
 
 static struct platform_driver omap_kp_driver = {
 	.probe		= omap_kp_probe,
-	.remove		= omap_kp_remove,
+	.remove_new	= omap_kp_remove,
 	.driver		= {
 		.name	= "omap-keypad",
 	},
-- 
2.40.1

