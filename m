Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E587A8261
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236006AbjITM7O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236160AbjITM7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D1B134
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-0005XM-Cd; Wed, 20 Sep 2023 14:58:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-007h0k-Dt; Wed, 20 Sep 2023 14:58:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-003IEu-34; Wed, 20 Sep 2023 14:58:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     ye xingchen <ye.xingchen@zte.com.cn>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 38/52] input: olpc_apsp - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:15 +0200
Message-Id: <20230920125829.1478827-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fReQFlkCfPybI+fyuVzmCak9214FTU6WawvLTrOCDzw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxfCsHSSy/RXU2oYBRqiSrUfXjeXrftwSAoF NYi20ujKXWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsXwAKCRCPgPtYfRL+ TtheCACv6m8q9trDDNkxfOwK013rs5SHbTQGT8gUPUQrtJ7+tqa8ylw4NekHNr5FGdslsXNrgYE tl4R59T+PnfrcSbOGfM8bLDl4whSJqF5QsNUp8Oh57D6mevtxeOKq2dOG86JcA5GYL3pmsmCfN9 YQjrDVPh8Ncif+X8JKAP7MuIdK8Ea7ifozoGjfCmyPq3KwglrL0lwZNR45KE7yTdDbwUQZxiDpx b54L5ACTc9rRoArfFArlYqcTdOMG40t/d1/tZGC2euD5ZTLbXiBf1JrHni8yJUCGVTPbWylaLf5 ZUkMsy4gDu0AHwd9L35azlOySHboY+bEv/wFu+AXgoeKVw4u
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
 drivers/input/serio/olpc_apsp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/olpc_apsp.c b/drivers/input/serio/olpc_apsp.c
index 33a8e5889bd8..240a714f7081 100644
--- a/drivers/input/serio/olpc_apsp.c
+++ b/drivers/input/serio/olpc_apsp.c
@@ -238,7 +238,7 @@ static int olpc_apsp_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int olpc_apsp_remove(struct platform_device *pdev)
+static void olpc_apsp_remove(struct platform_device *pdev)
 {
 	struct olpc_apsp *priv = platform_get_drvdata(pdev);
 
@@ -246,8 +246,6 @@ static int olpc_apsp_remove(struct platform_device *pdev)
 
 	serio_unregister_port(priv->kbio);
 	serio_unregister_port(priv->padio);
-
-	return 0;
 }
 
 static const struct of_device_id olpc_apsp_dt_ids[] = {
@@ -258,7 +256,7 @@ MODULE_DEVICE_TABLE(of, olpc_apsp_dt_ids);
 
 static struct platform_driver olpc_apsp_driver = {
 	.probe		= olpc_apsp_probe,
-	.remove		= olpc_apsp_remove,
+	.remove_new	= olpc_apsp_remove,
 	.driver		= {
 		.name	= "olpc-apsp",
 		.of_match_table = olpc_apsp_dt_ids,
-- 
2.40.1

