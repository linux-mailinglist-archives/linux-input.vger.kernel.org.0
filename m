Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D097F7A8254
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236009AbjITM7G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236153AbjITM66 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:58 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB9319C
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-00058Z-CK; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-007gyn-M1; Wed, 20 Sep 2023 14:58:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-003ICx-Cd; Wed, 20 Sep 2023 14:58:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 08/52] input: samsung-keypad - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:45 +0200
Message-Id: <20230920125829.1478827-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sSjxlRI6ic64GKrn1BxzxBl1JS/1ZiAMfsKC/c/RCSc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw8mIy0OFnL13R9o77RfYTsxf041GZZpwWK3 yiSHoRVaBKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsPAAKCRCPgPtYfRL+ TmrVB/9xlJmcQhEB1fh3aklpZ08zq/tbsb2im9IdDWcmcGb0XlpXnuaQClcD+T9T+IFsNvYgzQk cL+sQgXK4YLxYyg6q3iDgHRF8jMJElFu5e65n9xhPaMqLhMQbJtct9H/E7yaG9zibwbsYi2k71g rNbAYlRiVWbxYyv3xQtMQ4aydl05jX9kohWng4ogdIs3pnz8EsNnEruTnmuRofRXkz06/BiOBVq D/ne8Z+z2jQ9DniUmhrrRhA6XGAZyJrqi+sDjB5NKRhEPf5FFFrzDmVqkefHsrtwIPzK8NYAI1o qfkc97ve+6p241GkbIGo5slY3tb2sZNPwRJ0YRMMUIXAVgNp
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
 drivers/input/keyboard/samsung-keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index d85dd2489293..e212eff7687c 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -444,7 +444,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int samsung_keypad_remove(struct platform_device *pdev)
+static void samsung_keypad_remove(struct platform_device *pdev)
 {
 	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
 
@@ -453,8 +453,6 @@ static int samsung_keypad_remove(struct platform_device *pdev)
 	input_unregister_device(keypad->input_dev);
 
 	clk_unprepare(keypad->clk);
-
-	return 0;
 }
 
 static int samsung_keypad_runtime_suspend(struct device *dev)
@@ -589,7 +587,7 @@ MODULE_DEVICE_TABLE(platform, samsung_keypad_driver_ids);
 
 static struct platform_driver samsung_keypad_driver = {
 	.probe		= samsung_keypad_probe,
-	.remove		= samsung_keypad_remove,
+	.remove_new	= samsung_keypad_remove,
 	.driver		= {
 		.name	= "samsung-keypad",
 		.of_match_table = of_match_ptr(samsung_keypad_dt_match),
-- 
2.40.1

