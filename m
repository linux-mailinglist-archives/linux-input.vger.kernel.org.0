Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55CE7A8268
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236153AbjITM7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236180AbjITM7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:07 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA571185
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-0005bP-UX; Wed, 20 Sep 2023 14:58:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-007h0v-6j; Wed, 20 Sep 2023 14:58:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-003IF7-RS; Wed, 20 Sep 2023 14:58:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ruan Jinjie <ruanjinjie@huawei.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 41/52] input: rpckbd - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:18 +0200
Message-Id: <20230920125829.1478827-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BcJ0AywxOV7G9krecrDeZFJTnE1lKJBvT4EpmtKIkgs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxiEPdB5NoqEu9duHO90iy0wFeDyR1VzYdHz KK4ZehG0EiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsYgAKCRCPgPtYfRL+ TuT5B/9BUS0Wno0+5YZoXN0Sb8RTIDfba64Excn8Kzkdhojjd89pmzYq/3dpAZrsCNBttjhAS0w rC4Dkdnx3bNnw49j0UTYqjOd2OTp5Qina7d7aWzzHoXY5ARNukHeDTnTUtHsZrhnkJUnI5RUUUQ vKV/m0wx5o6Ld7I9p+ujeE95CU5wQsjC3L4gAj7OJQVESrakDtJEjeddYv+cV7o+j2pm9gl8KwQ vKIQQw88Hqusv1NVg7f7NH/5fOQbjYOLdtUAKqs/gCnTWHlf29vfn95QrKAiGj4VzbLpa0ZedLF DWlPhpz81zeKp/W915vwdJZFdFd5Zp5ywHPL8oHdWRi/shHO
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
 drivers/input/serio/rpckbd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/rpckbd.c b/drivers/input/serio/rpckbd.c
index e8a9709f32eb..9bbfefd092c0 100644
--- a/drivers/input/serio/rpckbd.c
+++ b/drivers/input/serio/rpckbd.c
@@ -133,20 +133,18 @@ static int rpckbd_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int rpckbd_remove(struct platform_device *dev)
+static void rpckbd_remove(struct platform_device *dev)
 {
 	struct serio *serio = platform_get_drvdata(dev);
 	struct rpckbd_data *rpckbd = serio->port_data;
 
 	serio_unregister_port(serio);
 	kfree(rpckbd);
-
-	return 0;
 }
 
 static struct platform_driver rpckbd_driver = {
 	.probe		= rpckbd_probe,
-	.remove		= rpckbd_remove,
+	.remove_new	= rpckbd_remove,
 	.driver		= {
 		.name	= "kart",
 	},
-- 
2.40.1

