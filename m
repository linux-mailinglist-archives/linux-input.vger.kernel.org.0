Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207F47A823B
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbjITM6z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236009AbjITM6v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:51 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910AC185
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwms-0005AF-VI; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwms-007gyz-Gf; Wed, 20 Sep 2023 14:58:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwms-003IDC-7F; Wed, 20 Sep 2023 14:58:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 12/52] input: 88pm80x_onkey - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:49 +0200
Message-Id: <20230920125829.1478827-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VdDT6oyta/rpqazxfou5Ka7SdQCrrjXJRR/uFSclTwg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxBPhIyiqzW1vbSI8fBEyoJy/0r7Wt3A57VL qr1eHkKQ3GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsQQAKCRCPgPtYfRL+ TlYqCACTMqpj0Fe/86QIxMXQ4Jx0S26hpS+5XmlnbpsBOuUBNaC9+aYjmorFUToegRvUcQAAMCe Y5xlNAx8BDz6Wy/Uki+hPWI/8Y1Ctihx3XbrZmuoclFf9krqQvSdahV0x0bwmVgbtZO0wNUFTiI XTskiLcXMBNN3+pnsduHAlgzZER5dXpVNKO2q5NnhXzxxewaRY9X+BmKXPtvAzthju4rowv6mJZ v1l9e7JGMXD2zzE2lNhA4PO55vUoRzuMaiMEpRe34uRLgU5vpCw4yshDGwfH+ktAZB505CnZhwS 3okjy66ZJbItSyWBp2Ni1WgX/2DrQ265MeL3s7O0gen/7Y7d
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
 drivers/input/misc/88pm80x_onkey.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/88pm80x_onkey.c b/drivers/input/misc/88pm80x_onkey.c
index 51c8a326fd06..31f0702c3d01 100644
--- a/drivers/input/misc/88pm80x_onkey.c
+++ b/drivers/input/misc/88pm80x_onkey.c
@@ -138,14 +138,13 @@ static int pm80x_onkey_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int pm80x_onkey_remove(struct platform_device *pdev)
+static void pm80x_onkey_remove(struct platform_device *pdev)
 {
 	struct pm80x_onkey_info *info = platform_get_drvdata(pdev);
 
 	pm80x_free_irq(info->pm80x, info->irq, info);
 	input_unregister_device(info->idev);
 	kfree(info);
-	return 0;
 }
 
 static struct platform_driver pm80x_onkey_driver = {
@@ -154,7 +153,7 @@ static struct platform_driver pm80x_onkey_driver = {
 		   .pm = &pm80x_onkey_pm_ops,
 		   },
 	.probe = pm80x_onkey_probe,
-	.remove = pm80x_onkey_remove,
+	.remove_new = pm80x_onkey_remove,
 };
 
 module_platform_driver(pm80x_onkey_driver);
-- 
2.40.1

