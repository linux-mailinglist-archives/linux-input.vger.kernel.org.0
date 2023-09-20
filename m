Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667867A823C
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbjITM64 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbjITM6w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:52 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC26E5
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-0005Bl-TP; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-007gzA-BL; Wed, 20 Sep 2023 14:58:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwms-003IDO-VU; Wed, 20 Sep 2023 14:58:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andrey Moiseev <o2g.org.ru@gmail.com>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 15/52] input: ideapad_slidebar - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:52 +0200
Message-Id: <20230920125829.1478827-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=t/buwNUMTo9ACPKKsW7XuzXVT7i0LeDrcpWzGnDR+cg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxEZz+LaPU7suGswAFzul/K4Sph4q99WKxDV PxEq5p0gDqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsRAAKCRCPgPtYfRL+ TqkRCAC1m09dfmUAIEn/KbwUbzpVPw9G9adUbcpRyWhJHYzzdMGna0xndUXJrqOvAdX/t0p2ebl hBdpi3qLnytWb5JtQbymnEnwF4CqT/E/utOF1tYJLODeUOEFkcA3QYG7rlvHwOi0dQROnneoXKs lPMue7lZa/yRMWfXiQTWPOH28qT1gWpzrCElwGfHTVtjq/OFH/EvMqKH9k59bOF4GCO1qXQIgj2 tfxgqXQnAQfoFwOmpBPVg1rvHUWMJGzwuyFO+Y7lJ11isBKPaFj21jGkaFxwNEq69sYpN2WCxKg sVKoUlwQi62YQoYdkNFv2rpqaouoBkYIlPHLDF5sH1ZSpx4W
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
 drivers/input/misc/ideapad_slidebar.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/ideapad_slidebar.c b/drivers/input/misc/ideapad_slidebar.c
index 68f1c584da05..fa4e7f67d713 100644
--- a/drivers/input/misc/ideapad_slidebar.c
+++ b/drivers/input/misc/ideapad_slidebar.c
@@ -256,20 +256,18 @@ static int __init ideapad_probe(struct platform_device* pdev)
 	return err;
 }
 
-static int ideapad_remove(struct platform_device *pdev)
+static void ideapad_remove(struct platform_device *pdev)
 {
 	i8042_remove_filter(slidebar_i8042_filter);
 	input_unregister_device(slidebar_input_dev);
 	release_region(IDEAPAD_BASE, 3);
-
-	return 0;
 }
 
 static struct platform_driver slidebar_drv = {
 	.driver = {
 		.name = "ideapad_slidebar",
 	},
-	.remove = ideapad_remove,
+	.remove_new = ideapad_remove,
 };
 
 static int __init ideapad_dmi_check(const struct dmi_system_id *id)
-- 
2.40.1

