Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0731A7A8271
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbjITM7W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236090AbjITM7J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:09 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C668192
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn2-0005gW-4t; Wed, 20 Sep 2023 14:58:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-007h1B-2m; Wed, 20 Sep 2023 14:58:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-003IFN-Pm; Wed, 20 Sep 2023 14:58:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 45/52] input: mainstone-wm97xx - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:22 +0200
Message-Id: <20230920125829.1478827-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lC3ygZTUVktuFO26GQrcLcsry+U4nk9RuYbUCLf6jig=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxnDgIBqqxqV70prFlWwfIN8nR0tYbK9+Q6y UQ8USmwLwKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsZwAKCRCPgPtYfRL+ ThvqCACtnpcu+EAvV6/xEQcqbmzc4vDHBHL8zxtJoQw/K8+YSi2YhgATTq4qitmnVbdT2Pp+pDB QMh2l9+NsEHhRcwxncU3QUwjYYqXxVtndV5q6oVWovQwmxpdqgWqy3QIKotQzCrXYFrA3Qv/obZ xjWDwlOcctcEXNAORSvpBbcbIRWoKJHrLOPdBKzvRllRQLAIKnjdQy35SnFE6QQzF1wtxef9iC2 u85W5M3PUv5XKz/IJRDEQA1nqA5IY9O2DYio/oZ+J0B9lzZWbljQ2yb91AaziwiIIp/yu1gPXd5 xQr77ezdoHCS0dWR9V0qguKhVTaPM00uJVghCJd7hAyws/vD
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
 drivers/input/touchscreen/mainstone-wm97xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 85b95ed461e7..bfbebe245040 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -252,18 +252,16 @@ static int mainstone_wm97xx_probe(struct platform_device *pdev)
 	return wm97xx_register_mach_ops(wm, &mainstone_mach_ops);
 }
 
-static int mainstone_wm97xx_remove(struct platform_device *pdev)
+static void mainstone_wm97xx_remove(struct platform_device *pdev)
 {
 	struct wm97xx *wm = platform_get_drvdata(pdev);
 
 	wm97xx_unregister_mach_ops(wm);
-
-	return 0;
 }
 
 static struct platform_driver mainstone_wm97xx_driver = {
 	.probe	= mainstone_wm97xx_probe,
-	.remove	= mainstone_wm97xx_remove,
+	.remove_new = mainstone_wm97xx_remove,
 	.driver	= {
 		.name	= "wm97xx-touch",
 	},
-- 
2.40.1

