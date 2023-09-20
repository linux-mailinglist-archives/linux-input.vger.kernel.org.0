Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937B57A8241
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbjITM66 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235709AbjITM6x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:53 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C446D194
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-0005Cy-4z; Wed, 20 Sep 2023 14:58:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-007gzJ-Ir; Wed, 20 Sep 2023 14:58:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-003IDS-8D; Wed, 20 Sep 2023 14:58:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 16/52] input: m68kspkr - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:53 +0200
Message-Id: <20230920125829.1478827-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lf4rtaI/w6VSWNjNbo6KGWx/rFWLQqZd+jiz9vpR5yY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxFJFTl6HDnfGClQihUfudD8ovETAe/9LhRt a058MrKfJiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsRQAKCRCPgPtYfRL+ TqtKB/sGWsqWY+KTKJkSsm+WI81Do6ekZMb/9OovA2BRvYMQslO+RthPxHilu7Unm9mdx1X+w1j Y4AMkTasUc7viNlpteFzB4gWcn2upb5ED0gr+UC8roQgnGMgyvgZvp9pIjgVX4bzWrcBhP3NqtZ qDihLqmnxS90frR1lP28lLnxlYARLNycNURy1/23y6+WoAkvrHb10HiTo0uTljerGTCfTc89fgm 11VN5nNnNsWr8uQ7y09iPQY8MRe8E3MUBGwWHG/bS5Y4jgpQ2gIQEuCDk+6jbSBIJycyilXPqHQ vtgNRrc+Kevj9uKdhInhm2StBaiM+aQilSAXdGoAagwM/74V
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
 drivers/input/misc/m68kspkr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/m68kspkr.c b/drivers/input/misc/m68kspkr.c
index 25fcf1467151..3fe0a85c45e0 100644
--- a/drivers/input/misc/m68kspkr.c
+++ b/drivers/input/misc/m68kspkr.c
@@ -75,15 +75,13 @@ static int m68kspkr_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int m68kspkr_remove(struct platform_device *dev)
+static void m68kspkr_remove(struct platform_device *dev)
 {
 	struct input_dev *input_dev = platform_get_drvdata(dev);
 
 	input_unregister_device(input_dev);
 	/* turn off the speaker */
 	m68kspkr_event(NULL, EV_SND, SND_BELL, 0);
-
-	return 0;
 }
 
 static void m68kspkr_shutdown(struct platform_device *dev)
@@ -97,7 +95,7 @@ static struct platform_driver m68kspkr_platform_driver = {
 		.name	= "m68kspkr",
 	},
 	.probe		= m68kspkr_probe,
-	.remove		= m68kspkr_remove,
+	.remove_new	= m68kspkr_remove,
 	.shutdown	= m68kspkr_shutdown,
 };
 
-- 
2.40.1

