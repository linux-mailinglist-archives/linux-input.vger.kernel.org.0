Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568B17A826E
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbjITM7V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236229AbjITM7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:07 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884B4E5
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn2-0005jL-Cg; Wed, 20 Sep 2023 14:58:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-007h1J-GH; Wed, 20 Sep 2023 14:58:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-003IFV-7G; Wed, 20 Sep 2023 14:58:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 47/52] input: pcap_ts - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:24 +0200
Message-Id: <20230920125829.1478827-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=O9V+dbtrFe7O6zT8B/foRZxZSOZEnvwSslVl9rftPSA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxpIdP4HLl/LuuGRA3825iun0VFhIGQFDhNb gCKzGj+ceCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsaQAKCRCPgPtYfRL+ Ti+2B/4xfpJ5sPGX9iJ8HdTt3XhPSyrAJyBQ7T1JCa0UDZFWf+T7KE5RlN9vTCStRnjDUPRzcRt WfmZFfWkJUQ68GWH41oS3nUdDs53FoZ3haUy8jeh098sqHg8brPayqR5GgLORsfhT3DQwD4oAiq SjsLaPJ5ywdPJ7789RTdfg68cE1a9owgp4+ktSiCWiuXt3KqFanpYpl3nJO4thDq9T34ir2yJtv yuDFnBmMK+x5iSgi22tz9fWGVA9JNsbt7bD3EhohBC7aUGZ7hwR/M2eeXhr7eKwKdw9Gnn2GspT R165Br3dMAR9W9dExD/oUYVtX8Z3+47co+foLHq2IDkcBjNP
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
 drivers/input/touchscreen/pcap_ts.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/pcap_ts.c b/drivers/input/touchscreen/pcap_ts.c
index b2da0194e02a..821245019fea 100644
--- a/drivers/input/touchscreen/pcap_ts.c
+++ b/drivers/input/touchscreen/pcap_ts.c
@@ -197,7 +197,7 @@ static int pcap_ts_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int pcap_ts_remove(struct platform_device *pdev)
+static void pcap_ts_remove(struct platform_device *pdev)
 {
 	struct pcap_ts *pcap_ts = platform_get_drvdata(pdev);
 
@@ -207,8 +207,6 @@ static int pcap_ts_remove(struct platform_device *pdev)
 	input_unregister_device(pcap_ts->input);
 
 	kfree(pcap_ts);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -240,7 +238,7 @@ static const struct dev_pm_ops pcap_ts_pm_ops = {
 
 static struct platform_driver pcap_ts_driver = {
 	.probe		= pcap_ts_probe,
-	.remove		= pcap_ts_remove,
+	.remove_new	= pcap_ts_remove,
 	.driver		= {
 		.name	= "pcap-ts",
 		.pm	= PCAP_TS_PM_OPS,
-- 
2.40.1

