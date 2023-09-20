Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007727A8239
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236089AbjITM6v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235304AbjITM6r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:47 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE8012D
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-000588-U6; Wed, 20 Sep 2023 14:58:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-007gyQ-56; Wed, 20 Sep 2023 14:58:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmp-003ICV-S5; Wed, 20 Sep 2023 14:58:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 01/52] input: adp5520-keys - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:38 +0200
Message-Id: <20230920125829.1478827-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sDIRovx61qE47X7u63C5Fpn3zLhxFmyy8YCWQAY9uqw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw0dEwKJIDKXb8Aa8hVkIfHeNUAgFh5dOtwE x0K4Z/nF8+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsNAAKCRCPgPtYfRL+ ThCvB/9qP/JE8OUDiLGI7bGtpaSTj9bSKnUA/HxaUcpWRMYjO3Xku9e9Ms9wMnDSF++TgdYBI8g XwvLQ0vr0x04pgimIKrlSG3S2zMMBn1MhYUZi91V6Q3Y+MMc3VMdpxL6gGRT0G/x8YqDXW/2r6E y8igyo6Iq4UKt1IejBTRH5M7op9E2lPpqX18aaFoy4nsS87NJmkmH/iVXyQzbLOz9J7GYRs4t3Q Rv3oJJOOZ90b+KH/4h1YWkwNNtRPYGLJO69Kc+u4QVH0K0xS41gGyVlKX/lGXOwMMtJOtTK4PjC J1YXgPwNLr5Z4S4uObMEM1DEKHBeNhlil++2mvTapFBjCiNX
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
 drivers/input/keyboard/adp5520-keys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5520-keys.c b/drivers/input/keyboard/adp5520-keys.c
index 7851ffd678a8..10c248f0c1fc 100644
--- a/drivers/input/keyboard/adp5520-keys.c
+++ b/drivers/input/keyboard/adp5520-keys.c
@@ -168,14 +168,12 @@ static int adp5520_keys_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int adp5520_keys_remove(struct platform_device *pdev)
+static void adp5520_keys_remove(struct platform_device *pdev)
 {
 	struct adp5520_keys *dev = platform_get_drvdata(pdev);
 
 	adp5520_unregister_notifier(dev->master, &dev->notifier,
 				ADP5520_KP_IEN | ADP5520_KR_IEN);
-
-	return 0;
 }
 
 static struct platform_driver adp5520_keys_driver = {
@@ -183,7 +181,7 @@ static struct platform_driver adp5520_keys_driver = {
 		.name	= "adp5520-keys",
 	},
 	.probe		= adp5520_keys_probe,
-	.remove		= adp5520_keys_remove,
+	.remove_new	= adp5520_keys_remove,
 };
 module_platform_driver(adp5520_keys_driver);
 
-- 
2.40.1

