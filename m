Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1C97A823A
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235925AbjITM6x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbjITM6t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:49 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A3B133
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-00058K-HT; Wed, 20 Sep 2023 14:58:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-007gyZ-Sg; Wed, 20 Sep 2023 14:58:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-003ICh-JH; Wed, 20 Sep 2023 14:58:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 04/52] input: iqs62x-keys - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:41 +0200
Message-Id: <20230920125829.1478827-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mFcYl1wn77fniEtgx2E+xFlEporo/edpNsQGpHbkh4I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw4z/0x539b7hiWcLC1fP4I5yPm/9gXHUPMp wr3GMBP1AaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsOAAKCRCPgPtYfRL+ TmOsB/9xUS+E9aa53DGDmNeIzXaoCNxL2jwsMr53CztWh5OUgFI2/jcfrPKvu3NLBgkaemCl0zS MZeQ98R0d4pxj1eDtHNOZ/oUNPQtuFGrrprMVre/rl3PaGeq7zBn1sFvDSSWqYzfinpgm+EH4Gi +/tPMpLGZvXEnml9sZWurGVLl+++90ww18bBHwIpRbvWMGCHHLIqurZUq9OOngPgN5g4WFPFOgL 26+yV4R0cz5LfA/6uQA3LKgEdrF4Kup8xE0y4Ud2YoQGZvQDWJWKD2KV7ySlzQkmBdQ5X8a71PF ZXDYoVoYPcQ1Ci8A8PjVbF2gE8AvEufZz0HNOOjqlmIU9H4m
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
 drivers/input/keyboard/iqs62x-keys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
index 02ceebad7bda..688d61244b5f 100644
--- a/drivers/input/keyboard/iqs62x-keys.c
+++ b/drivers/input/keyboard/iqs62x-keys.c
@@ -310,7 +310,7 @@ static int iqs62x_keys_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int iqs62x_keys_remove(struct platform_device *pdev)
+static void iqs62x_keys_remove(struct platform_device *pdev)
 {
 	struct iqs62x_keys_private *iqs62x_keys = platform_get_drvdata(pdev);
 	int ret;
@@ -319,8 +319,6 @@ static int iqs62x_keys_remove(struct platform_device *pdev)
 						 &iqs62x_keys->notifier);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to unregister notifier: %d\n", ret);
-
-	return 0;
 }
 
 static struct platform_driver iqs62x_keys_platform_driver = {
@@ -328,7 +326,7 @@ static struct platform_driver iqs62x_keys_platform_driver = {
 		.name = "iqs62x-keys",
 	},
 	.probe = iqs62x_keys_probe,
-	.remove = iqs62x_keys_remove,
+	.remove_new = iqs62x_keys_remove,
 };
 module_platform_driver(iqs62x_keys_platform_driver);
 
-- 
2.40.1

