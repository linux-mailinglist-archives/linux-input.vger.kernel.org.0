Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5F47A8252
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235907AbjITM7F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbjITM65 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:57 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF301AD
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-0005Iv-Vz; Wed, 20 Sep 2023 14:58:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-007h00-JA; Wed, 20 Sep 2023 14:58:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-003IE6-A9; Wed, 20 Sep 2023 14:58:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Miloslav Trmac <mitr@volny.cz>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 26/52] input: wistron_btns - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:03 +0200
Message-Id: <20230920125829.1478827-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Y689/ToQbZVEjELE6UCi7Qr7sB3Vy8O7iIGOkfPvpyE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxRwzCcTc0EGaBurqmX8DYo9lF6U62Q+Mk7b gUM1lQ4BH6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsUQAKCRCPgPtYfRL+ TtZnB/9rhh9DbqHFmis7tBoFBsHLMJ29Q8bIpP3CuPt6W0HulBjdpQWZgSNgqfOqGxvauP9dRqn yViff7LDiEd7VT9BEUO3rdJZTHXfU4U5oQNEIT3OFQYY9muQb4em+f0iHRFvrQ72/W6t2HTo0mm o1xfplWaXBKP3Rri9TNvfKi48XRMGowpLFP+9+6RwVCt2XuCa4DgMEGg9VvYZxe90PmFPQN7GeS po6VtOQHPuwouoBjE/TuRV2hfHn2YDc8LvgmAoiXXkaDDw66PKRWOlKSYUxhCTJIKuVTNEb6S0+ WGbifQ1TlMAKi6WTr9KMkatbjO92IYX9Sh/zPd/XK/mrkXL6
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
 drivers/input/misc/wistron_btns.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/wistron_btns.c b/drivers/input/misc/wistron_btns.c
index 111cb70cde46..5c4956678cd0 100644
--- a/drivers/input/misc/wistron_btns.c
+++ b/drivers/input/misc/wistron_btns.c
@@ -1286,13 +1286,11 @@ static int wistron_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int wistron_remove(struct platform_device *dev)
+static void wistron_remove(struct platform_device *dev)
 {
 	wistron_led_remove();
 	input_unregister_device(wistron_idev);
 	bios_detach();
-
-	return 0;
 }
 
 static int wistron_suspend(struct device *dev)
@@ -1336,7 +1334,7 @@ static struct platform_driver wistron_driver = {
 		.pm	= pm_sleep_ptr(&wistron_pm_ops),
 	},
 	.probe		= wistron_probe,
-	.remove		= wistron_remove,
+	.remove_new	= wistron_remove,
 };
 
 static int __init wb_module_init(void)
-- 
2.40.1

