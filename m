Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4C87A826A
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235970AbjITM7T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236047AbjITM7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:07 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E441BE
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn2-0005hv-9B; Wed, 20 Sep 2023 14:58:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-007h1E-9c; Wed, 20 Sep 2023 14:58:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-003IFR-0U; Wed, 20 Sep 2023 14:58:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 46/52] input: mc13783_ts - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:23 +0200
Message-Id: <20230920125829.1478827-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oVLUxNyjaub1YiVWOsaHCDPrLETVx9xQiELvVrYNZoU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSuNxnPL9d9kovQ2efqye/ztfnn++fCJzN0Joj2Onv+O 7HHK1Gmk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJLBRm/+/qZZy9nMNGduNF L7W/HSe3FF1f1rQhTWrzpx6DGuapbpwTjizhXabYeckqcGnKjrMpla5ZM2rPJN6YErH5SML97mc pOgfDj4jLnSxfOeG2jkgVj+TK8iXFXEp/lRaUJZ9Jlqh/s8G+5NxWlmuBZ7nkzAL3mZ/vui7Q35 2+cmmjbdrCwOo7gaLhbE9y87sYb+Q3LpEIVOifu974Q1ZG4rfdLFIPRLMD05bwWM+Y9nPxbJcng lcPmQZb9vB1lqhGxx7wTU5+5PO3o2vfvVrm9GiNb7KMQtHdN1nMXROzpvIVL5GRj9zR5vno8WQz 1+SvYjGXmSve3/K1P9y7ZlHyC4m/eawmSl9+2goKRwoDAA==
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
 drivers/input/touchscreen/mc13783_ts.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
index ae0d978c83bf..cbcd6e34efb7 100644
--- a/drivers/input/touchscreen/mc13783_ts.c
+++ b/drivers/input/touchscreen/mc13783_ts.c
@@ -217,18 +217,16 @@ static int __init mc13783_ts_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mc13783_ts_remove(struct platform_device *pdev)
+static void mc13783_ts_remove(struct platform_device *pdev)
 {
 	struct mc13783_ts_priv *priv = platform_get_drvdata(pdev);
 
 	input_unregister_device(priv->idev);
 	kfree(priv);
-
-	return 0;
 }
 
 static struct platform_driver mc13783_ts_driver = {
-	.remove		= mc13783_ts_remove,
+	.remove_new	= mc13783_ts_remove,
 	.driver		= {
 		.name	= MC13783_TS_NAME,
 	},
-- 
2.40.1

