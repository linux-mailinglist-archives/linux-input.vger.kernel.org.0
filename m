Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E267A827A
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236325AbjITM7Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbjITM7P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:15 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D226ED
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn3-0005lr-7Q; Wed, 20 Sep 2023 14:58:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-007h1P-Ts; Wed, 20 Sep 2023 14:58:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-003IFd-KN; Wed, 20 Sep 2023 14:58:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: [PATCH 49/52] input: sun4i-ts - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:26 +0200
Message-Id: <20230920125829.1478827-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zF4xZu+hwVC6L9733M9plkhU8fvddRnK55gpTuc7Vgc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxrqjnosHJ8C+UWdQ9SSqEsDaJf8YeepCMl6 Dz31Yhm+9mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsawAKCRCPgPtYfRL+ TufgB/wIzdbOjhnYmod3UlF216YglsMYuG6yfO4qP6mOpAwxOZyb95LGe9Ues464HKE8BCR37M+ ag2d8E3T6NsfX8eTOwD8rqfEVGy1B+FaEAS0h8iI1dwzPqEGxQ7HnKCjHXCSeFSTi4gVBLLr+A1 ajAI65d5ZBm6RBKUxBmAj8rQQEXr4fcoMlNkOVzmkzGmmBfTjR95xplqAuF04h3CFU15MPmnLAQ EUaaGGLBTMpn7KrYt1MALqDqMp1UBGYgcaq0MeW+Lwuzzk4a/q5Mu2ShP906iZzX358k2ti4oMU 7CiBuWSz/bcWdFCsGrjQTKddfH6WmY28l0aPcK6PWyq1DaX9
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
 drivers/input/touchscreen/sun4i-ts.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index bb3c6072fc82..92b2b840b4b7 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -375,7 +375,7 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int sun4i_ts_remove(struct platform_device *pdev)
+static void sun4i_ts_remove(struct platform_device *pdev)
 {
 	struct sun4i_ts_data *ts = platform_get_drvdata(pdev);
 
@@ -385,8 +385,6 @@ static int sun4i_ts_remove(struct platform_device *pdev)
 
 	/* Deactivate all IRQs */
 	writel(0, ts->base + TP_INT_FIFOC);
-
-	return 0;
 }
 
 static const struct of_device_id sun4i_ts_of_match[] = {
@@ -403,7 +401,7 @@ static struct platform_driver sun4i_ts_driver = {
 		.of_match_table = sun4i_ts_of_match,
 	},
 	.probe	= sun4i_ts_probe,
-	.remove	= sun4i_ts_remove,
+	.remove_new = sun4i_ts_remove,
 };
 
 module_platform_driver(sun4i_ts_driver);
-- 
2.40.1

