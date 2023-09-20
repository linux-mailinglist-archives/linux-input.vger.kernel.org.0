Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A028D7A825D
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbjITM7K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbjITM7E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:04 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B21ED
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-0005EH-C4; Wed, 20 Sep 2023 14:58:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-007gzQ-SK; Wed, 20 Sep 2023 14:58:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-003IDX-J9; Wed, 20 Sep 2023 14:58:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 17/52] input: max8997_haptic - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:54 +0200
Message-Id: <20230920125829.1478827-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2DtF1NaX75+bn977z+QqWxhsiiwrjYCNN5DXyZUALwk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxG4/BQPZCszNyocVpkOzUzaV1igCA0JxBPK GoQqJgqC0OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsRgAKCRCPgPtYfRL+ TumuB/9mwDWL9yH13V7E675PhtsjOT62RNQLxN4FPiSPx3xlPKCZKNETCWJyowQSYnM447rV4Ed ofkGJcSRSx9iDoZ6nzSLMuDBpxAJ7+3gank8xy+tYWp8sJyHFdsroFLGXuNmToocqKHlZshe/Uq TKmPuk2S4K1yuf20UtgsgynTe+9uolKok0TEt5ponKUTZuBCfnDKQ6J2XTiQfJALPSoejrLPcAe cNPT5NEC/mvrsRJVRnw5HFrQanjPV+U8khZWpRrP0DXHNxbJYywF/sOZ9XIK15huZ6hw2yogRdu 3jJ9qnTsHFCCaAqWAJGnIZM+lSlUYx+mf5VjEoHhqhwhEVlF
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
 drivers/input/misc/max8997_haptic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index c4dff476d479..8861a67be575 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -351,7 +351,7 @@ static int max8997_haptic_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int max8997_haptic_remove(struct platform_device *pdev)
+static void max8997_haptic_remove(struct platform_device *pdev)
 {
 	struct max8997_haptic *chip = platform_get_drvdata(pdev);
 
@@ -362,8 +362,6 @@ static int max8997_haptic_remove(struct platform_device *pdev)
 		pwm_put(chip->pwm);
 
 	kfree(chip);
-
-	return 0;
 }
 
 static int max8997_haptic_suspend(struct device *dev)
@@ -391,7 +389,7 @@ static struct platform_driver max8997_haptic_driver = {
 		.pm	= pm_sleep_ptr(&max8997_haptic_pm_ops),
 	},
 	.probe		= max8997_haptic_probe,
-	.remove		= max8997_haptic_remove,
+	.remove_new	= max8997_haptic_remove,
 	.id_table	= max8997_haptic_id,
 };
 module_platform_driver(max8997_haptic_driver);
-- 
2.40.1

