Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B74722C4B
	for <lists+linux-input@lfdr.de>; Mon,  5 Jun 2023 18:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjFEQPG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jun 2023 12:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjFEQPF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jun 2023 12:15:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8115DB7
        for <linux-input@vger.kernel.org>; Mon,  5 Jun 2023 09:15:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6CrG-0002xV-2w; Mon, 05 Jun 2023 18:15:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6CrF-005JVx-0K; Mon, 05 Jun 2023 18:15:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6CrE-00BRjx-3f; Mon, 05 Jun 2023 18:15:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] Input: tps65219-pwrbutton - Convert to .remove_new()
Date:   Mon,  5 Jun 2023 18:14:57 +0200
Message-Id: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=c2q+gKaVNzQOhIVcIymxoyjmyVEMJOqoSQ10fFtSj3s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkfgoA/p0IuYTWou4nh68kYJMjnKcnrqt1urdVY 66/YwufgwaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZH4KAAAKCRCPgPtYfRL+ Tm2YCACaScZdmXygTrKIELwagS5KevB3h0KwqxdwJdWdanghede9wF0koqkwTLs948TSxiRcB0h bBcjXis0X3quj5cZHWzUC1aHZ6tNtF0VbH8dIw1v8BN+OAO82LaQyfdsoFiCc9g9od15zG+Qg0W 06R7jrRDT5wErhxZNN/hu2pTwHWXgNEfUKsbjYxCDEKpOSbN1XWexAdBW2OTYzYdXC1wUy0ciYI OoTbC7AzAb8k2BxbJ6AmkztOqK5+/lWsXmdDpGWt1hT+Jjt+TKHmTCcoU7Yu99jQwQnc83rh5Ae HckwKyMiDhLLEMoWACIBa8VXzJUcPwt/WsKwtdatFAOJ/2yG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart from
emitting a warning).

To improve here there is a quest to make the remove callback return void.
In the first step of this quest all drivers are converted to .remove_new()
which already returns void. Eventually after all drivers are converted,
.remove_new() is renamed to .remove().

Before this driver might have returned an error. In this case emit a
warning that tells more about the problem than the generic warning by
the core, and instead of making the remove callback return zero
unconditionally, convert to .remove_new() which is equivalent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/misc/tps65219-pwrbutton.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
index 245134bdb59e..b2d9e5d2bcfd 100644
--- a/drivers/input/misc/tps65219-pwrbutton.c
+++ b/drivers/input/misc/tps65219-pwrbutton.c
@@ -117,14 +117,17 @@ static int tps65219_pb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tps65219_pb_remove(struct platform_device *pdev)
+static void tps65219_pb_remove(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
+	int ret;
 
 	/* Disable interrupt for the pushbutton */
-	return regmap_update_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
-				  TPS65219_REG_MASK_INT_FOR_PB_MASK,
-				  TPS65219_REG_MASK_INT_FOR_PB_MASK);
+	ret = regmap_update_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
+				 TPS65219_REG_MASK_INT_FOR_PB_MASK,
+				 TPS65219_REG_MASK_INT_FOR_PB_MASK);
+	if (ret)
+		dev_warn(&pdev->dev, "Failed to disable irq (%pe)\n", ERR_PTR(ret));
 }
 
 static const struct platform_device_id tps65219_pwrbtn_id_table[] = {
@@ -135,7 +138,7 @@ MODULE_DEVICE_TABLE(platform, tps65219_pwrbtn_id_table);
 
 static struct platform_driver tps65219_pb_driver = {
 	.probe = tps65219_pb_probe,
-	.remove = tps65219_pb_remove,
+	.remove_new = tps65219_pb_remove,
 	.driver = {
 		.name = "tps65219_pwrbutton",
 	},

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

