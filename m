Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F9A7A8267
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236160AbjITM7R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236153AbjITM7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:07 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104B0B6
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-0005Sm-Dv; Wed, 20 Sep 2023 14:58:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-007h0V-Cx; Wed, 20 Sep 2023 14:58:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-003IEf-3k; Wed, 20 Sep 2023 14:58:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Liang He <windhl@126.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 34/52] drivers/input/serio/i8042-sparcio.h :: Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:11 +0200
Message-Id: <20230920125829.1478827-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bguHYNAbW0JHfcHAlaOD0UMgUkVnGF3h4uEIBcS7buU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxaCp/ffrkPyj63s+7uKo9rTudeMDyxXjfy7 9WGpdyEDjuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsWgAKCRCPgPtYfRL+ TlV1CACpjFOT8mrF71juA6+GWd/WW9RUGh5rCRChIw/QuCY/HYh585mON22EQxLP6QEAC4qpIag TTQ8wa6p+jmJjcIfDOpLMXN0KGyMWp2Dy2bFbliJtsfP21NXT59DmwUuDIG29vEMMYf+EHI9g1x 0ts21VPu1gOYuLAqdipWxtps0m5cjnepLY3K4UfGMTwur9e6soQOqTFt1wSP7ewfEf4nBb6djjm 79AnL1+/t13kTtu+XShc+CER5hHP2InS9DXvBBm9rwBf4392lt2NvyRYFcnn08TcVf0uz0t6RDh Myr2hzYK/DqhhvrvBFO6Uk37T17aLjUkM4+BCP13dbURySBR
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
 drivers/input/serio/i8042-sparcio.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
index b68793bf05c8..c2fda54dc384 100644
--- a/drivers/input/serio/i8042-sparcio.h
+++ b/drivers/input/serio/i8042-sparcio.h
@@ -82,11 +82,9 @@ static int sparc_i8042_probe(struct platform_device *op)
 	return 0;
 }
 
-static int sparc_i8042_remove(struct platform_device *op)
+static void sparc_i8042_remove(struct platform_device *op)
 {
 	of_iounmap(kbd_res, kbd_iobase, 8);
-
-	return 0;
 }
 
 static const struct of_device_id sparc_i8042_match[] = {
@@ -103,7 +101,7 @@ static struct platform_driver sparc_i8042_driver = {
 		.of_match_table = sparc_i8042_match,
 	},
 	.probe		= sparc_i8042_probe,
-	.remove		= sparc_i8042_remove,
+	.remove_new	= sparc_i8042_remove,
 };
 
 static bool i8042_is_mr_coffee(void)
-- 
2.40.1

