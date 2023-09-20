Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7C27A8262
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235869AbjITM7O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236189AbjITM7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:05 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3373125
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwn0-0005Zv-Cc; Wed, 20 Sep 2023 14:58:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-007h0r-Ti; Wed, 20 Sep 2023 14:58:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-003IF3-KR; Wed, 20 Sep 2023 14:58:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 40/52] input: q40kbd - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:17 +0200
Message-Id: <20230920125829.1478827-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3NA87Fw35hD22BEG9Qbq5UUK53fmztjINSWqrQSCBIc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxhcnMyX1vo0q08PxHM7+obQOzBX1l3seC1t DFCe6DEek6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsYQAKCRCPgPtYfRL+ TtjRB/9eIsdA402PsLzQhmDL/gNZKg2o41edOBSvJdw/VujVmQs7efNi7wA+QdcELkGNuh4oota UpoZ3pcrE3/gT/l5iengtohg2QZZCsNXmz3Suh6Q/BdvDnhmR4+bRAMP/mK+T13Byi1TGhHnVxh eninyZOc/ElsyQy6AeoQGG6bDrKTcrcSBTUc6vY09Qlm0zhT43aaqqRvtQN4l4cN4Of05h6VMWx dex+wOCQfoDuaYl8ZcNtr4sbzeDTUCDxYsnB5owR8tavsQF9JtUeIrzRs301zkktVtle9KqQGEO wGZVkNIXoWj8o4yhCOXVPTjh6QFnXk2hDiqbiWrakgX1JPG3
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
 drivers/input/serio/q40kbd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/q40kbd.c b/drivers/input/serio/q40kbd.c
index ba04058fc3cb..3f81f8749cd5 100644
--- a/drivers/input/serio/q40kbd.c
+++ b/drivers/input/serio/q40kbd.c
@@ -148,7 +148,7 @@ static int q40kbd_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int q40kbd_remove(struct platform_device *pdev)
+static void q40kbd_remove(struct platform_device *pdev)
 {
 	struct q40kbd *q40kbd = platform_get_drvdata(pdev);
 
@@ -160,15 +160,13 @@ static int q40kbd_remove(struct platform_device *pdev)
 	serio_unregister_port(q40kbd->port);
 	free_irq(Q40_IRQ_KEYBOARD, q40kbd);
 	kfree(q40kbd);
-
-	return 0;
 }
 
 static struct platform_driver q40kbd_driver = {
 	.driver		= {
 		.name	= "q40kbd",
 	},
-	.remove		= q40kbd_remove,
+	.remove_new	= q40kbd_remove,
 };
 
 module_platform_driver_probe(q40kbd_driver, q40kbd_probe);
-- 
2.40.1

