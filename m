Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8694A7A8242
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbjITM67 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235840AbjITM6x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:53 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16780E0
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-0005Ew-GF; Wed, 20 Sep 2023 14:58:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-007gzU-1y; Wed, 20 Sep 2023 14:58:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-003IDb-P7; Wed, 20 Sep 2023 14:58:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 18/52] input: mc13783-pwrbutton - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:55 +0200
Message-Id: <20230920125829.1478827-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6jV3OqLKyaaesmy8yS6B0BVvd+w3baM67kGFQIsSRrw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxIwVcEzxYM5a/yJsIY3h/XVAAnqjzY4Iub9 TyASLqCsqSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsSAAKCRCPgPtYfRL+ TnZ7B/9ubSxKxlPwBNoIMQTDBE93nvv4kR/MWzTNzZCB318o1mmxl9+yMd11+zIW8JyCrjLLFD3 7WS6kH8hxcovQS7E4eDnsg6IGaPKLnbnoKxWVPI5+VDQdYxQZfgd7v1S6qIKNJeCNCPtwsPbQRw CM018SolV9b73Wa88WcKiBjfZAGcu9PvW/SyjXjSbNmhgHKhY93SYaATqVE+gmQA9/rA1UahLsG X2pOPSTrQfFxUmXDdUU2sk05e4/F3GrDSchYZMBc5UTDwfGAimqey4Sn+PRvMYtRqY93yt8c7Th 7kqSvqufQnPtmMaItupD9HaKh1R3f6Q40l4rcYMJS/SGnDL5
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
 drivers/input/misc/mc13783-pwrbutton.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 0636eee4bb6c..1c8c939638f6 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -229,7 +229,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mc13783_pwrbutton_remove(struct platform_device *pdev)
+static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 {
 	struct mc13783_pwrb *priv = platform_get_drvdata(pdev);
 	const struct mc13xxx_buttons_platform_data *pdata;
@@ -249,13 +249,11 @@ static int mc13783_pwrbutton_remove(struct platform_device *pdev)
 
 	input_unregister_device(priv->pwr);
 	kfree(priv);
-
-	return 0;
 }
 
 static struct platform_driver mc13783_pwrbutton_driver = {
 	.probe		= mc13783_pwrbutton_probe,
-	.remove		= mc13783_pwrbutton_remove,
+	.remove_new	= mc13783_pwrbutton_remove,
 	.driver		= {
 		.name	= "mc13783-pwrbutton",
 	},
-- 
2.40.1

