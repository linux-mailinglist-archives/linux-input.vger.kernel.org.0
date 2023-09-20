Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3DC7A826F
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbjITM7V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236278AbjITM7I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:08 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D2699
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn1-0005e3-Dz; Wed, 20 Sep 2023 14:58:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-007h14-JX; Wed, 20 Sep 2023 14:58:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-003IFE-9d; Wed, 20 Sep 2023 14:58:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 43/52] input: xilinx_ps2 - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:20 +0200
Message-Id: <20230920125829.1478827-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0CeKHSrpFi8VJT5ADH0g2h77fBe/JBdswra8dnYrk4U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxkKl27fWqZ7qjvYFdjP5eyIHREWS3M4smp5 ZByxIeTfNuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsZAAKCRCPgPtYfRL+ Tk5uCACmp/3LN8RED0xxGPZTZ0qtkrb61WodRwkMNbTvCaenKZtTlt2JKQmP9Z4fM9oCS8rK7fl EF5NhlV9oivllu6ufOWEctPhM45juochU5xS6gchhlGlwLCWbWkpCG6Mab4ZyeWGJtVGcqviNOu 4tQM5IQ3YZGADO7eWVesyJziOHeDDWZmWJC4G3wfAygQq7qLtvzEHOoyITpqP6eWsFLKa93Twiw Qem0gPv0EyAH56yXsgh24h3Ul87e8nnDFvLKAosoVQg9nxg0E6vQ+jUXYTlyvttPVgX3xb0BO7d t+lb0vatC1hX+a9TN57mNaiFLwvs3xDBhenjGLPE5j0gNk+K
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
 drivers/input/serio/xilinx_ps2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/xilinx_ps2.c b/drivers/input/serio/xilinx_ps2.c
index f3d28da70b75..d8f9faf2b529 100644
--- a/drivers/input/serio/xilinx_ps2.c
+++ b/drivers/input/serio/xilinx_ps2.c
@@ -329,7 +329,7 @@ static int xps2_of_probe(struct platform_device *ofdev)
  * if the driver module is being unloaded. It frees any resources allocated to
  * the device.
  */
-static int xps2_of_remove(struct platform_device *of_dev)
+static void xps2_of_remove(struct platform_device *of_dev)
 {
 	struct xps2data *drvdata = platform_get_drvdata(of_dev);
 	struct resource r_mem; /* IO mem resources */
@@ -344,8 +344,6 @@ static int xps2_of_remove(struct platform_device *of_dev)
 		release_mem_region(r_mem.start, resource_size(&r_mem));
 
 	kfree(drvdata);
-
-	return 0;
 }
 
 /* Match table for of_platform binding */
@@ -361,7 +359,7 @@ static struct platform_driver xps2_of_driver = {
 		.of_match_table = xps2_of_match,
 	},
 	.probe		= xps2_of_probe,
-	.remove		= xps2_of_remove,
+	.remove_new	= xps2_of_remove,
 };
 module_platform_driver(xps2_of_driver);
 
-- 
2.40.1

