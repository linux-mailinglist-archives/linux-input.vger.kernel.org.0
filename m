Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A127A8263
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbjITM7P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236224AbjITM7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559B68F
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-0005NW-Gk; Wed, 20 Sep 2023 14:58:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-007h0L-PV; Wed, 20 Sep 2023 14:58:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-003IER-G3; Wed, 20 Sep 2023 14:58:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 31/52] input: apbps2 - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:08 +0200
Message-Id: <20230920125829.1478827-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uM3xnUriNMhL6Hc4uF1BY04iIO0JvSpY6xt5ozx9fbI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxXRn0YU4GkZm14DLiyc7+ZYtL/6unVWbBzM Wms7CkFZeiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsVwAKCRCPgPtYfRL+ TniXCACFz32ZJHEmh7sGSmcCwzGCUHX/qYJ1LBXPkaHL5XNo5KHD2JhXlUCv8dYAarEkbatQzPU B4sY4/c0AEzrMaJqVci1vvmPlzJ7O2qVMk8wRaPLRLFyjHQVA6brOyot7ujrGnMhoaPQAJxpuwA NZnnyMEmzikVquGkQvB6SXgog3hos/sq485I3xw4vKzS2gNf8h/WhYrsn7jCGckdGK/Y6amk5+W cRfbwRqwlEHttyYDI2uBvA5x6pCMgzFbSMbL1JMlXCH24dcSNaclLG4kPVdKCCKChWoPYi2Olyl NDZxl5d+JxLg6FR2vYTEHtJtDsmll3/AsWLmF7kOKIhOYtrG
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
 drivers/input/serio/apbps2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index 3f6866d39b86..dbbb10251520 100644
--- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -187,13 +187,11 @@ static int apbps2_of_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-static int apbps2_of_remove(struct platform_device *of_dev)
+static void apbps2_of_remove(struct platform_device *of_dev)
 {
 	struct apbps2_priv *priv = platform_get_drvdata(of_dev);
 
 	serio_unregister_port(priv->io);
-
-	return 0;
 }
 
 static const struct of_device_id apbps2_of_match[] = {
@@ -210,7 +208,7 @@ static struct platform_driver apbps2_of_driver = {
 		.of_match_table = apbps2_of_match,
 	},
 	.probe = apbps2_of_probe,
-	.remove = apbps2_of_remove,
+	.remove_new = apbps2_of_remove,
 };
 
 module_platform_driver(apbps2_of_driver);
-- 
2.40.1

