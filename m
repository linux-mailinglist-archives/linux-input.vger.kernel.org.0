Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA547A8249
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbjITM7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbjITM6z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:55 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D609E8
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-0005H1-9N; Wed, 20 Sep 2023 14:58:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-007gzk-T2; Wed, 20 Sep 2023 14:58:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-003IDq-Jd; Wed, 20 Sep 2023 14:58:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 22/52] input: pcspkr - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:59 +0200
Message-Id: <20230920125829.1478827-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RjV/fOJvcYA26YDjbKZ6eckVWDo+1/pWGVfTBVFSGuE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxMggHl+xh8fGNKhkvGdeyoJjuDeyxkK+KPe 1bR5CAnRU2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsTAAKCRCPgPtYfRL+ TrRICACCVglrT1/CxhR9HLrEN346UzBrJLsOynBBSxNqdSBbkJdQx2zOPWmPmtDzWYVtAm6hlxE mysS0SODqBt+HDxiv/xvMcXtw7Jzbw737iDTCrbBk+pymWeMPbEBvFJS/D/Xe2wHAqHltLOyxyA vS2nrtUEIZ7yJ7m03i3A9RL8flpeCIs+GTM5GPmRPTkdaENROk3zSkLP5yf/Ih7+/pGevCKgIpm V/ORvJ/LgqaUlKK/DH1ptCk9VPduMyeUWONUNm/WZGas2s9sNXNF8mXw4mHpdx0D5TXNE6zGq9R m328fNb7jaccdDQ/dr9MapUT/xEzRjnPRGpKfCdCrIJOQn5p
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
 drivers/input/misc/pcspkr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/pcspkr.c b/drivers/input/misc/pcspkr.c
index 9c666b2f14fe..897854fd245f 100644
--- a/drivers/input/misc/pcspkr.c
+++ b/drivers/input/misc/pcspkr.c
@@ -95,15 +95,13 @@ static int pcspkr_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int pcspkr_remove(struct platform_device *dev)
+static void pcspkr_remove(struct platform_device *dev)
 {
 	struct input_dev *pcspkr_dev = platform_get_drvdata(dev);
 
 	input_unregister_device(pcspkr_dev);
 	/* turn off the speaker */
 	pcspkr_event(NULL, EV_SND, SND_BELL, 0);
-
-	return 0;
 }
 
 static int pcspkr_suspend(struct device *dev)
@@ -129,7 +127,7 @@ static struct platform_driver pcspkr_platform_driver = {
 		.pm	= &pcspkr_pm_ops,
 	},
 	.probe		= pcspkr_probe,
-	.remove		= pcspkr_remove,
+	.remove_new	= pcspkr_remove,
 	.shutdown	= pcspkr_shutdown,
 };
 module_platform_driver(pcspkr_platform_driver);
-- 
2.40.1

