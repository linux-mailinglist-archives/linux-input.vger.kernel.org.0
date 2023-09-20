Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F11D27A8274
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236342AbjITM7X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbjITM7K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:10 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AAA188
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn1-0005cl-5S; Wed, 20 Sep 2023 14:58:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-007h0y-Cu; Wed, 20 Sep 2023 14:58:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-003IFB-3I; Wed, 20 Sep 2023 14:58:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 42/52] input: sun4i-ps2 - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:19 +0200
Message-Id: <20230920125829.1478827-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9/tzG6hSPC1O7G4VLWSid0fAqDrsjXjJIrKCNtsf9XM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxjwrC0hABNvV8yIyxtcS5AEkzmBO4C+0b0H yKBlEGkQD6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsYwAKCRCPgPtYfRL+ TmzUB/sHyzeQmJlM6eoE28qcA8tKM2fHB6nWG7LueBBPhMWfRclE0VxCNVG7Rj15HnnF0jV8M8O RAWM/8orH1/vdA0dfXKLYTjrEndXdxzgj7zoxj0l/gQBBcPPwemuYsHXTs+hSXOoWwNq1N5WETu IajTpWmFGsUYnX76HxJaKmaVmSTcIez1HghHVmxJGc+3uvmZq55z2qBoU3EfcoR99cK5Ee/wazK L0PbyFEJu94SX21v3vbmC6XCNt/1dgdLTTf6Qt8aTJawt/7l1+XHjZAfsVg/7eaGMD8n2sH0m9i KoNmJqYJUyrNO5C/bpgnvi1bB7mSBhLvNPpyJGShJvNq9hHm
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
 drivers/input/serio/sun4i-ps2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/sun4i-ps2.c b/drivers/input/serio/sun4i-ps2.c
index eb262640192e..aec66d9f5176 100644
--- a/drivers/input/serio/sun4i-ps2.c
+++ b/drivers/input/serio/sun4i-ps2.c
@@ -297,7 +297,7 @@ static int sun4i_ps2_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int sun4i_ps2_remove(struct platform_device *pdev)
+static void sun4i_ps2_remove(struct platform_device *pdev)
 {
 	struct sun4i_ps2data *drvdata = platform_get_drvdata(pdev);
 
@@ -311,8 +311,6 @@ static int sun4i_ps2_remove(struct platform_device *pdev)
 	iounmap(drvdata->reg_base);
 
 	kfree(drvdata);
-
-	return 0;
 }
 
 static const struct of_device_id sun4i_ps2_match[] = {
@@ -324,7 +322,7 @@ MODULE_DEVICE_TABLE(of, sun4i_ps2_match);
 
 static struct platform_driver sun4i_ps2_driver = {
 	.probe		= sun4i_ps2_probe,
-	.remove		= sun4i_ps2_remove,
+	.remove_new	= sun4i_ps2_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = sun4i_ps2_match,
-- 
2.40.1

