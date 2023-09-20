Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B52A07A825A
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235976AbjITM7J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235445AbjITM7C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:02 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8041AA
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-0005PD-Qf; Wed, 20 Sep 2023 14:58:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-007h0O-0G; Wed, 20 Sep 2023 14:58:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-003IEX-NF; Wed, 20 Sep 2023 14:58:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     ye xingchen <ye.xingchen@zte.com.cn>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 32/52] input: arc_ps2 - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:09 +0200
Message-Id: <20230920125829.1478827-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7X8uCrMOxU8K8IY7e7GStE3Jj6HCWLqRoi2Yd+ba3bk=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxY2s4o+BRlx1jHH9//0fAUDYdOSnX4sju+O Vod2sIFPRqJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsWAAKCRCPgPtYfRL+ TpfEB/MG7oNID/tu31FaFDAWzBc9skt9hQuObENvHmRoMxyluviYQptM53V9uei5/YzVYPZUXx4 VpPBG7ClmKUjomR+nbKp/ReKQqdM4ns7QyQaeeW5hnKBFI2Na/NZLuAlsvCKbnBItnMCsvvCcOB VsrwgyIaEY9UqNCI1a2DXepo9Sq4KVGYOJ5HxDJXlVZHXoxlMsSflZ763Nns6ZBhK26ohMmVUFz w/aGc3BN9kvcB50N/sNxe8Bi04R9WiBfZ00eEMe7mGSVgMGrjUAs7DgpQUNEiajaU4SGqL9rAEB o9DRbqmQ6hIvrzRl2VxY6mt5d7hcdPGD7Z8xsqkgyjZhKbU=
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
 drivers/input/serio/arc_ps2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/arc_ps2.c b/drivers/input/serio/arc_ps2.c
index a6debb13d527..9d8726830140 100644
--- a/drivers/input/serio/arc_ps2.c
+++ b/drivers/input/serio/arc_ps2.c
@@ -232,7 +232,7 @@ static int arc_ps2_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int arc_ps2_remove(struct platform_device *pdev)
+static void arc_ps2_remove(struct platform_device *pdev)
 {
 	struct arc_ps2_data *arc_ps2 = platform_get_drvdata(pdev);
 	int i;
@@ -244,8 +244,6 @@ static int arc_ps2_remove(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "frame error count = %i\n", arc_ps2->frame_error);
 	dev_dbg(&pdev->dev, "buffer overflow count = %i\n",
 		arc_ps2->buf_overflow);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -262,7 +260,7 @@ static struct platform_driver arc_ps2_driver = {
 		.of_match_table	= of_match_ptr(arc_ps2_match),
 	},
 	.probe	= arc_ps2_probe,
-	.remove	= arc_ps2_remove,
+	.remove_new = arc_ps2_remove,
 };
 
 module_platform_driver(arc_ps2_driver);
-- 
2.40.1

