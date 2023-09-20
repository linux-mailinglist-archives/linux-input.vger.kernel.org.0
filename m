Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9667A8256
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236165AbjITM7H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235290AbjITM67 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:59 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0E319D
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-0005M9-3v; Wed, 20 Sep 2023 14:58:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-007h0H-JM; Wed, 20 Sep 2023 14:58:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmw-003IEM-AB; Wed, 20 Sep 2023 14:58:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 30/52] input: ams_delta_serio - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:07 +0200
Message-Id: <20230920125829.1478827-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=k4RLsXMFvCHnBLWmbBjnDnZVO2FI6ukTajpbodF2N5E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxVCmdSD7izreR5w2xmw2r0Fc8fe3Ih5cUAE pLhBY1n/h2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsVQAKCRCPgPtYfRL+ ToZ6B/0VDI1VHr5OzdCsZStAZnpDgUnHj9L7Wwv+rYlmt4LGZf3D/WcykI3OmGDEV94B87C6pQL T5XxP5frQE8KGtKhqHpATg/UTK7HgXWyUjyABaRh1WJuPH6xxOBtbiQaedGT+4xWLm1kKuaFakr 0/1BX0tzJm98ETCIfdI0qjFGGnN+MhngsYxxntEzqB5sWGfiDkSlQwpM/zBSYfY7lwZr0CQlhfB ZX0sEhY+AoskBdHob+ftRBBofuHB5C+lLdMUXeSNrRlP60B1c0Z3WaNPQDQ5fj7HoTD/0JTDMaF MI4/YGgVihooX/RLLH9PURUZDCi2qzclnULiECqYNnLFrNd2
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
 drivers/input/serio/ams_delta_serio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/ams_delta_serio.c b/drivers/input/serio/ams_delta_serio.c
index ec93cb4573c3..0bd6ae106809 100644
--- a/drivers/input/serio/ams_delta_serio.c
+++ b/drivers/input/serio/ams_delta_serio.c
@@ -173,18 +173,16 @@ static int ams_delta_serio_init(struct platform_device *pdev)
 	return 0;
 }
 
-static int ams_delta_serio_exit(struct platform_device *pdev)
+static void ams_delta_serio_exit(struct platform_device *pdev)
 {
 	struct ams_delta_serio *priv = platform_get_drvdata(pdev);
 
 	serio_unregister_port(priv->serio);
-
-	return 0;
 }
 
 static struct platform_driver ams_delta_serio_driver = {
 	.probe	= ams_delta_serio_init,
-	.remove	= ams_delta_serio_exit,
+	.remove_new = ams_delta_serio_exit,
 	.driver	= {
 		.name	= DRIVER_NAME
 	},
-- 
2.40.1

