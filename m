Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD7D7A8258
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235812AbjITM7I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235572AbjITM7C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:02 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59751133
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-0005Qi-Un; Wed, 20 Sep 2023 14:58:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-007h0R-74; Wed, 20 Sep 2023 14:58:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-003IEb-U5; Wed, 20 Sep 2023 14:58:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 33/52] input: ct82c710 - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:10 +0200
Message-Id: <20230920125829.1478827-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ItH+0WRyjZ/ukPbYKT4JATm3dReP/LejSq4QWeVXTJ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxZBZuOtJ9xbe3a9i8VphLd2KNsoX9nrIY85 sdwSicjiQGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsWQAKCRCPgPtYfRL+ TuB8B/0fWJdV+duCvgUDAQ2n2LiknL+qH6xLCLvTIfogBvmaBtypy3OSEixUKVByLJESA3oTe16 fCf3f68IWz9U4jWVDaBfyr3eVVKuW7p7qdC6a2exscAVZzL64tcyMWXvoh2/OABoJYbpwI/na3M K0Qw8PXYtgO1ZH0WfbUBC5l54UecZrRiu3uW3vugRm/8Xbl8Wt+iOV4nJ/9zv/SLhMNQTCohRL4 r3HkNEl6LYcMWDfivYBu0Dy1AybQymEvASX8j/sA1kCM0LtGUyvzsFPAr0fv/JeDVrXuFrSYmUD rgosGTb95+QPENTPZOyT044z2s+k6UW0LqNwCpkS2Wx/+C4u
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
 drivers/input/serio/ct82c710.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/ct82c710.c b/drivers/input/serio/ct82c710.c
index 3da751f4a6bf..d5c9bb3d0103 100644
--- a/drivers/input/serio/ct82c710.c
+++ b/drivers/input/serio/ct82c710.c
@@ -180,11 +180,9 @@ static int ct82c710_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int ct82c710_remove(struct platform_device *dev)
+static void ct82c710_remove(struct platform_device *dev)
 {
 	serio_unregister_port(ct82c710_port);
-
-	return 0;
 }
 
 static struct platform_driver ct82c710_driver = {
@@ -192,7 +190,7 @@ static struct platform_driver ct82c710_driver = {
 		.name	= "ct82c710",
 	},
 	.probe		= ct82c710_probe,
-	.remove		= ct82c710_remove,
+	.remove_new	= ct82c710_remove,
 };
 
 
-- 
2.40.1

