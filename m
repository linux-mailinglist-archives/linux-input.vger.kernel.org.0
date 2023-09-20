Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C227A8248
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbjITM7C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbjITM6z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:55 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F56EC6
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-0005Ih-R5; Wed, 20 Sep 2023 14:58:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-007gzw-ED; Wed, 20 Sep 2023 14:58:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-003IE2-4s; Wed, 20 Sep 2023 14:58:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 25/52] input: sparcspkr - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:02 +0200
Message-Id: <20230920125829.1478827-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oAueTscKRI8vCl8QQanTVPtmrT1p6TuiRwp4kOaCADI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSuNwG8B/p7LeMUDmyPKDnqKTDbOlbpqfXZ45b2O8OaV izsv7Wik9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJRK9m/8l4WGgaz4Rah/3i 5a1qEyw8t7FvZn44PUnu5aONQbxB+t+r5qZEvWDiVty0zXeRxdovcVask5U1fzccynhg+KVz0Q/ XZtX078d3NszIL20rPF5txll9c3p77zIl9f/hzSstJRtLtbcZSYodN5ibo3/UwEvXdXr+/7LtFl 6Lzud5bgmYtvE+62G3mM9a9b82lXrlH334ZHaBytL4n80/4z79fb9kyhnHq8lLJht/qvv82vdku tFMC+HGDwXhZiLH1CNrVyhXt6zcvSpqIr+0X0ihSGnJTld5jfNSsY+ixXQ25k/iErl60E04bnJk uZS8+aMu5cJ5rppqBQ8eBVSsee/HLWY9e6duj9jnpYEuAA==
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
 drivers/input/misc/sparcspkr.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index e5dd84725c6e..20020cbc0752 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -231,7 +231,7 @@ static int bbc_beep_probe(struct platform_device *op)
 	return err;
 }
 
-static int bbc_remove(struct platform_device *op)
+static void bbc_remove(struct platform_device *op)
 {
 	struct sparcspkr_state *state = platform_get_drvdata(op);
 	struct input_dev *input_dev = state->input_dev;
@@ -245,8 +245,6 @@ static int bbc_remove(struct platform_device *op)
 	of_iounmap(&op->resource[0], info->regs, 6);
 
 	kfree(state);
-
-	return 0;
 }
 
 static const struct of_device_id bbc_beep_match[] = {
@@ -264,7 +262,7 @@ static struct platform_driver bbc_beep_driver = {
 		.of_match_table = bbc_beep_match,
 	},
 	.probe		= bbc_beep_probe,
-	.remove		= bbc_remove,
+	.remove_new	= bbc_remove,
 	.shutdown	= sparcspkr_shutdown,
 };
 
@@ -310,7 +308,7 @@ static int grover_beep_probe(struct platform_device *op)
 	return err;
 }
 
-static int grover_remove(struct platform_device *op)
+static void grover_remove(struct platform_device *op)
 {
 	struct sparcspkr_state *state = platform_get_drvdata(op);
 	struct grover_beep_info *info = &state->u.grover;
@@ -325,8 +323,6 @@ static int grover_remove(struct platform_device *op)
 	of_iounmap(&op->resource[2], info->freq_regs, 2);
 
 	kfree(state);
-
-	return 0;
 }
 
 static const struct of_device_id grover_beep_match[] = {
@@ -344,7 +340,7 @@ static struct platform_driver grover_beep_driver = {
 		.of_match_table = grover_beep_match,
 	},
 	.probe		= grover_beep_probe,
-	.remove		= grover_remove,
+	.remove_new	= grover_remove,
 	.shutdown	= sparcspkr_shutdown,
 };
 
-- 
2.40.1

